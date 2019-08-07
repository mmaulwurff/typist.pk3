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
class tt_DynamicTest
{

// private: ////////////////////////////////////////////////////////////////////

  private play
  void testQuestionAnswerDamager() const
  {
    Describe("Checking Question Answer Damager");

    let knownTargetSource = new("tt_KnownTargetSourceMock").init();
    let answerSource      = new("tt_AnswerSourceMock").init();
    let damager = new("tt_QuestionAnswerDamager").init(knownTargetSource, answerSource);

    let answer = new("tt_Answer").init("abc");
    answerSource.expect_getAnswer(answer);

    let a            = Actor.Spawn("ZombieMan", (0, 100, 0));
    let target       = new("tt_ActorTarget").init(a);
    let question     = new("tt_QuestionMock").init();
    let knownTarget  = new("tt_KnownTarget").init(target, question);
    let knownTargets = new("tt_KnownTargets").init();
    knownTargets.add(knownTarget);
    knownTargetSource.expect_getTargets(knownTargets);
    question.expect_IsRight(true);

    damager.damage();

    It("Answer source is satisfied", Assert(answerSource.isSatisfied_getAnswer()));
    It("KnownTargetSource is satisfied", Assert(knownTargetSource.isSatisfied_getTargets()));

    // Damaging happens in the next tick.
    //It("Target is dead", AssertEval(a.Health, "<", 0));

    EndDescribe();
  }

} // class tt_DynamicTest
