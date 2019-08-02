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

/** This class represents a list of disabled targets.
 */
class tt_DisabledTargets
{

// public: /////////////////////////////////////////////////////////////////////

  tt_DisabledTargets init() { return self; }

// public: /////////////////////////////////////////////////////////////////////

  // Returns a target in this list.
  tt_DisabledTarget at(uint index) const { return _targets[index]; }

  // Returns a number of targets in this list.
  uint size() const { return _targets.size(); }

// public: /////////////////////////////////////////////////////////////////////

  // Adds a target to this list.
  void add(tt_DisabledTarget target) { _targets.push(target); }

// private: ////////////////////////////////////////////////////////////////////

  private Array<tt_DisabledTarget> _targets;

} // class tt_DisabledTargets
