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
 * This class implements tt_AnswerSource by receiving player key inputs and
 * composing an answer from them.
 */
class tt_PlayerInput : tt_AnswerSource
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_PlayerInput of(tt_ModeStorage modeStorage, tt_EventReporter eventReporter)
  {
    let result = new("tt_PlayerInput"); // construct

    result._modeStorage   = modeStorage;
    result._eventReporter = eventReporter;

    result._answer = tt_Answer.of();

    return result;
  }

// public: // tt_AnswerSource //////////////////////////////////////////////////

  override
  tt_Answer getAnswer()
  {
    return _answer;
  }

  override
  void processKey(tt_Character character)
  {
    int type = character.getType();
    switch (type)
    {
    case tt_Character.NONE: break;

    case tt_Character.PRINTABLE:
      _answer.append(character.getCharacter());
      _eventReporter.reportKeyPressed();
      break;

    case tt_Character.BACKSPACE:      _answer.deleteLastCharacter();         break;
    case tt_Character.CTRL_BACKSPACE: reset();                               break;
    case tt_Character.ESCAPE:         _modeStorage.setMode(tt_Mode.Explore); break;
    }
  }

  override
  void reset()
  {
    _answer = tt_Answer.of();
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_ModeStorage   _modeStorage;
  private tt_EventReporter _eventReporter;

  private tt_Answer _answer;

} // class tt_PlayerInput
