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

/** This class contains Activatables and activates() ones with commands matching
 *  answer.
 */
class tt_CommandDispatcher : tt_Activatable
{

// public: /////////////////////////////////////////////////////////////////////

  tt_CommandDispatcher init(tt_AnswerSource answerSource, tt_Activatables activatables)
  {
    _answerSource = answerSource;
    _activatables = activatables;

    return self;
  }

// public: // tt_Activatable ///////////////////////////////////////////////////

  override
  void activate()
  {
    let answer       = _answerSource.getAnswer();
    let answerString = answer.getString();

    uint nActivatables = _activatables.size();
    for (uint i = 0; i < nActivatables; ++i)
    {
      let activatable = _activatables.at(i);

      tryActivate(activatable, answerString);
    }
  }

  override
  tt_Strings getCommands()
  {
    let result = new("tt_Strings").init();

    uint nActivatables = _activatables.size();
    for (uint i = 0; i < nActivatables; ++i)
    {
      let activatable = _activatables.at(i);
      let commands    = activatable.getCommands();

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

  void tryActivate(tt_Activatable activatable, String answer)
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
        _answerSource.reset();
        return;
      }
    }
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_AnswerSource _answerSource;
  private tt_Activatables _activatables;

} // class tt_CommandDispatcher
