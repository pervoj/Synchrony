/* application.vala
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

public class Synchrony.Application : Adw.Application {

    public Application () {
        Object (
            application_id: Constants.APP_ID,
            flags: ApplicationFlags.FLAGS_NONE
        );
    }


    construct {
        ActionEntry[] action_entries = {
            { "about", this.on_about_action },
            { "preferences", this.on_preferences_action },
            { "quit", this.quit }
        };
        this.add_action_entries (action_entries, this);
        this.set_accels_for_action ("app.quit", {"<primary>q"});
    }


    public override void activate () {
        base.activate ();
        var win = this.active_window;
        if (win == null) {
            // win = new Synchrony.Window (this);
            // win = new Gtk.Window ();
        }
        win.present ();
    }


    public static int main (string[] args) {
        // enable gettext
        // https://developer.gnome.org/glib/stable/glib-I18N.html#glib-I18N.description
        Intl.setlocale (LocaleCategory.ALL, "");
        Intl.bindtextdomain (Constants.GETTEXT_PACKAGE, Constants.LOCALE_DIR);
        Intl.bind_textdomain_codeset (Constants.GETTEXT_PACKAGE, "UTF-8");
        Intl.textdomain (Constants.GETTEXT_PACKAGE);

        // create data dir
        try {
            var data_dir = File.new_for_path (Constants.DATA_DIR);
            if (!data_dir.query_exists ())
                data_dir.make_directory_with_parents ();
        } catch (Error e) {
            critical (_("Error creating data directory: %s"), e.message);
            return 1;
        }

        // create config file
        try {
            var config_file = File.new_build_filename (Constants.DATA_DIR, "rclone.conf");
            if (!config_file.query_exists ())
                config_file.create (GLib.FileCreateFlags.NONE);
        } catch (Error e) {
            critical (_("Error creating config file: %s"), e.message);
            return 1;
        }

        // var app = new Application ();
        // return app.run (args);

        return 0;
    }


    private void on_about_action () {
        string[] authors = { "Vojtěch Perník" };
        Gtk.show_about_dialog (this.active_window,
            "program-name", _("Synchrony"),
            "authors", authors,
            "translator-credits", _("translator-credits"),
            "version", Constants.VERSION
        );
    }


    private void on_preferences_action () {
        message ("app.preferences action activated");
    }

}
