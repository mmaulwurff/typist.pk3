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

class tt_TargetRegistryTest : tt_Clematis
{

// public: /////////////////////////////////////////////////////////////////////

  override
  void TestSuites()
  {
    targetRegistryEmptyCheck();
    targetRegistryAddCheck();
    targetRegistryAddExistingCheck();
    targetRegistryRemoveCheck();
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void targetRegistryEmptyCheck()
  {
    targetRegistrySetUp("Checking empty Target Registry");

    _targetSource        .expect_getTargets(tt_Targets.of());
    _disabledTargetSource.expect_getTargets(tt_Targets.of());

    It("Is empty", Assert(_targetRegistry.isEmpty()));

    targetRegistryTearDown();
  }

  private
  void targetRegistryAddCheck()
  {
    targetRegistrySetUp("Checking adding to Target Registry");

    let target1 = tt_Target.of(Spawn("Demon", (0, 0, 0)));
    let target2 = tt_Target.of(Spawn("Demon", (0, 0, 0)));
    let targets = tt_Targets.of();
    targets.add(target1);
    targets.add(target2);

    _targetSource.expect_getTargets(targets);
    _disabledTargetSource.expect_getTargets(tt_Targets.of());
    _questionSource.expect_getQuestion(tt_QuestionMock.of(), 2);

    let knownTargets = _targetRegistry.getTargets();

    It("Is two targets", AssertEval(knownTargets.size(), "==", 2));

    targetRegistryTearDown();
  }

  private
  void targetRegistryAddExistingCheck()
  {
    targetRegistrySetUp("Checking adding an existing target to Target Registry");

    // First, add a single target.
    let demon1  = Spawn("Demon", (0, 0, 0));
    let target  = tt_Target.of(demon1);
    let targets = tt_Targets.of();
    targets.add(target);

    _targetSource.expect_getTargets(targets);
    _disabledTargetSource.expect_getTargets(tt_Targets.of());
    _questionSource.expect_getQuestion(tt_QuestionMock.of());

    let knownTargets = _targetRegistry.getTargets();

    It("Is one target", AssertEval(knownTargets.size(), "==", 1));

    assertSourcesSatisfied();

    // Second, add the same target again. Only a single target must remain
    // registered.
    _targetSource.expect_getTargets(targets);
    _disabledTargetSource.expect_getTargets(tt_Targets.of());
    _questionSource.expect_getQuestion(NULL, 0);
    _clock.expect_since(999);

    knownTargets = _targetRegistry.getTargets();

    It("Is one target", AssertEval(knownTargets.size(), "==", 1));

    targetRegistryTearDown();
  }

  private
  void targetRegistryRemoveCheck()
  {
    targetRegistrySetUp("Checking removing a target from Target Registry");

    // First, add two targets.
    let demon1  = Spawn("Demon", (0, 0, 0));
    let demon2  = Spawn("Demon", (0, 0, 0));
    let target1 = tt_Target.of(demon1);
    let target2 = tt_Target.of(demon2);
    let targets = tt_Targets.of();
    targets.add(target1);
    targets.add(target2);

    _targetSource.expect_getTargets(targets);
    _disabledTargetSource.expect_getTargets(tt_Targets.of());
    _questionSource.expect_getQuestion(tt_QuestionMock.of(), 2);

    let knownTargets = _targetRegistry.getTargets();

    It("Is two targets", AssertEval(knownTargets.size(), "==", 2));

    assertSourcesSatisfied();

    // Second, remove one target.
    let disabledTarget  = tt_Target.of(demon1);
    let disabledTargets = tt_Targets.of();
    disabledTargets.add(disabledTarget);

    _targetSource.expect_getTargets(tt_Targets.of());
    _disabledTargetSource.expect_getTargets(disabledTargets);
    _questionSource.expect_getQuestion(NULL, 0);
    _clock.expect_since(999);

    knownTargets = _targetRegistry.getTargets();

    It("Is one target now", AssertEval(knownTargets.size(), "==", 1));

    targetRegistryTearDown();
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void targetRegistrySetUp(String description)
  {
    Describe(description);

    _targetSource         = tt_TargetSourceMock.of();
    _questionSource       = tt_QuestionSourceMock.of();
    _disabledTargetSource = tt_TargetSourceMock.of();
    _clock                = tt_ClockMock.of();

    _targetRegistry = tt_TargetRegistry.of( _targetSource
                                           , _questionSource
                                           , _disabledTargetSource
                                           , _clock
                                           );
  }

  private
  void targetRegistryTearDown()
  {
    assertSourcesSatisfied();

    _targetSource         = NULL;
    _questionSource       = NULL;
    _disabledTargetSource = NULL;
    _targetRegistry       = NULL;
    _clock                = NULL;

    EndDescribe();
  }

  private
  void assertSourcesSatisfied()
  {
    It("Target Source is satisfied",
       Assert(_targetSource.isSatisfied_getTargets()));
    It("Question Source is satisfied",
       Assert(_questionSource.isSatisfied_getQuestion()));
    It("Disabled Target Source is satisfied",
       Assert(_disabledTargetSource.isSatisfied_getTargets()));
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_TargetSourceMock   _targetSource;
  private tt_QuestionSourceMock _questionSource;
  private tt_TargetSourceMock   _disabledTargetSource;
  private tt_ClockMock          _clock;

  private tt_KnownTargetSource  _targetRegistry;

} // class tt_TargetRegistryTest
