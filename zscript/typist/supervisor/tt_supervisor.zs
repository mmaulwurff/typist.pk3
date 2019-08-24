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
    let questionSource   = new("tt_RandomNumberSource"  ).init(difficultySource);

    let targetRegistry = new("tt_TargetRegistry").init(targetSource, questionSource, deathReporter);
    let modeSource     = new("tt_AutoModeSource").init(targetRegistry);

    let targetOriginSource = new("tt_QuestionAnswerMatcher").init(targetRegistry, playerInput);
    let aimer              = new("tt_AimerImpl"            ).init(targetOriginSource, pawnSource);
    let firer              = new("tt_FirerImpl"            ).init(playerInfoSource);
    let damager            = new("tt_Gunner"               ).init(targetOriginSource, aimer, firer);

    let targetWidgetSource = new("tt_TargetWidgetRegistry").init(targetRegistry);
    let view               = new("tt_Screen"              ).init(targetWidgetSource, playerInput);

    _playerInput    = playerInput;
    _deathReporter  = deathReporter;
    _targetRegistry = targetRegistry;
    _view           = view;
    _modeSource     = modeSource;
    _damager        = damager;

    return self;
  }

// public: /////////////////////////////////////////////////////////////////////

  void processKey(int key)
  {
    _playerInput.processKey(key);
  }

  play
  void updateTargets()
  {
    _targetRegistry.update();
    _damager.damage();
  }

  void reportDead(Actor dead)
  {
    _deathReporter.reportDead(dead);
  }

  void draw()
  {
    _view.draw();
  }

  int getMode()
  {
    return _modeSource.getMode();
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_PlayerInput       _playerInput;
  private tt_KnownTargetSource _targetRegistry;
  private tt_DeathReporter     _deathReporter;
  private tt_View              _view;
  private tt_ModeSource        _modeSource;
  private tt_Damager           _damager;

} // class tt_Supervisor
