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
 * This class implements tt_AnswerState by observing Enter and Space keys.
 *
 * The state is:
 * - Preparing when no Enter or Space key is pressed.
 * - Ready when Enter or Space key is pressed, but not yet released.
 * - Finished when Enter or Space key is released.
 *
 * @note Space acts the same as Enter key, see tt_Character class for details.
 */
class tt_PressedAnswerState : tt_AnswerStateSource
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_PressedAnswerState of()
  {
    let result = new("tt_PressedAnswerState"); // construct
    result._answerState = DEFAULT_STATE;
    return result;
  }

// public: // tt_AnswerStateSource /////////////////////////////////////////////

  override
  void processKey(tt_Character character)
  {
    switch (character.getType())
    {
    case tt_Character.ENTER:    _answerState = tt_AnswerState.Ready;     break;
    case tt_Character.ENTER_UP: _answerState = tt_AnswerState.Finished;  break;
    default:                    _answerState = tt_AnswerState.Preparing; break;
    }
  }

  override
  tt_AnswerState getAnswerState()
  {
    return tt_AnswerState.of(_answerState);
  }

  override
  void reset()
  {
    _answerState = DEFAULT_STATE;
  }

// private: ////////////////////////////////////////////////////////////////////

  const DEFAULT_STATE = tt_AnswerState.Preparing;

  private int _answerState;

} // class tt_PressedAnswerState
