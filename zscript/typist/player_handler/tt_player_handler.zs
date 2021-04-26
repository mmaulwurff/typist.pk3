/* Copyright Alexander 'm8f' Kromm (mmaulwurff@gmail.com) 2019-2021
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
 * This class handles the game for one player.
 */
class tt_PlayerHandler abstract
{

  abstract
  void processKey(tt_Character character);

  play abstract
  void tick();

  abstract
  void reportDead(Actor dead);

  abstract
  bool isCapturingKeys();

  abstract
  void unlockMode();

  abstract
  void forceCombat();

  ui abstract
  void draw(RenderEvent event);

} // class tt_PlayerHandler
