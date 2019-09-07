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

/** This is a test for tt_AimerImpl class.
 *
 * This test assumes that the player is located at (0, 0, 0);
 */
class tt_AimerImplTest : tt_Clematis
{

// public: // tt_Clematis //////////////////////////////////////////////////////

  override
  void TestSuites()
  {
    Describe("Checking Aimer implementation");

    Array<tt_Origin> targetPositions;
    Array<double>    angles;

    targetPositions.push(new("tt_Origin").init(( 100,  100, 0))); angles.push(  45);
    targetPositions.push(new("tt_Origin").init((-100, -100, 0))); angles.push(-135);
    targetPositions.push(new("tt_Origin").init((   0,    0, 0))); angles.push(   0);

    movePlayerToZero();

    uint nTargetPositions = targetPositions.size();
    for (uint i = 0; i < nTargetPositions; ++i)
    {
      let    originSource  = new("tt_OriginSourceMock").init();
      let    pawnSource    = new("tt_PawnSourceMock").init();
      let    aimer         = new("tt_AimerImpl").init(originSource, pawnSource);
      let    targetOrigin  = targetPositions[i];
      let    pawn          = players[consolePlayer].mo;
      double angle         = angles[i];

      originSource.expect_getOrigin(targetOrigin);
      pawnSource  .expect_getPawn(pawn);

      // Just for a visual check.
      Spawn("DoomImp", targetOrigin.getPosition());

      aim(aimer);

      String message = String.Format("Pawn is oriented at the target, angle: %f", angle);
      It(message                      , AssertEval(pawn.angle, "~==", angles[i]));
      It("Origin source is satisfied" , Assert(originSource.isSatisfied_getOrigin()));
      It("Pawn source is satisfied"   , Assert(pawnSource.isSatisfied_getPawn()));
    }

    EndDescribe();
  }

// private: ////////////////////////////////////////////////////////////////////

  private play
  void aim(tt_Aimer aimer) const
  {
    aimer.aim();
  }

  private play
  void movePlayerToZero() const
  {
    players[consolePlayer].mo.SetOrigin((0, 0, 0), false);
  }

} // class tt_AimerImplTest
