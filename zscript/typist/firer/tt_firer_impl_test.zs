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

class tt_FirerImplTest : tt_Clematis
{

// public: /////////////////////////////////////////////////////////////////////

  override
  void TestSuites()
  {
    Describe("Checking FirerImpl");

    let        playerSource = tt_PlayerSourceMock.of();
    let        firerImpl    = tt_FirerImpl.of(playerSource);
    PlayerInfo info         = players[consolePlayer];
    let        pawn         = info.mo;

    playerSource.expect_getInfo(info);
    playerSource.expect_getPawn(pawn);

    int nBullets = pawn.CountInv("Clip");
    It("Must be 50 bullets before firing", AssertEval(nBullets, "==", 50));

    fire(firerImpl);

    It("PlayerInfo Source must be satisfied", Assert(playerSource.isSatisfied_getInfo()));
    It("PlayerInfo Source must be satisfied", Assert(playerSource.isSatisfied_getPawn()));

    EndDescribe();
  }

// private: ////////////////////////////////////////////////////////////////////

  private play
  void fire(tt_Firer firer) const
  {
    firer.fire();
  }

} // class tt_FirerImplTest
