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

  bool isSatisfied_damage()
  {
    return _mock_damage_expected == _mock_damage_called;
  }

  private int _mock_damage_expected;
  private int _mock_damage_called;

} // tt_DamagerMock

class tt_KnownTargetSourceMock : tt_KnownTargetSource
{

  override
  tt_KnownTarget getTarget()
  {
    ++_mock_getTarget_called;
    return _mock_getTarget;
  }

  void Expect_getTarget(tt_KnownTarget value, int expected = 1)
  {
    _mock_getTarget = value;
    _mock_getTarget_expected = expected;
    _mock_getTarget_called = 0;
  }

  bool isSatisfied_getTarget()
  {
    return _mock_getTarget_expected == _mock_getTarget_called;
  }

  private tt_KnownTarget _mock_getTarget;
  private int _mock_getTarget_expected;
  private int _mock_getTarget_called;

} // tt_KnownTargetSourceMock

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

  bool isSatisfied_getActor()
  {
    return _mock_getActor_expected == _mock_getActor_called;
  }

  private Actor _mock_getActor;
  private int _mock_getActor_expected;
  private int _mock_getActor_called;

} // tt_ActorSourceMock

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

  bool isSatisfied_activate()
  {
    return _mock_activate_expected == _mock_activate_called;
  }

  private int _mock_activate_expected;
  private int _mock_activate_called;

} // tt_ActivatableMock

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

  bool isSatisfied_getDifficulty()
  {
    return _mock_getDifficulty_expected == _mock_getDifficulty_called;
  }

  private tt_Difficulty _mock_getDifficulty;
  private int _mock_getDifficulty_expected;
  private int _mock_getDifficulty_called;

} // tt_DifficultySourceMock

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

  bool isSatisfied_getTargets()
  {
    return _mock_getTargets_expected == _mock_getTargets_called;
  }

  private tt_DisabledTargets _mock_getTargets;
  private int _mock_getTargets_expected;
  private int _mock_getTargets_called;

} // tt_DisabledTargetSourceMock

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

  bool isSatisfied_getTargets()
  {
    return _mock_getTargets_expected == _mock_getTargets_called;
  }

  private tt_Targets _mock_getTargets;
  private int _mock_getTargets_expected;
  private int _mock_getTargets_called;

} // tt_TargetSourceMock

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

  bool isSatisfied_getWidgets()
  {
    return _mock_getWidgets_expected == _mock_getWidgets_called;
  }

  private tt_TargetWidgets _mock_getWidgets;
  private int _mock_getWidgets_expected;
  private int _mock_getWidgets_called;

} // tt_TargetWidgetSourceMock

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

  bool isSatisfied_getMode()
  {
    return _mock_getMode_expected == _mock_getMode_called;
  }

  private tt_Mode _mock_getMode;
  private int _mock_getMode_expected;
  private int _mock_getMode_called;

} // tt_ModeSourceMock

class tt_ShootStringSourceMock : tt_ShootStringSource
{

  override
  tt_String getString(int length)
  {
    ++_mock_getString_called;
    return _mock_getString;
  }

  void Expect_getString(tt_String value, int expected = 1)
  {
    _mock_getString = value;
    _mock_getString_expected = expected;
    _mock_getString_called = 0;
  }

  bool isSatisfied_getString()
  {
    return _mock_getString_expected == _mock_getString_called;
  }

  private tt_String _mock_getString;
  private int _mock_getString_expected;
  private int _mock_getString_called;

} // tt_ShootStringSourceMock

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

  bool isSatisfied_draw()
  {
    return _mock_draw_expected == _mock_draw_called;
  }

  private int _mock_draw_expected;
  private int _mock_draw_called;

} // tt_ViewMock

class tt_ChargeStringSourceMock : tt_ChargeStringSource
{

  override
  tt_String getString()
  {
    ++_mock_getString_called;
    return _mock_getString;
  }

  void Expect_getString(tt_String value, int expected = 1)
  {
    _mock_getString = value;
    _mock_getString_expected = expected;
    _mock_getString_called = 0;
  }

  bool isSatisfied_getString()
  {
    return _mock_getString_expected == _mock_getString_called;
  }

  private tt_String _mock_getString;
  private int _mock_getString_expected;
  private int _mock_getString_called;

} // tt_ChargeStringSourceMock

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

  bool isSatisfied_getOrigin()
  {
    return _mock_getOrigin_expected == _mock_getOrigin_called;
  }

  private tt_Origin _mock_getOrigin;
  private int _mock_getOrigin_expected;
  private int _mock_getOrigin_called;

} // tt_OriginSourceMock

