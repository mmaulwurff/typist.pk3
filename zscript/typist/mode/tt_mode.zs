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

/** This class represents the mode in which Typist operates.
 */
class tt_Mode
{

// public: /////////////////////////////////////////////////////////////////////

  tt_Mode init()
  {
    _isAuto = true;
    _mode   = MODE_EXPLORE;

    return self;
  }

// public: /////////////////////////////////////////////////////////////////////

  /** Auto mode means that Typist will select one of modes according to the
   * current situation.
   */
  bool isAuto() const { return _isAuto; }

  /** Current mode.
   * @returns one of tt_Mode.Modes.
   */
  int mode() const { return _mode; }

  enum Modes
  {
    MODE_COMBAT,  ///< Typist is focused on destroying the targets.
    MODE_EXPLORE, ///< Typist is focused on movement and exploration.
  }

// public: /////////////////////////////////////////////////////////////////////

  void setAuto(bool isAuto) { _isAuto = isAuto; }

  void setMode(int mode)
  {
    if (!isAuto())
    {
      _mode = mode;
    }
  }

// private: ////////////////////////////////////////////////////////////////////

  private bool _isAuto;
  private int  _mode;

} // class tt_Mode
