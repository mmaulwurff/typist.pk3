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

/**
 * This class handles game tweaks.
 */
class tt_GameTweaks
{

// public: /////////////////////////////////////////////////////////////////////

  tt_GameTweaks init()
  {
    return self;
  }

// public: /////////////////////////////////////////////////////////////////////

  play
  void processSpawnedThing(Actor thing)
  {
    bool isMissile = thing.bMissile;
    if (!isMissile) { return; }

    bool isPlayers = (thing.Target != NULL && thing.Target is "PlayerPawn");
    if (isPlayers) { return; }

    thing.bShootable   = true;
    thing.bSolid       = true;
    thing.bNoBlood     = true;
    thing.bThruSpecies = true;
    thing.Health       = 1;
    thing.A_ScaleVelocity(0.01);
    thing.A_ChangeLinkFlags(0);
  }

// private: ////////////////////////////////////////////////////////////////////

} // class tt_GameTweaks
