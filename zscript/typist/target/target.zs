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
 * This class represents an attack target.
 */
class tt_Target
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_Target of(Actor a)
  {
    let result = new("tt_Target"); // construct

    result._actor = a;

    return result;
  }

// public: /////////////////////////////////////////////////////////////////////

  /**
   * Get position in game space of this target.
   */
  tt_Origin getPosition() const
  {
    Vector3 position = _actor.pos;
    position.z += _actor.height / 2;

    let result = tt_Origin.of(position);

    return result;
  }

  bool isEqual(tt_Target other) const
  {
    return other._actor == _actor;
  }

  Actor getActor() const
  {
    return _actor;
  }

// private: ////////////////////////////////////////////////////////////////////

  private Actor _actor;

} // class tt_Target
