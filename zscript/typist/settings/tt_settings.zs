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

/**
 * This interface provides access to Typist.pk3 settings.
 */
class tt_Settings abstract
{

// public: /////////////////////////////////////////////////////////////////////

  virtual
  int getScale()
  {
    Console.Printf("zscript/typist/settings/tt_settings.zs:29: T: override this!");

    return 1;
  }

  virtual
  bool isAutoAimEnabled()
  {
    Console.Printf("zscript/typist/settings/tt_settings.zs:37: T: override this!");

    return false;
  }

} // class tt_Settings
