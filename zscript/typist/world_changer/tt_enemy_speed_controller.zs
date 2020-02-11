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
 * This class implements tt_WorldChanger by slowing down enemies.
 */
class tt_EnemySpeedController : tt_WorldChanger
{

// public: /////////////////////////////////////////////////////////////////////

  tt_EnemySpeedController init(tt_TargetSource targetSource)
  {
    _targetSource = targetSource;

    return self;
  }

// public: // tt_WorldChanger //////////////////////////////////////////////////

  override
  void changeWorld()
  {
    let  targets  = _targetSource.getTargets();
    uint nTargets = targets.size();

    for (uint i = 0; i < nTargets; ++i)
    {
      let enemy = targets.at(i).getActor();
      if (!isSlowedDown(enemy))
      {
        slowDown(enemy);
      }
    }
  }

// private: ////////////////////////////////////////////////////////////////////

  private play
  bool isSlowedDown(Actor a)
  {
    return (a.CountInv("tt_VelocityStorage") != 0);
  }

  private play
  void slowDown(Actor a)
  {
    // Storage acts just as a marker here.
    a.AddInventory(tt_VelocityStorage(Actor.Spawn("tt_VelocityStorage")));
    a.Speed *= VELOCITY_SCALE_FACTOR;
  }

// private: ////////////////////////////////////////////////////////////////////

  const VELOCITY_SCALE_FACTOR = 0.2;

// private: ////////////////////////////////////////////////////////////////////

  private tt_TargetSource _targetSource;

} // class tt_EnemySpeedController
