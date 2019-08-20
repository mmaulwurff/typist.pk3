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

class tt_PlayerInfoSourceImplTest : tt_Clematis
{

// public: /////////////////////////////////////////////////////////////////////

  override
  void TestSuites()
  {
    Describe("Checking Player Info Source");

    for (int playerNumber = 0; playerNumber < MAXPLAYERS; ++playerNumber)
    {
      let source       = new("tt_PlayerInfoSourceImpl").init(playerNumber);
      let info         = source.getInfo();

      It(String.Format("Player info (%d) must be not NULL", playerNumber), Assert(info != NULL));
    }

    EndDescribe();
  }

} // class tt_PlayerInfoSourceImplTest
