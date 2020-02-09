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

class zc_TallyView
{

// public: /////////////////////////////////////////////////////////////////////

  zc_TallyView init()
  {
    return self;
  }

  ui
  int show(int y)
  {
    for (int i = 0; i < MAXPLAYERS; ++i)
    {
      if (!playerInGame[i] || i == consolePlayer)
      {
        continue;
      }

      PlayerInfo player   = players[i];
      String playerString = String.Format("%s: %d", player.GetUserName(), player.mo.score);
      int    playerWidth  = OriginalSmallFont.StringWidth(playerString) * CleanXFac_1;
      int    x            = (Screen.GetWidth() - playerWidth) / 2;
      Screen.DrawText(OriginalSmallFont, Font.CR_Blue, x, y, playerString, DTA_CleanNoMove_1, true);
    }

    int lineHeight = OriginalSmallFont.GetHeight() * CleanYFac_1;
    return lineHeight;
  }

} // class zc_TallyView
