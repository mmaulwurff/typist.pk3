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

    _targetSource.expect_getTargets(NULL);

    let origin = _matcher.getOrigin();

    It("NULL known targets -> NULL origin", AssertNull(origin));

    tearDown();
  }

  private
  void checkZeroKnownTargets()
  {
    setUp("Checking Question-Answer Matcher: zero known targets");

    let targets = tt_KnownTargets.of();
    _targetSource.expect_getTargets(targets);

    let origin = _matcher.getOrigin();

    It("Zero known targets -> NULL origin", AssertNull(origin));

    tearDown();
  }

  private
  void checkNullKnownTarget()
  {
    setUp("Checking Question-Answer Matcher: null known target");

    let targets = tt_KnownTargets.of();
    targets.add(NULL);
    _targetSource.expect_getTargets(targets);
    _answerSource.expect_getAnswer(NULL);

    let origin = _matcher.getOrigin();

    It("NULL known target -> NULL origin", AssertNull(origin));

    tearDown();
  }

  private
  void checkNullAnswer()
  {
    setUp("Checking Question-Answer Matcher: null answer");

    let knownTargets = tt_KnownTargets.of();
    let target       = tt_Target.of(NULL);
    let question     = tt_QuestionMock.of();
    let knownTarget  = tt_KnownTarget.of(target, question);
    knownTargets.add(knownTarget);
    _targetSource.expect_getTargets(knownTargets);
    _answerSource.expect_getAnswer(NULL);

    let origin = _matcher.getOrigin();

    It("NULL answer -> NULL origin", AssertNull(origin));

    tearDown();
  }

  private
  void checkKnownTargetAndAnswerMatch()
  {
    setUp("Checking Question-Answer Matcher: target and answer match");

    let knownTargets = tt_KnownTargets.of();
    let target       = tt_Target.of(Spawn("Demon", (0, 0, 0)));
    let question     = tt_QuestionMock.of();
    let knownTarget  = tt_KnownTarget.of(target, question);
    knownTargets.add(knownTarget);
    _targetSource.expect_getTargets(knownTargets);
    question.expect_isRight(true);

    let answer = tt_Answer.of("abc");
    _answerSource.expect_getAnswer(answer);
    _stateSource.expect_getAnswerState(tt_AnswerState.of(tt_AnswerState.Ready));
    _playerSource.expect_getPawn(players[consolePlayer].mo);

    let origin = _matcher.getOrigin();

    It("Question is satisfied" , Assert(question.isSatisfied_isRight()));
    It("Match: valid origin"   , AssertNotNull(origin));

    tearDown();
  }

  private
  void checkKnownTargetAndAnswerNoMatch()
  {
    setUp("Checking Question-Answer Matcher: no target and answer match");

    let knownTargets = tt_KnownTargets.of();
    let target       = tt_Target.of(NULL);
    let question     = tt_QuestionMock.of();
    let knownTarget  = tt_KnownTarget.of(target, question);
    knownTargets.add(knownTarget);
    _targetSource.expect_getTargets(knownTargets);
    question.expect_isRight(false);

    let answer = tt_Answer.of("abc");
    _answerSource.expect_getAnswer(answer);
    _stateSource.expect_getAnswerState(tt_AnswerState.of(tt_AnswerState.Ready));
    _playerSource.expect_getPawn(players[consolePlayer].mo);

    let origin = _matcher.getOrigin();

    It("Question is satisfied" , Assert(question.isSatisfied_isRight()));
    It("No match: NULL origin" , AssertNull(origin));

    tearDown();
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void setUp(String description)
  {
    Describe(description);

    _targetSource = tt_KnownTargetSourceMock.of();
    _answerSource = tt_AnswerSourceMock.of();
    _playerSource = tt_PlayerSourceMock.of();
    _stateSource  = tt_AnswerStateSourceMock.of();

    _matcher = tt_QuestionAnswerMatcher.of( _targetSource
                                          , _answerSource
                                          , _playerSource
                                          , _stateSource
                                          );
  }

  private
  void tearDown()
  {
    It("Known Target Source is satisfied" , Assert(_targetSource.isSatisfied_getTargets    ()));
    It("Answer Source is satisfied"       , Assert(_answerSource.isSatisfied_getAnswer     ()));
    It("Answer Source is satisfied"       , Assert(_answerSource.isSatisfied_reset         ()));
    It("Answer State Source is satisfied" , Assert(_stateSource .isSatisfied_getAnswerState()));
    It("Answer State Source is satisfied" , Assert(_stateSource .isSatisfied_reset         ()));
    It("Player Source is satisfied"       , Assert(_playerSource.isSatisfied_getPawn       ()));

    EndDescribe();
  }

  private tt_KnownTargetSourceMock _targetSource;
  private tt_AnswerSourceMock      _answerSource;
  private tt_PlayerSourceMock      _playerSource;
  private tt_QuestionAnswerMatcher _matcher;
  private tt_AnswerStateSourceMock _stateSource;

} // class tt_QuestionAnswerMatcherTest
