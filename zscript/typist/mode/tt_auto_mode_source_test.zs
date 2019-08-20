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

class tt_AutoModeSourceTest : tt_Clematis
{

// public: /////////////////////////////////////////////////////////////////////

  override
  void TestSuites()
  {
    Describe("Checking Auto Mode Source");

    testAutoModeSourceNoTargets();
    testAutoModeSourceTargetsArePresent();

    EndDescribe();
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void testAutoModeSourceNoTargets()
  {
    let knownTargetSource = new("tt_KnownTargetSourceMock").init();
    let autoModeSource    = new("tt_AutoModeSource").init(knownTargetSource);

    knownTargetSource.expect_isEmpty(true);

    int mode = autoModeSource.getMode();

    It("No targets -> Explore", AssertEval(mode, "==", tt_Mode.MODE_EXPLORE));
  }

  private
  void testAutoModeSourceTargetsArePresent()
  {
    let knownTargetSource = new("tt_KnownTargetSourceMock").init();
    let autoModeSource    = new("tt_AutoModeSource").init(knownTargetSource);

    knownTargetSource.expect_isEmpty(false);

    int mode = autoModeSource.getMode();

    It("There are targets -> Combat", AssertEval(mode, "==", tt_Mode.MODE_COMBAT));
  }

} // class tt_AutoModeSourceTest
