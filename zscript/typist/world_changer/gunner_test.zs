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

/** This is a test for tt_Gunner.
 */
class tt_GunnerTest : tt_Clematis
{

// public: /////////////////////////////////////////////////////////////////////

  override
  void TestSuites()
  {
    Describe("Checking Gunner");

    checkNullOrigin();
    checkValidOrigin();

    EndDescribe();
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void checkNullOrigin()
  {
    setUp();

    _originSource.expect_getOrigin(NULL);

    shoot();
    tearDown();
  }

  private
  void checkValidOrigin()
  {
    setUp();

    let origin = tt_Origin.of((0, 0, 0));

    _originSource.expect_getOrigin(origin);
    _aimer.expect_aim();
    _firer.expect_fire();

    shoot();
    tearDown();
  }

  private
  void setUp()
  {
    _originSource = tt_OriginSourceMock.of();
    _aimer        = tt_AimerMock.of();
    _firer        = tt_FirerMock.of();
    _gunner       = tt_Gunner.of(_originSource, _aimer, _firer);
  }

  private
  void tearDown()
  {
    It("Origin Source is satisfied" , Assert(_originSource.isSatisfied_getOrigin()));
    It("Aimer is satisfied"         , Assert(_aimer.isSatisfied_aim()));
    It("Firer is satisfied"         , Assert(_firer.isSatisfied_fire()));
  }

  private play
  void shoot() const
  {
    _gunner.changeWorld();
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_OriginSourceMock _originSource;
  private tt_AimerMock        _aimer;
  private tt_FirerMock        _firer;
  private tt_Gunner           _gunner;

} // class tt_GunnerTest
