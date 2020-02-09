/* Copyright Alexander 'm8f' Kromm (mmaulwurff@gmail.com) 2019-2020
 *
 * This file is a part of Lazy Points.
 *
 * Lazy Points is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later
 * version.
 *
 * Lazy Points is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
 * details.
 *
 * You should have received a copy of the GNU General Public License along with
 * Lazy Points.  If not, see <https://www.gnu.org/licenses/>.
 */

/**
 * This class is a namespace for various constants that are worth being placed
 * out of the code, so Lazy Points can be customized more easily.
 *
 */
class zc_Parameters
{

// public: /////////////////////////////////////////////////////////////////////

  /**
   * This font is used for drawing score points and info on bonuses.
   */
  const FONT = "NewSmallFont";

  /**
   * This is a time in seconds, during which kills provide a bonus.
   */
  const BONUS_COUNTDOWN = 4;

  /**
   * This is an offset in pixels from the top of the screen for all score info.
   */
  const Y_OFFSET = 100;

} // class zc_Parameters
