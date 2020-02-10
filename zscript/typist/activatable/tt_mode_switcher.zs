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
 * This class implements Activatable interface by allowing to switch game modes.
 */
class tt_ModeSwitcher : tt_Activatable
{

// public: /////////////////////////////////////////////////////////////////////

  tt_ModeSwitcher init(tt_ModeStorage modeStorage)
  {
    _modeStorage = modeStorage;

    return self;
  }

// public: // Activatable //////////////////////////////////////////////////////

  override
  void activate()
  {
    _modeStorage.setMode(tt_Mode.Explore);
  }

  override
  tt_Strings getCommands()
  {
    let result = new("tt_Strings").init();
    result.add("/exp");

    return result;
  }

  override
  bool isVisible()
  {
    return true;
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_ModeStorage _modeStorage;

} // class tt_ModeSwitcher
