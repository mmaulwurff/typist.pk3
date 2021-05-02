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
 * This class represents a character.
 */
class tt_Character
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_Character of(int type, int code, bool isCtrl)
  {
    let result = new("tt_Character"); // construct

    result._eventType = type;
    //tt_Log.log("type: %d, code: %d", type, code);

    // Normally, KeyUp events aren't registered, but releasing Enter or Space
    // key has special meaning, important for Hold Fire feature.
    if (type == UiEvent.Type_KeyUp && (code == tt_Ascii.Enter || code == tt_Ascii.Space))
    {
      result._type = ENTER_UP;
      return result;
    }

    bool isChar    = (type == UiEvent.Type_Char);
    bool isDown    = (type == UiEvent.Type_KeyDown);
    bool isRepeat  = (type == UiEvent.Type_KeyRepeat);
    bool isControl = (code == tt_Ascii.Backspace
                   || code == tt_Ascii.Enter
                   || code == tt_Ascii.Space
                   || code == tt_Ascii.Escape);

    if (!isChar && !((isDown || isRepeat) && isControl))
    {
      result._type = NONE;
      return result;
    }

    if      (code == tt_Ascii.Backspace) { result._type = (isCtrl ? CTRL_BACKSPACE : BACKSPACE); }
    else if (code == tt_Ascii.Delete   )       { result._type = CTRL_BACKSPACE; }
    else if (code == tt_Ascii.Enter    )       { result._type = ENTER;          }
    else if (code == tt_Ascii.Space    )       { result._type = ENTER;          }
    else if (code == tt_Ascii.Escape   )       { result._type = ESCAPE;         }
    else if (code <  tt_Ascii.FIRST_PRINTABLE) { result._type = NONE;           }
    else
    {
      result._type      = PRINTABLE;
      result._character = String.Format("%c", code);
    }

    return result;
  }

// public: /////////////////////////////////////////////////////////////////////

  enum _
  {
    NONE,
    PRINTABLE,
    BACKSPACE,
    CTRL_BACKSPACE,
    ENTER,
    ENTER_UP,
    ESCAPE,
  }

  int getType() const { return _type; }

  String getCharacter() const { return _character; }

  int getEventType() const { return _eventType; }

// private: ////////////////////////////////////////////////////////////////////

  static
  bool isUppercaseLetter(int code)
  {
    bool isBig = (tt_Ascii.UppercaseA <= code && code <= tt_Ascii.UppercaseZ);
    return isBig;
  }

  static
  bool isLowercaseLetter(int code)
  {
    bool isSmall = (tt_Ascii.LowercaseA <= code && code <= tt_Ascii.LowercaseZ);
    return isSmall;
  }

// private: ////////////////////////////////////////////////////////////////////

  private int    _type;
  private String _character;
  private int    _eventType;

} // class tt_Key
