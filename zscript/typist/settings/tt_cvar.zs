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
 * This class provides access to a user or server Cvar.
 *
 * Accessing Cvars through this class is faster because calling Cvar.GetCvar()
 * is costly. This class caches the result of Cvar.GetCvar() and handles
 * loading a savegame.
 */
class tt_Cvar
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_Cvar of(tt_PlayerSource playerSource, String name)
  {
    let result = new("tt_Cvar"); // construct

    result._playerSource = playerSource;
    result._name         = name;

    return result;
  }

  String getString() { load(); return _cvar.GetString(); }
  bool   getBool()   { load(); return _cvar.GetInt();    }
  int    getInt()    { load(); return _cvar.GetInt();    }
  double getFloat()  { load(); return _cvar.GetFloat();  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void load()
  {
    if (_cvar == NULL)
    {
      let playerInfo = _playerSource.getInfo();

      _cvar = Cvar.GetCvar(_name, playerInfo);
    }
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_PlayerSource _playerSource;
  private String          _name;
  private transient Cvar  _cvar;

} // class tt_Cvar
