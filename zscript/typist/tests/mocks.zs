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

// This file is generated by ./scripts/make_mocks.py.
// Do not edit it by hand, your changes will be overwritten!

class tt_InputManagerMock : tt_InputManager
{

  static tt_InputManagerMock of() { return new("tt_InputManagerMock"); } // construct

  override
  void manageInput()
  {
    ++_mock_manageInput_called;
  }

  void expect_manageInput(int expected = 1)
  {
    _mock_manageInput_expected = expected;
    _mock_manageInput_called = 0;
  }

  bool isSatisfied_manageInput() const
  {
    return _mock_manageInput_expected == _mock_manageInput_called;
  }

  private int _mock_manageInput_expected;
  private int _mock_manageInput_called;

  override
  bool isCapturingKeys()
  {
    ++_mock_isCapturingKeys_called;
    return _mock_isCapturingKeys;
  }

  void expect_isCapturingKeys(bool value, int expected = 1)
  {
    _mock_isCapturingKeys = value;
    _mock_isCapturingKeys_expected = expected;
    _mock_isCapturingKeys_called = 0;
  }

  bool isSatisfied_isCapturingKeys() const
  {
    return _mock_isCapturingKeys_expected == _mock_isCapturingKeys_called;
  }

  private bool _mock_isCapturingKeys;
  private int _mock_isCapturingKeys_expected;
  private int _mock_isCapturingKeys_called;

} // class tt_InputManagerMock

class tt_RandomCharactersLessonSettingsMock : tt_RandomCharactersLessonSettings
{

  static tt_RandomCharactersLessonSettingsMock of() { return new("tt_RandomCharactersLessonSettingsMock"); } // construct

  override
  int getLessonLength()
  {
    ++_mock_getLessonLength_called;
    return _mock_getLessonLength;
  }

  void expect_getLessonLength(int value, int expected = 1)
  {
    _mock_getLessonLength = value;
    _mock_getLessonLength_expected = expected;
    _mock_getLessonLength_called = 0;
  }

  bool isSatisfied_getLessonLength() const
  {
    return _mock_getLessonLength_expected == _mock_getLessonLength_called;
  }

  private int _mock_getLessonLength;
  private int _mock_getLessonLength_expected;
  private int _mock_getLessonLength_called;

  override
  bool isUppercaseLettersEnabled()
  {
    ++_mock_isUppercaseLettersEnabled_called;
    return _mock_isUppercaseLettersEnabled;
  }

  void expect_isUppercaseLettersEnabled(bool value, int expected = 1)
  {
    _mock_isUppercaseLettersEnabled = value;
    _mock_isUppercaseLettersEnabled_expected = expected;
    _mock_isUppercaseLettersEnabled_called = 0;
  }

  bool isSatisfied_isUppercaseLettersEnabled() const
  {
    return _mock_isUppercaseLettersEnabled_expected == _mock_isUppercaseLettersEnabled_called;
  }

  private bool _mock_isUppercaseLettersEnabled;
  private int _mock_isUppercaseLettersEnabled_expected;
  private int _mock_isUppercaseLettersEnabled_called;

  override
  bool isLowercaseLettersEnabled()
  {
    ++_mock_isLowercaseLettersEnabled_called;
    return _mock_isLowercaseLettersEnabled;
  }

  void expect_isLowercaseLettersEnabled(bool value, int expected = 1)
  {
    _mock_isLowercaseLettersEnabled = value;
    _mock_isLowercaseLettersEnabled_expected = expected;
    _mock_isLowercaseLettersEnabled_called = 0;
  }

  bool isSatisfied_isLowercaseLettersEnabled() const
  {
    return _mock_isLowercaseLettersEnabled_expected == _mock_isLowercaseLettersEnabled_called;
  }

  private bool _mock_isLowercaseLettersEnabled;
  private int _mock_isLowercaseLettersEnabled_expected;
  private int _mock_isLowercaseLettersEnabled_called;

  override
  bool isNumbersEnabled()
  {
    ++_mock_isNumbersEnabled_called;
    return _mock_isNumbersEnabled;
  }

  void expect_isNumbersEnabled(bool value, int expected = 1)
  {
    _mock_isNumbersEnabled = value;
    _mock_isNumbersEnabled_expected = expected;
    _mock_isNumbersEnabled_called = 0;
  }

  bool isSatisfied_isNumbersEnabled() const
  {
    return _mock_isNumbersEnabled_expected == _mock_isNumbersEnabled_called;
  }

  private bool _mock_isNumbersEnabled;
  private int _mock_isNumbersEnabled_expected;
  private int _mock_isNumbersEnabled_called;

  override
  bool isPunctuationEnabled()
  {
    ++_mock_isPunctuationEnabled_called;
    return _mock_isPunctuationEnabled;
  }

  void expect_isPunctuationEnabled(bool value, int expected = 1)
  {
    _mock_isPunctuationEnabled = value;
    _mock_isPunctuationEnabled_expected = expected;
    _mock_isPunctuationEnabled_called = 0;
  }

  bool isSatisfied_isPunctuationEnabled() const
  {
    return _mock_isPunctuationEnabled_expected == _mock_isPunctuationEnabled_called;
  }

