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
 * This class implements tt_KeyProcessor interface by calling several instances
 * of tt_KeyProcessor
 */
class tt_KeyProcessors : tt_KeyProcessor
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_KeyProcessors of(Array<tt_KeyProcessor> keyProcessors)
  {
    let result = new("tt_KeyProcessors"); // construct

    result._keyProcessors.Copy(keyProcessors);

    return result;
  }

// public: // tt_KeyProcessor //////////////////////////////////////////////////

  override
  void processKey(tt_Character character)
  {
    uint nProcessors = _keyProcessors.size();
    for (uint i = 0; i < nProcessors; ++i)
    {
      _keyProcessors[i].processKey(character);
    }
  }

// private: ////////////////////////////////////////////////////////////////////

  private Array<tt_KeyProcessor> _keyProcessors;

} // class tt_KeyProcessors
