/* Copyright Alexander 'm8f' Kromm (mmaulwurff@gmail.com) 2019-2021
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

  abstract
  double getDashAngle() const;

// tt_Activatable //////////////////////////////////////////////////////////////////////////////////

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

  /// This function is defined only to satisfy brittle mock class generation script.
  override
  tt_Strings getCommands()
  {
    tt_Log.log("zscript/typist/activatable/dasher.zs:48: T: override this!");
    return NULL;
  }

// private: ////////////////////////////////////////////////////////////////////

  const SPEED = 18;

// protected: //////////////////////////////////////////////////////////////////

  protected tt_PlayerSource _playerSource;

} // class tt_Dasher
