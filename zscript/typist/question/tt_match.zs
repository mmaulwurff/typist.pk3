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
 * This class implements tt_Question.
 * The answer is right for this kind of question if it matches the string
 * contained in this question.
 */
class tt_Match : tt_Question
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_Match of(String question, String description)
  {
    let result = new("tt_Match"); // construct

    result._question    = question;
    result._description = description;

    return result;
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
    return getColoredMatch(_question, answer.getString());
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  String getColoredMatch(String origin, String matched)
  {
    String result;

    int originLength   = origin .CodePointCount();
    int matchedLength  = matched.CodePointCount();
    int nChars         = min(originLength, matchedLength);
    int originCharPos  = 0;
    int matchedCharPos = 0;

    for (int i = 0; i < nChars; ++i)
    {
      int nextOriginCharPos;
      int nextMatchedCharPos;
      int originCode;
      int matchedCode;
      [originCode,  nextOriginCharPos ] = origin .GetNextCodePoint(originCharPos );
      [matchedCode, nextMatchedCharPos] = matched.GetNextCodePoint(matchedCharPos);

      bool   isCharSame = (originCode == matchedCode);
      String colorCode  = (isCharSame ? "q" : "g"); // dark green, red

      String matchedChar = matched.Mid(matchedCharPos, nextMatchedCharPos - matchedCharPos);
      result.appendFormat("\c%s%s", colorCode, matchedChar);

      originCharPos  = nextOriginCharPos;
      matchedCharPos = nextMatchedCharPos;
    }

    if (matchedLength > originLength)
    {
      // everything that is beyond origin is wrong.
      result.appendFormat("\cg%s", matched.Mid(matchedCharPos));
    }

    return result;
  }

// private: ////////////////////////////////////////////////////////////////////

  private String _question;
  private String _description;

} // class tt_Match
