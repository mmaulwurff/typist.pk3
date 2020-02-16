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
 * This class handles Typist.pk3 features for one player.
 */
class tt_PlayerSupervisor : tt_PlayerHandler
{

// public: /////////////////////////////////////////////////////////////////////

  tt_PlayerSupervisor init(int playerNumber)
  {
    let manualModeSource = new("tt_SettableMode" ).init();
    let playerInput      = new("tt_PlayerInput"  ).init(manualModeSource);
    let deathReporter    = new("tt_DeathReporter").init();

    let difficultySource = new("tt_SelectedDifficulty").init();
    let playerSource     = new("tt_PlayerSourceImpl"  ).init(playerNumber);
    let settings         = new("tt_SettingsImpl"      ).init(playerSource);

    let originSource     = new("tt_PlayerOriginSource").init(playerSource);
    let targetRadar      = new("tt_TargetRadar"       ).init(originSource);
    let questionSource   = makeQuestionSource(difficultySource, settings);

    let targetRegistry = new("tt_TargetRegistry").init(targetRadar, questionSource, deathReporter);

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

    Array<tt_Activatable> commands;
    makeCommands(playerSource, commands);
    let commandDispatcher = new("tt_CommandDispatcher").init(playerInput, commands, settings);

    let modeSource = makeModeSource(targetRegistry, playerSource, manualModeSource);

    let oldModeSource = new("tt_SettableMode").init();
    let inputBlockAfterCombat = new("tt_InputBlockAfterCombat").init( playerInput
                                                                    , modeSource
                                                                    , oldModeSource
                                                                    );

    let views         = new("tt_Views"        ).init();
    let targetOverlay = new("tt_TargetOverlay").init( widgetSorter
                                                    , playerInput
                                                    , settings
                                                    , modeSource
                                                    );
    let infoPanel     = new("tt_InfoPanel"    ).init( modeSource
                                                    , playerInput
                                                    , commandDispatcher
                                                    , targetRegistry
                                                    , settings
                                                    , playerSource
                                                    );
    let conditionalView = new("tt_ConditionalView").init(views);
    views.add(targetOverlay);
    views.add(infoPanel);

    let inputManager = new("tt_InputByModeManager").init(modeSource, playerInput);

    let projectileSpeedController =
      new("tt_ProjectileSpeedController").init(originSource, playerSource);
    let enemySpeedController =
      new("tt_EnemySpeedController").init(targetRadar);

    // Initialize attributes ///////////////////////////////////////////////////

    _playerInput        = inputBlockAfterCombat;
    _deathReporter      = deathReporter;
    _targetRegistry     = targetRegistry;
    _view               = conditionalView;
    _modeSource         = modeSource;
    _damager            = damager;
    _targetWidgetSource = projector;
    _targetOriginSource = targetOriginSource;
    _commandDispatcher  = commandDispatcher;
    _manualModeSource   = manualModeSource;
    _inputManager       = inputManager;
    _oldModeSource      = oldModeSource;
    _inputBlockAfterCombat = inputBlockAfterCombat;

    _projectileSpeedController = projectileSpeedController;
    _enemySpeedController      = enemySpeedController;

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

    _inputBlockAfterCombat.update();
    _oldModeSource.setMode(_modeSource.getMode());

    _projectileSpeedController.changeWorld();
    _enemySpeedController.changeWorld();
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
    _manualModeSource.setMode(tt_Mode.None);
  }

// public: // ui ///////////////////////////////////////////////////////////////

  override
  void draw(RenderEvent event)
  {
    _view.draw(event);
  }

// private: ////////////////////////////////////////////////////////////////////

  private static
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

  /**
   * @attention See docs/adding-new-lesson.md before editing this function.
   */
  private static
  tt_QuestionSource makeQuestionSource(tt_DifficultySource difficultySource, tt_Settings settings)
  {
    let letterSource   = new("tt_RandomLetterSource"    ).init(difficultySource);
    let numberSource   = new("tt_RandomNumberSource"    ).init(difficultySource);
    let selectedSource = new("tt_SelectedQuestionSource").init(settings);
    let gzdoomSource   = new("tt_StringSet"             ).init("tt_gzdoom");
    let cppSource      = new("tt_StringSet"             ).init("tt_cpp");
    let mathsSource    = new("tt_MathsLesson"           ).init();
    let english1000    = new("tt_StringSet"             ).init("tt_1000");
    let russian1000    = new("tt_StringSet"             ).init("tt_1000_ru");
    let customLesson   = new("tt_CustomLesson"          ).init();

    let mixedLesson    = new("tt_MixedLesson").init(settings);

    selectedSource.add(letterSource);
    selectedSource.add(numberSource);
    selectedSource.add(gzdoomSource);
    selectedSource.add(cppSource   );
    selectedSource.add(mathsSource );
    selectedSource.add(english1000 );
    selectedSource.add(russian1000 );
    selectedSource.add(mixedLesson );
    selectedSource.add(customLesson);

    mixedLesson.add(letterSource);
    mixedLesson.add(numberSource);
    mixedLesson.add(gzdoomSource);
    mixedLesson.add(cppSource   );
    mixedLesson.add(mathsSource );
    mixedLesson.add(english1000 );
    mixedLesson.add(russian1000 );
    mixedLesson.add(customLesson);

    return selectedSource;
  }

  private static
  void makeCommands(tt_PlayerSource playerSource, out Array<tt_Activatable> activatables)
  {
    activatables.push(new("tt_RightTurner"  ).init(playerSource));
    activatables.push(new("tt_LeftTurner"   ).init(playerSource));
    activatables.push(new("tt_Sphinx"       ).init());
    activatables.push(new("tt_RightDasher"  ).init(playerSource));
    activatables.push(new("tt_LeftDasher"   ).init(playerSource));
    activatables.push(new("tt_ForwardDasher").init(playerSource));
    activatables.push(new("tt_BackDasher"   ).init(playerSource));
  }

  private static
  tt_ModeSource makeModeSource( tt_KnownTargetSource knownTargetSource
                              , tt_PlayerSource      playerSource
                              , tt_ModeSource        manualModeSource
                              )
  {
    let clock = new("tt_TotalClock").init();

    let autoModeSource          = new("tt_AutoModeSource").init(knownTargetSource, playerSource);
    let delayedCombatModeSource = new("tt_DelayedCombatModeSource").init(clock, autoModeSource);

    Array<tt_ModeSource> modeSources;
    modeSources.Push(manualModeSource);
    modeSources.Push(delayedCombatModeSource);
    modeSources.Push(autoModeSource);
    let result = new("tt_ModeCascade").init(modeSources);

    return result;
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
  private tt_SettableMode       _oldModeSource;
  private tt_InputBlockAfterCombat _inputBlockAfterCombat;

  private tt_ProjectileSpeedController _projectileSpeedController;
  private tt_EnemySpeedController      _enemySpeedController;

} // class tt_PlayerSupervisor
