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
 * This class represents a point in space.
 * Note that the Origin position cannot change once set.
 */
class tt_Origin
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_Origin of(Vector3 pos)
  {
    let result = new("tt_Origin"); // construct

    result._pos = pos;

    return result;
  }

// public: /////////////////////////////////////////////////////////////////////

  Vector3 getVector() const
  {
    return _pos;
  }

// private: ////////////////////////////////////////////////////////////////////

  private Vector3 _pos;

} // class tt_Origin
