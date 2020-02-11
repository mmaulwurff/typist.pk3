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
 * This class implements tt_WorldChanger by slowing down projectiles that
 * fly towards the player.
 *
 * When a projectile is no longer flying towards the player, its speed is
 * restored.
 */
class tt_ProjectileSpeedController : tt_WorldChanger
{

// public: /////////////////////////////////////////////////////////////////////

  tt_ProjectileSpeedController init( tt_OriginSource playerOriginSource
                                   , tt_PlayerSource playerSource
                                   )
  {
    _playerOriginSource = playerOriginSource;
    _playerSource = playerSource;

    return self;
  }

// public: // tt_WorldChanger //////////////////////////////////////////////////

  override
  void changeWorld()
  {
    let origin   = _playerOriginSource.getOrigin().getPosition();
    let iterator = ThinkerIterator.Create("Actor", Thinker.STAT_DEFAULT);
    let pawn     = _playerSource.getPawn();

    double playerRadius = pawn.radius;

    for (Actor a; a = Actor(iterator.Next());)
    {
      if (a.bMissile)
      {
        controlProjectile(a, origin, playerRadius);
      }
    }
  }

// private: ////////////////////////////////////////////////////////////////////

  private play
  void controlProjectile(Actor a, Vector3 playerOrigin, double playerRadius)
  {
    bool isInRange = tt_Math.isInEffectiveRange(a.pos, playerOrigin);

    if (isInRange && isMovingTowardsPlayer(a, playerOrigin, playerRadius))
    {
      if (!isSlowedDown(a))
      {
        slowDown(a);
      }
    }
    else if (isSlowedDown(a))
    {
      restoreVelocity(a);
    }
  }

  private play
  bool isMovingTowardsPlayer(Actor projectile, Vector3 playerPos, double playerRadius)
  {
    Vector3 vel = projectile.vel;
    if (vel == (0, 0, 0)) { return false; } // doesn't move

    double oldDistance = (projectile.pos - vel - playerPos).length();
    double distance    = (projectile.pos -       playerPos).length();

    if (distance > oldDistance) { return false; } // moves from player

    // http://mathworld.wolfram.com/Point-LineDistance3-Dimensional.html
    Vector3 x10             = projectile.pos - playerPos;
    Vector3 prod            = tt_Math.crossProduct(vel, x10);
    double  lineDistance    = prod.length() / vel.length();
    double  hitDistance     = playerRadius + projectile.radius;
    bool    willTouchPlayer = (hitDistance >= lineDistance);

    return willTouchPlayer;
  }

  private play
  bool isSlowedDown(Actor a)
  {
    return (a.CountInv("tt_VelocityStorage") != 0);
  }

  private play
  void slowDown(Actor a)
  {
    let storage = tt_VelocityStorage(Actor.Spawn("tt_VelocityStorage"));
    storage.velocity = a.vel;
    a.AddInventory(storage);

    a.A_ScaleVelocity(VELOCITY_SCALE_FACTOR);
  }

  /**
   * @note This method assumes that @a a contains tt_VelocityStorage inventory item.
   */
  private play
  void restoreVelocity(Actor a)
  {
    let storage = tt_VelocityStorage(a.FindInventory("tt_VelocityStorage"));
    a.vel = storage.velocity;

    a.RemoveInventory(storage);
    storage.Destroy();
  }

// private: ////////////////////////////////////////////////////////////////////

  const VELOCITY_SCALE_FACTOR = 0.1;

// private: ////////////////////////////////////////////////////////////////////

  private tt_OriginSource _playerOriginSource;
  private tt_PlayerSource _playerSource;

} // class tt_ProjectileSpeedController