  private bool _mock_isPunctuationEnabled;
  private int _mock_isPunctuationEnabled_expected;
  private int _mock_isPunctuationEnabled_called;

  override
  bool isSymbolsEnabled()
  {
    ++_mock_isSymbolsEnabled_called;
    return _mock_isSymbolsEnabled;
  }

  void expect_isSymbolsEnabled(bool value, int expected = 1)
  {
    _mock_isSymbolsEnabled = value;
    _mock_isSymbolsEnabled_expected = expected;
    _mock_isSymbolsEnabled_called = 0;
  }

  bool isSatisfied_isSymbolsEnabled() const
  {
    return _mock_isSymbolsEnabled_expected == _mock_isSymbolsEnabled_called;
  }

  private bool _mock_isSymbolsEnabled;
  private int _mock_isSymbolsEnabled_expected;
  private int _mock_isSymbolsEnabled_called;

  override
  bool isCustomCharactersEnabled()
  {
    ++_mock_isCustomCharactersEnabled_called;
    return _mock_isCustomCharactersEnabled;
  }

  void expect_isCustomCharactersEnabled(bool value, int expected = 1)
  {
    _mock_isCustomCharactersEnabled = value;
    _mock_isCustomCharactersEnabled_expected = expected;
    _mock_isCustomCharactersEnabled_called = 0;
  }

  bool isSatisfied_isCustomCharactersEnabled() const
  {
    return _mock_isCustomCharactersEnabled_expected == _mock_isCustomCharactersEnabled_called;
  }

  private bool _mock_isCustomCharactersEnabled;
  private int _mock_isCustomCharactersEnabled_expected;
  private int _mock_isCustomCharactersEnabled_called;

  override
  String getCustomCharacters()
  {
    ++_mock_getCustomCharacters_called;
    return _mock_getCustomCharacters;
  }

  void expect_getCustomCharacters(String value, int expected = 1)
  {
    _mock_getCustomCharacters = value;
    _mock_getCustomCharacters_expected = expected;
    _mock_getCustomCharacters_called = 0;
  }

  bool isSatisfied_getCustomCharacters() const
  {
    return _mock_getCustomCharacters_expected == _mock_getCustomCharacters_called;
  }

  private String _mock_getCustomCharacters;
  private int _mock_getCustomCharacters_expected;
  private int _mock_getCustomCharacters_called;

} // class tt_RandomCharactersLessonSettingsMock

class tt_CommandSettingsMock : tt_CommandSettings
{

  static tt_CommandSettingsMock of() { return new("tt_CommandSettingsMock"); } // construct

  override
  String getForwardDashCommand()
  {
    ++_mock_getForwardDashCommand_called;
    return _mock_getForwardDashCommand;
  }

  void expect_getForwardDashCommand(String value, int expected = 1)
  {
    _mock_getForwardDashCommand = value;
    _mock_getForwardDashCommand_expected = expected;
    _mock_getForwardDashCommand_called = 0;
  }

  bool isSatisfied_getForwardDashCommand() const
  {
    return _mock_getForwardDashCommand_expected == _mock_getForwardDashCommand_called;
  }

  private String _mock_getForwardDashCommand;
  private int _mock_getForwardDashCommand_expected;
  private int _mock_getForwardDashCommand_called;

  override
  String getBackwardDashCommand()
  {
    ++_mock_getBackwardDashCommand_called;
    return _mock_getBackwardDashCommand;
  }

  void expect_getBackwardDashCommand(String value, int expected = 1)
  {
    _mock_getBackwardDashCommand = value;
    _mock_getBackwardDashCommand_expected = expected;
    _mock_getBackwardDashCommand_called = 0;
  }

  bool isSatisfied_getBackwardDashCommand() const
  {
    return _mock_getBackwardDashCommand_expected == _mock_getBackwardDashCommand_called;
  }

  private String _mock_getBackwardDashCommand;
  private int _mock_getBackwardDashCommand_expected;
  private int _mock_getBackwardDashCommand_called;

  override
  String getLeftDashCommand()
  {
    ++_mock_getLeftDashCommand_called;
    return _mock_getLeftDashCommand;
  }

  void expect_getLeftDashCommand(String value, int expected = 1)
  {
    _mock_getLeftDashCommand = value;
    _mock_getLeftDashCommand_expected = expected;
    _mock_getLeftDashCommand_called = 0;
  }

  bool isSatisfied_getLeftDashCommand() const
  {
    return _mock_getLeftDashCommand_expected == _mock_getLeftDashCommand_called;
  }

  private String _mock_getLeftDashCommand;
  private int _mock_getLeftDashCommand_expected;
  private int _mock_getLeftDashCommand_called;

  override
  String getRightDashCommand()
  {
    ++_mock_getRightDashCommand_called;
    return _mock_getRightDashCommand;
  }

  void expect_getRightDashCommand(String value, int expected = 1)
  {
    _mock_getRightDashCommand = value;
    _mock_getRightDashCommand_expected = expected;
    _mock_getRightDashCommand_called = 0;
  }

  bool isSatisfied_getRightDashCommand() const
  {
    return _mock_getRightDashCommand_expected == _mock_getRightDashCommand_called;
  }

  private String _mock_getRightDashCommand;
  private int _mock_getRightDashCommand_expected;
  private int _mock_getRightDashCommand_called;

