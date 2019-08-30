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

/** This class represents a set of strings.
 */
class tt_Strings
{

// public: /////////////////////////////////////////////////////////////////////

  tt_Strings init()
  {
    return self;
  }

// public: /////////////////////////////////////////////////////////////////////

  uint size() const
  {
    return _strings.size();
  }

  String at(uint i) const
  {
    return _strings[i];
  }

  bool contains(String str) const
  {
    uint foundIndex = _strings.Find(str);
    bool isFound    = (foundIndex != size());

    return isFound;
  }

// public: /////////////////////////////////////////////////////////////////////

  void add(String str)
  {
    _strings.Push(str);
  }

// private: ////////////////////////////////////////////////////////////////////

  private Array<String> _strings;

} // class tt_strings
