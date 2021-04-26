/* Copyright Alexander 'm8f' Kromm (mmaulwurff@gmail.com) 2019-2021
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
 * This class implements tt_AnswerSource by taking another tt_AnswerSource,
 * and only passing keys to it if a key was pressed down after the game mode
 * has changed to Combat.
 */
class tt_InputBlockAfterCombat : tt_AnswerSource
{

  static
  tt_InputBlockAfterCombat of( tt_AnswerSource answerSource
                             , tt_ModeSource   modeSource
                             , tt_ModeSource   oldModeSource
                             )
  {
    let result = new("tt_InputBlockAfterCombat"); // construct

    result._answerSource  = answerSource;
    result._modeSource    = modeSource;
    result._oldModeSource = oldModeSource;

    result._isLocked = false;

    return result;
  }

  void update()
  {
    int mode    = _modeSource.getMode();
    int oldMode = _oldModeSource.getMode();

    if (oldMode != tt_Mode.Combat && mode == tt_Mode.Combat)
    {
      _isLocked = true;
    }
  }

// public: // tt_AnswerSource //////////////////////////////////////////////////

  override
  tt_Answer getAnswer()
  {
    return _answerSource.getAnswer();
  }

  override
  void processKey(tt_Character character)
  {
    if (character.getEventType() == UiEvent.Type_KeyDown)
    {
      _isLocked = false;
    }

    if (!_isLocked)
    {
      _answerSource.processKey(character);
    }
  }

  override
  void reset() {}

// private: ////////////////////////////////////////////////////////////////////

  private tt_AnswerSource _answerSource;
  private tt_ModeSource   _modeSource;
  private tt_ModeSource   _oldModeSource;

  private bool _isLocked;

} // class tt_InputBlockAfterCombat
