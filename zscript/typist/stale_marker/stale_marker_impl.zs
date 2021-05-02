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
 * This class implements tt_StaleMarker by observing a tt_Clock.
 */
class tt_StaleMarkerImpl : tt_StaleMarker
{

// public: /////////////////////////////////////////////////////////////////////

  /**
   * Creates an instance of tt_StaleMarkerImpl.
   *
   * @param clock       dependency, a clock to be observed.
   * @param updateTicks in how much ticks this marker becomes stale.
   */
  static
  tt_StaleMarkerImpl of(tt_Clock clock, int updateTicks = 1)
  {
    let result = new("tt_StaleMarkerImpl"); // construct

    result._clock       = clock;

    result._updateTicks = updateTicks;
    result._isEmpty     = true;
    result._oldMoment   = 0;

    return result;
  }

// public: // tt_StaleMarker ///////////////////////////////////////////////////

  override
  bool isStale()
  {
    bool isUpdated = shouldUpdate();

    if (isUpdated)
    {
      _oldMoment = _clock.getNow();
      _isEmpty   = false;
    }

    return isUpdated;
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  bool shouldUpdate() const
  {
    if (_isEmpty)
    {
      return true;
    }
    else
    {
      int  passed     = _clock.since(_oldMoment);
      bool isObsolete = (passed >= _updateTicks);

      if (isObsolete)
      {
        return true;
      }
    }

    return false;
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_Clock _clock;

  private int  _updateTicks;
  private bool _isEmpty;
  private int  _oldMoment;

} // class tt_StaleMarkerImpl
