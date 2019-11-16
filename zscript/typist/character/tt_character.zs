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
 * This class represents a character.
 */
class tt_Character
{

// public: /////////////////////////////////////////////////////////////////////

  tt_Character init(int type, int code, bool isShift, bool isCtrl)
  {
    //Console.Printf("type: %d, code: %d, string: %s", type, code, event.keyString);

    if (type == UiEvent.Type_KeyUp && code == tt_Ascii.Enter)
    {
      type = UiEvent.Type_KeyDown;
      code = tt_Ascii.EndOfText;
    }

    bool isChar    = (type == UiEvent.Type_Char);
    bool isDown    = (type == UiEvent.Type_KeyDown);
    bool isControl = (code == tt_Ascii.Backspace
                   || code == tt_Ascii.Enter
                   || code == tt_Ascii.EndOfText);

    if (!isChar && !(isDown && isControl))
    {
      _type = NONE;
      return self;
    }

    if      (code == tt_Ascii.Backspace)       { _type = (isCtrl ? CTRL_BACKSPACE : BACKSPACE); }
    else if (code == tt_Ascii.Delete   )       { _type = CTRL_BACKSPACE; }
    else if (code == tt_Ascii.Enter    )       { _type = ENTER;    }
    else if (code == tt_Ascii.EndOfText)       { _type = ENTER_UP; }
    else if (code <  tt_Ascii.FIRST_PRINTABLE) { _type = NONE;     }
    else
    {
      _type = PRINTABLE;

      if (isShift) { if (isLowercaseLetter(code)) { code -= tt_Ascii.CASE_DIFFERENCE; } }
      else         { if (isUppercaseLetter(code)) { code += tt_Ascii.CASE_DIFFERENCE; } }

      _character = String.Format("%c", code);
    }

    return self;
  }

// public: /////////////////////////////////////////////////////////////////////

  enum CHARACTER_TYPES
  {
    NONE,
    PRINTABLE,
    BACKSPACE,
    CTRL_BACKSPACE,
    ENTER,
    ENTER_UP,
  }

  int getType() const { return _type; }

  String getCharacter() const { return _character; }

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

} // class tt_Key
