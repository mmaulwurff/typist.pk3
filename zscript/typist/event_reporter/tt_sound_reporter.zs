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

  static
  tt_SoundReporter of(tt_PlayerSource playerSource, tt_SoundSettings settings)
  {
    let result = new("tt_SoundReporter"); // construct

    result._playerSource = playerSource;
    result._settings     = settings;

    return result;
  }

// public: // tt_EventReporter /////////////////////////////////////////////////

  override
  void reportNewMode(int mode)
  {
    if (isDisabled()) return;

    switch (mode)
    {
    case tt_Mode.Unknown:
      tt_Log.log("zscript/typist/event_reporter/tt_sound_reporter.zs:48: T: unknown mode!");
      break;
    case tt_Mode.Combat:  playPlayerSound("tt/combat");  break;
    case tt_Mode.Explore: playPlayerSound("tt/explore"); break;
    case tt_Mode.None:    break;
    }
  }

  override
  void reportKeyPressed()
  {
    if (isDisabled() || isTypingDisabled()) return;
    playPlayerSound("tt/click");
  }

  override
  void reportAnswerMatch()
  {
    if (isDisabled()) return;
    playPlayerSound("tt/match");
  }

  override
  void reportAnswerNotMatch()
  {
    if (isDisabled()) return;
    playPlayerSound("tt/not-match");
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void playPlayerSound(String s)
  {
    int theme = _settings.getTheme();
    s.AppendFormat("%d", theme);
    let player = _playerSource.getPawn();

    player.A_StartSound(s, CHAN_AUTO, CHANF_UI | CHANF_OVERLAP | CHANF_LOCAL);
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  bool isDisabled()
  {
    return (!_settings.isEnabled());
  }

  private
  bool isTypingDisabled()
  {
    return (!_settings.isTypingEnabled());
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_PlayerSource  _playerSource;
  private tt_SoundSettings _settings;

} // class tt_SoundReporter
