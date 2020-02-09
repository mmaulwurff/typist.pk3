/* Copyright Alexander 'm8f' Kromm (mmaulwurff@gmail.com) 2019-2020
 *
 * This file is a part of Lazy Points.
 *
 * Lazy Points is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later
 * version.
 *
 * Lazy Points is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
 * details.
 *
 * You should have received a copy of the GNU General Public License along with
 * Lazy Points.  If not, see <https://www.gnu.org/licenses/>.
 */

class zc_Spawner
{

// public: /////////////////////////////////////////////////////////////////////

  zc_Spawner init()
  {
    return self;
  }

  play
  void spawnScoreFor(Actor thing)
  {
    if (thing && thing.bCountItem)
    {
      zc_MapScoreItem(Actor.Spawn("zc_MapScoreItem", thing.pos)).init(5);
    }
    else if (thing is "Key")
    {
      zc_MapScoreItem(Actor.Spawn("zc_MapScoreItem", thing.pos)).init(250);
    }
  }

} // class zc_Spawner
