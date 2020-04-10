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
 * This class implements tt_AnswerStateSource interface by selecting one of the
 * dependency instances of tt_AnswerStateSource according to Cvar value.
 */
class tt_AnswerStateSourceSelector : tt_AnswerStateSource
{

// public: /////////////////////////////////////////////////////////////////////

  /**
   * @note order in @a answerStateSources is important.
   */
  static
  tt_AnswerStateSourceSelector of( Array<tt_AnswerStateSource> answerStateSources
                                 , tt_PlayerSource             playerSource
                                 )
  {
    let result = new("tt_AnswerStateSourceSelector"); // construct

    result._answerStateSources.Copy(answerStateSources);
    result._selectorCvar = tt_Cvar.of(playerSource, "tt_confirm_type");

    return result;
  }

// public: // tt_AnswerStateSource /////////////////////////////////////////////

  override
  void processKey(tt_Character character)
  {
    let source = getCurrentAnswerSource();

    if (source != NULL)
    {
      source.processKey(character);
    }
  }

  override
  tt_AnswerState getAnswerState()
  {
    let source = getCurrentAnswerSource();
    let result = (source != NULL)
               ? source.getAnswerState()
               : NULL;

    return result;
  }

// private: ////////////////////////////////////////////////////////////////////

  tt_AnswerStateSource getCurrentAnswerSource()
  {
    int selectedSourceIndex = _selectorCvar.getInt();

    if (selectedSourceIndex >= _answerStateSources.size())
    {
      tt_Log.log("Invalid answer state source!");
      return NULL;
    }

    return _answerStateSources[selectedSourceIndex];
  }

// private: ////////////////////////////////////////////////////////////////////

  private Array<tt_AnswerStateSource> _answerStateSources;
  private tt_Cvar _selectorCvar;

} // class tt_AnswerStateSourceSelector
