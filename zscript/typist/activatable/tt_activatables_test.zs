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

/** This class contains tests for tt_Activatables.
 */
class tt_ActivatablesTest : tt_Clematis
{

// public: // tt_Clematis //////////////////////////////////////////////////////

  override
  void TestSuites()
  {
    Describe("Checking Activatables");

    checkEmpty();
    checkAdd();

    EndDescribe();
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void checkEmpty()
  {
    let activatables = new("tt_Activatables").init();
    let size         = activatables.size();

    It("New Activatables has zero size", AssertEval(size, "==", 0));
  }

  private
  void checkAdd()
  {
    let activatables = new("tt_Activatables"   ).init();
    let activatable  = new("tt_ActivatableMock").init();

    activatables.add(activatable);

    let size = activatables.size();

    It("Filled Activatables is not empty", AssertEval(size, "==", 1));
  }

} // class tt_ActivatablesTest
