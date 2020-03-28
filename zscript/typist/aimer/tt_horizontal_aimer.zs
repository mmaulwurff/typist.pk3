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
 * This class implements Aimer interface by rotating the player.
 *
 * This implementation only aims horizontally. Hope for the vertical autoaim!
 */
class tt_HorizontalAimer : tt_Aimer
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_HorizontalAimer of(tt_OriginSource targetOriginSource, tt_PlayerSource playerSource)
  {
    let result = new("tt_HorizontalAimer"); // construct

    result._targetOriginSource = targetOriginSource;
    result._playerSource       = playerSource;

    return result;
  }

// public: // tt_Aimer /////////////////////////////////////////////////////////

  override
  void aim()
  {
    let targetOrigin = _targetOriginSource.getOrigin();
    if (targetOrigin == NULL) { return; }

    let pawn = _playerSource.getPawn();
    if (pawn == NULL) { return; }

    Vector3 myPosition    = pawn.pos;
    Vector3 otherPosition = targetOrigin.getPosition();
    double  angle         = AngleTo(myPosition.XY, otherPosition.XY);

    pawn.A_SetAngle(angle, SPF_INTERPOLATE);
  }

// private: ////////////////////////////////////////////////////////////////////

  private static
  double AngleTo(Vector2 myPosition, Vector2 otherPosition)
  {
    Vector2 xy = otherPosition - myPosition;
    return VectorAngle(xy.x, xy.y);
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_OriginSource _targetOriginSource;
  private tt_PlayerSource _playerSource;

} // class tt_HorizontalAimer
