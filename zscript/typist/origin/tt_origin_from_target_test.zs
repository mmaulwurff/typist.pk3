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

/** This is a test for tt_OriginFromTarget class.
 */
class tt_OriginFromTargetTest : tt_Clematis
{

// public: /////////////////////////////////////////////////////////////////////

  override
  void TestSuites()
  {
    Describe("Checking Origin From Target");

    checkNullTargets();
    checkZeroTargets();
    checkNullTarget();
    checkOneTarget();

    EndDescribe();
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void checkNullTargets()
  {
    setUp();

    _targetSource.expect_getTargets(NULL);

    let origin = _originSource.getOrigin();

    It("NULL targets -> NULL origin", AssertNull(origin));

    tearDown();
  }

  private
  void checkZeroTargets()
  {
    setUp();

    let targets = new("tt_Targets").init();
    _targetSource.expect_getTargets(targets);

    let origin = _originSource.getOrigin();

    It("Zero targets -> NULL origin", AssertNull(origin));

    tearDown();
  }

  private
  void checkNullTarget()
  {
    setUp();

    let targets = new("tt_Targets").init();
    targets.add(NULL);
    _targetSource.expect_getTargets(targets);

    let origin = _originSource.getOrigin();

    It("NULL target -> NULL origin", AssertNull(origin));

    tearDown();
  }

  private
  void checkOneTarget()
  {
    setUp();

    let targets = new("tt_Targets").init();
    let target  = new("tt_TargetMock").init();
    targets.add(target);
    _targetSource.expect_getTargets(targets);
    target.expect_position((0, 0, 0));

    let origin = _originSource.getOrigin();

    It("Valid target -> valid origin", AssertNotNull(origin));
    It("Target is satisfied", Assert(target.isSatisfied_position()));

    tearDown();
  }

  private
  void setUp()
  {
    _targetSource = new("tt_TargetSourceMock").init();
    _originSource = new("tt_OriginFromTarget").init(_targetSource);
  }

  private
  void tearDown()
  {
    It("Target Source is satisfied", Assert(_targetSource.isSatisfied_getTargets()));
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_TargetSourceMock _targetSource;
  private tt_OriginSource     _originSource;

} // class tt_OriginFromTargetTest
