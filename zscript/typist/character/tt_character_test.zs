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
      let smallANoShift = new("tt_Character").init(97, false, false);
      It("Small character, no shift", Assert(smallANoShift.getType() == tt_Character.PRINTABLE));
      It("Small character, no shift", Assert(smallANoShift.getCharacter() == "a"));
    }

    {
      let smallAShift = new("tt_Character").init(97, true, false);
      It("Small character, shift", Assert(smallAShift.getType() == tt_Character.PRINTABLE));
      It("Small character, shift", Assert(smallAShift.getCharacter() == "A"));
    }

    {
      let bigANoShift = new("tt_Character").init(65, false, false);
      It("Big character, no shift", Assert(bigANoShift.getType() == tt_Character.PRINTABLE));
      It("Big character, no shift", Assert(bigANoShift.getCharacter() == "a"));
    }

    {
      let bigAShift = new("tt_Character").init(65, true, false);
      It("Big character, shift", Assert(bigAShift.getType() == tt_Character.PRINTABLE));
      It("Big character, shift", Assert(bigAShift.getCharacter() == "A"));
    }

    {
      let numberNoShift = new("tt_Character").init(52, false, false);
      It("Number, no shift", Assert(numberNoShift.getType() == tt_Character.PRINTABLE));
      It("Number, no shift", Assert(numberNoShift.getCharacter() == "4"));
    }

    {
      let numberShift = new("tt_Character").init(52, true, false);
      It("Number, shift", Assert(numberShift.getType() == tt_Character.PRINTABLE));
      It("Number, shift", Assert(numberShift.getCharacter() == "4"));
    }

    {
      let backspace = new("tt_Character").init(8, false, false);
      It("Backspace", Assert(backspace.getType() == tt_Character.BACKSPACE));
    }

    {
      let nonPrintable = new("tt_Character").init(0, false, false);
      It("Non-printable", Assert(nonPrintable.getType() == tt_Character.NONE));
    }

    {
      let ctrlBackspace = new("tt_Character").init(8, false, true);
      It("Ctrl-Backspace", Assert(ctrlBackspace.getType() == tt_Character.CTRL_BACKSPACE));
    }

    EndDescribe();
  }

} // class tt_CharacterTest
