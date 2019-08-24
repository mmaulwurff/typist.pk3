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

/** This is a test for tt_QuestionAnswerMatcher.
 */
class tt_QuestionAnswerMatcherTest : tt_Clematis
{

// public: // tt_Clematis //////////////////////////////////////////////////////

  override
  void TestSuites()
  {
    checkNullKnownTargets();
    checkZeroKnownTargets();
    checkNullKnownTarget();

    checkNullAnswer();

    checkKnownTargetAndAnswerMatch();
    checkKnownTargetAndAnswerNoMatch();
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void checkNullKnownTargets()
  {
    setUp("Checking Question-Answer Matcher: NULL known targets");

    _knownTargetSource.expect_getTargets(NULL);

    let origin = _matcher.getOrigin();

    It("NULL known targets -> NULL origin", AssertNull(origin));

    tearDown();
  }

  private
  void checkZeroKnownTargets()
  {
    setUp("Checking Question-Answer Matcher: zero known targets");

    let targets = new("tt_KnownTargets").init();
    _knownTargetSource.expect_getTargets(targets);

    let origin = _matcher.getOrigin();

    It("Zero known targets -> NULL origin", AssertNull(origin));

    tearDown();
  }

  private
  void checkNullKnownTarget()
  {
    setUp("Checking Question-Answer Matcher: null known target");

    let targets = new("tt_KnownTargets").init();
    targets.add(NULL);
    _knownTargetSource.expect_getTargets(targets);
    _answerSource.expect_getAnswer(NULL);

    let origin = _matcher.getOrigin();

    It("NULL known target -> NULL origin", AssertNull(origin));

    tearDown();
  }

  private
  void checkNullAnswer()
  {
    setUp("Checking Question-Answer Matcher: null answer");

    let knownTargets = new("tt_KnownTargets").init();
    let target       = new("tt_TargetMock").init();
    let question     = new("tt_QuestionMock").init();
    let knownTarget  = new("tt_KnownTarget").init(target, question);
    knownTargets.add(knownTarget);
    _knownTargetSource.expect_getTargets(knownTargets);
    _answerSource.expect_getAnswer(NULL);

    let origin = _matcher.getOrigin();

    It("NULL answer -> NULL origin", AssertNull(origin));

    tearDown();
  }

  private
  void checkKnownTargetAndAnswerMatch()
  {
    setUp("Checking Question-Answer Matcher: target and answer match");

    let knownTargets = new("tt_KnownTargets").init();
    let target       = new("tt_TargetMock").init();
    let question     = new("tt_QuestionMock").init();
    let knownTarget  = new("tt_KnownTarget").init(target, question);
    knownTargets.add(knownTarget);
    _knownTargetSource.expect_getTargets(knownTargets);
    question.expect_isRight(true);
    target.expect_getPosition((0, 0, 0));

    let answer = new("tt_Answer").init("abc");
    _answerSource.expect_getAnswer(answer);
    _answerSource.expect_reset();

    let origin = _matcher.getOrigin();

    It("Target is satisfied"   , Assert(target.isSatisfied_getPosition()));
    It("Question is satisfied" , Assert(question.isSatisfied_isRight()));
    It("Match: valid origin"   , AssertNotNull(origin));

    tearDown();
  }

  private
  void checkKnownTargetAndAnswerNoMatch()
  {
    setUp("Checking Question-Answer Matcher: no target and answer match");

    let knownTargets = new("tt_KnownTargets").init();
    let target       = new("tt_TargetMock").init();
    let question     = new("tt_QuestionMock").init();
    let knownTarget  = new("tt_KnownTarget").init(target, question);
    knownTargets.add(knownTarget);
    _knownTargetSource.expect_getTargets(knownTargets);
    question.expect_isRight(false);

    let answer = new("tt_Answer").init("abc");
    _answerSource.expect_getAnswer(answer);

    let origin = _matcher.getOrigin();

    It("Target is satisfied"   , Assert(target.isSatisfied_getPosition()));
    It("Question is satisfied" , Assert(question.isSatisfied_isRight()));
    It("No match: NULL origin" , AssertNull(origin));

    tearDown();
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void setUp(String description)
  {
    Describe(description);

    _knownTargetSource = new("tt_KnownTargetSourceMock").init();
    _answerSource      = new("tt_AnswerSourceMock").init();
    _matcher           = new("tt_QuestionAnswerMatcher").init(_knownTargetSource, _answerSource);
  }

  private
  void tearDown()
  {
    It("Known Target Source is satisfied" , Assert(_knownTargetSource.isSatisfied_getTargets()));
    It("Answer Source is satisfied"       , Assert(_answerSource.isSatisfied_getAnswer()));
    It("Answer Source is satisfied"       , Assert(_answerSource.isSatisfied_reset()));

    EndDescribe();
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_KnownTargetSourceMock _knownTargetSource;
  private tt_AnswerSourceMock      _answerSource;
  private tt_QuestionAnswerMatcher _matcher;

} // class tt_QuestionAnswerMatcherTest