  override
  String getReloadCommand()
  {
    ++_mock_getReloadCommand_called;
    return _mock_getReloadCommand;
  }

  void expect_getReloadCommand(String value, int expected = 1)
  {
    _mock_getReloadCommand = value;
    _mock_getReloadCommand_expected = expected;
    _mock_getReloadCommand_called = 0;
  }

  bool isSatisfied_getReloadCommand() const
  {
    return _mock_getReloadCommand_expected == _mock_getReloadCommand_called;
  }

  private String _mock_getReloadCommand;
  private int _mock_getReloadCommand_expected;
  private int _mock_getReloadCommand_called;

  override
  String getCommandPrefix()
  {
    ++_mock_getCommandPrefix_called;
    return _mock_getCommandPrefix;
  }

  void expect_getCommandPrefix(String value, int expected = 1)
  {
    _mock_getCommandPrefix = value;
    _mock_getCommandPrefix_expected = expected;
    _mock_getCommandPrefix_called = 0;
  }

  bool isSatisfied_getCommandPrefix() const
  {
    return _mock_getCommandPrefix_expected == _mock_getCommandPrefix_called;
  }

  private String _mock_getCommandPrefix;
  private int _mock_getCommandPrefix_expected;
  private int _mock_getCommandPrefix_called;

} // class tt_CommandSettingsMock

class tt_SoundSettingsMock : tt_SoundSettings
{

  static tt_SoundSettingsMock of() { return new("tt_SoundSettingsMock"); } // construct

  override
  bool isEnabled()
  {
    ++_mock_isEnabled_called;
    return _mock_isEnabled;
  }

  void expect_isEnabled(bool value, int expected = 1)
  {
    _mock_isEnabled = value;
    _mock_isEnabled_expected = expected;
    _mock_isEnabled_called = 0;
  }

  bool isSatisfied_isEnabled() const
  {
    return _mock_isEnabled_expected == _mock_isEnabled_called;
  }

  private bool _mock_isEnabled;
  private int _mock_isEnabled_expected;
  private int _mock_isEnabled_called;

  override
  bool isTypingEnabled()
  {
    ++_mock_isTypingEnabled_called;
    return _mock_isTypingEnabled;
  }

  void expect_isTypingEnabled(bool value, int expected = 1)
  {
    _mock_isTypingEnabled = value;
    _mock_isTypingEnabled_expected = expected;
    _mock_isTypingEnabled_called = 0;
  }

  bool isSatisfied_isTypingEnabled() const
  {
    return _mock_isTypingEnabled_expected == _mock_isTypingEnabled_called;
  }

  private bool _mock_isTypingEnabled;
  private int _mock_isTypingEnabled_expected;
  private int _mock_isTypingEnabled_called;

  override
  int getTheme()
  {
    ++_mock_getTheme_called;
    return _mock_getTheme;
  }

  void expect_getTheme(int value, int expected = 1)
  {
    _mock_getTheme = value;
    _mock_getTheme_expected = expected;
    _mock_getTheme_called = 0;
  }

  bool isSatisfied_getTheme() const
  {
    return _mock_getTheme_expected == _mock_getTheme_called;
  }

  private int _mock_getTheme;
  private int _mock_getTheme_expected;
  private int _mock_getTheme_called;

} // class tt_SoundSettingsMock

class tt_SettingsMock : tt_Settings
{

  static tt_SettingsMock of() { return new("tt_SettingsMock"); } // construct

  override
  int getScale()
  {
    ++_mock_getScale_called;
    return _mock_getScale;
  }

  void expect_getScale(int value, int expected = 1)
  {
    _mock_getScale = value;
    _mock_getScale_expected = expected;
    _mock_getScale_called = 0;
  }

  bool isSatisfied_getScale() const
  {
    return _mock_getScale_expected == _mock_getScale_called;
  }

  private int _mock_getScale;
  private int _mock_getScale_expected;
  private int _mock_getScale_called;

  override
  bool isAutoAimEnabled()
  {
    ++_mock_isAutoAimEnabled_called;
    return _mock_isAutoAimEnabled;
  }

  void expect_isAutoAimEnabled(bool value, int expected = 1)
  {
    _mock_isAutoAimEnabled = value;
    _mock_isAutoAimEnabled_expected = expected;
    _mock_isAutoAimEnabled_called = 0;
  }

  bool isSatisfied_isAutoAimEnabled() const
  {
    return _mock_isAutoAimEnabled_expected == _mock_isAutoAimEnabled_called;
  }

  private bool _mock_isAutoAimEnabled;
  private int _mock_isAutoAimEnabled_expected;
  private int _mock_isAutoAimEnabled_called;

  override
  int getQuestionSourceIndex()
  {
    ++_mock_getQuestionSourceIndex_called;
    return _mock_getQuestionSourceIndex;
  }

  void expect_getQuestionSourceIndex(int value, int expected = 1)
  {
    _mock_getQuestionSourceIndex = value;
    _mock_getQuestionSourceIndex_expected = expected;
    _mock_getQuestionSourceIndex_called = 0;
  }

  bool isSatisfied_getQuestionSourceIndex() const
  {
    return _mock_getQuestionSourceIndex_expected == _mock_getQuestionSourceIndex_called;
  }

