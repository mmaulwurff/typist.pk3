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
 * This class implements tt_QuestionSource by composing a question from groups
 * of characters enabled by settings.
 */
class tt_RandomCharactersLesson : tt_QuestionSource
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_RandomCharactersLesson of(tt_RandomCharactersLessonSettings settings)
  {
    let result = new("tt_RandomCharactersLesson"); // construct

    result._settings = settings;

    return result;
  }

// public: // tt_QuestionSource ////////////////////////////////////////////////

  override
  tt_Question getQuestion()
  {
    String characters = composeCharacterRange();
    int    length     = _settings.getLessonLength();
    String picked     = pick(characters, length);
    let    question   = tt_Match.of(picked, picked);

    return question;
  }

// private: ////////////////////////////////////////////////////////////////////

  /**
   * This function is guaranteed to return non-empty strings.
   */
  private
  String composeCharacterRange()
  {
    String characters;

    if (_settings.isUppercaseLettersEnabled()) { characters.AppendFormat("%s", UPPERCASE_LETTERS); }
    if (_settings.isLowercaseLettersEnabled()) { characters.AppendFormat("%s", LOWERCASE_LETTERS); }
    if (_settings.isNumbersEnabled         ()) { characters.AppendFormat("%s", NUMBERS          ); }
    if (_settings.isPunctuationEnabled     ()) { characters.AppendFormat("%s", PUNCTUATION      ); }
    if (_settings.isSymbolsEnabled         ())
    {
      // GZDoom cannot handle "\\" in a string, so add it manually.
      characters.AppendFormat("%s%c", SYMBOLS, tt_Ascii.Backslash);
    }
    if (_settings.isCustomCharactersEnabled())
    {
      characters.AppendFormat("%s", _settings.getCustomCharacters());
    }

    if (characters.Length() == 0)
    {
      characters = "?";
    }

    return characters;
  }

  /**
   * This function expects that @a characters consists of ASCII characters only.
   * This function is guaranteed to return non-empty strings.
   */
  private static
  String pick(String characters, int number)
  {
    String picked;
    int    lastCharacter = characters.CodePointCount() - 1;

    for (int i = 0; i < number; ++i)
    {
      int randomIndex = Random(0, lastCharacter);
      int character   = getCodePointAt(characters, randomIndex);

      picked.AppendFormat("%c", character);
    }

    return picked;
  }

  /**
   * @attention O(n)
   */
  private static
  int getCodePointAt(String str, int index)
  {
    int letterCode;
    int charPos = 0;
    for (int i = 0; i <= index; ++i)
    {
      [letterCode, charPos] = str.GetNextCodePoint(charPos);
    }

    return letterCode;
  }

// private: ////////////////////////////////////////////////////////////////////

  const LOWERCASE_LETTERS = "abcdefghijklmnopqrstuvwxyz";
  const UPPERCASE_LETTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  const NUMBERS           = "0123456789";
  const PUNCTUATION       = ",.();:-'\"?!/";
  const SYMBOLS           = "~`@#$%^&*+=[]{}<>|";

// private: ////////////////////////////////////////////////////////////////////

  private tt_RandomCharactersLessonSettings _settings;

} // class tt_RandomCharactersLesson
