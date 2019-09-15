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
 * This is a test for tt_SettingsImpl class.
 */
class tt_SettingsImplTest : tt_Clematis
{

// public: // tt_Clematis //////////////////////////////////////////////////////

  override
  void TestSuites()
  {
    Describe("Checking SettingsImpl");

    testGetScale();

    EndDescribe();
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void testGetScale()
  {
    let playerInfoSource = new("tt_PlayerInfoSourceMock");
    let settings         = new("tt_SettingsImpl").init(playerInfoSource);

    playerInfoSource.expect_getPlayerInfo(players[consolePlayer]);

    int scale = settings.getScale();
    scale = settings.getScale(); // second call to getScale must not get player info again.

    It("Player Info Source is satisfied", Assert(playerInfoSource.isSatisfied_getPlayerInfo()));
    It("Scale is more than zero", AssertEval(scale, ">", 0));
  }

} // class tt_SettingsImplTest