  private int _mock_getQuestionSourceIndex;
  private int _mock_getQuestionSourceIndex_expected;
  private int _mock_getQuestionSourceIndex_called;

  override
  bool getLessonEnabled(uint i)
  {
    ++_mock_getLessonEnabled_called;
    return _mock_getLessonEnabled;
  }

  void expect_getLessonEnabled(bool value, int expected = 1)
  {
    _mock_getLessonEnabled = value;
    _mock_getLessonEnabled_expected = expected;
    _mock_getLessonEnabled_called = 0;
  }

  bool isSatisfied_getLessonEnabled() const
  {
    return _mock_getLessonEnabled_expected == _mock_getLessonEnabled_called;
  }

  private bool _mock_getLessonEnabled;
  private int _mock_getLessonEnabled_expected;
  private int _mock_getLessonEnabled_called;

  override
  bool isFastConfirmation()
  {
    ++_mock_isFastConfirmation_called;
    return _mock_isFastConfirmation;
  }

  void expect_isFastConfirmation(bool value, int expected = 1)
  {
    _mock_isFastConfirmation = value;
    _mock_isFastConfirmation_expected = expected;
    _mock_isFastConfirmation_called = 0;
  }

  bool isSatisfied_isFastConfirmation() const
  {
    return _mock_isFastConfirmation_expected == _mock_isFastConfirmation_called;
  }

  private bool _mock_isFastConfirmation;
  private int _mock_isFastConfirmation_expected;
  private int _mock_isFastConfirmation_called;

} // class tt_SettingsMock

class tt_TargetSourceMock : tt_TargetSource
{

  static tt_TargetSourceMock of() { return new("tt_TargetSourceMock"); } // construct

  override
  tt_Targets getTargets()
  {
    ++_mock_getTargets_called;
    return _mock_getTargets;
  }

  void expect_getTargets(tt_Targets value, int expected = 1)
  {
    _mock_getTargets = value;
    _mock_getTargets_expected = expected;
    _mock_getTargets_called = 0;
  }

  bool isSatisfied_getTargets() const
  {
    return _mock_getTargets_expected == _mock_getTargets_called;
  }

  private tt_Targets _mock_getTargets;
  private int _mock_getTargets_expected;
  private int _mock_getTargets_called;

} // class tt_TargetSourceMock

class tt_AnswerStateSourceMock : tt_AnswerStateSource
{

  static tt_AnswerStateSourceMock of() { return new("tt_AnswerStateSourceMock"); } // construct

  override
  tt_AnswerState getAnswerState()
  {
    ++_mock_getAnswerState_called;
    return _mock_getAnswerState;
  }

  void expect_getAnswerState(tt_AnswerState value, int expected = 1)
  {
    _mock_getAnswerState = value;
    _mock_getAnswerState_expected = expected;
    _mock_getAnswerState_called = 0;
  }

  bool isSatisfied_getAnswerState() const
  {
    return _mock_getAnswerState_expected == _mock_getAnswerState_called;
  }

  private tt_AnswerState _mock_getAnswerState;
  private int _mock_getAnswerState_expected;
  private int _mock_getAnswerState_called;

  override
  void reset()
  {
    ++_mock_reset_called;
  }

  void expect_reset(int expected = 1)
  {
    _mock_reset_expected = expected;
    _mock_reset_called = 0;
  }

  bool isSatisfied_reset() const
  {
    return _mock_reset_expected == _mock_reset_called;
  }

  private int _mock_reset_expected;
  private int _mock_reset_called;

} // class tt_AnswerStateSourceMock

class tt_AnswerReporterMock : tt_AnswerReporter
{

  static tt_AnswerReporterMock of() { return new("tt_AnswerReporterMock"); } // construct

  override
  void reportMatch()
  {
    ++_mock_reportMatch_called;
  }

  void expect_reportMatch(int expected = 1)
  {
    _mock_reportMatch_expected = expected;
    _mock_reportMatch_called = 0;
  }

  bool isSatisfied_reportMatch() const
  {
    return _mock_reportMatch_expected == _mock_reportMatch_called;
  }

  private int _mock_reportMatch_expected;
  private int _mock_reportMatch_called;

  override
  void reportNotMatch()
  {
    ++_mock_reportNotMatch_called;
  }

  void expect_reportNotMatch(int expected = 1)
  {
    _mock_reportNotMatch_expected = expected;
    _mock_reportNotMatch_called = 0;
  }

  bool isSatisfied_reportNotMatch() const
  {
    return _mock_reportNotMatch_expected == _mock_reportNotMatch_called;
  }

  private int _mock_reportNotMatch_expected;
  private int _mock_reportNotMatch_called;

} // class tt_AnswerReporterMock

class tt_SoundPlayerMock : tt_SoundPlayer
{

  static tt_SoundPlayerMock of() { return new("tt_SoundPlayerMock"); } // construct

  override
  void playSound(String soundId)
  {
    ++_mock_playSound_called;
  }

  void expect_playSound(int expected = 1)
  {
    _mock_playSound_expected = expected;
    _mock_playSound_called = 0;
  }

  bool isSatisfied_playSound() const
  {
    return _mock_playSound_expected == _mock_playSound_called;
  }

  private int _mock_playSound_expected;
  private int _mock_playSound_called;

} // class tt_SoundPlayerMock

