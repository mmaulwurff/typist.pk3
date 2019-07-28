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

/** This interface represents a source of answers.
 */
class tt_AnswerSource abstract
{

// public: /////////////////////////////////////////////////////////////////////

  virtual
  tt_Answer getAnswer()
  {
    Console.Printf("zscript/typist/answer/tt_answer_source.zs:28: T: override this!");
    return NULL;
  }

  /** This function asks the AnswerSource to try begin to return another answer.
   */
  virtual
  void reset()
  {
    Console.Printf("zscript/typist/answer/tt_answer_source.zs:37: T: override this!");
  }

} // class tt_AnswerSource
