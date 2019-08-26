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

/** This class represents a list of target widgets.
 */
class tt_TargetWidgets
{

// public: /////////////////////////////////////////////////////////////////////

  tt_TargetWidgets init() { return self; }

// public: /////////////////////////////////////////////////////////////////////

  // Returns a target in this list.
  tt_TargetWidget at(uint index) const { return _widgets[index]; }

  // Returns a number of targets in this list.
  uint size() const { return _widgets.size(); }

  tt_TargetWidget find(tt_Target id) const
  {
    uint nWidgets = size();
    for (uint i = 0; i < nWidgets; ++i)
    {
      let widget = _widgets[i];
      if (widget.getTarget().getTarget().isEqual(id)) { return widget; }
    }
    return NULL;
  }

// public: /////////////////////////////////////////////////////////////////////

  // Adds a target to this list.
  void add(tt_TargetWidget target) { _widgets.push(target); }

// private: ////////////////////////////////////////////////////////////////////

  private Array<tt_TargetWidget> _widgets;

} // class tt_TargetWidgets
