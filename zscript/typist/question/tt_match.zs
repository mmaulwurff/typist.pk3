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

/**
 * This class implements tt_Question.
 * The answer is right for this kind of question if it matches the string
 * contained in this question.
 */
class tt_Match : tt_Question
{

// public: /////////////////////////////////////////////////////////////////////

  tt_Question init(String question, String description)
  {
    _question    = question;
    _description = description;

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
    return _description;
  }

  override
  String getHintFor(tt_Answer answer)
  {
    // This method is limited to ASCII questions and answers.

    String answerString   = answer.getString();
    uint   answerLength   = answerString.length();
    uint   questionLength = _question.length();
    uint   nChars         = min(answerLength, questionLength);
    String result;

    for (uint i = 0; i < nChars; ++i)
    {
      int    questionChar = _question.ByteAt(i);
      int    answerChar   = answerString.ByteAt(i);
      bool   isCharSame   = (questionChar == answerChar);
      String colorCode    = (isCharSame ? "q" : "g"); // dark green, red

      result.appendFormat("\c%s%c", colorCode, answerChar);
    }

    if (answerLength > questionLength)
    {
      // everything that is beyond question is wrong.
      result.appendFormat("\cg%s", answerString.Mid(questionLength));
    }

    return result;
  }

// private: ////////////////////////////////////////////////////////////////////

  private String _question;
  private String _description;

} // class tt_Match
