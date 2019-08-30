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

/** This class represents an array of Activatable entities.
 */
class tt_Activatables
{

// public: /////////////////////////////////////////////////////////////////////

  tt_Activatables init()
  {
    return self;
  }

// public: /////////////////////////////////////////////////////////////////////

  uint size() const
  {
    return _activatables.size();
  }

  tt_Activatable at(uint i) const
  {
    return _activatables[i];
  }

// public: /////////////////////////////////////////////////////////////////////

  void add(tt_Activatable activatable)
  {
    _activatables.push(activatable);
  }

// private: ////////////////////////////////////////////////////////////////////

  private Array<tt_Activatable> _activatables;

} // class tt_Activatables
