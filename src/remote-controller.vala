/* remote-controller.vala
 *
 * Copyright 2022 Vojtěch Perník
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

public class Synchrony.RemoteController : Object {

    private static Settings settings = new Settings.with_path (Constants.APP_ID, Constants.RESOURCE_PATH);
    private static Synchrony.Remote[] remotes;


    /**
     * Loads all the remotes to the list.
     */
    public static void load_remotes () throws Error {
        if (remotes != null) return;
        remotes = {};

        var config = File.new_build_filename (Constants.DATA_DIR, "rclone.conf");
        var dis = new DataInputStream (config.read ());

        string last_id = null;
        string last_provider = null;

        string s;
        while ((s = dis.read_line ()) != null) {
            if (s.has_prefix ("[") && s.has_suffix ("]")) {
                last_id = s.substring (1, s.length - 2);
                last_provider = null;
                continue;
            }

            if (s.has_prefix ("type = ") && last_id != null) {
                last_provider = s.replace ("type = ", "");

                if (ProviderController.code_exists (last_provider)) {
                    remotes += new Remote (
                        ProviderController.get_for_code (last_provider),
                        last_id
                    );
                }

                last_id = null;
                last_provider = null;
            }
        }

        foreach (var remote in remotes) {
            print ("%s : %s\n", remote.provider.name, remote.id);
        }
    }


    /**
     * Updates the remote list.
     */
    public static void update_remotes () throws Error {
        remotes = null;
        load_remotes ();
    }


    /**
     * Checks, if the given ID already exists.
     */
    public static bool id_exists (string id) throws Error {
        load_remotes ();
        if (remotes.length == 0) return false;
        foreach (var remote in remotes) {
            if (remote.id == id) return true;
        }
        return false;
    }


    /**
     * Generates new ID.
     */
    public static string new_id () throws Error {
        string id = Uuid.string_random ();
        if (id_exists (id)) return new_id ();
        return id;
    }


    /**
     * Creates a new remote.
     */
    public static async Remote new_remote (
        Provider    provider,
        Cancellable cancellable = new Cancellable ()
    ) throws Error {

        // see `rclone config create --help` for more info

        // generate new ID
        string id = new_id ();

        // prepare variables
        Subprocess subprocess = null;
        DataInputStream output = null;
        bool repeat_cycle = true;

        // set cancelling
        cancellable.cancelled.connect (() => {
            if (subprocess != null) subprocess.force_exit ();
            repeat_cycle = false;
            try {
                run_rclone_command ({ "config", "delete", id });
            } catch (Error e) {}
        });

        // run the create command
        subprocess = run_rclone_command ({
            "config", "create", id, provider.code, "--non-interactive"
        }, GLib.SubprocessFlags.STDOUT_PIPE);

        // answer all questions with the default value
        while (repeat_cycle) {
            // get the command output
            output = new DataInputStream (
                subprocess.get_stdout_pipe ()
            );

            // read the output content
            string content = "";
            string s;
            while ((s = output.read_line_utf8 ()) != null) {
                content += @"$(s)\n";
            }

            // if there is nothing to answer, break the cycle
            if (content.contains ("\"Option\": null")) break;

            // get state node from `"State": "NEEDLE",`
            string node_state = content.split ("\"State\": \"")[1];
            node_state = node_state.split ("\",")[0];

            // get default node from `"Default": NEEDLE,`
            string node_default = content.split ("\"Default\": ")[1];
            node_default = node_default.split (",")[0];
            node_default = node_default.replace ("\"", "");

            // answer the question
            subprocess = run_rclone_command ({
                "config", "update", id, "--continue",
                "--state", node_state,
                "--result", node_default
            }, GLib.SubprocessFlags.STDOUT_PIPE);
        }

        // again load the remote list
        update_remotes ();

        // return created remote
        return new Remote (provider, id);

    }


    /**
     * Runs rclone command.
     */
    private static Subprocess run_rclone_command (
        string[]        args,
        SubprocessFlags flags = SubprocessFlags.NONE
    ) throws Error {

        // make new array of args
        string[] complete_args = {};

        // add `rclone` program name
        complete_args += "rclone";

        // add all the args
        foreach (var arg in args) complete_args += arg;

        // add `--config PATH` argument to make rclone use the correct config
        complete_args += "--config";
        complete_args += Path.build_filename (Constants.DATA_DIR, "rclone.conf");

        // run the command
        return new Subprocess.newv (complete_args, flags);

    }

}
