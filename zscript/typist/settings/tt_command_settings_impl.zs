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
 * This class implements tt_CommandSettings interface by reading the Cvars.
 */
class tt_CommandSettingsImpl : tt_CommandSettings
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_CommandSettingsImpl of(tt_PlayerSource playerSource)
  {
    let result = new("tt_CommandSettingsImpl"); // construct

    result._rightDashCommandCvar    = tt_Cvar.of(playerSource, "tt_command_right_dash"   );
    result._leftDashCommandCvar     = tt_Cvar.of(playerSource, "tt_command_left_dash"    );
    result._forwardDashCommandCvar  = tt_Cvar.of(playerSource, "tt_command_forward_dash" );
    result._backwardDashCommandCvar = tt_Cvar.of(playerSource, "tt_command_backward_dash");

    result._reloadCommandCvar       = tt_Cvar.of(playerSource, "tt_command_reload");
    result._commandPrefixCvar       = tt_Cvar.of(playerSource, "tt_command_prefix");

    return result;
  }

// public: // tt_CommandSettings ///////////////////////////////////////////////

  override String getForwardDashCommand()  { return _forwardDashCommandCvar .getString(); }
  override String getBackwardDashCommand() { return _backwardDashCommandCvar.getString(); }
  override String getLeftDashCommand()     { return _leftDashCommandCvar    .getString(); }
  override String getRightDashCommand()    { return _rightDashCommandCvar   .getString(); }

  override String getReloadCommand()       { return _reloadCommandCvar.getString(); }
  override String getCommandPrefix()       { return _commandPrefixCvar.getString(); }

// private: ////////////////////////////////////////////////////////////////////

  private tt_Cvar _rightDashCommandCvar;
  private tt_Cvar _leftDashCommandCvar;
  private tt_Cvar _forwardDashCommandCvar;
  private tt_Cvar _backwardDashCommandCvar;

  private tt_Cvar _reloadCommandCvar;
  private tt_Cvar _commandPrefixCvar;

} // class tt_CommandSettingsImpl
