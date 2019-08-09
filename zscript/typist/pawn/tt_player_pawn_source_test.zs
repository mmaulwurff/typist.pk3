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
class tt_DynamicTest
{

  // private: //////////////////////////////////////////////////////////////////

  private
  void testPlayerPawnSource()
  {
    testConsolePlayer();
    testNextPlayer();
  }

  private
  void testConsolePlayer()
  {
    Describe("Checking Player Pawn Source with ConsolePlayer");

    let source = new("tt_PlayerPawnSource").init(consolePlayer);
    let pawn   = source.getPawn();

    It(String.Format("Must get main player (%d) actor", consolePlayer), AssertNotNull(pawn));

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
      int playerNumber = (consolePlayer + i) % MAXPLAYERS;
      let source       = new("tt_PlayerPawnSource").init(playerNumber);
      let pawn         = source.getPawn();

      It(String.Format("Other player (%d) must be null", playerNumber), AssertNull(pawn));
    }

    EndDescribe();
  }

} // class tt_DynamicTest
