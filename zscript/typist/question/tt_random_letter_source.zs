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
 * This class implement tt_QuestionSource by producing questions that contain
 * string composed from random numbers and should match exactly to the answers.
 */
class tt_RandomLetterSource : tt_QuestionSource
{

// public: /////////////////////////////////////////////////////////////////////

  tt_RandomLetterSource init(tt_DifficultySource difficultySource)
  {
    _difficultySource = difficultySource;

    return self;
  }

// public: // tt_QuestionSource ////////////////////////////////////////////////

  override
  tt_Question getQuestion()
  {
    let difficulty   = _difficultySource.getDifficulty();
    let stringLength = difficulty.shootStringLength();
    let str          = "";

    for (int i = 0; i < stringLength; ++i)
    {
      bool isCapital = false; // Random(0, 1);

      int letter = isCapital
                 ? Random(tt_Ascii.UppercaseA, tt_Ascii.UppercaseZ)
                 : Random(tt_Ascii.LowercaseA, tt_Ascii.LowercaseZ);
      str.AppendFormat("%c", letter);
    }

    let question = new("tt_Match").init(str, str);

    return question;
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_DifficultySource _difficultySource;

} // class tt_RandomLetterSource
