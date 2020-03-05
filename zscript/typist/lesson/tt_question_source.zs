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
 * This class is an interface for getting Questions.
 *
 * Different question sources are different Lessons.
 */
class tt_QuestionSource abstract
{

// public: /////////////////////////////////////////////////////////////////////

  virtual
  tt_Question getQuestion()
  {
    Console.Printf("zscript/typist/lesson/tt_question_source.zs:31: T: override this!");
    return NULL;
  }

} // class tt_QuestionSource
