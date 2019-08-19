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

extend
class tt_Test
{

// private: //////////////////////////////////////////////////////////////////

  private
  void testPawnOriginSource()
  {
    Describe("Checking Pawn Origin Source");

    double x   = 1;
    double y   = 2;
    double z   = 3;
    let    imp = PlayerPawn(Spawn("DoomPlayer", (x, y, z)));

    let pawnSource   = new("tt_PawnSourceMock").init();
    let originSource = new("tt_PawnOriginSource").init(pawnSource);

    pawnSource.expect_getPawn(imp);

    let origin = originSource.getOrigin().position();
    let impZ   = imp.height / 2 + z;

    It("X matches", AssertEval(x,    "==", origin.x));
    It("Y matches", AssertEval(y,    "==", origin.y));
    It("Z matches", AssertEval(impZ, "==", origin.z));
    It("Pawn source is satisfied", Assert(pawnSource.isSatisfied_getPawn()));

    EndDescribe();
  }

} // class tt_Test
