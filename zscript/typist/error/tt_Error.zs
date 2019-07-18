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

/** This class represents an error.
 * It is intended to be used as a possible result of an operation.
 */
class tt_Error
{

// public: /////////////////////////////////////////////////////////////////////

  tt_Error init(string description)
  {
    _description = description;

    return self;
  }

// public: /////////////////////////////////////////////////////////////////////

  bool isOccurred() const { return _description.length() == 0; }

  string description() const { return _description; }

// private: ////////////////////////////////////////////////////////////////////

  private string _description;

} // class tt_Error
