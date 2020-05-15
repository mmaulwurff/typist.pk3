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
 * This class implements tt_AnswerStateSource by always returning Ready state.
 */
class tt_AlwaysReadyAnswerStateSource : tt_AnswerStateSource
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_AlwaysReadyAnswerStateSource of()
  {
    let result = new("tt_AlwaysReadyAnswerStateSource"); // construct
    return result;
  }

// public: // tt_AnswerStateSource /////////////////////////////////////////////

  override
  void processKey(tt_Character character)
  {
    // do nothing
  }

  override
  tt_AnswerState getAnswerState()
  {
    return tt_AnswerState.of(tt_AnswerState.Ready);
  }

  override
  void reset()
  {
    // do nothing
  }

} // class tt_AlwaysReadyAnswerStateSource
