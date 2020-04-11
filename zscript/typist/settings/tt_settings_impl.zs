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

  static
  tt_SettingsImpl of(tt_PlayerSource playerSource)
  {
    let result = new("tt_SettingsImpl"); // construct

    result._scaleCvar               = tt_Cvar.of(playerSource, "tt_view_scale"     );
    result._autoaimCvar             = tt_Cvar.of(playerSource, "autoaim"           );
    result._questionSourceIndexCvar = tt_Cvar.of(playerSource, "tt_question_source");

    for (uint i = 0; i < N_IS_LESSON_ENABLED_CVARS; ++i)
    {
      String cvarName = String.Format("tt_is_lesson_enabled_%d", i);
      result._isLessonEnabledCvars.Push(tt_Cvar.of(playerSource, cvarName));
    }

    return result;
  }

// public: // tt_Settings //////////////////////////////////////////////////////

  override int  getScale()               { return _scaleCvar.getInt();               }
  override bool isAutoAimEnabled()       { return (_autoaimCvar.getFloat() > 34.5);  }
  override int  getQuestionSourceIndex() { return _questionSourceIndexCvar.getInt(); }

  override
  bool getLessonEnabled(uint index)
  {
    return _isLessonEnabledCvars[index].getBool();
  }

// private: ////////////////////////////////////////////////////////////////////

  const N_IS_LESSON_ENABLED_CVARS = 10;

  private tt_Cvar _scaleCvar;
  private tt_Cvar _autoaimCvar;
  private tt_Cvar _questionSourceIndexCvar;

  private Array<tt_Cvar> _isLessonEnabledCvars;

} // class tt_SettingsImpl
