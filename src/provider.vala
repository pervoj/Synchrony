/* provider.vala
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

public class Synchrony.Provider : Object {

    /**
     * The rclone code for the provider.
     *
     * e.g. `dropbox`
     */
    public string code { get; construct; }


    /**
     * The name for the provider.
     *
     * e.g. `Dropbox`
     */
    public string name { get; construct; }


    public Provider (string code, string name) {
        Object (
            code: code,
            name: name
        );
    }

}
