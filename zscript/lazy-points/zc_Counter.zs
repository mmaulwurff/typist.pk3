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

class zc_Counter
{

// public: /////////////////////////////////////////////////////////////////////

  zc_Counter init(int playerNumber, zc_TimerBonus timerBonus, zc_HealthBonus healthBonus)
  {
    _player         = players[playerNumber];
    _oldSecretCount = 0;
    _timerBonus     = timerBonus;
    _healthBonus    = healthBonus;

    return self;
  }

  play
  void countDamage(Actor damaged, int damage, Name damageType, Actor inflictor)
  {
    if (damageType == "Telefrag")
    {
      damage = damaged.getSpawnHealth();
    }

    if (damaged && damaged.bIsMonster && isMe(inflictor))
    {
      addPoints(damage);
    }
  }

  play
  void countDeath(Actor died)
  {
    if (!(died && isMe(died.target)))
    {
      return;
    }

    addPoints(calculatePointsFor(died));
  }

  play
  void countSecrets()
  {
    int newSecretCount = _player.SecretCount;
    if (newSecretCount > _oldSecretCount)
    {
      addPoints(250);
      _oldSecretCount = newSecretCount;
    }
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  bool isMe(Actor other)
  {
    return (other && other == _player.mo);
  }

  private play
  void addPoints(int points)
  {
    _player.mo.score += points;
  }

  private play
  int calculatePointsFor(Actor died)
  {
    int result = died.bIsMonster
      ? (died.SpawnHealth() / 10 + _timerBonus.getBonus())
      : 5;

    result *= int(round(_healthBonus.getMultiplier()));

    _timerBonus.registerKill();

    return result;
  }

// private: ////////////////////////////////////////////////////////////////////

  private PlayerInfo     _player;
  private int            _oldSecretCount;
  private zc_TimerBonus  _timerBonus;
  private zc_HealthBonus _healthBonus;

} // class zc_Counter
