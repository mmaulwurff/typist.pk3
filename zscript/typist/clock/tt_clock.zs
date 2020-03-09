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
 * This class provides access to time.
 */
class tt_Clock abstract
{

// public: /////////////////////////////////////////////////////////////////////

  /**
   * Provides access to getting points in time.
   *
   * @returns a moment in time.
   */
  virtual
  int getNow()
  {
    tt_Log.log("zscript/typist/clock/tt_clock.zs:34: T: override this!");

    return 0;
  }

  /**
   * Provides a way to determine how many ticks passed since a moment in time.
   *
   * @param moment a moment in time, received from getNow().
   *
   * @returns a number of ticks since @a moment.
   */
  virtual
  int since(int moment)
  {
    tt_Log.log("zscript/typist/clock/tt_clock.zs:49: T: override this!");

    return 0;
  }

} // class tt_Clock
