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
 * This class implements tt_Activatable by performing a dash.
 *
 * Inherit this class and override getDashAngle().
 */
class tt_Dasher : tt_Activatable abstract
{

// public: /////////////////////////////////////////////////////////////////////

  virtual
  double getDashAngle() const
  {
    tt_Log.log("zscript/typist/activatable/tt_dasher.zs:31: T: override this!");
    return 0;
  }

// public: // tt_Activatable ///////////////////////////////////////////////////

  override
  void activate()
  {
    let pawn = _playerSource.getPawn();
    pawn.Thrust(SPEED, pawn.Angle + getDashAngle());
  }

  override
  bool isVisible()
  {
    return true;
  }

// private: ////////////////////////////////////////////////////////////////////

  const SPEED = 18;

// protected: //////////////////////////////////////////////////////////////////

  protected tt_PlayerSource _playerSource;

} // class tt_Dasher
