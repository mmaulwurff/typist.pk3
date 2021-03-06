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
 * This class implements tt_InputManager by examining the current and old
 * Typist mode.
 *
 * Input is reset when the game mode is changed.
 */
class tt_InputByModeManager : tt_InputManager
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_InputByModeManager of(tt_ModeSource modeSource, tt_PlayerInput playerInput)
  {
    let result = new("tt_InputByModeManager"); // construct

    result._modeSource  = modeSource;
    result._playerInput = playerInput;

    result._oldMode = tt_Mode.Unknown;

    return result;
  }

// public: // tt_InputManager //////////////////////////////////////////////////

  override
  void manageInput()
  {
    int  mode             = _modeSource.getMode();
    bool isCapturingKeys  = (mode == tt_Mode.Combat);
    bool wasCapturingKeys = (_oldMode != tt_Mode.Combat);

    if (wasCapturingKeys && isCapturingKeys == false)
    {
      _playerInput.reset();
    }

    _oldMode = mode;
  }

  override
  bool isCapturingKeys()
  {
    int mode = _modeSource.getMode();
    return (mode == tt_Mode.Combat);
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_ModeSource  _modeSource;
  private tt_PlayerInput _playerInput;

  private int _oldMode;

} // class tt_InputByModeManager
