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

/** This class implements tt_ModeSource by examining the specified
 * tt_KnownTargetSource.
 */
class tt_AutoModeSource : tt_ModeSource
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_AutoModeSource of(tt_KnownTargetSource knownTargetSource, tt_PlayerSource playerSource)
  {
    let result = new("tt_AutoModeSource"); // construct

    result._knownTargetSource = knownTargetSource;
    result._playerSource      = playerSource;

    return result;
  }

// public: // tt_ModeSource ////////////////////////////////////////////////////

  override
  int getMode()
  {
    if (_knownTargetSource.isEmpty())
    {
      return tt_Mode.Explore;
    }

    bool isAtLeastOneVisible = false;
    let  pawn = _playerSource.getPawn();

    let  targets  = _knownTargetSource.getTargets();
    uint nTargets = targets.size();
    for (uint i = 0; i < nTargets; ++i)
    {
      let target = targets.at(i).getTarget();
      if (isVisible(target, pawn))
      {
        isAtLeastOneVisible = true;
      }
    }

    int mode = (isAtLeastOneVisible ? tt_Mode.Combat : tt_Mode.Explore);

    return mode;
  }

// private: ////////////////////////////////////////////////////////////////////

  private play
  bool isVisible(tt_Target target, PlayerPawn pawn) const
  {
    let  targetActor = target.getActor();
    bool visible     = pawn.IsVisible(targetActor, ALL_AROUND);

    return visible;
  }

  const ALL_AROUND = 1; // true

  private tt_KnownTargetSource _knownTargetSource;
  private tt_PlayerSource      _playerSource;

} // class tt_AutoModeSource
