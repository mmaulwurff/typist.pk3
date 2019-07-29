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

extend
class tt_Test
{

// private: ////////////////////////////////////////////////////////////////////

  private
  void testTargetRegistry()
  {
    targetRegistryEmptyCheck();
    targetRegistryAddCheck();
  }

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
    targetRegistrySetUp("Checking adding to Target Registry ");

    let target1 = new("tt_TargetMock");
    let target2 = new("tt_TargetMock");
    let targets = new("tt_Targets");
    targets.add(target1);
    targets.add(target2);

    target1.expect_id(tt_TargetID.fromNumber(tt_TargetID.TARGET_USER));
    target2.expect_id(tt_TargetID.fromNumber(tt_TargetID.TARGET_USER + 1));
    _targetSource.expect_getTargets(targets);

    let disabledTargets = new("tt_DisabledTargets");
    _disabledTargetSource.expect_getTargets(disabledTargets);

    let question = new("tt_QuestionMock");
    _questionSource.expect_getQuestion(question, 2);

    _targetRegistry.update();

    let knownTargets = _targetRegistry.getTargets();

    It("Is two targets", AssertEval(knownTargets.size(), "==", 2));

    targetRegistryTearDown();
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void targetRegistrySetUp(string description)
  {
    Describe(description);

    _targetSource         = new("tt_TargetSourceMock");
    _questionSource       = new("tt_QuestionSourceMock");
    _disabledTargetSource = new("tt_DisabledTargetSourceMock");

    _targetRegistry = new("tt_TargetRegistry").init( _targetSource
                                                   , _questionSource
                                                   , _disabledTargetSource
                                                   );
  }

  private
  void targetRegistryTearDown()
  {
    It("Target Source is satisfied",
       Assert(_targetSource.isSatisfied_getTargets()));
    It("Question Source is satisfied",
       Assert(_questionSource.isSatisfied_getQuestion()));
    It("Disabled Target Source is satisfied",
       Assert(_disabledTargetSource.isSatisfied_getTargets()));

    _targetSource         = NULL;
    _questionSource       = NULL;
    _disabledTargetSource = NULL;
    _targetRegistry       = NULL;

    EndDescribe();
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_TargetSourceMock         _targetSource;
  private tt_QuestionSourceMock       _questionSource;
  private tt_DisabledTargetSourceMock _disabledTargetSource;
  private tt_KnownTargetSource        _targetRegistry;

} // class tt_Test
