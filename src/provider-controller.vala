/* provider-controller.vala
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

public class Synchrony.ProviderController : Object {

    private static void set_providers () {
        if (providers != null) return;
        providers = {

            // defined list of providers
            // new Provider ("CODE", _("NAME"));
            // keep alphabetical order!

            // Dropbox (https://www.dropbox.com/)
            new Provider ("dropbox", _("Dropbox")),

            // Google Drive (https://drive.google.com/)
            new Provider ("drive", _("Google Drive")),

            // OneDrive (https://onedrive.com/)
            new Provider ("onedrive", _("OneDrive")),

            // pCloud (https://www.pcloud.com/)
            new Provider ("pcloud", _("pCloud")),

        };
    }


    private static Provider[] providers;


    public static Provider[] get_providers () {
        set_providers ();
        return providers;
    }


    public static bool code_exists (string code) {
        set_providers ();
        foreach (var provider in providers) {
            if (provider.code == code) return true;
        }
        return false;
    }


    public static Provider? get_for_code (string code) {
        set_providers ();
        foreach (var provider in providers) {
            if (provider.code == code) return provider;
        }
        return null;
    }

}
