/* Copyright Alexander 'm8f' Kromm (mmaulwurff@gmail.com) 2019-2020
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
 * This class implements Turner by specifying the angle to turn left.
 */
class tt_LeftTurner : tt_Turner
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_LeftTurner of(tt_PlayerSource playerSource)
  {
    let result = new("tt_LeftTurner"); // construct

    result._playerSource = playerSource;

    return result;
  }

// public: // tt_Turner ////////////////////////////////////////////////////////

  override
  double getTurnAngle()
  {
    return 45.0;
  }

// public: // tt_Activatable ///////////////////////////////////////////////////

  override
  tt_Strings getCommands()
  {
    let result = tt_Strings.of();
    result.add("tl");

    return result;
  }

} // class tt_LeftTurner
