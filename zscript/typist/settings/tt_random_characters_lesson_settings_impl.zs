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
 * This class implements tt_RandomCharactersLessonSettings by returning Cvar
 * contents.
 *
 * Cvars are cached.
 */
class tt_RandomCharactersLessonSettingsImpl : tt_RandomCharactersLessonSettings
{

// public: /////////////////////////////////////////////////////////////////////

  tt_RandomCharactersLessonSettingsImpl init(tt_PlayerSource playerSource)
  {
    initPlayerSource(playerSource);

    return self;
  }

// public: // tt_RandomCharactersLessonSettings ////////////////////////////////

  override
  int getLessonLength()
  {
    if (_lessonLengthCvar == NULL)
    {
      _lessonLengthCvar = getCvar("tt_rc_length");
    }

    return _lessonLengthCvar.GetInt();
  }

  override
  bool isUppercaseLettersEnabled()
  {
    if (_isUppercaseLettersEnabledCvar == NULL)
    {
      _isUppercaseLettersEnabledCvar = getCvar("tt_rc_uppercase_letters_enabled");
    }

    return _isUppercaseLettersEnabledCvar.GetBool();
  }

  override
  bool isLowercaseLettersEnabled()
  {
    if (_isLowercaseLettersEnabledCvar == NULL)
    {
      _isLowercaseLettersEnabledCvar = getCvar("tt_rc_lowercase_letters_enabled");
    }

    return _isLowercaseLettersEnabledCvar.GetBool();
  }

  override
  bool isNumbersEnabled()
  {
    if (_isNumbersEnabledCvar == NULL)
    {
      _isNumbersEnabledCvar = getCvar("tt_rc_numbers_enabled");
    }

    return _isNumbersEnabledCvar.GetBool();
  }

  override
  bool isPunctuationEnabled()
  {
    if (_isPunctuationEnabledCvar == NULL)
    {
      _isPunctuationEnabledCvar = getCvar("tt_rc_punctuation_enabled");
    }

    return _isPunctuationEnabledCvar.GetBool();
  }

  override
  bool isSymbolsEnabled()
  {
    if (_isSymbolsEnabledCvar == NULL)
    {
      _isSymbolsEnabledCvar = getCvar("tt_rc_symbols_enabled");
    }

    return _isSymbolsEnabledCvar.GetBool();
  }

  override
  bool isCustomCharactersEnabled()
  {
    if (_isCustomEnabledCvar == NULL)
    {
      _isCustomEnabledCvar = getCvar("tt_rc_custom_enabled");
    }

    return _isCustomEnabledCvar.GetBool();
  }

  override
  String getCustomCharacters()
  {
    if (_customCharactersCvar == NULL)
    {
      _customCharactersCvar = getCvar("tt_rc_custom");
    }

    return _customCharactersCvar.GetString();
  }

// private: ////////////////////////////////////////////////////////////////////

  mixin tt_CvarUser;

  private transient Cvar _lessonLengthCvar;
  private transient Cvar _isUppercaseLettersEnabledCvar;
  private transient Cvar _isLowercaseLettersEnabledCvar;
  private transient Cvar _isNumbersEnabledCvar;
  private transient Cvar _isPunctuationEnabledCvar;
  private transient Cvar _isSymbolsEnabledCvar;
  private transient Cvar _isCustomEnabledCvar;
  private transient Cvar _customCharactersCvar;

} // class tt_RandomCharactersLessonSettingsImpl
