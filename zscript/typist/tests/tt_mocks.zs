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

  tt_InputManagerMock init() { return self; }

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

class tt_EventReporterMock : tt_EventReporter
{

  tt_EventReporterMock init() { return self; }

  override
  void reportNewMode(int mode)
  {
    ++_mock_reportNewMode_called;
  }

  void expect_reportNewMode(int expected = 1)
  {
    _mock_reportNewMode_expected = expected;
    _mock_reportNewMode_called = 0;
  }

  bool isSatisfied_reportNewMode() const
  {
    return _mock_reportNewMode_expected == _mock_reportNewMode_called;
  }

  private int _mock_reportNewMode_expected;
  private int _mock_reportNewMode_called;

  override
  void reportKeyPressed()
  {
    ++_mock_reportKeyPressed_called;
  }

  void expect_reportKeyPressed(int expected = 1)
  {
    _mock_reportKeyPressed_expected = expected;
    _mock_reportKeyPressed_called = 0;
  }

  bool isSatisfied_reportKeyPressed() const
  {
    return _mock_reportKeyPressed_expected == _mock_reportKeyPressed_called;
  }

  private int _mock_reportKeyPressed_expected;
  private int _mock_reportKeyPressed_called;

  override
  void reportAnswerMatch()
  {
    ++_mock_reportAnswerMatch_called;
  }

  void expect_reportAnswerMatch(int expected = 1)
  {
    _mock_reportAnswerMatch_expected = expected;
    _mock_reportAnswerMatch_called = 0;
  }

  bool isSatisfied_reportAnswerMatch() const
  {
    return _mock_reportAnswerMatch_expected == _mock_reportAnswerMatch_called;
  }

  private int _mock_reportAnswerMatch_expected;
  private int _mock_reportAnswerMatch_called;

  override
  void reportAnswerNotMatch()
  {
    ++_mock_reportAnswerNotMatch_called;
  }

  void expect_reportAnswerNotMatch(int expected = 1)
  {
    _mock_reportAnswerNotMatch_expected = expected;
    _mock_reportAnswerNotMatch_called = 0;
  }

  bool isSatisfied_reportAnswerNotMatch() const
  {
    return _mock_reportAnswerNotMatch_expected == _mock_reportAnswerNotMatch_called;
  }

  private int _mock_reportAnswerNotMatch_expected;
  private int _mock_reportAnswerNotMatch_called;

} // class tt_EventReporterMock

class tt_SettingsMock : tt_Settings
{

  tt_SettingsMock init() { return self; }

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

} // class tt_SettingsMock

class tt_TargetSourceMock : tt_TargetSource
{

  tt_TargetSourceMock init() { return self; }

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

class tt_ClockMock : tt_Clock
{

  tt_ClockMock init() { return self; }

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

  tt_PlayerHandlerMock init() { return self; }

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

  tt_TargetWidgetSourceMock init() { return self; }

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

  override
  void prepare()
  {
    ++_mock_prepare_called;
  }

  void expect_prepare(int expected = 1)
  {
    _mock_prepare_expected = expected;
    _mock_prepare_called = 0;
  }

  bool isSatisfied_prepare() const
  {
    return _mock_prepare_expected == _mock_prepare_called;
  }

  private int _mock_prepare_expected;
  private int _mock_prepare_called;

} // class tt_TargetWidgetSourceMock

class tt_KnownTargetSourceMock : tt_KnownTargetSource
{

  tt_KnownTargetSourceMock init() { return self; }

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

  override
  void update()
  {
    ++_mock_update_called;
  }

  void expect_update(int expected = 1)
  {
    _mock_update_expected = expected;
    _mock_update_called = 0;
  }

  bool isSatisfied_update() const
  {
    return _mock_update_expected == _mock_update_called;
  }

  private int _mock_update_expected;
  private int _mock_update_called;

} // class tt_KnownTargetSourceMock

class tt_DamagerMock : tt_Damager
{

  tt_DamagerMock init() { return self; }

  override
  void damage()
  {
    ++_mock_damage_called;
  }

  void expect_damage(int expected = 1)
  {
    _mock_damage_expected = expected;
    _mock_damage_called = 0;
  }

  bool isSatisfied_damage() const
  {
    return _mock_damage_expected == _mock_damage_called;
  }

  private int _mock_damage_expected;
  private int _mock_damage_called;

} // class tt_DamagerMock

class tt_ActivatableMock : tt_Activatable
{

  tt_ActivatableMock init() { return self; }

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

class tt_DasherMock : tt_Dasher
{

  tt_DasherMock init() { return self; }

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

class tt_TurnerMock : tt_Turner
{

  tt_TurnerMock init() { return self; }

  override
  double getTurnAngle()
  {
    ++_mock_getTurnAngle_called;
    return _mock_getTurnAngle;
  }

  void expect_getTurnAngle(double value, int expected = 1)
  {
    _mock_getTurnAngle = value;
    _mock_getTurnAngle_expected = expected;
    _mock_getTurnAngle_called = 0;
  }

  bool isSatisfied_getTurnAngle() const
  {
    return _mock_getTurnAngle_expected == _mock_getTurnAngle_called;
  }

  private double _mock_getTurnAngle;
  private int _mock_getTurnAngle_expected;
  private int _mock_getTurnAngle_called;

} // class tt_TurnerMock

class tt_OriginSourceMock : tt_OriginSource
{

  tt_OriginSourceMock init() { return self; }

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

  override
  void update()
  {
    ++_mock_update_called;
  }

  void expect_update(int expected = 1)
  {
    _mock_update_expected = expected;
    _mock_update_called = 0;
  }

  bool isSatisfied_update() const
  {
    return _mock_update_expected == _mock_update_called;
  }

  private int _mock_update_expected;
  private int _mock_update_called;

} // class tt_OriginSourceMock

class tt_FirerMock : tt_Firer
{

  tt_FirerMock init() { return self; }

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

  tt_WorldChangerMock init() { return self; }

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

class tt_QuestionMock : tt_Question
{

  tt_QuestionMock init() { return self; }

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

  tt_AimerMock init() { return self; }

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

  tt_PlayerSourceMock init() { return self; }

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

  tt_ModeStorageMock init() { return self; }

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

  tt_ModeSourceMock init() { return self; }

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

  tt_AnswerSourceMock init() { return self; }

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

} // class tt_AnswerSourceMock

class tt_QuestionSourceMock : tt_QuestionSource
{

  tt_QuestionSourceMock init() { return self; }

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

  tt_ViewMock init() { return self; }

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
