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
 * This class implements tt_ModeReporter by playing the corresponding sound for
 * each mode.
 */
class tt_SoundModeReporter : tt_ModeReporter
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_SoundModeReporter of(tt_SoundPlayer soundPlayer)
  {
    let result = new("tt_SoundModeReporter"); // construct
    result._soundPlayer = soundPlayer;
    return result;
  }

  override
  void report(int mode)
  {
    switch (mode)
    {
    case tt_Mode.Unknown:
      tt_Log.log("zscript/typist/event_reporters/tt_sound_mode_reporter.zs:41: T: unknown mode!");
      break;
    case tt_Mode.Combat:  _soundPlayer.playSound("tt/combat");  break;
    case tt_Mode.Explore: _soundPlayer.playSound("tt/explore"); break;
    case tt_Mode.None:    break;
    }
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_SoundPlayer _soundPlayer;

} // class tt_SoundModeReporter
