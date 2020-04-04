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
 * This class implements tt_WorldChanger by executing several instances of
 * tt_WorldChanger.
 */
class tt_WorldChangers : tt_WorldChanger
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_WorldChangers of(Array<tt_WorldChanger> worldChangers)
  {
    let result = new("tt_WorldChangers"); // construct

    result._worldChangers.Move(worldChangers);

    return result;
  }

// public: // tt_WorldChanger //////////////////////////////////////////////////

  override
  void changeWorld()
  {
    uint nChangers = _worldChangers.size();
    for (uint i = 0; i < nChangers; ++i)
    {
      _worldChangers[i].changeWorld();
    }
  }

// private: ////////////////////////////////////////////////////////////////////

  private Array<tt_WorldChanger> _worldChangers;

} // class tt_WorldChangers
