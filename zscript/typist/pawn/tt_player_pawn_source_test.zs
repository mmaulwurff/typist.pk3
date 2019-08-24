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

class tt_PlayerPawnSourceTest : tt_Clematis
{

// public: /////////////////////////////////////////////////////////////////////

  override
  void TestSuites()
  {
    testConsolePlayer();
    testNextPlayer();
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void testConsolePlayer()
  {
    Describe("Checking Player Pawn Source with ConsolePlayer");

    let mockInfoSource = new("tt_PlayerInfoSourceMock").init();

    mockInfoSource.expect_getPlayerInfo(players[consolePlayer]);

    let source = new("tt_PlayerPawnSource").init(mockInfoSource);
    let pawn   = source.getPawn();

    It(String.Format("Must get main player (%d) actor", consolePlayer), AssertNotNull(pawn));
    It("Player Info Source is satisfied", Assert(mockInfoSource.isSatisfied_getPlayerInfo()));

    EndDescribe();
  }

  /** Since tests are run on single-player game, no other players must exist.
   */
  private
  void testNextPlayer()
  {
    Describe("Checking Player Pawn Source with other numbers");

    for (int i = 1; i < MAXPLAYERS; ++i)
    {
      int playerNumber   = (consolePlayer + i) % MAXPLAYERS;
      let mockInfoSource = new("tt_PlayerInfoSourceMock").init();
      mockInfoSource.expect_getPlayerInfo(players[playerNumber]);

      let source = new("tt_PlayerPawnSource").init(mockInfoSource);
      let pawn   = source.getPawn();

      It(String.Format("Other player (%d) must be null", playerNumber), AssertNull(pawn));
      It("Player Info Source is satisfied", Assert(mockInfoSource.isSatisfied_getPlayerInfo()));
    }

    EndDescribe();
  }

} // class tt_PlayerPawnSourceTest
