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
 * This class implements ModeStorage by simply storing the mode that was set.
 */
class tt_SettableMode : tt_ModeStorage
{

// public: /////////////////////////////////////////////////////////////////////

  tt_SettableMode init()
  {
    _mode = tt_Mode.None;

    return self;
  }

// public: // tt_ModeSource ////////////////////////////////////////////////////

  override
  int getMode()
  {
    return _mode;
  }

// public: // tt_ModeStorage ///////////////////////////////////////////////////

  override
  void setMode(int mode)
  {
    _mode = mode;
  }

// private: ////////////////////////////////////////////////////////////////////

  private int _mode;

} // class tt_SettableMode
