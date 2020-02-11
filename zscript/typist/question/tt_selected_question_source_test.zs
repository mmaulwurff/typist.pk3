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
 * This is a test for tt_SelectedQuestionSource class.
 */
class tt_SelectedQuestionSourceTest : tt_Clematis
{

// public: /////////////////////////////////////////////////////////////////////

  override
  void TestSuites()
  {
    Describe("Checking selected question source");

    checkEmpty();
    checkTwo();

    EndDescribe();
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void checkEmpty()
  {
    let settings               = new("tt_SettingsMock"          ).init();
    let selectedQuestionSource = new("tt_SelectedQuestionSource").init(settings);

    settings.expect_getQuestionSourceIndex(0);

    let question = selectedQuestionSource.getQuestion();

    It("Settings is satisfied", Assert(settings.isSatisfied_getQuestionSourceIndex()));
    It("No sources -> NULL question", AssertNull(question));
  }

  private
  void checkTwo()
  {
    let settings               = new("tt_SettingsMock"          ).init();
    let selectedQuestionSource = new("tt_SelectedQuestionSource").init(settings);
    let questionSource1        = new("tt_QuestionSourceMock"    ).init();
    let questionSource2        = new("tt_QuestionSourceMock"    ).init();

    selectedQuestionSource.add(questionSource1);
    selectedQuestionSource.add(questionSource2);

    let mockQuestion = new("tt_QuestionMock").init();
    questionSource2.expect_getQuestion(mockQuestion);
    settings       .expect_getQuestionSourceIndex(1);

    let question = selectedQuestionSource.getQuestion();

    It("Settings is satisfied", Assert(settings.isSatisfied_getQuestionSourceIndex()));
    It("Question source is satisfied", Assert(questionSource2.isSatisfied_getQuestion()));
    It("There are sources -> not NULL question", Assert(question == mockQuestion));
  }

} // class tt_SelectedQuestionSourceTest
