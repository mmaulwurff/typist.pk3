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

/**
 * This class handles Typist.pk3 features for one player.
 */
class tt_PlayerSupervisor : tt_PlayerHandler
{

// public: /////////////////////////////////////////////////////////////////////

  tt_PlayerSupervisor init(int playerNumber)
  {
    let playerInput   = new("tt_PlayerInput"  ).init();
    let deathReporter = new("tt_DeathReporter").init();

    let difficultySource = new("tt_SelectedDifficulty").init();
    let playerSource     = new("tt_PlayerSourceImpl"  ).init(playerNumber);
    let settings         = new("tt_SettingsImpl"      ).init(playerSource);

    let originSource     = new("tt_PlayerOriginSource").init(playerSource);
    let targetSource     = new("tt_TargetRadar"       ).init(originSource);
    let questionSource   = makeQuestionSource(difficultySource, settings);

    let targetRegistry = new("tt_TargetRegistry").init(targetSource, questionSource, deathReporter);
    let autoModeSource = new("tt_AutoModeSource").init(targetRegistry, playerSource);

    let targetOriginSource = new("tt_QuestionAnswerMatcher").init( targetRegistry
                                                                 , playerInput
                                                                 , playerSource
                                                                 );

    let aimer              = makeAimer(targetOriginSource, playerSource, settings);
    let firer              = new("tt_FirerImpl"            ).init(playerSource);
    let damager            = new("tt_Gunner"               ).init(targetOriginSource, aimer, firer);

    let projector        = new("tt_Projector"           ).init(targetRegistry, playerSource);
    let visibilityFilter = new("tt_VisibilityFilter"    ).init(projector, playerSource);
    let widgetRegistry   = new("tt_TargetWidgetRegistry").init(visibilityFilter);
    let widgetSorter     = new("tt_SorterByDistance"    ).init(widgetRegistry, originSource);

    let manualModeSource  = new("tt_SettableMode").init();
    let modeSwitcher      = new("tt_ModeSwitcher").init(manualModeSource);

    let rightTurner  = new("tt_RightTurner" ).init(playerSource);
    let leftTurner   = new("tt_LeftTurner"  ).init(playerSource);
    let activatables = new("tt_Activatables").init();
    activatables.add(modeSwitcher);
    activatables.add(rightTurner);
    activatables.add(leftTurner);

    let commandDispatcher = new("tt_CommandDispatcher").init(playerInput, activatables);

    let modeSources = new("tt_ModeSources").init();
    modeSources.add(manualModeSource);
    modeSources.add(autoModeSource);
    let modeCascade = new("tt_ModeCascade").init(modeSources);

    let views         = new("tt_Views"        ).init();
    let targetOverlay = new("tt_TargetOverlay").init(widgetSorter, playerInput, settings);
    let infoPanel     = new("tt_InfoPanel"    ).init( modeCascade
                                                    , playerInput
                                                    , commandDispatcher
                                                    , targetRegistry
                                                    , settings
                                                    , playerSource
                                                    );
    let conditionalView = new("tt_ConditionalView").init(views);
    views.add(targetOverlay);
    views.add(infoPanel);

    let inputManager = new("tt_InputByModeManager").init(modeCascade, playerInput);

    // Initialize attributes ///////////////////////////////////////////////////

    _playerInput        = playerInput;
    _deathReporter      = deathReporter;
    _targetRegistry     = targetRegistry;
    _view               = conditionalView;
    _modeSource         = modeCascade;
    _damager            = damager;
    _targetWidgetSource = projector;
    _targetOriginSource = targetOriginSource;
    _commandDispatcher  = commandDispatcher;
    _manualModeSource   = manualModeSource;
    _inputManager       = inputManager;

    return self;
  }

// public: /////////////////////////////////////////////////////////////////////

  override
  void processKey(tt_Character character)
  {
    _playerInput.processKey(character);
  }

  override
  void tick()
  {
    _targetRegistry.update();
    _targetOriginSource.update();
    _damager.damage();
    _targetWidgetSource.prepare();
    _commandDispatcher.activate();
    _inputManager.manageInput();
  }

  override
  void reportDead(Actor dead)
  {
    _deathReporter.reportDead(dead);
  }

  override
  bool isCapturingKeys()
  {
    return _inputManager.isCapturingKeys();
  }

  override
  void unlockMode()
  {
    _manualModeSource.setMode(tt_Mode.MODE_NONE);
  }

// public: // ui ///////////////////////////////////////////////////////////////

  override
  void draw(RenderEvent event)
  {
    _view.draw(event);
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  tt_Aimer makeAimer( tt_OriginSource targetOriginSource
                    , tt_PlayerSource playerSource
                    , tt_Settings     settings
                    )
  {
    let horizontalAimer = new("tt_HorizontalAimer").init(targetOriginSource, playerSource);
    let verticalAimer = new("tt_VerticalAimer").init(targetOriginSource, playerSource, settings);
    let aimer         = new("tt_Aimers"       ).init();
    aimer.add(horizontalAimer);
    aimer.add(verticalAimer);

    return aimer;
  }

  private
  tt_QuestionSource makeQuestionSource(tt_DifficultySource difficultySource, tt_Settings settings)
  {
    let letterSource   = new("tt_RandomLetterSource"    ).init(difficultySource);
    let numberSource   = new("tt_RandomNumberSource"    ).init(difficultySource);
    let selectedSource = new("tt_SelectedQuestionSource").init(settings);
    let gzdoomSource   = new("tt_StringSet"             ).init("tt_gzdoom");
    let cppSource      = new("tt_StringSet"             ).init("tt_cpp");
    let mathsSource    = new("tt_MathsChallenge"        ).init();
    let english1000    = new("tt_StringSet"             ).init("tt_1000");
    let russian1000    = new("tt_StringSet"             ).init("tt_1000_ru");

    // Attention! Keep this list consistent with menudef entries.
    selectedSource.add(letterSource);
    selectedSource.add(numberSource);
    selectedSource.add(gzdoomSource);
    selectedSource.add(cppSource   );
    selectedSource.add(mathsSource );
    selectedSource.add(english1000 );
    selectedSource.add(russian1000 );

    return selectedSource;
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_AnswerSource       _playerInput;
  private tt_KnownTargetSource  _targetRegistry;
  private tt_DeathReporter      _deathReporter;
  private tt_View               _view;
  private tt_ModeSource         _modeSource;
  private tt_Damager            _damager;
  private tt_TargetWidgetSource _targetWidgetSource;
  private tt_OriginSource       _targetOriginSource;
  private tt_CommandDispatcher  _commandDispatcher;
  private tt_ModeStorage        _manualModeSource;
  private tt_InputManager       _inputManager;

} // class tt_PlayerSupervisor
