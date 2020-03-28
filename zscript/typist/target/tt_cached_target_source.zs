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
 * This class implements tt_TargetSource by calling other tt_TargetSource only
 * when some time has passed.
 */
class tt_CachedTargetSource : tt_TargetSource
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_CachedTargetSource of(tt_TargetSource targetSource, tt_Clock clock)
  {
    let result = new("tt_CachedTargetSource"); // construct

    result._targetSource = targetSource;
    result._clock        = clock;

    result._isEmpty   = true;
    result._oldMoment = 0;

    return result;
  }

// public: // tt_TargetSource //////////////////////////////////////////////////

  override
  tt_Targets getTargets()
  {
    if (_isEmpty)
    {
      read();
    }
    else
    {
      int  passed     = _clock.since(_oldMoment);
      bool isObsolete = (passed >= REREAD_TICS);

      if (isObsolete)
      {
        read();
      }
    }

    return _targets;
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void read()
  {
    _targets   = _targetSource.getTargets();
    _oldMoment = _clock.getNow();
    _isEmpty   = false;
  }

  const REREAD_TICS = 1;

  private tt_TargetSource _targetSource;
  private tt_Clock        _clock;

  private bool       _isEmpty;
  private int        _oldMoment;
  private tt_Targets _targets;

} // class tt_CachedTargetSource
