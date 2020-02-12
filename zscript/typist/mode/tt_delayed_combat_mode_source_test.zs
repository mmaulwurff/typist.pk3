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
   * |-----|-----|-------------|--------|---------------------|
   * | new | old | time is up? | result | test                |
   * |-----|-----|-------------|--------|---------------------|
   * |  C  |  *  |      *      |   N    | checkNewCombat      |
   * |  E  |  C  |     no      |   C    | checkDelay          |
   * |  E  |  C  |     yes     |   N    | checkDelay          |
   * |  E  |  E  |      *      |   N    | checkOldExploration |
   * |-----|-----|-------------|--------|---------------------|
   */
  override
  void TestSuites()
  {
    Describe("Checking tt_DelayedCombatModeSource");

    checkNewCombat();
    checkDelay();
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
    It("Again, new combat -> None", AssertEval(result2, "==", tt_Mode.None));

    checkSatisfaction();
  }

  private
  void checkDelay()
  {
    initTest();

    _modeSource.expect_getMode(tt_Mode.Combat);

    int result1 = _delay.getMode();
    It("Delayed Combat: not yet", AssertEval(result1, "==", tt_Mode.None));

    _modeSource.expect_getMode(tt_Mode.Explore, 2);

    _clock.expect_getNow(0);
    _clock.expect_since(0);

    int result2 = _delay.getMode();
    It("Delayed Combat: yes", AssertEval(result2, "==", tt_Mode.Combat));

    _clock.expect_since(9999);
    int result3 = _delay.getMode();
    It("Delayed Combat: no more", AssertEval(result3, "==", tt_Mode.None));

    checkSatisfaction();
  }

  private
  void checkOldExploration()
  {
    initTest();

    _modeSource.expect_getMode(tt_Mode.Explore, 2);
    _clock.expect_getNow(0, 0);
    _clock.expect_since(0, 0);

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
    _clock      = new("tt_ClockMock").init();
    _modeSource = new("tt_ModeSourceMock").init();
    _delay      = new("tt_DelayedCombatModeSource").init(_clock, _modeSource);
  }

  private
  void checkSatisfaction()
  {
    It("Mode source is satisfied",  Assert(_modeSource.isSatisfied_getMode()));
    It("Clock getNow is satisfied", Assert(_clock.isSatisfied_getNow()));
    It("Clock since is satisfied",  Assert(_clock.isSatisfied_since()));
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_ClockMock      _clock;
  private tt_ModeSourceMock _modeSource;

  private tt_DelayedCombatModeSource _delay;

} // class tt_DelayedCombatModeSourceTest
