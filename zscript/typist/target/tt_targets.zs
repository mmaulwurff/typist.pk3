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
 * Represent a list of Targets.
 */
class tt_Targets
{

// public: /////////////////////////////////////////////////////////////////////

  tt_Targets init()
  {
    return self;
  }

// public: /////////////////////////////////////////////////////////////////////

  /**
   * Returns a target in this list.
   */
  tt_Target at(uint index) const
  {
    return _targets[index];
  }

  /**
   * Returns a number of targets in this list.
   */
  uint size() const
  {
    return _targets.size();
  }

  /**
   * Returns true if this target list contains a target with the specified id.
   */
  bool contains(tt_Target target) const
  {
    return find(target) != size();
  }

  bool isEmpty() const
  {
    return (size() == 0);
  }

// public: /////////////////////////////////////////////////////////////////////

  /**
   * Adds a target to this list.
   */
  void add(tt_Target target)
  {
    _targets.push(target);
  }

// private: ////////////////////////////////////////////////////////////////////

  /**
   * Searches for a target with a particular id.
   * @returns index on success, the total number of targets on failure.
   */
  private
  uint find(tt_Target target) const
  {
    uint nTargets = size();
    for (uint i = 0; i < nTargets; ++i)
    {
      if (_targets[i].isEqual(target)) { return i; }
    }
    return nTargets;
  }

// private: ////////////////////////////////////////////////////////////////////

  private Array<tt_Target> _targets;

} // class tt_Targets
