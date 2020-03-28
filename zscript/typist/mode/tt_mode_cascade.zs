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
 * This class implements ModeSource by taking the first mode from ModeSources
 * list that is not NONE.
 */
class tt_ModeCascade : tt_ModeSource
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_ModeCascade of(Array<tt_ModeSource> modeSources)
  {
    let result = new("tt_ModeCascade"); // construct

    result._modeSources.copy(modeSources);

    return result;
  }

// public: // tt_ModeSource ////////////////////////////////////////////////////

  override
  int getMode()
  {
    uint nSources = _modeSources.size();
    for (uint i = 0; i < nSources; ++i)
    {
      let source = _modeSources[i];
      int mode   = source.getMode();

      if (mode != tt_Mode.None)
      {
        return mode;
      }
    }

    return tt_Mode.None;
  }

// private: ////////////////////////////////////////////////////////////////////

  private Array<tt_ModeSource> _modeSources;

} // class tt_ModeCascade
