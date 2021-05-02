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
 */
class tt_FirerImpl : tt_Firer
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_FirerImpl of(tt_PlayerSource playerSource)
  {
    let result = new("tt_FirerImpl"); // construct

    result._playerSource = playerSource;

    return result;
  }

// public: // tt_Firer /////////////////////////////////////////////////////////

  override
  void fire()
  {
    let  playerInfo = _playerSource.getInfo();
    bool isReady    = isWeaponReady(playerInfo);

    if (isReady)
    {
      let   pawn = _playerSource.getPawn();
      State stat = NULL;
      playerInfo.cmd.buttons |= BT_ATTACK;
      pawn.FireWeapon(stat);
    }
  }

// private: ////////////////////////////////////////////////////////////////////

  private static
  bool isWeaponReady(PlayerInfo player)
  {
    bool isReady = (player.WeaponState & WF_WEAPONREADY)
      || (player.WeaponState & WF_WEAPONREADYALT)
      || player.attackDown;

    return isReady;
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_PlayerSource _playerSource;

} // class tt_FirerImpl
