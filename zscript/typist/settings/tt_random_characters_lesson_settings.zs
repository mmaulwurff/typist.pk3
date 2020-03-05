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
 * This class represents settings for tt_RandomCharactersLesson.
 */
class tt_RandomCharactersLessonSettings
{

// public: /////////////////////////////////////////////////////////////////////

  virtual
  int getLessonLength()
  {
    Console.Printf(
      "zscript/typist/settings/tt_random_characters_lesson_settings.zs:30: T: override this!");
    return 3;
  }

  virtual
  bool isUppercaseLettersEnabled()
  {
    Console.Printf(
      "zscript/typist/settings/tt_random_characters_lesson_settings.zs:38: T: override this!");
    return false;
  }

  virtual
  bool isLowercaseLettersEnabled()
  {
    Console.Printf(
      "zscript/typist/settings/tt_random_characters_lesson_settings.zs:46: T: override this!");
    return false;
  }

  virtual
  bool isNumbersEnabled()
  {
    Console.Printf(
      "zscript/typist/settings/tt_random_characters_lesson_settings.zs:54: T: override this!");
    return false;
  }

  virtual
  bool isPunctuationEnabled()
  {
    Console.Printf(
      "zscript/typist/settings/tt_random_characters_lesson_settings.zs:62: T: override this!");
    return false;
  }

  virtual
  bool isSymbolsEnabled()
  {
    Console.Printf(
      "zscript/typist/settings/tt_random_characters_lesson_settings.zs:70: T: override this!");
    return false;
  }

  virtual
  bool isCustomCharactersEnabled()
  {
    Console.Printf(
      "zscript/typist/settings/tt_random_characters_lesson_settings.zs:78: T: override this!");
    return false;
  }

  virtual
  String getCustomCharacters()
  {
    Console.Printf(
      "zscript/typist/settings/tt_random_characters_lesson_settings.zs:86: T: override this!");
    return "";
  }

} // class tt_RandomCharactersLessonSettings
