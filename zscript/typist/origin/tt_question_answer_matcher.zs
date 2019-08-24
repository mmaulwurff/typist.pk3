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

/** This class implements OriginSource by finding an origin for a known target
 * that fits to for the answer.
 */
class tt_QuestionAnswerMatcher : tt_OriginSource
{

// public: /////////////////////////////////////////////////////////////////////

  tt_QuestionAnswerMatcher init( tt_KnownTargetSource knownTargetSource
                               , tt_AnswerSource      answerSource
                               )
  {
    _knownTargetSource = knownTargetSource;
    _answerSource      = answerSource;
    _origin            = NULL;

    return self;
  }

// public: // tt_OriginSource //////////////////////////////////////////////////

  override
  tt_Origin getOrigin()
  {
    return _origin;
  }

  override
  void update()
  {
    _origin = getUpdatedOrigin();
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  tt_Origin getUpdatedOrigin()
  {
    let targets = _knownTargetSource.getTargets();
    if (targets == NULL || targets.size() == 0) { return NULL; }

    let answer = _answerSource.getAnswer();
    if (answer == NULL) { return NULL; }

    uint nTargets = targets.size();
    for (uint i = 0; i < nTargets; ++i)
    {
      let  target   = targets.at(i);
      let  question = target.getQuestion();
      bool isRight  = question.isRight(answer);

      if (isRight)
      {
        let result = new("tt_Origin").init(target.getTarget().getPosition());
        _answerSource.reset();
        return result;
      }
    }

    return NULL;
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_KnownTargetSource _knownTargetSource;
  private tt_AnswerSource      _answerSource;
  private tt_Origin            _origin;

} // class tt_QuestionAnswerMatcher