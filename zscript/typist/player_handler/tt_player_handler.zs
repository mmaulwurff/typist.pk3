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
 * This class handles the game for one player.
 */
class tt_PlayerHandler abstract
{

// public: /////////////////////////////////////////////////////////////////////

  virtual
  void processKey(tt_Character character)
  {
    Console.Printf("zscript/typist/player_handler/tt_player_handler.zs:29: T: override this!");
  }

  play virtual
  void tick()
  {
    Console.Printf("zscript/typist/player_handler/tt_player_handler.zs:35: T: override this!");
  }

  virtual
  void reportDead(Actor dead)
  {
    Console.Printf("zscript/typist/player_handler/tt_player_handler.zs:41: T: override this!");
  }

  virtual
  int getMode()
  {
    Console.Printf("zscript/typist/player_handler/tt_player_handler.zs:47: T: override this!");
    return tt_Mode.MODE_UNKNOWN;
  }

  virtual
  void unlockMode()
  {
    Console.Printf("zscript/typist/player_handler/tt_player_handler.zs:54: T: override this!");
  }

  ui virtual
  void draw(RenderEvent event)
  {
    Console.Printf("zscript/typist/player_handler/tt_player_handler.zs:60: T: override this!");
  }

} // class tt_PlayerHandler
