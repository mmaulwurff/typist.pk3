/* Copyright Alexander 'm8f' Kromm (mmaulwurff@gmail.com) 2019-2021
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
 * This is a test for tt_DelayedCombatModeSource.
 */
class tt_DelayedCombatModeSourceTest : tt_Clematis
{

// public: // tt_Clematis //////////////////////////////////////////////////////

  /**
   * C - Combat Mode
   * E - Exploration Mode
   * N - None Mode (let other decide)
   *
   * |-----|-----|---------|-------------|--------|-------------------------|
   * | old | new | enemies | time is up? | result | test                    |
   * |-----|-----|---------|-------------|--------|-------------------------|
   * |  *  |  C  |    *    |      *      | None   | checkNewCombat          |
   * |  C  |  E  |   no    |      *      | None   | checkNoEnemies          |
   * |  C  |  E  |   yes   |     no      | Combat | checkEnemiesStillCombat |
   * |  C  |  E  |   yes   |     yes     | None   | checkEnemiesTimeIsUp    |
   * |  E  |  *  |    *    |      *      | None   | checkOldExploration     |
   * |-----|-----|---------|-------------|--------|-------------------------|
   */
  override
  void TestSuites()
  {
    Describe("Checking tt_DelayedCombatModeSource");

    checkNewCombat();
    checkNoEnemies();
    checkEnemiesStillCombat();
    checkEnemiesTimeIsUp();
    checkOldExploration();

    EndDescribe();
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void checkNewCombat()
  {
    initTest();

    _modeSource.expect_getMode(tt_Mode.Combat, 2);
    _clock.expect_getNow(0, 0);
    _clock.expect_since(0, 0);

    int result1 = _delay.getMode();
    It("New combat -> None", AssertEval(result1, "==", tt_Mode.None));

    int result2 = _delay.getMode();
    It("Again, combat -> None", AssertEval(result2, "==", tt_Mode.None));

    checkSatisfaction();
  }

  private
  void checkNoEnemies()
  {
    initTest();

    // set up history: it was combat.
    _modeSource.expect_getMode(tt_Mode.Combat);
    _delay.getMode();

    _modeSource.expect_getMode(tt_Mode.Explore);
    _targetSource.expect_getTargets(tt_Targets.of());

    int result = _delay.getMode();
    It("Delayed Combat: no enemies", AssertEval(result, "==", tt_Mode.None));

    checkSatisfaction();
  }

  private
  void checkEnemiesStillCombat()
  {
    initTest();

    // set up history: it was combat.
    _modeSource.expect_getMode(tt_Mode.Combat);
    _delay.getMode();

    { // set expectations
      _modeSource.expect_getMode(tt_Mode.Explore);

      let targets = tt_Targets.of();
      targets.add(NULL);
      _targetSource.expect_getTargets(targets);

      _clock.expect_getNow(0);
      _clock.expect_since(0);
    }

    int result = _delay.getMode();
    It("Delayed Combat: still combat", AssertEval(result, "==", tt_Mode.Combat));

    checkSatisfaction();
  }

  private
  void checkEnemiesTimeIsUp()
  {
    initTest();

    // set up history: it was combat.
    _modeSource.expect_getMode(tt_Mode.Combat);
    _delay.getMode();

    { // set expectations
      _modeSource.expect_getMode(tt_Mode.Explore);

      let targets = tt_Targets.of();
      targets.add(NULL);
      _targetSource.expect_getTargets(targets);

      _clock.expect_getNow(0);
      _clock.expect_since(999);
    }

    int result = _delay.getMode();
    It("Delayed Combat: no more combat", AssertEval(result, "==", tt_Mode.None));

    checkSatisfaction();
  }

  private
  void checkOldExploration()
  {
    initTest();

    _modeSource.expect_getMode(tt_Mode.Explore, 2);
    _clock.expect_getNow(0, 0);
    _clock.expect_since(0, 0);
    _targetSource.expect_getTargets(tt_Targets.of());

    int result1 = _delay.getMode();
    It("Old Exploration -> None", AssertEval(result1, "==", tt_Mode.None));

    int result2 = _delay.getMode();
    It("Again, old Exploration -> None", AssertEval(result2, "==", tt_Mode.None));

    checkSatisfaction();
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void initTest()
  {
    _clock        = tt_ClockMock.of();
    _modeSource   = tt_ModeSourceMock.of();
    _targetSource = tt_TargetSourceMock.of();

    _delay        = tt_DelayedCombatModeSource.of(_clock, _modeSource, _targetSource);
  }

  private
  void checkSatisfaction()
  {
    It("Mode source is satisfied",  Assert(_modeSource.isSatisfied_getMode()));
    It("Clock getNow is satisfied", Assert(_clock.isSatisfied_getNow()));
    It("Clock since is satisfied",  Assert(_clock.isSatisfied_since()));
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_ClockMock        _clock;
  private tt_ModeSourceMock   _modeSource;
  private tt_TargetSourceMock _targetSource;

  private tt_DelayedCombatModeSource _delay;

} // class tt_DelayedCombatModeSourceTest
