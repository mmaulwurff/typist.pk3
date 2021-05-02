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
 * This is a test for tt_VerticalAimer class.
 */
class tt_VerticalAimerTest : tt_Clematis
{

// public: /////////////////////////////////////////////////////////////////////

  override
  void TestSuites()
  {
    Describe("Checking Vertical Aimer");

    testAim();

    EndDescribe();
  }

// private: ////////////////////////////////////////////////////////////////////

  private play
  void testAim() const
  {
    let targetOriginSource = tt_OriginSourceMock.of();
    let playerSource       = tt_PlayerSourceMock.of();
    let settings           = tt_SettingsMock.of();

    let aimer = tt_VerticalAimer.of(targetOriginSource, playerSource, settings);

    let targetOrigin = tt_Origin.of((550, 500, 500));
    let pawn         = players[consolePlayer].mo;
    pawn.SetOrigin((0, 0, 0), false);

    targetOriginSource.expect_getOrigin(targetOrigin);
    playerSource      .expect_getPawn(pawn);
    settings          .expect_isAutoaimEnabled(false);

    aimer.aim();

    It("Target Origin Source is satisfied" , Assert(targetOriginSource.isSatisfied_getOrigin()));
    It("Pawn Source is satisfied"          , Assert(playerSource.isSatisfied_getPawn()));
    It("Settings is satisfied"             , Assert(settings.isSatisfied_isAutoaimEnabled()));
  }

} // class tt_VerticalAimerTest
