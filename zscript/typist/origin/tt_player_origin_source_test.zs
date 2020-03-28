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
 * This is a test for tt_PlayerOriginSource class.
 */
class tt_PlayerOriginSourceTest : tt_Clematis
{

// public: /////////////////////////////////////////////////////////////////////

  override
  void TestSuites()
  {
    Describe("Checking Pawn Origin Source");

    double x = 1;
    double y = 2;
    double z = 3;
    let player = PlayerPawn(Spawn("DoomPlayer", (x, y, z)));

    let playerSource = tt_PlayerSourceMock.of();
    let originSource = tt_PlayerOriginSource.of(playerSource);

    playerSource.expect_getPawn(player);

    let origin  = originSource.getOrigin().getPosition();

    It("X matches",  AssertEval(x, "==", origin.x));
    It("Y matches",  AssertEval(y, "==", origin.y));
    It("Z in range", AssertEval(z, "<=", origin.z));
    It("Z in range", AssertEval(z + player.Height, ">=", origin.z));
    It("Player source is satisfied", Assert(playerSource.isSatisfied_getPawn()));

    EndDescribe();
  }

} // class tt_PawnOriginSourceTest
