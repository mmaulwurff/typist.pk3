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
 * This class implements tt_ModeSource by overriding other source with
 * Exploration mode if there are no enemies around.
 */
class tt_NoEnemiesMode : tt_ModeSource
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_NoEnemiesMode of(tt_ModeSource modeSource, tt_TargetSource targetSource)
  {
    let result = new("tt_NoEnemiesMode"); // construct

    result._modeSource   = modeSource;
    result._targetSource = targetSource;

    return result;
  }

// public: // tt_ModeSource ////////////////////////////////////////////////////

  override
  int getMode()
  {
    let targets = _targetSource.getTargets();
    if (targets.isEmpty())
    {
      return tt_Mode.Explore;
    }

    return _modeSource.getMode();
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_ModeSource   _modeSource;
  private tt_TargetSource _targetSource;

} // class tt_NoEnemiesMode
