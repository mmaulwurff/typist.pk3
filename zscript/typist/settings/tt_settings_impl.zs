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
 * This class implements tt_Settings by reading values from user CVars.
 */
class tt_SettingsImpl : tt_Settings
{

// public: /////////////////////////////////////////////////////////////////////

  tt_SettingsImpl init(tt_PlayerSource playerSource)
  {
    _playerSource = playerSource;

    return self;
  }

// public: // tt_Settings //////////////////////////////////////////////////////

  override
  int getScale()
  {
    if (_scaleCvar == NULL)
    {
      _scaleCvar = getCvar("tt_view_scale");
    }

    return _scaleCvar.GetInt();
  }

  override
  bool isAutoAimEnabled()
  {
    if (_autoaimCvar == NULL)
    {
      _autoaimCvar = getCvar("autoaim");
    }

    return (_autoaimCvar.GetFloat() > 34.5);
  }

  override
  int getQuestionSourceIndex()
  {
    if (_questionSourceIndexCvar == NULL)
    {
      _questionSourceIndexCvar = getCvar("tt_question_source");
    }

    return _questionSourceIndexCvar.GetInt();
  }

  override
  String getCommandPrefix()
  {
    if (_commandPrefixCvar == NULL)
    {
      _commandPrefixCvar = getCvar("tt_command_prefix");
    }

    return _commandPrefixCvar.GetString();
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  Cvar getCvar(String cvarName)
  {
    let playerInfo = _playerSource.getInfo();
    let consoleVar = Cvar.GetCvar(cvarName, playerInfo);

    return consoleVar;
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_PlayerSource _playerSource;

  transient Cvar _scaleCvar;
  transient Cvar _autoaimCvar;
  transient Cvar _questionSourceIndexCvar;
  transient Cvar _commandPrefixCvar;

} // class tt_SettingsImpl
