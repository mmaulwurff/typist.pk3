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

    let targets = _targetRegistry.getTargets();
    It("Is empty", Assert(targets.size() == 0));

    targetRegistryTearDown();
  }

  private
  void targetRegistryAddCheck()
  {
    targetRegistrySetUp("Checking adding to Target Registry");

    let target1 = new("tt_TargetMock").init();
    let target2 = new("tt_TargetMock").init();
    target1.expect_id(tt_TargetID.fromNumber(tt_TargetID.TARGET_USER));
    target2.expect_id(tt_TargetID.fromNumber(tt_TargetID.TARGET_USER + 1));

    let targets = new("tt_Targets").init();
    targets.add(target1);
    targets.add(target2);

    _targetSource.expect_getTargets(targets);
    _disabledTargetSource.expect_getTargets(new("tt_DisabledTargets").init());
    _questionSource.expect_getQuestion(new("tt_QuestionMock").init(), 2);

    _targetRegistry.update();
    let knownTargets = _targetRegistry.getTargets();

    It("Is two targets", AssertEval(knownTargets.size(), "==", 2));
    It("Target1 ID", Assert(target1.isSatisfied_id()));
    It("Target2 ID", Assert(target2.isSatisfied_id()));

    targetRegistryTearDown();
  }

  private
  void targetRegistryAddExistingCheck()
  {
    targetRegistrySetUp("Checking adding an existing target to Target Registry");

    // First, add a single target.
    let target = new("tt_TargetMock").init();
    target.expect_id(tt_TargetID.fromNumber(tt_TargetID.TARGET_USER));

    let targets = new("tt_Targets").init();
    targets.add(target);

    _targetSource.expect_getTargets(targets);
    _disabledTargetSource.expect_getTargets(new("tt_DisabledTargets").init());
    _questionSource.expect_getQuestion(new("tt_QuestionMock").init(), 1);

    _targetRegistry.update();
    let knownTargets = _targetRegistry.getTargets();

    It("Is one targets", AssertEval(knownTargets.size(), "==", 1));
    It("Target ID", Assert(target.isSatisfied_id()));

    assertSourcesSatisfied();

    // Second, add the same target again. Only a single target must remain
    // registered.
    _targetSource.expect_getTargets(targets);
    _disabledTargetSource.expect_getTargets(new("tt_DisabledTargets").init());
    _questionSource.expect_getQuestion(NULL, 0);
    target.expect_id(tt_TargetID.fromNumber(tt_TargetID.TARGET_USER), 2);

    _targetRegistry.update();
    knownTargets = _targetRegistry.getTargets();
    let target1 = new("tt_TargetMock").init();
    let target2 = new("tt_TargetMock").init();
    target1.expect_id(tt_TargetID.fromNumber(tt_TargetID.TARGET_USER));
    target2.expect_id(tt_TargetID.fromNumber(tt_TargetID.TARGET_USER + 1));

    It("Is one targets", AssertEval(knownTargets.size(), "==", 1));
    It("Target ID", Assert(target.isSatisfied_id()));

    targetRegistryTearDown();
  }

  private
  void targetRegistryRemoveCheck()
  {
    targetRegistrySetUp("Checking removing a target from Target Registry");

    // First, add two targets.
    let target1 = new("tt_TargetMock").init();
    let target2 = new("tt_TargetMock").init();
    target1.expect_id(tt_TargetID.fromNumber(tt_TargetID.TARGET_USER));
    target2.expect_id(tt_TargetID.fromNumber(tt_TargetID.TARGET_USER + 1));

    let targets = new("tt_Targets").init();
    targets.add(target1);
    targets.add(target2);

    _targetSource.expect_getTargets(targets);
    _disabledTargetSource.expect_getTargets(new("tt_DisabledTargets").init());
    _questionSource.expect_getQuestion(new("tt_QuestionMock").init(), 2);

    _targetRegistry.update();
    let knownTargets = _targetRegistry.getTargets();

    It("Is two targets", AssertEval(knownTargets.size(), "==", 2));
    It("Target1 ID", Assert(target1.isSatisfied_id()));
    It("Target2 ID", Assert(target2.isSatisfied_id()));

    assertSourcesSatisfied();

    // Second, remove one target.
    let disabledTarget =
      new("tt_DisabledTarget").init(tt_TargetID.fromNumber(tt_TargetID.TARGET_USER));
    let disabledTargets = new("tt_DisabledTargets").init();
    disabledTargets.add(disabledTarget);

    _targetSource.expect_getTargets(new("tt_Targets").init());
    _disabledTargetSource.expect_getTargets(disabledTargets);
    _questionSource.expect_getQuestion(NULL, 0);

    _targetRegistry.update();
    knownTargets = _targetRegistry.getTargets();

    It("Is one target now", AssertEval(knownTargets.size(), "==", 1));

    targetRegistryTearDown();
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void targetRegistrySetUp(String description)
  {
    Describe(description);

    _targetSource         = new("tt_TargetSourceMock").init();
    _questionSource       = new("tt_QuestionSourceMock").init();
    _disabledTargetSource = new("tt_DisabledTargetSourceMock").init();

    _targetRegistry = new("tt_TargetRegistry").init( _targetSource
                                                   , _questionSource
                                                   , _disabledTargetSource
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

  private tt_TargetSourceMock         _targetSource;
  private tt_QuestionSourceMock       _questionSource;
  private tt_DisabledTargetSourceMock _disabledTargetSource;
  private tt_KnownTargetSource        _targetRegistry;

} // class tt_TargetRegistryTest
