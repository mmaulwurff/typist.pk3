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
 * This class is a test for LeftTurner class.
 */
class tt_LeftTurnerTest : tt_Clematis
{

// public: // tt_Clematis //////////////////////////////////////////////////////

  override
  void TestSuites()
  {
    Describe("Checking LeftTurner");

    checkTurn();
    checkCommand();

    EndDescribe();
  }

// private: ////////////////////////////////////////////////////////////////////

  private play
  void checkTurn() const
  {
    let pawn       = players[consolePlayer].mo;
    let pawnSource = new("tt_PawnSourceMock").init();
    let leftTurner = new("tt_LeftTurner"   ).init(pawnSource);

    double before = pawn.Angle;

    pawnSource.expect_getPawn(pawn);

    leftTurner.activate();

    double after = pawn.Angle;
    double delta = (after - before) % 360;

    It("Must turn right", AssertEval(delta, ">",   0));
    It("Must turn right", AssertEval(delta, "<", 180));
    It("Pawn Source is satisfied", Assert(pawnSource.isSatisfied_getPawn()));
  }

  private
  void checkCommand()
  {
    let pawnSource = new("tt_PawnSourceMock").init();
    let leftTurner = new("tt_LeftTurner"    ).init(pawnSource);

    let commands = leftTurner.getCommands();

    It("Must contain turn command", Assert(commands.contains("/left")));
    It("Pawn Source is satisfied",  Assert(pawnSource.isSatisfied_getPawn()));
  }

} // class tt_LeftTurnerTest
