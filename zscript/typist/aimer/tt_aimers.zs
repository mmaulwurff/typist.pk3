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
 * This class implements tt_Aimer interface by aiming several Aimers.
 */
class tt_Aimers : tt_Aimer
{

// public: /////////////////////////////////////////////////////////////////////

  tt_Aimers init()
  {
    return self;
  }

  void add(tt_Aimer aimer)
  {
    _aimers.Push(aimer);
  }

// public: // tt_Aimer /////////////////////////////////////////////////////////

  override
  void aim()
  {
    uint nAimers = _aimers.size();
    for (uint i = 0; i < nAimers; ++i)
    {
      let aimer = _aimers[i];
      aimer.aim();
    }
  }

// private: ////////////////////////////////////////////////////////////////////

  private Array<tt_Aimer> _aimers;

} // class tt_Aimers
