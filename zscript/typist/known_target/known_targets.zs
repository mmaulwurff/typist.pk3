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
 * This class represents a list of known targets.
 */
class tt_KnownTargets
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_KnownTargets of()
  {
    let result = new("tt_KnownTargets"); // construct
    return result;
  }

// public: /////////////////////////////////////////////////////////////////////

  // Returns a target in this list.
  tt_KnownTarget at(uint index) const
  {
    return _targets[index];
  }

  // Returns a number of targets in this list.
  uint size() const
  {
    return _targets.size();
  }

  // Returns true if this target list contains a target with the specified id.
  bool contains(tt_Target target) const
  {
    return (find(target) != size());
  }

  tt_KnownTarget findTarget(tt_Target target) const
  {
    uint index = find(target);
    return (index == size()) ? NULL : at(index);
  }

// public: /////////////////////////////////////////////////////////////////////

  // Adds a target to this list.
  void add(tt_KnownTarget target)
  {
    _targets.push(target);
  }

  void addMany(tt_KnownTargets targets)
  {
    uint nTargets = targets.size();
    for (uint i = 0; i < nTargets; ++i)
    {
      _targets.push(targets.at(i));
    }
  }

  // Removes a target from the list.
  // If the target is not in the list, does nothing.
  void remove(tt_Target target)
  {
    uint index = find(target);
    if (index != size()) { _targets.Delete(index); }
  }

// private: ////////////////////////////////////////////////////////////////////

  /** Searches for a target with a particular id.
   * @returns index on success, the total number of targets on failure.
   */
  private
  uint find(tt_Target target) const
  {
    uint nTargets = size();
    for (uint i = 0; i < nTargets; ++i)
    {
      if (_targets[i].getTarget().isEqual(target)) { return i; }
    }
    return nTargets;
  }

// private: ////////////////////////////////////////////////////////////////////

  private Array<tt_KnownTarget> _targets;

} // class tt_KnownTargets
