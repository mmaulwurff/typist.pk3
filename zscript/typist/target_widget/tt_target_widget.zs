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

/** This class represents a target displayed on the screen.
 */
class tt_TargetWidget
{

// public: /////////////////////////////////////////////////////////////////////

  tt_TargetWidget init(tt_KnownTarget target, Vector2 position)
  {
    _target   = target;
    _position = position;

    return self;
  }

// public: /////////////////////////////////////////////////////////////////////

  tt_KnownTarget getTarget() const
  {
    return _target;
  }

  Vector2 getPosition() const
  {
    return _position;
  }

  double getDistanceTo(Vector3 other)
  {
    let worldPosition = _target.getTarget().getPosition();
    let distance      = (worldPosition - other).Length();

    return distance;
  }

// public: /////////////////////////////////////////////////////////////////////

  void setPosition(Vector2 position)
  {
    _position = position;
  }

// private:

  private tt_KnownTarget _target;
  private Vector2        _position;

} // class tt_TargetWidget
