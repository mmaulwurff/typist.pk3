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

  static
  tt_PlayerSupervisor of(int playerNumber)
  {
    let playerSource     = tt_PlayerSourceImpl.of(playerNumber);
    let clock            = tt_TotalClock      .of();

    let soundSettings    = tt_SoundSettingsImpl.of(playerSource);
    let soundPlayer      = tt_PlayerSoundPlayer.of(playerSource, soundSettings);

    let answerReporter   = tt_SoundAnswerReporter  .of(soundPlayer);
    let modeReporter     = tt_SoundModeReporter    .of(soundPlayer);
    let keyPressReporter = tt_SoundKeyPressReporter.of(soundPlayer, soundSettings);

    let manualModeSource = tt_SettableMode     .of();
    let playerInput      = tt_PlayerInput      .of(manualModeSource, keyPressReporter);
    let deathReporter    = tt_DeathReporter    .of();
    let settings         = tt_SettingsImpl     .of(playerSource);

    let originSource     = tt_PlayerOriginSource.of(playerSource);
    let targetRadar      = tt_TargetRadar       .of(originSource);
    let radarStaleMarker = tt_StaleMarkerImpl   .of(clock);
    let radarCache       = tt_TargetSourceCache .of(targetRadar, radarStaleMarker);
    let questionSource   = makeQuestionSource(settings, playerSource);

    let targetRegistry = makeTargetRegistry(radarCache, questionSource, deathReporter, clock);

    let answerStateSource  = tt_PressedAnswerState.of();
    let targetOriginSource = makeTargetOriginSource( targetRegistry
                                                   , playerInput
                                                   , playerSource
                                                   , clock
                                                   , answerStateSource
                                                   , answerReporter
                                                   , settings
                                                   );

    let aimer              = makeAimer(targetOriginSource, playerSource, settings);
    let firer              = tt_FirerImpl.of(playerSource);
    let damager            = tt_Gunner   .of(targetOriginSource, aimer, firer);

    let projector        = tt_Projector           .of(targetRegistry, playerSource);
    let visibilityFilter = tt_VisibilityFilter    .of(projector, playerSource);
    let widgetRegistry   = tt_TargetWidgetRegistry.of(visibilityFilter);
    let widgetSorter     = tt_SorterByDistance    .of(widgetRegistry, originSource);

    let commandSettings = tt_CommandSettingsImpl.of(playerSource);
    Array<tt_Activatable> commands;
    makeCommands(playerSource, commandSettings, commands);
    let commandDispatcher = tt_CommandDispatcher.of( playerInput
                                                   , commands
                                                   , commandSettings
                                                   , answerReporter
                                                   , answerStateSource
                                                   );

    let modeSource = makeModeSource( targetRegistry
                                   , playerSource
                                   , manualModeSource
                                   , modeReporter
                                   , clock
                                   , radarCache
                                   );

    let oldModeSource         = tt_SettableMode.of();
    let inputBlockAfterCombat = tt_InputBlockAfterCombat.of(playerInput, modeSource, oldModeSource);

    let views         = tt_Views.of();
    let targetOverlay = tt_TargetOverlay.of( widgetSorter
                                           , playerInput
                                           , settings
                                           , modeSource
                                           );
    let infoPanel     = tt_InfoPanel.of( modeSource
                                       , playerInput
                                       , commandDispatcher
                                       , targetRegistry
                                       , settings
                                       , playerSource
                                       );
    let conditionalView = tt_ConditionalView.of(views);
    views.add(targetOverlay);
    views.add(infoPanel);

    let inputManager = tt_InputByModeManager.of(modeSource, playerInput);

    let projectileSpeedController = tt_ProjectileSpeedController.of(originSource, playerSource);
    let enemySpeedController      = tt_EnemySpeedController     .of(radarCache);

    let answerResetter = tt_AnswerResetter.of(answerStateSource, playerInput);
    let matchWatcher   = tt_MatchWatcher.of(answerStateSource, answerReporter, targetOriginSource);

    Array<tt_WorldChanger> worldChangers;
    worldChangers.push(damager);
    worldChangers.push(projectileSpeedController);
    worldChangers.push(enemySpeedController);
    worldChangers.push(answerResetter);
    worldChangers.push(matchWatcher);
    let worldChanger = tt_WorldChangers.of(worldChangers);

    Array<tt_KeyProcessor> keyProcessors;
    keyProcessors.Push(inputBlockAfterCombat);
    keyProcessors.Push(answerStateSource);
    let keyProcessor = tt_KeyProcessors.of(keyProcessors);

    // Initialize attributes ///////////////////////////////////////////////////

    let result = new("tt_PlayerSupervisor"); // construct

    result._keyProcessor       = keyProcessor;
    result._deathReporter      = deathReporter;
    result._targetRegistry     = targetRegistry;
    result._view               = conditionalView;
    result._modeSource         = modeSource;
    result._targetWidgetSource = projector;
    result._commandDispatcher  = commandDispatcher;
    result._manualModeSource   = manualModeSource;
    result._inputManager       = inputManager;
    result._oldModeSource      = oldModeSource;
    result._inputBlockAfterCombat = inputBlockAfterCombat;
    result._worldChanger       = worldChanger;

    return result;
  }

