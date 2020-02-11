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
 * This class is a namespace for math-related functions.
 */
class tt_Math
{

// public: /////////////////////////////////////////////////////////////////////

  static
  bool isInEffectiveRange(Vector3 p1, Vector3 p2)
  {
    double distance = (p1 - p2).length();
    bool   inRange  = distance < MAX_DISTANCE;

    return inRange;
  }

  static Vector3 crossProduct(Vector3 u, Vector3 v)
  {
    Vector3 result;
    result.x = u.y * v.z - u.z * v.y;
    result.y = u.z * v.x - u.x * v.z;
    result.z = u.x * v.y - u.y * v.x;
    return result;
  }

// public: /////////////////////////////////////////////////////////////////////

  /// Max effective distance.
  const MAX_DISTANCE = 700;

} // class tt_Math
