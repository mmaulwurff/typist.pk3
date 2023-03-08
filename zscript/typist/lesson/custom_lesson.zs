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
 *
 */
class tt_CustomLesson : tt_QuestionSource
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_CustomLesson of()
  {
    let result = new("tt_CustomLesson"); // construct

    int    contentsIndex = Wads.FindLump("typist_custom_text");
    String contents      = Wads.ReadLump(contentsIndex);
    String filtered      = filterLetters(contents);
    Array<String> words;
    filtered.Split(words, SPACE, TOK_SkipEmpty);
    filterWords(words, result._wordSet);

    return result;
  }

// public: // tt_QuestionSource ////////////////////////////////////////////////

  override
  tt_Question getQuestion()
  {

    uint   nWords    = _wordSet.size();
    uint   wordIndex = Random(0, nWords - 1);
    String word      = _wordSet[wordIndex];
    let    question  = tt_Match.of(word, word);

    return question;
  }

// private: ////////////////////////////////////////////////////////////////////

  const SPACE = " ";

  const MIN_WORD_LENGTH =  1;

// private: ////////////////////////////////////////////////////////////////////

  private static
  String filterLetters(String text)
  {
    // replace everything that is not a letter with a space
    for (int code = 0; code < tt_Ascii.End; ++code)
    {
      bool isPrintable = (tt_Ascii.Space < code && code < tt_Ascii.Delete);
      if (isPrintable)
      {
        continue;
      }

      String pattern = String.Format("%c", code);
      text.Replace(pattern, SPACE);
    }

    return text;
  }

  /**
   * Removes too short words, removes duplicates.
   *
   * Guarantees that wordSet has at least one word.
   */
  private static
  void filterWords(Array<String> words, out Array<String> wordSet)
  {
    // Use dictionary to remove duplicates.

    uint nWords   = words.size();
    let  wordDict = Dictionary.Create();

    for (uint i = 0; i < nWords; ++i)
    {
      String word   = words[i];
      uint   length = word.CodePointCount();

      if (MIN_WORD_LENGTH <= length)
      {
        wordDict.Insert(word, "");
      }
    }

    let wordDictIterator = DictionaryIterator.Create(wordDict);
    while (wordDictIterator.Next())
    {
      wordSet.Push(wordDictIterator.Key());
    }

    if (wordSet.size() == 0)
    {
      wordSet.Push("<no words found>");
    }
  }

// private: ////////////////////////////////////////////////////////////////////

  private Array<String> _wordSet;

} // class tt_CustomLesson
