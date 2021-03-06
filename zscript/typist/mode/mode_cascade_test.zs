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

/**
 * This is a test for ModeCascade class.
 */
class tt_ModeCascadeTest : tt_Clematis
{

// public: // tt_Clematis //////////////////////////////////////////////////////

  override
  void TestSuites()
  {
    Describe("Checking Mode Cascade");

    checkZeroSources();
    checkCascadeFirst();
    checkCascadeSecond();

    EndDescribe();
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void checkZeroSources()
  {
    Array<tt_ModeSource> sources;
    let cascade = tt_ModeCascade.of(sources);

    int mode = cascade.getMode();

    It("No source -> no mode", AssertEval(mode, "==", tt_Mode.None));
  }

  private
  void checkCascadeFirst()
  {
    let source1 = tt_ModeSourceMock.of();
    let source2 = tt_ModeSourceMock.of();
    Array<tt_ModeSource> sources;
    sources.Push(source1);
    sources.Push(source2);

    let cascade = tt_ModeCascade.of(sources);

    source1.expect_getMode(tt_Mode.Explore);
    source2.expect_getMode(tt_Mode.Combat);

    int mode = cascade.getMode();

    It("Must be the first mode", AssertEval(mode, "==", tt_Mode.Explore));
  }

  private
  void checkCascadeSecond()
  {
    let source1 = tt_ModeSourceMock.of();
    let source2 = tt_ModeSourceMock.of();
    Array<tt_ModeSource> sources;
    sources.Push(source1);
    sources.Push(source2);

    let cascade = tt_ModeCascade.of(sources);

    source1.expect_getMode(tt_Mode.None);
    source2.expect_getMode(tt_Mode.Combat);

    int mode = cascade.getMode();

    It("Must be the second mode", AssertEval(mode, "==", tt_Mode.Combat));
  }

} // class tt_ModeCascadeTest
