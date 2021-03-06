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
 *
 * This class searches far matching target only if answer state is Ready.
 */
class tt_QuestionAnswerMatcher : tt_OriginSource
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_QuestionAnswerMatcher of( tt_KnownTargetSource knownTargetSource
                             , tt_AnswerSource      answerSource
                             , tt_PlayerSource      playerSource
                             , tt_AnswerStateSource answerStateSource
                             )
  {
    let result = new("tt_QuestionAnswerMatcher"); // construct

    result._knownTargetSource = knownTargetSource;
    result._answerSource      = answerSource;
    result._playerSource      = playerSource;
    result._answerStateSource = answerStateSource;

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

    let pawn   = _playerSource.getPawn();
    let result = findMatchedTarget(targets, answer, pawn);

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
  private tt_AnswerStateSource _answerStateSource;

} // class tt_QuestionAnswerMatcher
