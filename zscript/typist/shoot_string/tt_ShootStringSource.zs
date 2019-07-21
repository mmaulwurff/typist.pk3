/* Copyright Alexander 'm8f' Kromm (mmaulwurff@gmail.com) 2019
 *
 * This file is a part of Typist.pk3.
 *
 * Typist.pk3 is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later
 * version.
 *
 * Typist.pk3 is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
 * A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * Typist.pk3.  If not, see <https://www.gnu.org/licenses/>.
 */

/** This interface provides a source of strings intended to be assigned to
 * targets.
 */
class tt_ShootStringSource abstract
{

// public: /////////////////////////////////////////////////////////////////////

  /** Get a string with a specified length from this source.
   * String length is a recommendation, the result string is not guaranteed to
   * be the specified length.
   *
   * @returns a string on success, error on failure.
   */
  virtual
  tt_String getString(int length)
  {
    console.printf("./zscript/typist/shoot_string/tt_ShootStringSource.zs:35: T: override this!");
    return NULL;
  }

} // class tt_ShootStringSource
