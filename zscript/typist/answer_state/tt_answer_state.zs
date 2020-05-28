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
 * This class represents Answer state.
 *
 * @see tt_Answer class
 */
class tt_AnswerState
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_AnswerState of (int state)
  {
    let result = new("tt_AnswerState"); // construct

    result._state = state;

    return result;
  }

  enum _
  {
    Unknown,
    Preparing,
    Ready,
    Finished
  }

  bool isReady() const
  {
    return (_state >= Ready);
  }

  bool isFinished() const
  {
    return (_state == Finished);
  }

// private: ////////////////////////////////////////////////////////////////////

  private int _state;

} // class tt_AnswerState
