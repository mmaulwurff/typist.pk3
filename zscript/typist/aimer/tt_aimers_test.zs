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
 * This is a test for tt_Aimers.
 */
class tt_AimersTest : tt_Clematis
{

// public: /////////////////////////////////////////////////////////////////////

  override
  void TestSuites()
  {
    Describe("Checking tt_Aimers");

    testAdd();

    EndDescribe();
  }

// private: ////////////////////////////////////////////////////////////////////

  private play
  void testAdd() const
  {
    let aimers = new("tt_Aimers"   ).init();
    let aimer1 = new("tt_AimerMock").init();
    let aimer2 = new("tt_AimerMock").init();

    aimers.add(aimer1);
    aimers.add(aimer2);

    aimer1.expect_aim();
    aimer2.expect_aim();

    aimers.aim();

    It("Aimer 1 is satisfied", Assert(aimer1.isSatisfied_aim()));
    It("Aimer 2 is satisfied", Assert(aimer2.isSatisfied_aim()));
  }

} // class tt_AimersTest
