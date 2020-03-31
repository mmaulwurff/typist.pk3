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
 * This class implements tt_QuestionSource by reading a lump with words and
 * randomly selecting words from this lump.
 */
class tt_StringSet : tt_QuestionSource
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_StringSet of(String lumpName)
  {
    int    lump     = Wads.FindLump(lumpName, 0, Wads.AnyNamespace);
    String contents = Wads.ReadLump(lump);
    Array<String> words;
    contents.Split(words, "\n", TOK_SkipEmpty);
    sanitizeWords(words);

    let result = new("tt_StringSet"); // construct

    result._lumpName = lumpName;
    result._words.Move(words);

    return result;
  }

// public: // tt_QuestionSource ////////////////////////////////////////////////

  override
  tt_Question getQuestion()
  {
    int nWords = int(_words.size());
    if (nWords == 0)
    {
      let message = String.Format("zscript/typist/lesson/tt_string_set.zs:52: T:"
                                  "no words in lump %s.", _lumpName);
      tt_Log.log(message);
      return NULL;
    }

    int    wordIndex = Random(0, nWords - 1);
    String word      = _words[wordIndex];
    let    question  = tt_Match.of(word, word);

    return question;
  }

// private: ////////////////////////////////////////////////////////////////////

  private static
  void sanitizeWords(out Array<String> words)
  {
    uint nWords = words.size();
    for (uint i = 0; i < nWords; ++i)
    {
      words[i] = Strip(words[i]);
    }

    for (uint i = 0; i < words[i].length();)
    {
      if (words[i].length() == 0)
      {
        words.Delete(i);
      }
      else
      {
        ++i;
      }
    }

    words.Pop();
  }

  /**
   * Removes spaces from left and right.
   */
  private static
  String Strip(String str)
  {
    uint length = str.length();

    uint left = 0;
    while (isSpace(str.ByteAt(left)) && left < length)
    {
      ++left;
    }

    uint right = length - 1;
    while (isSpace(str.ByteAt(right)) && right >= 0)
    {
      --right;
    }

    String result = str.Mid(left, right - left + 1);

    return result;
  }

  private static
  bool isSpace(int byte)
  {
    return (byte <= tt_Ascii.Space); // control characters and space.
  }

// private: ////////////////////////////////////////////////////////////////////

  private String        _lumpName;
  private Array<String> _words;

} // class tt_StringSet
