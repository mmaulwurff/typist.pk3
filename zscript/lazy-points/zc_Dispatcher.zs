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

/**
 * This class is an entry point for Lazy Points.
 */
class zc_Dispatcher : EventHandler
{

// public: /////////////////////////////////////////////////////////////////////

  override
  void OnRegister()
  {
    _spawner = new("zc_Spawner").init();
  }

  override
  void PlayerEntered(PlayerEvent event)
  {
    let playerScore = new("zc_PlayerScore").init(event.playerNumber);
    _playerScores.push(playerScore);
  }

  override
  void PlayerDisconnected(PlayerEvent event)
  {
    int  playerNumber = event.playerNumber;
    uint nPlayers     = _playerScores.size();
    for (uint i = 0; i < nPlayers; ++i)
    {
      if (playerNumber == _playerScores[i].getPlayerNumber())
      {
        _playerScores.delete(i);
        return;
      }
    }
  }

  override
  void RenderOverlay(RenderEvent event)
  {
    if (menuActive || automapActive)
    {
      return;
    }

    uint nPlayers = _playerScores.size();
    for (uint i = 0; i < nPlayers; ++i)
    {
      _playerScores[i].show(event.fracTic);
    }
  }

  override
  void WorldThingDamaged(WorldEvent e)
  {
    uint nPlayers = _playerScores.size();
    for (uint i = 0; i < nPlayers; ++i)
    {
      _playerScores[i].countDamage(e.thing, e.damage, e.damageType, e.damageSource);
    }
  }

  override
  void WorldThingDied(WorldEvent event)
  {
    uint nPlayers = _playerScores.size();
    for (uint i = 0; i < nPlayers; ++i)
    {
      _playerScores[i].countDeath(event.thing);
    }
  }

  override
  void WorldTick()
  {
    uint nPlayers = _playerScores.size();
    for (uint i = 0; i < nPlayers; ++i)
    {
      _playerScores[i].tick();
    }
  }

  override
  void WorldThingSpawned(WorldEvent event)
  {
    _spawner.spawnScoreFor(event.thing);
  }

  override
  void WorldUnloaded(WorldEvent event)
  {
    uint nPlayers = _playerScores.size();
    for (uint i = 0; i < nPlayers; ++i)
    {
      _playerScores[i].saveMapScore();
    }
  }

// private: ////////////////////////////////////////////////////////////////////

  private zc_Spawner _spawner;

  private Array<zc_PlayerScore> _playerScores;

} // class zc_Dispatcher
