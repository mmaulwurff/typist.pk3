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
 * This class implements tt_PlayerHandler by just doing nothing.
 */
class tt_PlayerSupervisorStub : tt_PlayerHandler
{

// public: /////////////////////////////////////////////////////////////////////

  tt_PlayerSupervisorStub init() { return self; }

// public: // tt_PlayerHandler /////////////////////////////////////////////////

  override void processKey(tt_Character character) {}
  override void tick() {}
  override void reportDead(Actor dead) {}
  override bool isCapturingKeys() { return false; }
  override void unlockMode() {}
  override void draw(RenderEvent event) {}

} // class tt_PlayerSupervisorStub
