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
 * This class implements tt_Dasher by specifying dash angle.
 */
class tt_BackDasher : tt_Dasher
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_BackDasher of(tt_PlayerSource playerSource, tt_CommandSettings settings)
  {
    let result = new("tt_BackDasher"); // construct

    result._playerSource = playerSource;
    result._settings     = settings;

    return result;
  }

// public: // tt_Dasher ////////////////////////////////////////////////////////

  override
  double getDashAngle()
  {
    return 180;
  }

// public: // tt_Activatable ///////////////////////////////////////////////////

  override
  tt_Strings getCommands()
  {
    return tt_Strings.ofOne(_settings.getBackwardDashCommand());
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_CommandSettings _settings;

} // class tt_BackDasher
