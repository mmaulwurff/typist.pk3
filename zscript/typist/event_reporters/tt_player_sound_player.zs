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
 * This class implements tt_SoundPlayer by playing sounds for a player.
 *
 * The sounds won't play if they are disabled in settings.
 */
class tt_PlayerSoundPlayer : tt_SoundPlayer
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_PlayerSoundPlayer of(tt_PlayerSource playerSource, tt_SoundSettings settings)
  {
    let result = new("tt_PlayerSoundPlayer"); // construct

    result._playerSource = playerSource;
    result._settings     = settings;

    return result;
  }

  override
  void playSound(String soundId)
  {
    if (isDisabled()) return;

    let player = _playerSource.getPawn();
    int theme  = _settings.getTheme();
    soundId.AppendFormat("%d", theme);

    player.A_StartSound(soundId, CHAN_AUTO, SOUND_FLAGS);
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  bool isDisabled()
  {
    return (!_settings.isEnabled());
  }

  const SOUND_FLAGS = CHANF_UI | CHANF_OVERLAP | CHANF_LOCAL;

  private tt_PlayerSource  _playerSource;
  private tt_SoundSettings _settings;

} // class tt_PlayerSoundPlayer
