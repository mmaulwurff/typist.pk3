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
 * This is a test for tt_ReportedModeSource.
 */
class tt_ReportedModeSourceTest : tt_Clematis
{

// public: /////////////////////////////////////////////////////////////////////

  override
  void TestSuites()
  {
    Describe("Checking tt_ReportedModeSourceTest");

    checkInitial();
    checkExplorationToCombat();
    checkCombatToExploration();

    EndDescribe();
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void checkInitial()
  {
    init();

    int expected = tt_Mode.Explore;
    _modeSource.expect_getMode(expected);

    int mode = _reportedMode.getMode();

    It("Explore after init", AssertEval(mode, "==", expected));

    tearDown();
  }

  private
  void checkExplorationToCombat()
  {
    init();

    _eventReporter.expect_reportNewMode();

    _modeSource.expect_getMode(tt_Mode.Explore);
    int mode1 = _reportedMode.getMode();

    _modeSource.expect_getMode(tt_Mode.Combat);
    int mode2 = _reportedMode.getMode();

    tearDown();
  }

  private
  void checkCombatToExploration()
  {
    init();

    _eventReporter.expect_reportNewMode();

    _modeSource.expect_getMode(tt_Mode.Combat);
    int mode1 = _reportedMode.getMode();

    _modeSource.expect_getMode(tt_Mode.Explore);
    int mode2 = _reportedMode.getMode();

    tearDown();
  }

// private: ////////////////////////////////////////////////////////////////////

  void init()
  {
    _eventReporter = tt_EventReporterMock.of();
    _modeSource    = tt_ModeSourceMock.of();

    _reportedMode  = tt_ReportedModeSource.of(_eventReporter, _modeSource);
  }

  void tearDown()
  {
    It("Reporter satisfied: mode",      Assert(_eventReporter.isSatisfied_reportNewMode()       ));
    It("Reporter satisfied: key",       Assert(_eventReporter.isSatisfied_reportKeyPressed()    ));
    It("Reporter satisfied: match",     Assert(_eventReporter.isSatisfied_reportAnswerMatch()   ));
    It("Reporter satisfied: not match", Assert(_eventReporter.isSatisfied_reportAnswerNotMatch()));

    It("Mode Source satisfied", Assert(_modeSource.isSatisfied_getMode()));
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_EventReporterMock  _eventReporter;
  private tt_ModeSourceMock     _modeSource;
  private tt_ReportedModeSource _reportedMode;

} // class tt_ReportedModeSourceTest
