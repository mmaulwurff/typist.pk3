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
 * if previously received target is stale.
 */
class tt_TargetSourceCache : tt_TargetSource
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_TargetSourceCache of(tt_TargetSource targetSource, tt_StaleMarker staleMarker)
  {
    let result = new("tt_TargetSourceCache"); // construct

    result._targetSource = targetSource;
    result._staleMarker  = staleMarker;

    return result;
  }

// public: // tt_TargetSource //////////////////////////////////////////////////

  override
  tt_Targets getTargets()
  {
    if (_staleMarker.isStale())
    {
      _targets = _targetSource.getTargets();
    }

    return _targets;
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_TargetSource _targetSource;
  private tt_StaleMarker  _staleMarker;

  private tt_Targets _targets;

} // class tt_TargetSourceCache