class tt_KeyPressReporterMock : tt_KeyPressReporter
{

  static tt_KeyPressReporterMock of() { return new("tt_KeyPressReporterMock"); } // construct

  override
  void report()
  {
    ++_mock_report_called;
  }

  void expect_report(int expected = 1)
  {
    _mock_report_expected = expected;
    _mock_report_called = 0;
  }

  bool isSatisfied_report() const
  {
    return _mock_report_expected == _mock_report_called;
  }

  private int _mock_report_expected;
  private int _mock_report_called;

} // class tt_KeyPressReporterMock

class tt_ModeReporterMock : tt_ModeReporter
{

  static tt_ModeReporterMock of() { return new("tt_ModeReporterMock"); } // construct

  override
  void report(int mode)
  {
    ++_mock_report_called;
  }

  void expect_report(int expected = 1)
  {
    _mock_report_expected = expected;
    _mock_report_called = 0;
  }

  bool isSatisfied_report() const
  {
    return _mock_report_expected == _mock_report_called;
  }

  private int _mock_report_expected;
  private int _mock_report_called;

} // class tt_ModeReporterMock

class tt_ClockMock : tt_Clock
{

  static tt_ClockMock of() { return new("tt_ClockMock"); } // construct

  override
  int getNow()
  {
    ++_mock_getNow_called;
    return _mock_getNow;
  }

  void expect_getNow(int value, int expected = 1)
  {
    _mock_getNow = value;
    _mock_getNow_expected = expected;
    _mock_getNow_called = 0;
  }

  bool isSatisfied_getNow() const
  {
    return _mock_getNow_expected == _mock_getNow_called;
  }

  private int _mock_getNow;
  private int _mock_getNow_expected;
  private int _mock_getNow_called;

  override
  int since(int moment)
  {
    ++_mock_since_called;
    return _mock_since;
  }

  void expect_since(int value, int expected = 1)
  {
    _mock_since = value;
    _mock_since_expected = expected;
    _mock_since_called = 0;
  }

  bool isSatisfied_since() const
  {
    return _mock_since_expected == _mock_since_called;
  }

  private int _mock_since;
  private int _mock_since_expected;
  private int _mock_since_called;

} // class tt_ClockMock

class tt_PlayerHandlerMock : tt_PlayerHandler
{

  static tt_PlayerHandlerMock of() { return new("tt_PlayerHandlerMock"); } // construct

  override
  void processKey(tt_Character character)
  {
    ++_mock_processKey_called;
  }

  void expect_processKey(int expected = 1)
  {
    _mock_processKey_expected = expected;
    _mock_processKey_called = 0;
  }

  bool isSatisfied_processKey() const
  {
    return _mock_processKey_expected == _mock_processKey_called;
  }

  private int _mock_processKey_expected;
  private int _mock_processKey_called;

  override
  void tick()
  {
    ++_mock_tick_called;
  }

  void expect_tick(int expected = 1)
  {
    _mock_tick_expected = expected;
    _mock_tick_called = 0;
  }

  bool isSatisfied_tick() const
  {
    return _mock_tick_expected == _mock_tick_called;
  }

  private int _mock_tick_expected;
  private int _mock_tick_called;

  override
  void reportDead(Actor dead)
  {
    ++_mock_reportDead_called;
  }

  void expect_reportDead(int expected = 1)
  {
    _mock_reportDead_expected = expected;
    _mock_reportDead_called = 0;
  }

  bool isSatisfied_reportDead() const
  {
    return _mock_reportDead_expected == _mock_reportDead_called;
  }

  private int _mock_reportDead_expected;
  private int _mock_reportDead_called;

  override
  bool isCapturingKeys()
  {
    ++_mock_isCapturingKeys_called;
    return _mock_isCapturingKeys;
  }

  void expect_isCapturingKeys(bool value, int expected = 1)
  {
    _mock_isCapturingKeys = value;
    _mock_isCapturingKeys_expected = expected;
    _mock_isCapturingKeys_called = 0;
  }

  bool isSatisfied_isCapturingKeys() const
  {
    return _mock_isCapturingKeys_expected == _mock_isCapturingKeys_called;
  }

  private bool _mock_isCapturingKeys;
  private int _mock_isCapturingKeys_expected;
  private int _mock_isCapturingKeys_called;

  override
  void unlockMode()
  {
    ++_mock_unlockMode_called;
  }

  void expect_unlockMode(int expected = 1)
  {
    _mock_unlockMode_expected = expected;
    _mock_unlockMode_called = 0;
  }

  bool isSatisfied_unlockMode() const
  {
    return _mock_unlockMode_expected == _mock_unlockMode_called;
  }

  private int _mock_unlockMode_expected;
  private int _mock_unlockMode_called;

  override
  void forceCombat()
  {
    ++_mock_forceCombat_called;
  }

  void expect_forceCombat(int expected = 1)
  {
    _mock_forceCombat_expected = expected;
    _mock_forceCombat_called = 0;
  }

  bool isSatisfied_forceCombat() const
  {
    return _mock_forceCombat_expected == _mock_forceCombat_called;
  }

  private int _mock_forceCombat_expected;
  private int _mock_forceCombat_called;

  override
  void draw(RenderEvent event)
  {
    ++_mock_draw_called;
  }

