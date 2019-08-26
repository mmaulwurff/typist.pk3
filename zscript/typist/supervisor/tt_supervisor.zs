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

/** This class integrates the every Typist.pk3 module.
 */
class tt_Supervisor
{

// public: /////////////////////////////////////////////////////////////////////

  tt_Supervisor init(int playerNumber)
  {
    let playerInput    = new("tt_PlayerInput"  ).init();
    let deathReporter  = new("tt_DeathReporter").init();

    let difficultySource = new("tt_SelectedDifficulty"  ).init();
    let playerInfoSource = new("tt_PlayerInfoSourceImpl").init(playerNumber);
    let pawnSource       = new("tt_PlayerPawnSource"    ).init(playerInfoSource);
    let originSource     = new("tt_PawnOriginSource"    ).init(pawnSource);
    let targetSource     = new("tt_TargetRadar"         ).init(originSource);
    let questionSource   = new("tt_RandomLetterSource"  ).init(difficultySource);

    let targetRegistry = new("tt_TargetRegistry").init(targetSource, questionSource, deathReporter);
    let modeSource     = new("tt_AutoModeSource").init(targetRegistry);

    let targetOriginSource = new("tt_QuestionAnswerMatcher").init(targetRegistry, playerInput);
    let aimer              = new("tt_AimerImpl"            ).init(targetOriginSource, pawnSource);
    let firer              = new("tt_FirerImpl"            ).init(playerInfoSource);
    let damager            = new("tt_Gunner"               ).init(targetOriginSource, aimer, firer);

    let projector        = new("tt_Projector"           ).init(targetRegistry, playerInfoSource);
    let visibilityFilter = new("tt_VisibilityFilter"    ).init(projector, pawnSource);
    let widgetRegistry   = new("tt_TargetWidgetRegistry").init(visibilityFilter);
    let view             = new("tt_Screen"              ).init(widgetRegistry, playerInput);

    _playerInput        = playerInput;
    _deathReporter      = deathReporter;
    _targetRegistry     = targetRegistry;
    _view               = view;
    _modeSource         = modeSource;
    _damager            = damager;
    _targetWidgetSource = projector;
    _targetOriginSource = targetOriginSource;

    return self;
  }

// public: /////////////////////////////////////////////////////////////////////

  void processKey(tt_Character character)
  {
    _playerInput.processKey(character);
  }

  play
  void updateTargets()
  {
    _targetRegistry.update();
    _targetOriginSource.update();
    _damager.damage();
    _targetWidgetSource.prepare();
  }

  void reportDead(Actor dead)
  {
    _deathReporter.reportDead(dead);
  }

  int getMode()
  {
    return _modeSource.getMode();
  }

// public: // ui ///////////////////////////////////////////////////////////////

  ui
  void draw(RenderEvent event)
  {
    _view.draw(event);
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_PlayerInput        _playerInput;
  private tt_KnownTargetSource  _targetRegistry;
  private tt_DeathReporter      _deathReporter;
  private tt_View               _view;
  private tt_ModeSource         _modeSource;
  private tt_Damager            _damager;
  private tt_TargetWidgetSource _targetWidgetSource;
  private tt_OriginSource       _targetOriginSource;

} // class tt_Supervisor
