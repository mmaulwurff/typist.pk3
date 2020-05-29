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
 *
 */
class tt_AnswerResetter : tt_WorldChanger
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_AnswerResetter of( tt_AnswerStateSource answerStateSource
                      , tt_AnswerSource      answerSource
                      )
  {
    let result = new("tt_AnswerResetter"); // construct

    result._answerStateSource = answerStateSource;
    result._answerSource      = answerSource;
    result._oldAnswerState    = tt_AnswerState.of(tt_AnswerState.Unknown);

    return result;
  }

  override
  void changeWorld()
  {
    let newAnswerState = _answerStateSource.getAnswerState();
    if (!_oldAnswerState.isFinished() && newAnswerState.isFinished())
    {
      _answerStateSource.reset();
      _answerSource.reset();
    }

    _oldAnswerState = newAnswerState;
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_AnswerStateSource _answerStateSource;
  private tt_AnswerSource      _answerSource;

  private tt_AnswerState _oldAnswerState;

} // class tt_AnswerResetter
