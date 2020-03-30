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
 * This interface provides information when its instance becomes stale.
 */
class tt_StaleMarker abstract
{

// public: /////////////////////////////////////////////////////////////////////

  /**
   * Update stale status.
   *
   * @attention calling this function may change the state of tt_StaleMarker.
   *
   * @returns true if this instance is currently stale.
   */
  virtual
  bool isStale()
  {
    tt_Log.log("zscript/typist/stale_marker/tt_stale_marker.zs:36: T: override this!");
    return false;
  }

} // class tt_StaleMarker
