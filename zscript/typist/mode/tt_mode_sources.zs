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

/** This class represents a set of ModeSource.
 */
class tt_ModeSources
{

// public: /////////////////////////////////////////////////////////////////////

  tt_ModeSources init()
  {
    return self;
  }

// public: /////////////////////////////////////////////////////////////////////

  uint size() const
  {
    return _modeSources.size();
  }

  tt_ModeSource at(uint i) const
  {
    return _modeSources[i];
  }

  bool contains(tt_ModeSource modeSource) const
  {
    uint foundIndex = _modeSources.Find(modeSource);
    bool isFound    = (foundIndex != size());

    return isFound;
  }

// public: /////////////////////////////////////////////////////////////////////

  void add(tt_ModeSource modeSource)
  {
    _modeSources.Push(modeSource);
  }

// private: ////////////////////////////////////////////////////////////////////

  private Array<tt_ModeSource> _modeSources;

} // class tt_ModeSources
