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
 * This class provides access to Typist.pk3 sound settings.
 */
class tt_SoundSettings abstract
{

// public: /////////////////////////////////////////////////////////////////////

  virtual
  bool isEnabled()
  {
    tt_Log.log("zscript/typist/settings/tt_sound_settings.zs:29: T: override this!");
    return false;
  }

  virtual
  bool isTypingEnabled()
  {
    tt_Log.log("zscript/typist/settings/tt_sound_settings.zs:36: T: override this!");
    return false;
  }

  virtual
  int getTheme()
  {
    tt_Log.log("zscript/typist/settings/tt_sound_settings.zs:43: T: override this!");
    return 0;
  }

} // class tt_SoundSettings
