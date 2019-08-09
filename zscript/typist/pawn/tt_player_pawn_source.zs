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

/** This class implements tt_PawnSource.
 * It returns the player pawn.
 */
class tt_PlayerPawnSource : tt_PawnSource
{

// public: /////////////////////////////////////////////////////////////////////

  tt_PawnSource init(int playerNumber)
  {
    _playerNumber = playerNumber;

    return self;
  }

// public: /////////////////////////////////////////////////////////////////////

  override
  PlayerPawn getPawn()
  {
    PlayerInfo p = players[_playerNumber];
    if (p == NULL) { return NULL; }

    let pawn = p.mo;
    return pawn;
  }

// private: ////////////////////////////////////////////////////////////////////

  private int _playerNumber;

} // class tt_PlayerPawnSource
