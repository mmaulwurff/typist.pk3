/* Copyright Alexander 'm8f' Kromm (mmaulwurff@gmail.com) 2019
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
 * This class implements tt_OriginSource.
 * It takes the center of the player pawn.
 */
class tt_PlayerOriginSource : tt_OriginSource
{

// public: /////////////////////////////////////////////////////////////////////

  tt_OriginSource init(tt_PlayerSource playerSource)
  {
    _playerSource = playerSource;

    return self;
  }

// public: // tt_OriginSource //////////////////////////////////////////////////

  override
  tt_Origin getOrigin()
  {
    let pawn = _playerSource.getPawn();
    let pos  = pawn.pos;
    pos.z += pawn.height / 2;

    return new("tt_Origin").init(pos);
  }

  override
  void update()
  {
    // do nothing, getOrigin doesn't change the origin.
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_PlayerSource _playerSource;

} // class tt_PawnOriginSource
