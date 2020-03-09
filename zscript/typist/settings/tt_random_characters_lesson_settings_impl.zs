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
    _lessonLength         = new("tt_Cvar").init(playerSource, "tt_rc_length");
    _isUppercaseEnabled   = new("tt_Cvar").init(playerSource, "tt_rc_uppercase_letters_enabled");
    _isLowercaseEnabled   = new("tt_Cvar").init(playerSource, "tt_rc_lowercase_letters_enabled");
    _isNumbersEnabled     = new("tt_Cvar").init(playerSource, "tt_rc_numbers_enabled");
    _isPunctuationEnabled = new("tt_Cvar").init(playerSource, "tt_rc_punctuation_enabled");
    _isSymbolsEnabled     = new("tt_Cvar").init(playerSource, "tt_rc_symbols_enabled");
    _isCustomEnabled      = new("tt_Cvar").init(playerSource, "tt_rc_custom_enabled");
    _customCharacters     = new("tt_Cvar").init(playerSource, "tt_rc_custom");

    return self;
  }

// public: // tt_RandomCharactersLessonSettings ////////////////////////////////

  override int    getLessonLength()           { return _lessonLength.getInt();          }
  override bool   isUppercaseLettersEnabled() { return _isUppercaseEnabled.getBool();   }
  override bool   isLowercaseLettersEnabled() { return _isLowercaseEnabled.getBool();   }
  override bool   isNumbersEnabled()          { return _isNumbersEnabled.getBool();     }
  override bool   isPunctuationEnabled()      { return _isPunctuationEnabled.getBool(); }
  override bool   isSymbolsEnabled()          { return _isSymbolsEnabled.getBool();     }
  override bool   isCustomCharactersEnabled() { return _isCustomEnabled.getBool();      }
  override String getCustomCharacters()       { return _customCharacters.getString();   }

// private: ////////////////////////////////////////////////////////////////////

  private tt_Cvar _lessonLength;
  private tt_Cvar _isUppercaseEnabled;
  private tt_Cvar _isLowercaseEnabled;
  private tt_Cvar _isNumbersEnabled;
  private tt_Cvar _isPunctuationEnabled;
  private tt_Cvar _isSymbolsEnabled;
  private tt_Cvar _isCustomEnabled;
  private tt_Cvar _customCharacters;

} // class tt_RandomCharactersLessonSettingsImpl
