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

/** This class implements tt_Question.
 * The answer is right for this kind of question if it matches the string
 * contained in this question.
 */
class tt_Match : tt_Question
{

// public: /////////////////////////////////////////////////////////////////////

  tt_Question init(String question)
  {
    _question = question;

    return self;
  }

// public: // tt_Question //////////////////////////////////////////////////////

  override
  bool isRight(tt_Answer answer)
  {
    bool isEqual = (_question == answer.getString());

    return isEqual;
  }

  override
  String getDescription()
  {
    return _question;
  }

// private: ////////////////////////////////////////////////////////////////////

  private String _question;

} // class tt_Match
