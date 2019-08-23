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

/** This is a test for tt_Gunner.
 */
class tt_GunnerTest : tt_Clematis
{

// public: /////////////////////////////////////////////////////////////////////

  override
  void TestSuites()
  {
    Describe("Checking Gunner");

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

    shoot();
    tearDown();
  }

  private
  void checkZeroTargets()
  {
    setUp();

    let targets = new("tt_Targets").init();
    _targetSource.expect_getTargets(targets);

    shoot();
    tearDown();
  }

  private
  void checkNullTarget()
  {
    setUp();

    let targets = new("tt_Targets").init();
    targets.add(NULL);
    _targetSource.expect_getTargets(targets);

    shoot();
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
    _aimer.expect_aim();
    _firer.expect_fire();

    shoot();
    tearDown();
  }

  private
  void setUp()
  {
    _targetSource = new("tt_TargetSourceMock").init();
    _aimer        = new("tt_AimerMock").init();
    _firer        = new("tt_FirerMock").init();
    _gunner       = new("tt_Gunner").init(_targetSource, _aimer, _firer);
  }

  private
  void tearDown()
  {
    It("Target Source is satisfied" , Assert(_targetSource.isSatisfied_getTargets()));
    It("Aimer is satisfied"         , Assert(_aimer.isSatisfied_aim()));
    It("Firer is satisfied"         , Assert(_firer.isSatisfied_fire()));
  }

  private play
  void shoot() const
  {
    _gunner.damage();
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_TargetSourceMock _targetSource;
  private tt_AimerMock        _aimer;
  private tt_FirerMock        _firer;
  private tt_Gunner           _gunner;

} // class tt_GunnerTest
