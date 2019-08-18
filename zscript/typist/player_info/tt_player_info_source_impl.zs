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
 */
class tt_PlayerInfoSourceImpl : tt_PlayerInfoSource
{

// public: /////////////////////////////////////////////////////////////////////

  tt_PlayerInfoSourceImpl init(int playerNumber)
  {
    _playerNumber = playerNumber;

    return self;
  }

// public: // tt_PlayerInfoSource //////////////////////////////////////////////

  override
  PlayerInfo getInfo()
  {
    return players[_playerNumber];
  }

// private:

  private int _playerNumber;

} // class tt_PlayerInfoSourceImpl