  void expect_draw(int expected = 1)
  {
    _mock_draw_expected = expected;
    _mock_draw_called = 0;
  }

  bool isSatisfied_draw() const
  {
    return _mock_draw_expected == _mock_draw_called;
  }

  private int _mock_draw_expected;
  private int _mock_draw_called;

} // class tt_PlayerHandlerMock

class tt_TargetWidgetSourceMock : tt_TargetWidgetSource
{

  static tt_TargetWidgetSourceMock of() { return new("tt_TargetWidgetSourceMock"); } // construct

  override
  tt_TargetWidgets getWidgets(RenderEvent event)
  {
    ++_mock_getWidgets_called;
    return _mock_getWidgets;
  }

  void expect_getWidgets(tt_TargetWidgets value, int expected = 1)
  {
    _mock_getWidgets = value;
    _mock_getWidgets_expected = expected;
    _mock_getWidgets_called = 0;
  }

  bool isSatisfied_getWidgets() const
  {
    return _mock_getWidgets_expected == _mock_getWidgets_called;
  }

  private tt_TargetWidgets _mock_getWidgets;
  private int _mock_getWidgets_expected;
  private int _mock_getWidgets_called;

} // class tt_TargetWidgetSourceMock

class tt_KnownTargetSourceMock : tt_KnownTargetSource
{

  static tt_KnownTargetSourceMock of() { return new("tt_KnownTargetSourceMock"); } // construct

  override
  tt_KnownTargets getTargets()
  {
    ++_mock_getTargets_called;
    return _mock_getTargets;
  }

  void expect_getTargets(tt_KnownTargets value, int expected = 1)
  {
    _mock_getTargets = value;
    _mock_getTargets_expected = expected;
    _mock_getTargets_called = 0;
  }

  bool isSatisfied_getTargets() const
  {
    return _mock_getTargets_expected == _mock_getTargets_called;
  }

  private tt_KnownTargets _mock_getTargets;
  private int _mock_getTargets_expected;
  private int _mock_getTargets_called;

  override
  bool isEmpty()
  {
    ++_mock_isEmpty_called;
    return _mock_isEmpty;
  }

  void expect_isEmpty(bool value, int expected = 1)
  {
    _mock_isEmpty = value;
    _mock_isEmpty_expected = expected;
    _mock_isEmpty_called = 0;
  }

  bool isSatisfied_isEmpty() const
  {
    return _mock_isEmpty_expected == _mock_isEmpty_called;
  }

  private bool _mock_isEmpty;
  private int _mock_isEmpty_expected;
  private int _mock_isEmpty_called;

} // class tt_KnownTargetSourceMock

class tt_DasherMock : tt_Dasher
{

  static tt_DasherMock of() { return new("tt_DasherMock"); } // construct

  override
  double getDashAngle()
  {
    ++_mock_getDashAngle_called;
    return _mock_getDashAngle;
  }

  void expect_getDashAngle(double value, int expected = 1)
  {
    _mock_getDashAngle = value;
    _mock_getDashAngle_expected = expected;
    _mock_getDashAngle_called = 0;
  }

  bool isSatisfied_getDashAngle() const
  {
    return _mock_getDashAngle_expected == _mock_getDashAngle_called;
  }

  private double _mock_getDashAngle;
  private int _mock_getDashAngle_expected;
  private int _mock_getDashAngle_called;

} // class tt_DasherMock

class tt_ActivatableMock : tt_Activatable
{

  static tt_ActivatableMock of() { return new("tt_ActivatableMock"); } // construct

  override
  void activate()
  {
    ++_mock_activate_called;
  }

  void expect_activate(int expected = 1)
  {
    _mock_activate_expected = expected;
    _mock_activate_called = 0;
  }

  bool isSatisfied_activate() const
  {
    return _mock_activate_expected == _mock_activate_called;
  }

  private int _mock_activate_expected;
  private int _mock_activate_called;

  override
  tt_Strings getCommands()
  {
    ++_mock_getCommands_called;
    return _mock_getCommands;
  }

  void expect_getCommands(tt_Strings value, int expected = 1)
  {
    _mock_getCommands = value;
    _mock_getCommands_expected = expected;
    _mock_getCommands_called = 0;
  }

  bool isSatisfied_getCommands() const
  {
    return _mock_getCommands_expected == _mock_getCommands_called;
  }

  private tt_Strings _mock_getCommands;
  private int _mock_getCommands_expected;
  private int _mock_getCommands_called;

  override
  bool isVisible()
  {
    ++_mock_isVisible_called;
    return _mock_isVisible;
  }

  void expect_isVisible(bool value, int expected = 1)
  {
    _mock_isVisible = value;
    _mock_isVisible_expected = expected;
    _mock_isVisible_called = 0;
  }

  bool isSatisfied_isVisible() const
  {
    return _mock_isVisible_expected == _mock_isVisible_called;
  }

  private bool _mock_isVisible;
  private int _mock_isVisible_expected;
  private int _mock_isVisible_called;

} // class tt_ActivatableMock

class tt_OriginSourceMock : tt_OriginSource
{

  static tt_OriginSourceMock of() { return new("tt_OriginSourceMock"); } // construct

  override
  tt_Origin getOrigin()
  {
    ++_mock_getOrigin_called;
    return _mock_getOrigin;
  }

