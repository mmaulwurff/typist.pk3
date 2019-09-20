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
 * This class implements tt_Settings by reading values from user CVars.
 */
class tt_SettingsImpl : tt_Settings
{

// public: /////////////////////////////////////////////////////////////////////

  tt_SettingsImpl init(tt_PlayerInfoSource playerInfoSource)
  {
    _playerInfoSource = playerInfoSource;

    return self;
  }

// public: // tt_Settings //////////////////////////////////////////////////////

  override
  int getScale()
  {
    if (scaleCvar == NULL)
    {
      let playerInfo = _playerInfoSource.getPlayerInfo();
      scaleCvar = Cvar.GetCvar("tt_view_scale", playerInfo);
    }

    return scaleCvar.GetInt();
  }

  override
  bool isAutoAimEnabled()
  {
    if (autoaimCvar == NULL)
    {
      let playerInfo = _playerInfoSource.getPlayerInfo();
      autoaimCvar = Cvar.GetCvar("autoaim", playerInfo);
    }

    return (autoaimCvar.GetFloat() > 34.5);
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_PlayerInfoSource _playerInfoSource;

  transient CVar scaleCvar;
  transient CVar autoaimCvar;

} // class tt_SettingsImpl
