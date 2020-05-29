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
class tt_HastyQuestionAnswerMatcher : tt_OriginSource
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_HastyQuestionAnswerMatcher of( tt_KnownTargetSource knownTargetSource
                                  , tt_AnswerSource      answerSource
                                  , tt_PlayerSource      playerSource
                                  , tt_AnswerReporter    reporter
                                  )
  {
    let result = new("tt_HastyQuestionAnswerMatcher"); // construct

    result._knownTargetSource = knownTargetSource;
    result._answerSource      = answerSource;
    result._playerSource      = playerSource;
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

    let pawn   = _playerSource.getPawn();
    let result = findMatchedTarget(targets, answer, pawn);

    if (result != NULL)
    {
      _reporter.reportMatch();
      _answerSource.reset();
    }

    return result;
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  tt_Origin findMatchedTarget(tt_KnownTargets targets, tt_Answer answer, Actor pawn)
  {
    uint nTargets = targets.size();
    for (uint i = 0; i < nTargets; ++i)
    {
      let target   = targets.at(i);
      let question = target.getQuestion();

      if (!question.isRight(answer) || !isVisible(target, pawn))
      {
        continue;
      }

      let result = target.getTarget().getPosition();
      return result;
    }

    return NULL;
  }

  private play
  bool isVisible(tt_KnownTarget target, Actor pawn) const
  {
    let  targetActor = target.getTarget().getActor();
    bool visible     = pawn.IsVisible(targetActor, ALL_AROUND);

    return visible;
  }

  const ALL_AROUND = 1; // true

  private tt_KnownTargetSource _knownTargetSource;
  private tt_AnswerSource      _answerSource;
  private tt_PlayerSource      _playerSource;
  private tt_AnswerReporter    _reporter;

} // class tt_QuestionAnswerMatcher
