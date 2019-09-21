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

  tt_Character init(int code, bool isShift, bool isCtrl)
  {
    if (code == 8)
    {
      _type = (isCtrl ? CTRL_BACKSPACE : BACKSPACE);
    }
    else if (code <= 31)
    {
      _type = NONE;
    }
    else
    {
      _type = PRINTABLE;

      if (isShift) { if (isSmallLetter(code)) { code -= 32; } }
      else         { if (isBigLetter  (code)) { code += 32; } }

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
  }

  int getType() const { return _type; }

  String getCharacter() const { return _character; }

// private: ////////////////////////////////////////////////////////////////////

  static
  bool isBigLetter(int code)
  {
    // 65 - 'A'
    // 90 - 'Z'
    bool isBig = (65 <= code && code <= 90);
    return isBig;
  }

  static
  bool isSmallLetter(int code)
  {
    //  97 - 'a'
    // 122 - 'z'
    bool isSmall = (97 <= code && code <= 122);
    return isSmall;
  }

// private: ////////////////////////////////////////////////////////////////////

  private int    _type;
  private String _character;

} // class tt_Key
