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
class tt_GameTweaks play
{

// public: /////////////////////////////////////////////////////////////////////

  static
  void tweakPlayer(PlayerInfo player)
  {
    let pawn = player.mo;
    if (pawn == NULL) { return; }

    makeInvulnerable(pawn);
    increaseDamage(pawn);
    protectFromSelfDamage(pawn);
  }

// private: ////////////////////////////////////////////////////////////////////

  static private
  void makeInvulnerable(PlayerPawn pawn)
  {
    if (tt_buddha_enabled)
    {
      // Still lose health down to 1 point.
      pawn.GiveInventory("tt_Buddha", 1);
    }
  }

  static private
  void increaseDamage(PlayerPawn pawn)
  {
    class<PlayerPawn>    type           = pawn.GetClassName();
    readonly<PlayerPawn> default        = getDefaultByType(type);
    double               originalDamage = default.DamageMultiply;

    pawn.DamageMultiply = originalDamage * 10;
  }

  static private
  void protectFromSelfDamage(PlayerPawn pawn)
  {
    pawn.SelfDamageFactor = 0;
  }

} // class tt_GameTweaks
