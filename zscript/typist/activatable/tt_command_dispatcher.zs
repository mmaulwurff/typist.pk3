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

/** This class contains Activatables and activates() ones with commands matching
 *  answer.
 */
class tt_CommandDispatcher : tt_Activatable
{

// public: /////////////////////////////////////////////////////////////////////

  tt_CommandDispatcher init(tt_AnswerSource answerSource, Array<tt_Activatable> activatables)
  {
    _answerSource = answerSource;
    _activatables.copy(activatables);

    return self;
  }

// public: // tt_Activatable ///////////////////////////////////////////////////

  override
  void activate()
  {
    let answer = _answerSource.getAnswer();
    if (!answer.isFinished()) { return; }

    let answerString = answer.getString();

    uint nActivatables = _activatables.size();
    bool isActivated = false;
    for (uint i = 0; i < nActivatables; ++i)
    {
      let activatable = _activatables[i];

      isActivated = tryActivate(activatable, answerString);

      if (isActivated)
      {
        break;
      }
    }

    if (isActivated)
    {
      let reset = new("tt_Character").init(UiEvent.Type_CHAR, tt_Ascii.Backspace, true);
      _answerSource.processKey(reset);
    }
  }

  override
  tt_Strings getCommands()
  {
    let result = new("tt_Strings").init();

    uint nActivatables = _activatables.size();
    for (uint i = 0; i < nActivatables; ++i)
    {
      let activatable = _activatables[i];

      if (!activatable.isVisible()) { continue; }

      let commands = activatable.getCommands();

      uint nCommands = commands.size();
      for (uint c = 0; c < nCommands; ++c)
      {
        let command = commands.at(c);

        result.add(command);
      }
    }

    return result;
  }

// private: ////////////////////////////////////////////////////////////////////

  play
  bool tryActivate(tt_Activatable activatable, String answer)
  {
    let commands = activatable.getCommands();

    uint nCommands = commands.size();
    for (uint c = 0; c < nCommands; ++c)
    {
      String command    = commands.at(c);
      bool   isMatching = (command == answer);

      if (isMatching)
      {
        activatable.activate();
        return true;
      }
    }

    return false;
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_AnswerSource       _answerSource;
  private Array<tt_Activatable> _activatables;

} // class tt_CommandDispatcher
