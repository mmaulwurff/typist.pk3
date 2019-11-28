/* Copyright Alexander 'm8f' Kromm (mmaulwurff@gmail.com) 2019
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

/** This class implements tt_TargetSource by scanning the world around the
 * supplied origin for actors suitable to be targets.
 */
class tt_TargetRadar : tt_TargetSource
{

// public: /////////////////////////////////////////////////////////////////////

  tt_TargetRadar init(tt_OriginSource originSource)
  {
    _originSource = originSource;

    return self;
  }

// public: // tt_TargetSource //////////////////////////////////////////////////

  override
  tt_Targets getTargets()
  {
    let result = new("tt_Targets").init();

    let origin = _originSource.getOrigin().getPosition();

    let iterator = ThinkerIterator.Create("Actor", Thinker.STAT_DEFAULT);
    Actor a;
    while (a = Actor(iterator.Next()))
    {
      if (tt_Math.isInEffectiveRange(a.pos, origin) && isSuitableForTargeting(a))
      {
        result.add(new("tt_Target").init(a));
      }
    }

    return result;
  }

// private: ////////////////////////////////////////////////////////////////////

  private static
  bool isSuitableForTargeting(Actor a)
  {
    bool isMonster    = a.bIsMonster;
    bool isAlive      = (a.Health > 0);
    bool isFriendly   = a.bFriendly;
    bool isMissile    = a.bMissile;
    bool isDamageable = !a.bNoDamage;
    bool isNoDamage   = (a.Damage == 0);
    bool isMissileSuitable = false;
    bool isSuitable   = (  (  (isMonster && isDamageable)
                           || (isMissile && !isNoDamage && isMissileSuitable)
                           )
                        && isAlive
                        && !isFriendly
                        );

    return isSuitable;
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_OriginSource _originSource;

} // class tt_TargetRadar
