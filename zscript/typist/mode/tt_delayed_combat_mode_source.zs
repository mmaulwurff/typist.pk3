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
 * This class implements tt_ModeSource by reading other tt_ModeSource, and
 * switching to Exploration mode only if some time has passed.
 */
class tt_DelayedCombatModeSource : tt_ModeSource
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_DelayedCombatModeSource of(tt_Clock clock, tt_ModeSource modeSource)
  {
    let result = new("tt_DelayedCombatModeSource"); // construct

    result._clock      = clock;
    result._modeSource = modeSource;

    result._switchDetected = false;
    result._oldMode        = tt_Mode.None;
    result._switchToExploreMoment = 0;

    return result;
  }

// public: // tt_ModeSource ////////////////////////////////////////////////////

  override
  int getMode()
  {
    int topMode = _modeSource.getMode();

    if (topMode != tt_Mode.Explore)
    {
      // let others decide.
      _oldMode = topMode;
      return tt_Mode.None;
    }

    if (_oldMode == tt_Mode.Combat && topMode == tt_Mode.Explore)
    {
      _switchDetected        = true;
      _switchToExploreMoment = _clock.getNow();
    }

    _oldMode = topMode;

    if (!_switchDetected)
    {
      return tt_Mode.None;
    }

    bool timeIsUp = _clock.since(_switchToExploreMoment) > DELAY;

    if (timeIsUp)
    {
      _switchDetected = false;
    }

    return timeIsUp ? tt_Mode.None : tt_Mode.Combat;
  }

// private: ////////////////////////////////////////////////////////////////////

  const DELAY = Thinker.TicRate * 1; ///< 1 second

// private: ////////////////////////////////////////////////////////////////////

  private tt_Clock      _clock;
  private tt_ModeSource _modeSource;

  private int _switchDetected;
  private int _oldMode;
  private int _switchToExploreMoment;

} // class tt_DelayedCombatModeSource
