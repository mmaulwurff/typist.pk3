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

/** This is a test for ModeSources class.
 */
class tt_ModeSourcesTest : tt_Clematis
{

// public: /////////////////////////////////////////////////////////////////////

  override
  void TestSuites()
  {
    Describe("Checking ModeSources");

    checkEmpty();
    checkAdd();

    EndDescribe();
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void checkEmpty()
  {
    let modeSources = new("tt_ModeSources").init();

    It("Must be empty", AssertEval(modeSources.size(), "==", 0));
  }

  private
  void checkAdd()
  {
    let modeSources = new("tt_ModeSources"   ).init();
    let modeSource1 = new("tt_ModeSourceMock").init();
    let modeSource2 = new("tt_ModeSourceMock").init();

    modeSources.add(modeSource1);

    It("Must be not empty",         AssertEval(modeSources.size(), "==", 1));
    It("Must contain source 1",     Assert(modeSources.contains(modeSource1)));
    It("Must not contain source 2", AssertFalse(modeSources.contains(modeSource2)));
  }

} // class tt_ModeSourcesTest