  void expect_getOrigin(tt_Origin value, int expected = 1)
  {
    _mock_getOrigin = value;
    _mock_getOrigin_expected = expected;
    _mock_getOrigin_called = 0;
  }

  bool isSatisfied_getOrigin() const
  {
    return _mock_getOrigin_expected == _mock_getOrigin_called;
  }

  private tt_Origin _mock_getOrigin;
  private int _mock_getOrigin_expected;
  private int _mock_getOrigin_called;

} // class tt_OriginSourceMock

class tt_FirerMock : tt_Firer
{

  static tt_FirerMock of() { return new("tt_FirerMock"); } // construct

  override
  void fire()
  {
    ++_mock_fire_called;
  }

  void expect_fire(int expected = 1)
  {
    _mock_fire_expected = expected;
    _mock_fire_called = 0;
  }

  bool isSatisfied_fire() const
  {
    return _mock_fire_expected == _mock_fire_called;
  }

  private int _mock_fire_expected;
  private int _mock_fire_called;

} // class tt_FirerMock

class tt_WorldChangerMock : tt_WorldChanger
{

  static tt_WorldChangerMock of() { return new("tt_WorldChangerMock"); } // construct

  override
  void changeWorld()
  {
    ++_mock_changeWorld_called;
  }

  void expect_changeWorld(int expected = 1)
  {
    _mock_changeWorld_expected = expected;
    _mock_changeWorld_called = 0;
  }

  bool isSatisfied_changeWorld() const
  {
    return _mock_changeWorld_expected == _mock_changeWorld_called;
  }

  private int _mock_changeWorld_expected;
  private int _mock_changeWorld_called;

} // class tt_WorldChangerMock

class tt_KeyProcessorMock : tt_KeyProcessor
{

  static tt_KeyProcessorMock of() { return new("tt_KeyProcessorMock"); } // construct

  override
  void processKey(tt_Character character)
  {
    ++_mock_processKey_called;
  }

  void expect_processKey(int expected = 1)
  {
    _mock_processKey_expected = expected;
    _mock_processKey_called = 0;
  }

  bool isSatisfied_processKey() const
  {
    return _mock_processKey_expected == _mock_processKey_called;
  }

  private int _mock_processKey_expected;
  private int _mock_processKey_called;

} // class tt_KeyProcessorMock

class tt_StaleMarkerMock : tt_StaleMarker
{

  static tt_StaleMarkerMock of() { return new("tt_StaleMarkerMock"); } // construct

  override
  bool isStale()
  {
    ++_mock_isStale_called;
    return _mock_isStale;
  }

  void expect_isStale(bool value, int expected = 1)
  {
    _mock_isStale = value;
    _mock_isStale_expected = expected;
    _mock_isStale_called = 0;
  }

  bool isSatisfied_isStale() const
  {
    return _mock_isStale_expected == _mock_isStale_called;
  }

  private bool _mock_isStale;
  private int _mock_isStale_expected;
  private int _mock_isStale_called;

} // class tt_StaleMarkerMock

class tt_QuestionMock : tt_Question
{

  static tt_QuestionMock of() { return new("tt_QuestionMock"); } // construct

  override
  bool isRight(tt_Answer answer)
  {
    ++_mock_isRight_called;
    return _mock_isRight;
  }

  void expect_isRight(bool value, int expected = 1)
  {
    _mock_isRight = value;
    _mock_isRight_expected = expected;
    _mock_isRight_called = 0;
  }

  bool isSatisfied_isRight() const
  {
    return _mock_isRight_expected == _mock_isRight_called;
  }

  private bool _mock_isRight;
  private int _mock_isRight_expected;
  private int _mock_isRight_called;

  override
  String getDescription()
  {
    ++_mock_getDescription_called;
    return _mock_getDescription;
  }

  void expect_getDescription(String value, int expected = 1)
  {
    _mock_getDescription = value;
    _mock_getDescription_expected = expected;
    _mock_getDescription_called = 0;
  }

  bool isSatisfied_getDescription() const
  {
    return _mock_getDescription_expected == _mock_getDescription_called;
  }

  private String _mock_getDescription;
  private int _mock_getDescription_expected;
  private int _mock_getDescription_called;

  override
  String getHintFor(tt_Answer answer)
  {
    ++_mock_getHintFor_called;
    return _mock_getHintFor;
  }

  void expect_getHintFor(String value, int expected = 1)
  {
    _mock_getHintFor = value;
    _mock_getHintFor_expected = expected;
    _mock_getHintFor_called = 0;
  }

  bool isSatisfied_getHintFor() const
  {
    return _mock_getHintFor_expected == _mock_getHintFor_called;
  }

  private String _mock_getHintFor;
  private int _mock_getHintFor_expected;
  private int _mock_getHintFor_called;

} // class tt_QuestionMock

class tt_AimerMock : tt_Aimer
{

  static tt_AimerMock of() { return new("tt_AimerMock"); } // construct

  override
  void aim()
  {
    ++_mock_aim_called;
  }

  void expect_aim(int expected = 1)
  {
    _mock_aim_expected = expected;
    _mock_aim_called = 0;
  }

  bool isSatisfied_aim() const
  {
    return _mock_aim_expected == _mock_aim_called;
  }

