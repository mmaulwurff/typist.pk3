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

/** This class implements tt_AnswerSource by receiving player key inputs and
 * composing an answer from them.
 */
class tt_PlayerInput : tt_AnswerSource
{

// public: /////////////////////////////////////////////////////////////////////

  tt_PlayerInput init() { return self; }

// public: /////////////////////////////////////////////////////////////////////

  void processKey(tt_Character character)
  {
    int type = character.getType();
    switch (type)
    {
    case tt_Character.NONE: break;
    case tt_Character.PRINTABLE: _answer = _answer .. character.getCharacter(); break;
    case tt_Character.BACKSPACE: _answer.DeleteLastCharacter(); break;
    }
  }

// public: // tt_AnswerSource //////////////////////////////////////////////////

  override
  tt_Answer getAnswer()
  {
    let result = new("tt_Answer").init(_answer);
    return result;
  }

  override
  void reset()
  {
    _answer = "";
  }

// private: ////////////////////////////////////////////////////////////////////

  private String _answer;

} // class tt_PlayerInput
