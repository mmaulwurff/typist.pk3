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
 * This class implements OriginSource by finding an origin for a known target
 * that fits to for the answer.
 */
class tt_QuestionAnswerMatcher : tt_OriginSource
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_QuestionAnswerMatcher of( tt_KnownTargetSource knownTargetSource
                             , tt_AnswerSource      answerSource
                             , tt_PlayerSource      playerSource
                             , tt_AnswerStateSource answerStateSource
                             , tt_AnswerReporter    reporter
                             )
  {
    let result = new("tt_QuestionAnswerMatcher"); // construct

    result._knownTargetSource = knownTargetSource;
    result._answerSource      = answerSource;
    result._playerSource      = playerSource;
    result._answerStateSource = answerStateSource;
    result._reporter          = reporter;

    return result;
  }

// public: // tt_OriginSource //////////////////////////////////////////////////

  override
  tt_Origin getOrigin()
  {
    let targets = _knownTargetSource.getTargets();
    if (targets == NULL || targets.size() == 0) { return NULL; }

    let answer = _answerSource.getAnswer();
    if (answer == NULL) { return NULL; }

    let answerState = _answerStateSource.getAnswerState();
    if (!answerState.isReady()) { return NULL; }

    let pawn = _playerSource.getPawn();

    if (!answerState.isFinished())
    {
      _isNotMatchReported = false;
    }

    uint nTargets = targets.size();
    for (uint i = 0; i < nTargets; ++i)
    {
      let target   = targets.at(i);
      let question = target.getQuestion();

      bool isRight = question.isRight(answer);
      if (!isRight) { continue; }

      bool isVisible = isVisible(target, pawn);
      if (!isVisible) { continue; }

      _reporter.reportMatch();
      resetAnswer();

      let result = target.getTarget().getPosition();
      return result;
    }

    if (answerState.isFinished())
    {
      reportNotMatch();
      resetAnswer();
    }

    return NULL;
  }

// private: ////////////////////////////////////////////////////////////////////

  private play
  bool isVisible(tt_KnownTarget target, PlayerPawn pawn) const
  {
    let  targetActor = target.getTarget().getActor();
    bool visible     = pawn.IsVisible(targetActor, ALL_AROUND);

    return visible;
  }

  private
  void reportNotMatch()
  {
    if (!_isNotMatchReported)
    {
      _reporter.reportNotMatch();
      _isNotMatchReported = true;
    }
  }

  private
  void resetAnswer()
  {
    _answerSource.reset();
  }

// private: ////////////////////////////////////////////////////////////////////

  const ALL_AROUND = 1; // true

  private tt_KnownTargetSource _knownTargetSource;
  private tt_AnswerSource      _answerSource;
  private tt_PlayerSource      _playerSource;
  private tt_AnswerStateSource _answerStateSource;
  private tt_AnswerReporter    _reporter;

  private bool _isNotMatchReported;

} // class tt_QuestionAnswerMatcher
