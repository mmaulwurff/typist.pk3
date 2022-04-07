/* Copyright Alexander 'm8f' Kromm (mmaulwurff@gmail.com) 2022
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
 * This class implements tt_TargetSource by pruning other tt_TargetSource from
 * targets with null actors.
 */
class tt_TargetSourcePruner : tt_TargetSource
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_TargetSourcePruner of(tt_TargetSource targetSource)
  {
    let result = new("tt_TargetSourcePruner"); // construct
    result._targetSource = targetSource;
    return result;
  }

// public: // tt_TargetSource //////////////////////////////////////////////////

  override
  tt_Targets getTargets()
  {
    let targets = _targetSource.getTargets();

    tt_Targets result = tt_Targets.of();

    uint nTargets = targets.size();
    for (uint i = 0; i < nTargets; ++i)
    {
      tt_Target target = targets.at(i);
      if (target.getActor() != NULL)
      {
        result.add(target);
      }
    }

    return result;
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_TargetSource _targetSource;

} // class tt_TargetSourcePruner
