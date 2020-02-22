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
 * This class implements tt_EventReporter by playing sounds when an event
 * happens.
 */
class tt_SoundReporter : tt_EventReporter
{

// public: /////////////////////////////////////////////////////////////////////

  tt_SoundReporter init(tt_PlayerSource playerSource)
  {
    _playerSource = playerSource;

    return self;
  }

// public: // tt_EventReporter /////////////////////////////////////////////////

  override
  void reportNewMode(int mode)
  {
    switch (mode)
    {
    case tt_Mode.Unknown:
      Console.Printf("zscript/typist/event_reporter/tt_sound_reporter.zs:42: T: unknown mode!");
      break;
    case tt_Mode.Combat:  playPlayerSound("tt/combat"); break;
    case tt_Mode.Explore: playPlayerSound("tt/explore"); break;
    case tt_Mode.None:    break;
    }
  }

  override
  void reportKeyPressed()
  {
    playPlayerSound("tt/click");
  }

  override
  void reportAnswerMatch()
  {
    playPlayerSound("tt/match");
  }

  override
  void reportAnswerNotMatch()
  {
    playPlayerSound("tt/not-match");
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void playPlayerSound(String sound)
  {
    let player = _playerSource.getPawn();
    player.A_StartSound(sound);
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_PlayerSource _playerSource;

} // class tt_SoundReporter
