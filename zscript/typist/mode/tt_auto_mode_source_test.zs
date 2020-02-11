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

class tt_AutoModeSourceTest : tt_Clematis
{

// public: /////////////////////////////////////////////////////////////////////

  override
  void TestSuites()
  {
    Describe("Checking Auto Mode Source");

    checkNoTargets();
    checkTargetsAreVisible();
    checkTargetsAreInvisible();

    EndDescribe();
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void checkNoTargets()
  {
    setUp();

    _knownTargetSource.expect_isEmpty(true);

    int mode = _autoModeSource.getMode();

    It("No targets -> Explore", AssertEval(mode, "==", tt_Mode.Explore));

    tearDown();
  }

  private
  void checkTargetsAreVisible()
  {
    setUp();

    let knownTargets = new("tt_KnownTargets").init();
    let target       = new("tt_Target"      ).init(Spawn("Demon", (0, 0, 0)));
    let question     = new("tt_QuestionMock").init();
    let knownTarget  = new("tt_KnownTarget" ).init(target, question);
    knownTargets.add(knownTarget);

    _knownTargetSource.expect_isEmpty(false);
    _knownTargetSource.expect_getTargets(knownTargets);
    _playerSource     .expect_getPawn(players[consolePlayer].mo);

    int mode = _autoModeSource.getMode();

    It("There are visible targets -> Combat", AssertEval(mode, "==", tt_Mode.Combat));

    tearDown();
  }

  private
  void checkTargetsAreInvisible()
  {
    setUp();

    let knownTargets = new("tt_KnownTargets").init();
    let target       = new("tt_Target"      ).init(Spawn("Demon", (9999999, 0, 0)));
    let question     = new("tt_QuestionMock").init();
    let knownTarget  = new("tt_KnownTarget" ).init(target, question);
    knownTargets.add(knownTarget);

    _knownTargetSource.expect_isEmpty(false);
    _knownTargetSource.expect_getTargets(knownTargets);
    _playerSource     .expect_getPawn(players[consolePlayer].mo);

    int mode = _autoModeSource.getMode();

    It("There are no visible targets -> Explore", AssertEval(mode, "==", tt_Mode.Explore));

    tearDown();
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void setUp()
  {
    _knownTargetSource = new("tt_KnownTargetSourceMock").init();
    _playerSource      = new("tt_PlayerSourceMock").init();
    _autoModeSource    = new("tt_AutoModeSource").init(_knownTargetSource, _playerSource);
  }

  private
  void tearDown()
  {
    It("Known Target Source is satisfied", Assert(_knownTargetSource.isSatisfied_isEmpty()));
    It("Known Target Source is satisfied", Assert(_knownTargetSource.isSatisfied_getTargets()));
    It("Pawn Source is satisfied"        , Assert(_playerSource.isSatisfied_getPawn()));
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_KnownTargetSourceMock _knownTargetSource;
  private tt_PlayerSourceMock      _playerSource;
  private tt_AutoModeSource        _autoModeSource;

} // class tt_AutoModeSourceTest
