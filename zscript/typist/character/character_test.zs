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

/** This is a test for Character.
 */
class tt_CharacterTest : tt_Clematis
{

// public: // tt_Clematis //////////////////////////////////////////////////////

  override
  void TestSuites()
  {
    Describe("Checking Character");

    {
      let smallA = tt_Character.of(TYPE_CHAR, tt_Ascii.LowercaseA, false);
      It("Small character", Assert(smallA.getType() == tt_Character.PRINTABLE));
      It("Small character", Assert(smallA.getCharacter() == "a"));
    }

    {
      let bigA = tt_Character.of(TYPE_CHAR, tt_Ascii.UppercaseA, false);
      It("Big character", Assert(bigA.getType() == tt_Character.PRINTABLE));
      It("Big character", Assert(bigA.getCharacter() == "A"));
    }

    {
      let number = tt_Character.of(TYPE_CHAR, tt_Ascii.Number4, false);
      It("Number", Assert(number.getType() == tt_Character.PRINTABLE));
      It("Number", Assert(number.getCharacter() == "4"));
    }

    {
      let backspace = tt_Character.of(TYPE_CHAR, tt_Ascii.BACKSPACE, false);
      It("Backspace", Assert(backspace.getType() == tt_Character.BACKSPACE));
    }

    {
      let nonPrintable = tt_Character.of(TYPE_CHAR, tt_Ascii.NUL, false);
      It("Non-printable", Assert(nonPrintable.getType() == tt_Character.NONE));
    }

    {
      let ctrlBackspace = tt_Character.of(TYPE_CHAR, tt_Ascii.BACKSPACE, true);
      It("Ctrl-Backspace", Assert(ctrlBackspace.getType() == tt_Character.CTRL_BACKSPACE));
    }

    {
      let enter = tt_Character.of(TYPE_CHAR, tt_Ascii.ENTER, true);
      It("Enter", Assert(enter.getType() == tt_Character.ENTER));
    }

    EndDescribe();
  }

// private: ////////////////////////////////////////////////////////////////////

  const TYPE_CHAR = UiEvent.Type_Char;

} // class tt_CharacterTest
