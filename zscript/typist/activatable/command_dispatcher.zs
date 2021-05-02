/* Copyright Alexander 'm8f' Kromm (mmaulwurff@gmail.com) 2019-2021
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
 *  This class contains Activatables and activates() ones with commands matching
 *  answer.
 */
class tt_CommandDispatcher : tt_Activatable
{

  static
  tt_CommandDispatcher of( tt_AnswerSource       answerSource
                         , Array<tt_Activatable> activatables
                         , tt_CommandSettings    settings
                         , tt_AnswerReporter     answerReporter
                         , tt_AnswerStateSource  answerStateSource
                         , tt_Settings           globalSettings
                         )
  {
    let result = new("tt_CommandDispatcher"); // construct

    result._answerSource      = answerSource;
    result._activatables.Copy(activatables);
    result._settings          = settings;
    result._answerReporter    = answerReporter;
    result._answerStateSource = answerStateSource;
    result._globalSettings    = globalSettings;

    return result;
  }

// public: // tt_Activatable ///////////////////////////////////////////////////

  override
  void activate()
  {
    let answerState = _answerStateSource.getAnswerState();
    if (!answerState.isReady() && !_globalSettings.isFastConfirmation()) { return; }

    let answer       = _answerSource.getAnswer();
    let answerString = answer.getString();

    uint nActivatables = _activatables.size();
    for (uint i = 0; i < nActivatables; ++i)
    {
      let  activatable = _activatables[i];
      bool isActivated = tryActivate(activatable, answerString);

      if (isActivated)
      {
        _answerReporter.reportMatch();
        _answerSource.reset();
        _answerStateSource.reset();
        return;
      }
    }
  }

  override
  tt_Strings getCommands()
  {
    let result = tt_Strings.of();

    uint nActivatables = _activatables.size();
    for (uint i = 0; i < nActivatables; ++i)
    {
      let activatable = _activatables[i];

      if (!activatable.isVisible()) { continue; }

      let commands = activatable.getCommands();

      uint nCommands = commands.size();
      for (uint c = 0; c < nCommands; ++c)
      {
        String command         = commands.at(c);
        String prefixedCommand = makePrefixedCommand(command);

        result.add(prefixedCommand);
      }
    }

    return result;
  }

  override
  bool isVisible()
  {
    return true;
  }

// private: ////////////////////////////////////////////////////////////////////

  private play
  bool tryActivate(tt_Activatable activatable, String answer)
  {
    let commands = activatable.getCommands();

    uint nCommands = commands.size();
    for (uint c = 0; c < nCommands; ++c)
    {
      String command         = commands.at(c);
      String prefixedCommand = makePrefixedCommand(command);
      bool   isMatching      = (prefixedCommand == answer);

      if (isMatching)
      {
        activatable.activate();
        return true;
      }
    }

    return false;
  }

  private
  String makePrefixedCommand(String command)
  {
    String prefix          = _settings.getCommandPrefix();
    String prefixedCommand = String.Format("%s%s", prefix, command);

    return prefixedCommand;
  }

  private tt_AnswerSource       _answerSource;
  private Array<tt_Activatable> _activatables;
  private tt_CommandSettings    _settings;
  private tt_AnswerReporter     _answerReporter;
  private tt_AnswerStateSource  _answerStateSource;
  private tt_Settings           _globalSettings;

} // class tt_CommandDispatcher