// public: /////////////////////////////////////////////////////////////////////

  override
  void processKey(tt_Character character)
  {
    _keyProcessor.processKey(character);
  }

  override
  void tick()
  {
    _commandDispatcher.activate();
    _inputManager.manageInput();

    _inputBlockAfterCombat.update();
    _oldModeSource.setMode(_modeSource.getMode());

    _worldChanger.changeWorld();
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

  override
  void forceCombat()
  {
    _manualModeSource.setMode(tt_Mode.Combat);
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
    let horizontalAimer = tt_HorizontalAimer.of(targetOriginSource, playerSource);
    let verticalAimer = tt_VerticalAimer.of(targetOriginSource, playerSource, settings);
    let aimer         = tt_Aimers.of();
    aimer.add(horizontalAimer);
    aimer.add(verticalAimer);

    return aimer;
  }

  /**
   * @attention See docs/adding.of-lesson.md before editing this function.
   */
  private static
  tt_QuestionSource makeQuestionSource(tt_Settings settings, tt_PlayerSource playerSource)
  {
    let randomLessonSettings = tt_RandomCharactersLessonSettingsImpl.of(playerSource);

    let randomSource   = tt_RandomCharactersLesson.of(randomLessonSettings);
    let selectedSource = tt_SelectedQuestionSource.of(settings);
    let gzdoomSource   = tt_StringSet.of("tt_gzdoom");
    let cppSource      = tt_StringSet.of("tt_cpp");
    let mathsSource    = tt_MathsLesson.of();
    let english1000    = tt_StringSet.of("tt_1000");
    let russian1000    = tt_StringSet.of("tt_1000_ru");
    let customLesson   = tt_CustomLesson.of();
    let nixLesson      = tt_StringSet.of("tt_nix");

    let mixedLesson    = tt_MixedLesson.of(settings);

    selectedSource.add(randomSource);
    selectedSource.add(gzdoomSource);
    selectedSource.add(cppSource   );
    selectedSource.add(mathsSource );
    selectedSource.add(english1000 );
    selectedSource.add(russian1000 );
    selectedSource.add(mixedLesson );
    selectedSource.add(customLesson);
    selectedSource.add(nixLesson   );

    mixedLesson.add(randomSource);
    mixedLesson.add(gzdoomSource);
    mixedLesson.add(cppSource   );
    mixedLesson.add(mathsSource );
    mixedLesson.add(english1000 );
    mixedLesson.add(russian1000 );
    mixedLesson.add(customLesson);
    mixedLesson.add(nixLesson   );

    return selectedSource;
  }

  private static
  void makeCommands( tt_PlayerSource    playerSource
                   , tt_CommandSettings settings
                   , out Array<tt_Activatable> activatables
                   )
  {
    activatables.Push(tt_Sphinx       .of());
    activatables.Push(tt_Reloader     .of(playerSource, settings));

    activatables.Push(tt_RightDasher  .of(playerSource, settings));
    activatables.Push(tt_LeftDasher   .of(playerSource, settings));
    activatables.Push(tt_BackDasher   .of(playerSource, settings));
    activatables.Push(tt_ForwardDasher.of(playerSource, settings));
  }

  private static
  tt_ModeSource makeModeSource( tt_KnownTargetSource knownTargetSource
                              , tt_PlayerSource      playerSource
                              , tt_ModeSource        manualModeSource
                              , tt_ModeReporter      modeReporter
                              , tt_Clock             clock
                              , tt_TargetSource      targetSource
                              )
  {
    let autoModeSource          = tt_AutoModeSource.of(knownTargetSource, playerSource);
    let delayedCombatModeSource = tt_DelayedCombatModeSource.of( clock
                                                               , autoModeSource
                                                               , targetSource
                                                               );
    Array<tt_ModeSource> modeSources;
    modeSources.Push(manualModeSource);
    modeSources.Push(delayedCombatModeSource);
    modeSources.Push(autoModeSource);

    let cascade  = tt_ModeCascade.of(modeSources);
    let reporter = tt_ReportedModeSource.of(modeReporter, cascade);

    return reporter;
  }

  private static
  tt_OriginSource makeTargetOriginSource( tt_KnownTargetSource targetSource
                                        , tt_AnswerSource      answerSource
                                        , tt_PlayerSource      playerSource
                                        , tt_Clock             clock
                                        , tt_AnswerStateSource answerStateSource
                                        , tt_AnswerReporter    answerReporter
                                        , tt_Settings          settings
                                        )
  {
    let pressMatcher = tt_QuestionAnswerMatcher.of( targetSource
                                                  , answerSource
                                                  , playerSource
                                                  , answerStateSource
                                                  );
    let hastyMatcher = tt_HastyQuestionAnswerMatcher.of( targetSource
                                                       , answerSource
                                                       , playerSource
                                                       , answerReporter
                                                       );
    let selector    = tt_SelectableOriginSource.of(hastyMatcher, pressMatcher, settings);
    let staleMarker = tt_StaleMarkerImpl  .of(clock);
    let result      = tt_OriginSourceCache.of(selector, staleMarker);

    return result;
  }

  private static
  tt_KnownTargetSource makeTargetRegistry( tt_TargetSource   targetSource
                                         , tt_QuestionSource questionSource
                                         , tt_TargetSource   deathReporter
                                         , tt_Clock          clock
                                         )
  {
    let registry      = tt_TargetRegistry .of(targetSource, questionSource, deathReporter);
    let staleMarker   = tt_StaleMarkerImpl.of(clock);
    let registryCache = tt_KnownTargetSourceCache.of(registry, staleMarker);

    return registryCache;
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_KeyProcessor       _keyProcessor;
  private tt_KnownTargetSource  _targetRegistry;
  private tt_DeathReporter      _deathReporter;
  private tt_View               _view;
  private tt_ModeSource         _modeSource;
  private tt_TargetWidgetSource _targetWidgetSource;
  private tt_CommandDispatcher  _commandDispatcher;
  private tt_ModeStorage        _manualModeSource;
  private tt_InputManager       _inputManager;
  private tt_SettableMode       _oldModeSource;
  private tt_InputBlockAfterCombat _inputBlockAfterCombat;
  private tt_WorldChanger       _worldChanger;

} // class tt_PlayerSupervisor