  private int _mock_aim_expected;
  private int _mock_aim_called;

} // class tt_AimerMock

class tt_PlayerSourceMock : tt_PlayerSource
{

  static tt_PlayerSourceMock of() { return new("tt_PlayerSourceMock"); } // construct

  override
  PlayerInfo getInfo()
  {
    ++_mock_getInfo_called;
    return _mock_getInfo;
  }

  void expect_getInfo(PlayerInfo value, int expected = 1)
  {
    _mock_getInfo = value;
    _mock_getInfo_expected = expected;
    _mock_getInfo_called = 0;
  }

  bool isSatisfied_getInfo() const
  {
    return _mock_getInfo_expected == _mock_getInfo_called;
  }

  private PlayerInfo _mock_getInfo;
  private int _mock_getInfo_expected;
  private int _mock_getInfo_called;

  override
  PlayerPawn getPawn()
  {
    ++_mock_getPawn_called;
    return _mock_getPawn;
  }

  void expect_getPawn(PlayerPawn value, int expected = 1)
  {
    _mock_getPawn = value;
    _mock_getPawn_expected = expected;
    _mock_getPawn_called = 0;
  }

  bool isSatisfied_getPawn() const
  {
    return _mock_getPawn_expected == _mock_getPawn_called;
  }

  private PlayerPawn _mock_getPawn;
  private int _mock_getPawn_expected;
  private int _mock_getPawn_called;

} // class tt_PlayerSourceMock

class tt_ModeStorageMock : tt_ModeStorage
{

  static tt_ModeStorageMock of() { return new("tt_ModeStorageMock"); } // construct

  override
  void setMode(int mode)
  {
    ++_mock_setMode_called;
  }

  void expect_setMode(int expected = 1)
  {
    _mock_setMode_expected = expected;
    _mock_setMode_called = 0;
  }

  bool isSatisfied_setMode() const
  {
    return _mock_setMode_expected == _mock_setMode_called;
  }

  private int _mock_setMode_expected;
  private int _mock_setMode_called;

} // class tt_ModeStorageMock

class tt_ModeSourceMock : tt_ModeSource
{

  static tt_ModeSourceMock of() { return new("tt_ModeSourceMock"); } // construct

  override
  int getMode()
  {
    ++_mock_getMode_called;
    return _mock_getMode;
  }

  void expect_getMode(int value, int expected = 1)
  {
    _mock_getMode = value;
    _mock_getMode_expected = expected;
    _mock_getMode_called = 0;
  }

  bool isSatisfied_getMode() const
  {
    return _mock_getMode_expected == _mock_getMode_called;
  }

  private int _mock_getMode;
  private int _mock_getMode_expected;
  private int _mock_getMode_called;

} // class tt_ModeSourceMock

class tt_AnswerSourceMock : tt_AnswerSource
{

  static tt_AnswerSourceMock of() { return new("tt_AnswerSourceMock"); } // construct

  override
  tt_Answer getAnswer()
  {
    ++_mock_getAnswer_called;
    return _mock_getAnswer;
  }

  void expect_getAnswer(tt_Answer value, int expected = 1)
  {
    _mock_getAnswer = value;
    _mock_getAnswer_expected = expected;
    _mock_getAnswer_called = 0;
  }

  bool isSatisfied_getAnswer() const
  {
    return _mock_getAnswer_expected == _mock_getAnswer_called;
  }

  private tt_Answer _mock_getAnswer;
  private int _mock_getAnswer_expected;
  private int _mock_getAnswer_called;

  override
  void reset()
  {
    ++_mock_reset_called;
  }

  void expect_reset(int expected = 1)
  {
    _mock_reset_expected = expected;
    _mock_reset_called = 0;
  }

  bool isSatisfied_reset() const
  {
    return _mock_reset_expected == _mock_reset_called;
  }

  private int _mock_reset_expected;
  private int _mock_reset_called;

} // class tt_AnswerSourceMock

class tt_QuestionSourceMock : tt_QuestionSource
{

  static tt_QuestionSourceMock of() { return new("tt_QuestionSourceMock"); } // construct

  override
  tt_Question getQuestion()
  {
    ++_mock_getQuestion_called;
    return _mock_getQuestion;
  }

  void expect_getQuestion(tt_Question value, int expected = 1)
  {
    _mock_getQuestion = value;
    _mock_getQuestion_expected = expected;
    _mock_getQuestion_called = 0;
  }

  bool isSatisfied_getQuestion() const
  {
    return _mock_getQuestion_expected == _mock_getQuestion_called;
  }

  private tt_Question _mock_getQuestion;
  private int _mock_getQuestion_expected;
  private int _mock_getQuestion_called;

} // class tt_QuestionSourceMock

class tt_ViewMock : tt_View
{

  static tt_ViewMock of() { return new("tt_ViewMock"); } // construct

  override
  void draw(RenderEvent event)
  {
    ++_mock_draw_called;
  }

  void expect_draw(int expected = 1)
  {
    _mock_draw_expected = expected;
    _mock_draw_called = 0;
  }

  bool isSatisfied_draw() const
  {
    return _mock_draw_expected == _mock_draw_called;
  }

  private int _mock_draw_expected;
  private int _mock_draw_called;

} // class tt_ViewMock
