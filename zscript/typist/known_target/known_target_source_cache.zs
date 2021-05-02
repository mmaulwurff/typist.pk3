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
 * This class implements tt_KnownTargetSource by reading other
 * tt_KnownTargetSource only if the data is stale.
 */
class tt_KnownTargetSourceCache : tt_KnownTargetSource
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_KnownTargetSourceCache of(tt_KnownTargetSource targetSource, tt_StaleMarker staleMarker)
  {
    let result = new("tt_KnownTargetSourceCache"); // construct

    result._targetSource = targetSource;
    result._staleMarker  = staleMarker;

    return result;
  }

// public: // tt_KnownTargetSource /////////////////////////////////////////////

  override
  tt_KnownTargets getTargets()
  {
    ensureUpdated();
    return _targets;
  }

  override
  bool isEmpty()
  {
    ensureUpdated();
    return (_targets.size() == 0);
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void ensureUpdated()
  {
    if (_staleMarker.isStale())
    {
      _targets = _targetSource.getTargets();
    }
  }

  private tt_KnownTargetSource _targetSource;
  private tt_StaleMarker       _staleMarker;

  private tt_KnownTargets _targets;

} // class tt_KnownTargetSourceCache
