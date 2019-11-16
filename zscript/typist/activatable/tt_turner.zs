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
 * This class implements Activatable interface by turning the player.
 *
 * This class is an interface itself.
 */
class tt_Turner : tt_Activatable abstract
{

  tt_Turner init(tt_PlayerSource playerSource)
  {
    _playerSource = playerSource;

    return self;
  }

// public: /////////////////////////////////////////////////////////////////////

  virtual
  double getTurnAngle() const
  {
    Console.Printf("zscript/typist/activatable/tt_turner.zs:38: T: override this!");
    return 0;
  }

// public: // tt_Activatable ///////////////////////////////////////////////////

  override
  void activate()
  {
    let    pawn     = _playerSource.getPawn();
    double oldAngle = pawn.Angle;
    double newAngle = oldAngle + getTurnAngle();

    pawn.A_SetAngle(newAngle, FLAGS);
  }

  override
  bool isVisible()
  {
    return true;
  }

// private: ////////////////////////////////////////////////////////////////////

  const FLAGS = SPF_FORCECLAMP | SPF_INTERPOLATE;

// private: ////////////////////////////////////////////////////////////////////

  private tt_PlayerSource _playerSource;

} // class tt_Turner
