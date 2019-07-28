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

// This file is generated by ./scripts/make_mocks.py.
// Do not edit it by hand, your changes will be overwritten!

class tt_DamagerMock : tt_Damager
{

  override
  void damage()
  {
    ++_mock_damage_called;
  }

  void Expect_damage(int expected = 1)
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

class tt_AnswerSourceMock : tt_AnswerSource
{

  override
  tt_Answer getAnswer()
  {
    ++_mock_getAnswer_called;
    return _mock_getAnswer;
  }

  void Expect_getAnswer(tt_Answer value, int expected = 1)
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

  void Expect_reset(int expected = 1)
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

class tt_KnownTargetSourceMock : tt_KnownTargetSource
{

  override
  tt_KnownTargets getTargets()
  {
    ++_mock_getTargets_called;
    return _mock_getTargets;
  }

  void Expect_getTargets(tt_KnownTargets value, int expected = 1)
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
  void update()
  {
    ++_mock_update_called;
  }

  void Expect_update(int expected = 1)
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

class tt_ActorSourceMock : tt_ActorSource
{

  override
  Actor getActor()
  {
    ++_mock_getActor_called;
    return _mock_getActor;
  }

  void Expect_getActor(Actor value, int expected = 1)
  {
    _mock_getActor = value;
    _mock_getActor_expected = expected;
    _mock_getActor_called = 0;
  }

  bool isSatisfied_getActor() const
  {
    return _mock_getActor_expected == _mock_getActor_called;
  }

  private Actor _mock_getActor;
  private int _mock_getActor_expected;
  private int _mock_getActor_called;

} // class tt_ActorSourceMock

class tt_ActivatableMock : tt_Activatable
{

  override
  void activate()
  {
    ++_mock_activate_called;
  }

  void Expect_activate(int expected = 1)
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

} // class tt_ActivatableMock

class tt_DifficultySourceMock : tt_DifficultySource
{

  override
  tt_Difficulty getDifficulty()
  {
    ++_mock_getDifficulty_called;
    return _mock_getDifficulty;
  }

  void Expect_getDifficulty(tt_Difficulty value, int expected = 1)
  {
    _mock_getDifficulty = value;
    _mock_getDifficulty_expected = expected;
    _mock_getDifficulty_called = 0;
  }

  bool isSatisfied_getDifficulty() const
  {
    return _mock_getDifficulty_expected == _mock_getDifficulty_called;
  }

  private tt_Difficulty _mock_getDifficulty;
  private int _mock_getDifficulty_expected;
  private int _mock_getDifficulty_called;

} // class tt_DifficultySourceMock

class tt_DisabledTargetSourceMock : tt_DisabledTargetSource
{

  override
  tt_DisabledTargets getTargets()
  {
    ++_mock_getTargets_called;
    return _mock_getTargets;
  }

  void Expect_getTargets(tt_DisabledTargets value, int expected = 1)
  {
    _mock_getTargets = value;
    _mock_getTargets_expected = expected;
    _mock_getTargets_called = 0;
  }

  bool isSatisfied_getTargets() const
  {
    return _mock_getTargets_expected == _mock_getTargets_called;
  }

  private tt_DisabledTargets _mock_getTargets;
  private int _mock_getTargets_expected;
  private int _mock_getTargets_called;

} // class tt_DisabledTargetSourceMock

class tt_TargetSourceMock : tt_TargetSource
{

  override
  tt_Targets getTargets()
  {
    ++_mock_getTargets_called;
    return _mock_getTargets;
  }

  void Expect_getTargets(tt_Targets value, int expected = 1)
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

class tt_QuestionMock : tt_Question
{

  override
  bool isRight(tt_Answer answer)
  {
    ++_mock_isRight_called;
    return _mock_isRight;
  }

  void Expect_isRight(bool value, int expected = 1)
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

} // class tt_QuestionMock

class tt_QuestionSourceMock : tt_QuestionSource
{

  override
  tt_Question getQuestion()
  {
    ++_mock_getQuestion_called;
    return _mock_getQuestion;
  }

  void Expect_getQuestion(tt_Question value, int expected = 1)
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

class tt_TargetWidgetSourceMock : tt_TargetWidgetSource
{

  override
  tt_TargetWidgets getWidgets()
  {
    ++_mock_getWidgets_called;
    return _mock_getWidgets;
  }

  void Expect_getWidgets(tt_TargetWidgets value, int expected = 1)
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

class tt_ModeSourceMock : tt_ModeSource
{

  override
  tt_Mode getMode()
  {
    ++_mock_getMode_called;
    return _mock_getMode;
  }

  void Expect_getMode(tt_Mode value, int expected = 1)
  {
    _mock_getMode = value;
    _mock_getMode_expected = expected;
    _mock_getMode_called = 0;
  }

  bool isSatisfied_getMode() const
  {
    return _mock_getMode_expected == _mock_getMode_called;
  }

  private tt_Mode _mock_getMode;
  private int _mock_getMode_expected;
  private int _mock_getMode_called;

} // class tt_ModeSourceMock

class tt_ViewMock : tt_View
{

  override
  void draw()
  {
    ++_mock_draw_called;
  }

  void Expect_draw(int expected = 1)
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

class tt_OriginSourceMock : tt_OriginSource
{

  override
  tt_Origin getOrigin()
  {
    ++_mock_getOrigin_called;
    return _mock_getOrigin;
  }

  void Expect_getOrigin(tt_Origin value, int expected = 1)
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
