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
 * This is a test for SettableMode class.
 */
class tt_SettableModeTest : tt_Clematis
{

// public: /////////////////////////////////////////////////////////////////////

  override
  void TestSuites()
  {
    Describe("Checking Settable Mode");

    let settableMode = new("tt_SettableMode").init();
    int before       = tt_Mode.Combat;

    settableMode.setMode(before);
    int after = settableMode.getMode();

    It("Mode must be the same", AssertEval(before, "==", after));

    EndDescribe();
  }

} // class tt_SettableModeTest
