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
 * This is a test for tt_PlayerInput class.
 */
class tt_PlayerInputTest : tt_Clematis
{

// public: // tt_Clematis //////////////////////////////////////////////////////

  override
  void TestSuites()
  {
    Describe("Checking player input");

    testPlayerInputCheckInput();
    testPlayerInputCheckReset();
    testBackspace();
    testCtrlBackspace();

    EndDescribe();
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void testPlayerInputCheckInput()
  {
    setUp();

    String input = "abc";

    throwStringIntoInput(_playerInput, input);

    let answer       = _playerInput.getAnswer();
    let answerString = answer.getString();

    It("Input must be an answer", Assert(input == answerString));
  }

  private
  void testPlayerInputCheckReset()
  {
    setUp();

    String input1 = "abc";
    String input2 = "def";

    throwStringIntoInput(_playerInput, input1);
    let reset = tt_Character.of(TYPE_CHAR, tt_Ascii.Backspace, true);
    _playerInput.processKey(reset);
    throwStringIntoInput(_playerInput, input2);

    let answer       = _playerInput.getAnswer();
    let answerString = answer.getString();

    It("Second input must be an answer", Assert(input2 == answerString));
  }

  private
  void testBackspace()
  {
    setUp();

    let backspace = tt_Character.of(TYPE_CHAR, 8, false);
    let letterA   = tt_Character.of(TYPE_CHAR, 97, false);

    //_playerInput.reset();
    _playerInput.processKey(backspace);
    _playerInput.processKey(letterA);
    _playerInput.processKey(backspace);
    _playerInput.processKey(letterA);

    let answer       = _playerInput.getAnswer();
    let answerString = answer.getString();

    It("Input after backspace must be valid", Assert(answerString == "a"));
  }

  private
  void testCtrlBackspace()
  {
    setUp();

    let ctrlBackspace = tt_Character.of(TYPE_CHAR, 8, true);
    let letterA       = tt_Character.of(TYPE_CHAR, 97, false);

    _playerInput.processKey(letterA);
    _playerInput.processKey(letterA);
    _playerInput.processKey(ctrlBackspace);

    let answer       = _playerInput.getAnswer();
    let answerString = answer.getString();

    It("Input after ctrl-backspace must be empty", Assert(answerString == ""));
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void throwStringIntoInput(tt_PlayerInput input, String str)
  {
    uint inputSize = str.length();
    for (uint i = 0; i < inputSize; ++i)
    {
      let character = tt_Character.of(TYPE_CHAR, str.ByteAt(i), false);
      input.processKey(character);
    }

    let enter = tt_Character.of(TYPE_CHAR, tt_Ascii.Enter, false);
    input.processKey(enter);
  }

  private
  void setUp()
  {
    _modeStorage   = tt_ModeStorageMock.of();
    _eventReporter = tt_EventReporterMock.of();
    _playerInput   = tt_PlayerInput.of(_modeStorage, _eventReporter);
  }

// private: ////////////////////////////////////////////////////////////////////

  const TYPE_CHAR = UiEvent.Type_Char;

// private: ////////////////////////////////////////////////////////////////////

  private tt_ModeStorageMock _modeStorage;
  private tt_EventReporter   _eventReporter;
  private tt_PlayerInput     _playerInput;

} // class tt_PlayerInputTest
