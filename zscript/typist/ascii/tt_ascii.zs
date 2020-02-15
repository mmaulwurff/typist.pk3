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
 * The sole purpose of this class is to act as a namespace for ASCII table enum.
 *
 * https://en.cppreference.com/w/cpp/language/ascii
 */
class tt_Ascii
{

// public: /////////////////////////////////////////////////////////////////////

  enum AsciiTable
  {
    Nul        =   0,

    EndOfText  =   3,
    Backspace  =   8,
    Enter      =  13, // also known as carriage return
    Escape     =  27,

    Space      =  32,

    Number0    =  48,
    Number1    =  49,
    Number2    =  50,
    Number3    =  51,
    Number4    =  52,
    Number5    =  53,
    Number6    =  54,
    Number7    =  55,
    Number8    =  56,
    Number9    =  57,

    UppercaseA =  65,
    UppercaseZ =  90,

    LowercaseA =  97,
    LowercaseZ = 122,

    Delete     = 127,

    End        = 128
  }

  const CASE_DIFFERENCE = LowercaseA - UppercaseA;
  const FIRST_PRINTABLE = SPACE;

} // class tt_Ascii
