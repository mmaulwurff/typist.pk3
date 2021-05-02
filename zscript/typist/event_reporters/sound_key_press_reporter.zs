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
 * This class implements tt_KeyPressReporter by playing a sound.
 *
 * The sound won't play if it's disabled in settings.
 */
class tt_SoundKeyPressReporter : tt_KeyPressReporter
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_SoundKeyPressReporter of(tt_SoundPlayer soundPlayer, tt_SoundSettings settings)
  {
    let result = new("tt_SoundKeyPressReporter"); // construct

    result._soundPlayer = soundPlayer;
    result._settings    = settings;

    return result;
  }

  override
  void report()
  {
    if (_settings.isTypingEnabled())
    {
      _soundPlayer.playSound("tt/click");
    }
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_SoundPlayer   _soundPlayer;
  private tt_SoundSettings _settings;

} // class tt_SoundKeyPressReporter
