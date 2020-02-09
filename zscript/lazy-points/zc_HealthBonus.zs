/* Copyright Alexander 'm8f' Kromm (mmaulwurff@gmail.com) 2019-2020
 *
 * This file is a part of Lazy Points.
 *
 * Lazy Points is free software: you can redistribute it and/or modify it under the
 * terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later
 * version.
 *
 * Lazy Points is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
 * A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * Lazy Points.  If not, see <https://www.gnu.org/licenses/>.
 */

/**
 * Health Bonus is a multiplier, which value depends on player health.
 *
 * [100%, +inf) - x2
 * [ 50%, 100%) - x1.5
 * (  0%,  50%) - x1
 *
 * Credits to ZikShadow for an idea.
 */
class zc_HealthBonus
{

// public: /////////////////////////////////////////////////////////////////////

  zc_HealthBonus init(int playerNumber)
  {
    _player = players[playerNumber];

    return self;
  }

  double getMultiplier()
  {
    int healthPercent = _player.health * 100 / _player.mo.GetMaxHealth();

    if      (healthPercent >= 100) return 2.0;
    else if (healthPercent >=  50) return 1.5;

    return 1.0;
  }

// private: ////////////////////////////////////////////////////////////////////

  private PlayerInfo _player;

} // class zc_HealthBonus
