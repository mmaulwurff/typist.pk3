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

class tt_PlayerInputTest : tt_Clematis
{

// public: /////////////////////////////////////////////////////////////////////

  override
  void TestSuites()
  {
    Describe("Checking player input");

    testPlayerInputCheckInput();
    testPlayerInputCheckReset();

    EndDescribe();
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void testPlayerInputCheckInput()
  {

    let    playerInput = new("tt_PlayerInput").init();
    string input       = "Abc";

    throwStringIntoInput(playerInput, input);

    let answer       = playerInput.getAnswer();
    let answerString = answer.getString();

    It("Input must be an answer", Assert(input == answerString));
  }

  private
  void testPlayerInputCheckReset()
  {
    let    playerInput = new("tt_PlayerInput").init();
    string input1      = "abc";
    string input2      = "def";

    throwStringIntoInput(playerInput, input1);
    playerInput.reset();
    throwStringIntoInput(playerInput, input2);

    let answer       = playerInput.getAnswer();
    let answerString = answer.getString();

    It("Second input must be an answer", Assert(input2 == answerString));
  }

  private
  void throwStringIntoInput(tt_PlayerInput input, string str)
  {
    uint inputSize = str.length();
    for (uint i = 0; i < inputSize; ++i)
    {
      input.processKey(str.ByteAt(i));
    }
  }

} // class tt_PlayerInputTest
