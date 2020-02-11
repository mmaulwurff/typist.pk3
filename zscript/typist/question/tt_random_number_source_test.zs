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

class tt_RandomNumberSourceTest : tt_Clematis
{

// public: /////////////////////////////////////////////////////////////////////

  override
  void TestSuites()
  {
    Describe("Checking Random Number Source");

    let difficultySource = new("tt_DifficultySourceMock").init();
    let questionSource   = new("tt_RandomNumberSource").init(difficultySource);

    int stringLength     = 3;
    let difficulty       = new("tt_Difficulty").init(stringLength);
    difficultySource.expect_getDifficulty(difficulty);

    let question    = questionSource.getQuestion();
    let description = question.getDescription();
    Console.Printf("zscript/typist/question/tt_random_number_source_test.zs:37: T: Question: %s",
                   description);

    let wrongString = "aaa";
    let wrongAnswer = new("tt_Answer").init(wrongString);

    It("Number must be not equal to letters", AssertFalse(question.isRight(wrongAnswer)));
    It("Question must be of required length", AssertEval(description.length(), "==", stringLength));
    It("Difficulty Source is satisfied", Assert(difficultySource.isSatisfied_getDifficulty()));

    EndDescribe();
  }

} // class tt_RandomNumberSourceTest
