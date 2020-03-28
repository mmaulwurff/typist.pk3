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
 * This class implements tt_Activatable by reloading the weapon.
 *
 * This command is not visible when the weapon doesn't have the Reload state.
 */
class tt_Reloader : tt_Activatable
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_Reloader of(tt_PlayerSource playerSource)
  {
    let result = new("tt_Reloader"); // construct

    result._playerSource = playerSource;

    return result;
  }

// public: // tt_Activatable ///////////////////////////////////////////////////

  override
  void activate()
  {
    let playerInfo = _playerSource.getInfo();
    let weapon     = playerInfo.readyWeapon;

    if (weapon == NULL) return;

    let  reloadState = weapon.FindState('Reload');
    bool canReload   = (reloadState != NULL) && (playerInfo.WeaponState & WF_WeaponReloadOk);

    if (canReload)
    {
      playerInfo.cmd.buttons |= BT_RELOAD;
      playerInfo.SetPsprite(PSP_WEAPON, reloadState);
    }
  }

  override
  bool isVisible()
  {
    let playerInfo = _playerSource.getInfo();
    let weapon     = playerInfo.readyWeapon;

    if (weapon == NULL) return false;

    let  reloadState    = weapon.FindState('Reload');
    bool hasReloadState = (reloadState != NULL);

    return hasReloadState;
  }

  override
  tt_Strings getCommands()
  {
    let result = tt_Strings.of();
    result.add("rl");

    return result;
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_PlayerSource _playerSource;

} // class tt_Reloader
