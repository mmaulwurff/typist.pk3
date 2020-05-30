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

/** This is a test for CommandDispatcher.
 */
class tt_CommandDispatcherTest : tt_Clematis
{

// public: // tt_Clematis //////////////////////////////////////////////////////

  override
  void TestSuites()
  {
    Describe("Checking Command Dispatcher");

    checkActivate();
    checkGetCommands();

    EndDescribe();
  }

// private: ////////////////////////////////////////////////////////////////////

  private play
  void checkActivate() const
  {
    let activatable1      = tt_ActivatableMock.of();
    let activatable2      = tt_ActivatableMock.of();
    Array<tt_Activatable> activatables;
    activatables.Push(activatable1);
    activatables.Push(activatable2);
    let answerSource      = tt_AnswerSourceMock     .of();
    let settings          = tt_CommandSettingsMock  .of();
    let answerReporter    = tt_AnswerReporterMock   .of();
    let answerStateSource = tt_AnswerStateSourceMock.of();
    let globalSettings    = tt_SettingsMock         .of();
    let commandDispatcher = tt_CommandDispatcher.of( answerSource
                                                   , activatables
                                                   , settings
                                                   , answerReporter
                                                   , answerStateSource
                                                   , globalSettings
                                                   );

    let str    = "Hello";
    let answer = tt_Answer.of(str);
    answerSource.expect_getAnswer(answer);

    let commands1 = tt_Strings.of();
    let commands2 = tt_Strings.of();
    commands2.add(str);
    activatable1.expect_getCommands(commands1);
    activatable2.expect_getCommands(commands2);
    activatable2.expect_activate();
    answerReporter.expect_reportMatch();
    answerStateSource.expect_getAnswerState(tt_AnswerState.of(tt_AnswerState.Ready));

    commandDispatcher.activate();

    It("Answer Source is satisfied",          Assert(answerSource.isSatisfied_getAnswer()));
    It("The first activatable is satisfied",  Assert(activatable1.isSatisfied_activate()));
    It("The first activatable is satisfied",  Assert(activatable1.isSatisfied_getCommands()));
    It("The second activatable is satisfied", Assert(activatable2.isSatisfied_activate()));
    It("The second activatable is satisfied", Assert(activatable2.isSatisfied_getCommands()));

    It("Event reporter is satisfied", Assert(answerReporter.isSatisfied_reportMatch()));
  }

  private play
  void checkGetCommands() const
  {
    let activatable1      = tt_ActivatableMock.of();
    let activatable2      = tt_ActivatableMock.of();
    Array<tt_Activatable> activatables;
    activatables.Push(activatable1);
    activatables.Push(activatable2);
    let answerSource      = tt_AnswerSourceMock     .of();
    let settings          = tt_CommandSettingsMock  .of();
    let answerReporter    = tt_AnswerReporterMock   .of();
    let answerStateSource = tt_AnswerStateSourceMock.of();
    let globalSettings    = tt_SettingsMock         .of();
    let commandDispatcher = tt_CommandDispatcher.of( answerSource
                                                   , activatables
                                                   , settings
                                                   , answerReporter
                                                   , answerStateSource
                                                   , globalSettings
                                                   );

    let commands1 = tt_Strings.of();
    let commands2 = tt_Strings.of();
    commands1.add("1");
    commands1.add("2");
    commands2.add("3");
    commands2.add("4");
    activatable1.expect_getCommands(commands1);
    activatable2.expect_getCommands(commands2);
    activatable1.expect_isVisible(true);
    activatable2.expect_isVisible(true);
    answerStateSource.expect_getAnswerState(tt_AnswerState.of(tt_AnswerState.Ready));

    let allCommands = commandDispatcher.getCommands();
    let size        = allCommands.size();

    It("All commands are collected",      AssertEval(size, "==", 4));
    It("The first command is collected",  Assert(allCommands.contains("1")));
    It("The second command is collected", Assert(allCommands.contains("2")));
    It("The third command is collected",  Assert(allCommands.contains("3")));
    It("The forth command is collected",  Assert(allCommands.contains("4")));

    It("Answer Source is satisfied",          Assert(answerSource.isSatisfied_getAnswer()));
    It("The first activatable is satisfied",  Assert(activatable1.isSatisfied_activate()));
    It("The first activatable is satisfied",  Assert(activatable1.isSatisfied_getCommands()));
    It("The second activatable is satisfied", Assert(activatable2.isSatisfied_activate()));
    It("The second activatable is satisfied", Assert(activatable2.isSatisfied_getCommands()));

    It("Event reporter is satisfied", Assert(answerReporter.isSatisfied_reportMatch()));
  }

} // class tt_CommandDispatcherTest
