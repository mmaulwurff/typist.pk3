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
 * This class implements tt_ModeSource by reading other mode source, and
 * reporting an event when the mode has changed.
 */
class tt_ReportedModeSource : tt_ModeSource
{

// public: /////////////////////////////////////////////////////////////////////

  tt_ReportedModeSource init(tt_EventReporter reporter, tt_ModeSource modeSource)
  {
    _reporter   = reporter;
    _modeSource = modeSource;

    _oldMode = tt_Mode.None;

    return self;
  }

// public: // tt_ModeSource ////////////////////////////////////////////////////

  override
  int getMode()
  {
    int newMode = _modeSource.getMode();

    if (newMode != _oldMode)
    {
      if (_oldMode != tt_Mode.None)
      {
        _reporter.reportNewMode(newMode);
      }

      _oldMode = newMode;
    }

    return newMode;
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_EventReporter _reporter;
  private tt_ModeSource    _modeSource;

  private int _oldMode;

} // class tt_ReportedModeSource
