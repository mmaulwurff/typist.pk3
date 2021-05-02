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

/** This class contains tests for tt_Strings class.
 */
class tt_StringsTest : tt_Clematis
{

// public: // tt_Clematis //////////////////////////////////////////////////////

  override
  void TestSuites()
  {
    Describe("Checking tt_Strings");

    checkEmpty();
    checkAdd();

    EndDescribe();
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void checkEmpty()
  {
    let strings = tt_Strings.of();
    let size    = strings.size();

    It("New Strings is empty", AssertEval(size, "==", 0));
  }

  private void checkAdd()
  {
    let strings = tt_Strings.of();
    let str     = "a";

    strings.add(str);

    let size = strings.size();

    It("Element must be added", AssertEval(size, "==", 1));
    It("Element must be the same", Assert(strings.at(0) == str));
  }

} // class tt_StringsTest
