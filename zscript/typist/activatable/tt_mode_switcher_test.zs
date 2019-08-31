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
 * This is a test for ModeSwitcher class.
 */
class tt_ModeSwitcherTest : tt_Clematis
{

// public: /////////////////////////////////////////////////////////////////////

  override
  void TestSuites()
  {
    Describe("Checking ModeSwitcher");

    checkActivate();
    checkCommands();

    EndDescribe();
  }

// private: ////////////////////////////////////////////////////////////////////

  private play
  void checkActivate() const
  {
    let modeStorage  = new("tt_ModeStorageMock").init();
    let modeSwitcher = new("tt_ModeSwitcher"   ).init(modeStorage);

    modeStorage.expect_setMode();

    modeSwitcher.activate();

    It("Mode Storage is satisfied", Assert(modeStorage.isSatisfied_setMode()));
  }

  private
  void checkCommands()
  {
    let modeStorage  = new("tt_ModeStorageMock").init();
    let modeSwitcher = new("tt_ModeSwitcher"   ).init(modeStorage);
    let commands     = modeSwitcher.getCommands();

    It("Must be at least one command", AssertEval(commands.size(), ">", 0));
    It("Must contain explore command", Assert(commands.contains("/explore")));
  }

} // class tt_ModeSwitcherTest
