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
 * This is a test for tt_CachedTargetSource.
 */
class tt_CachedTargetSourceTest : tt_Clematis
{

// public: // tt_Clematis //////////////////////////////////////////////////////

  override
  void TestSuites()
  {
    Describe("Checking CachedTargetSource");

    checkFirstRead();
    checkCachedRead();
    checkCacheMissRead();

    EndDescribe();
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void checkFirstRead()
  {
    setUp();

    tt_Targets targets;
    _targetSource.expect_getTargets(targets, 1);
    _clock.expect_since(1);

    _cachedTargetSource.getTargets();

    tearDown();
  }

  private
  void checkCachedRead()
  {
    setUp();

    tt_Targets targets;
    _targetSource.expect_getTargets(targets);

    _cachedTargetSource.getTargets();

    _clock.expect_since(0);

    _cachedTargetSource.getTargets();

    tearDown();
  }

  private
  void checkCacheMissRead()
  {
    setUp();

    tt_Targets targets;
    _targetSource.expect_getTargets(targets, 2);

    _cachedTargetSource.getTargets();

    _clock.expect_since(1);

    _cachedTargetSource.getTargets();
    tearDown();
  }

  private
  void setUp()
  {
    _targetSource = new("tt_TargetSourceMock").init();
    _clock        = new("tt_ClockMock"       ).init();

    _cachedTargetSource = new("tt_CachedTargetSource").init(_targetSource, _clock);
  }

  private
  void tearDown()
  {
    It("Target Source satisfied", Assert(_targetSource.isSatisfied_getTargets()));
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_TargetSourceMock _targetSource;
  private tt_ClockMock        _clock;
  private tt_TargetSource     _cachedTargetSource;

} // class tt_CachedTargetSourceTest
