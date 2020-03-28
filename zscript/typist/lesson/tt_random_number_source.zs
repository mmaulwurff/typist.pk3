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
 * This class implements tt_QuestionSource by producing questions that contain
 * string composed from random numbers and should match exactly to the answers.
 */
class tt_RandomNumberSource : tt_QuestionSource
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_RandomNumberSource of()
  {
    let result = new("tt_RandomNumberSource"); // construct
    return result;
  }

// public: // tt_QuestionSource ////////////////////////////////////////////////

  override
  tt_Question getQuestion()
  {
    let stringLength = 3;
    let str          = "";

    for (int i = 0; i < stringLength; ++i)
    {
      int number = Random(tt_Ascii.Number0, tt_Ascii.Number9);
      str.AppendFormat("%c", number);
    }

    let question = tt_Match.of(str, str);

    return question;
  }

} // class tt_RandomNumberSource
