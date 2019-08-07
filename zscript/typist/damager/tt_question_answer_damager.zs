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

/** This class implements tt_Damager by looking up a target that corresponds
 * to an answer and damaging it.
 */
class tt_QuestionAnswerDamager : tt_Damager
{

// public: /////////////////////////////////////////////////////////////////////

  tt_QuestionAnswerDamager init( tt_KnownTargetSource knownTargetSource
                               , tt_AnswerSource      answerSource
                               )
  {
    _knownTargetSource = knownTargetSource;
    _answerSource      = answerSource;

    return self;
  }

// public: // tt_Damager ///////////////////////////////////////////////////////

  override
  void damage()
  {
    let  targets  = _knownTargetSource.getTargets();
    uint nTargets = targets.size();
    let  answer   = _answerSource.getAnswer();

    for (uint i = 0; i < nTargets; ++i)
    {
      let target   = targets.at(i);
      let question = target.question();

      if (question.isRight(answer))
      {
        applyDamageTo(target);
        _answerSource.reset();
        return;
      }
    }
  }

// private: ////////////////////////////////////////////////////////////////////

  private play
  void applyDamageTo(tt_KnownTarget knownTarget)
  {
    // quick and dirty
    let position = knownTarget.target().position();
    let barrel   = Actor.Spawn("ExplosiveBarrel", position);

    barrel.A_Die();
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_KnownTargetSource _knownTargetSource;
  private tt_AnswerSource      _answerSource;

} // class tt_QuestionAnswerDamager
