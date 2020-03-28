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
 * This class implements tt_SoundSettings by reading CVars.
 */
class tt_SoundSettingsImpl : tt_SoundSettings
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_SoundSettingsImpl of(tt_PlayerSource playerSource)
  {
    let result = new("tt_SoundSettingsImpl"); // construct

    result._enabledCvar       = tt_Cvar.of(playerSource, "tt_sound_enabled"       );
    result._soundThemeCvar    = tt_Cvar.of(playerSource, "tt_sound_theme"         );
    result._typingEnabledCvar = tt_Cvar.of(playerSource, "tt_sound_typing_enabled");

    return result;
  }

// public: // tt_SoundSettingsImpl /////////////////////////////////////////////

  override bool isEnabled()       { return _enabledCvar       . GetBool(); }
  override bool isTypingEnabled() { return _typingEnabledCvar . GetBool(); }
  override int  getTheme()        { return _soundThemeCvar    . GetInt (); }

// private: ////////////////////////////////////////////////////////////////////

  private tt_Cvar _soundThemeCvar;
  private tt_Cvar _enabledCvar;
  private tt_cvar _typingEnabledCvar;

} // class tt_SoundSettingsImpl
