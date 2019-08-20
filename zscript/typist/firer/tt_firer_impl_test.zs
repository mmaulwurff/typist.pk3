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

class tt_FirerImplTest : tt_Clematis
{

// public: /////////////////////////////////////////////////////////////////////

  override
  void TestSuites()
  {
    Describe("Checking FirerImpl");

    let pawnSource = new("tt_PawnSourceMock").init();
    let firerImpl  = new("tt_FirerImpl").init(pawnSource);
    let pawn       = players[consolePlayer].mo;

    pawnSource.expect_getPawn(pawn);

    int nBullets = pawn.CountInv("Clip");
    It("Must be 50 bullets before firing", AssertEval(nBullets, "==", 50));

    fire(firerImpl);

    It("Pawn Source must be satisfied", Assert(pawnSource.isSatisfied_getPawn()));

    EndDescribe();
  }

// private: ////////////////////////////////////////////////////////////////////

  private play
  void fire(tt_Firer firer) const
  {
    firer.fire();
  }

} // class tt_FirerImplTest
