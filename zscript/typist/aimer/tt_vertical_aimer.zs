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
 * This class implements Aimer interface by adjusting the player pitch
 * (horizontal angle).
 *
 * If autoaim is enabled, no pitch adjustment is done.
 *
 * @attention This class has no tests.
 */
class tt_VerticalAimer : tt_Aimer
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_VerticalAimer of( tt_OriginSource targetOriginSource
                     , tt_PlayerSource playerSource
                     , tt_Settings     settings
                     )
  {
    let result = new("tt_VerticalAimer"); // construct

    result._targetOriginSource = targetOriginSource;
    result._playerSource       = playerSource;
    result._settings           = settings;

    return result;
  }

// public: // tt_Aimer /////////////////////////////////////////////////////////

  override
  void aim()
  {
    if (!isAutoaimEnabled())
    {
      setPitch();
    }
  }

// private: ////////////////////////////////////////////////////////////////////

  private play
  bool isAutoaimEnabled()
  {
    return _settings.isAutoaimEnabled();
  }

  private play
  void setPitch()
  {
    let targetOrigin = _targetOriginSource.getOrigin();
    if (targetOrigin == NULL) { return; }

    let pawn = _playerSource.getPawn();
    if (pawn == NULL) { return; }

    Vector3 myPosition = pawn.pos;
    myPosition.z += pawn.Height / 2 + pawn.AttackZOffset;

    Vector3 otherPosition = targetOrigin.getVector();
    Vector3 diff          = myPosition - otherPosition;
    double  angle         = Atan2(diff.z, sqrt(diff.x * diff.x + diff.y * diff.y));

    pawn.A_SetPitch(angle, SPF_INTERPOLATE);
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_OriginSource _targetOriginSource;
  private tt_PlayerSource _playerSource;
  private tt_Settings     _settings;

} // class tt_VerticalAimer
