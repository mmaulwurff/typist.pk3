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
 * This class represents an answer to a tt_Question.
 * @see tt_Question
 */
class tt_Answer
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_Answer of(String answer = "")
  {
    let result = new("tt_Answer"); // construct

    result._answer     = answer;
    result._isFinished = false;

    return result;
  }

// public: /////////////////////////////////////////////////////////////////////

  String getString()  const { return _answer;     }
  bool   isFinished() const { return _isFinished; }

  void append(String character)
  {
    _answer = _answer .. character;
    _isFinished = false;
  }

  void deleteLastCharacter()
  {
    _answer.DeleteLastCharacter();
    _isFinished = false;
  }

  void finish()
  {
    _isFinished = true;
  }

// private: ////////////////////////////////////////////////////////////////////

  private String _answer;
  private bool   _isFinished;

} // class tt_Answer
