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

class zc_View
{

// public: /////////////////////////////////////////////////////////////////////

  zc_View init()
  {
    _player       = players[consolePlayer];
    _interpolator = DynamicValueInterpolator.Create(0, 0.1, 1, 1000000);

    return self;
  }

  ui
  int show(int y)
  {
    loadFont();

    int lineHeight = _font.GetHeight() * CleanYFac_1;

    if (!_player.mo)
    {
      return lineHeight;
    }

    y += MARGIN + lineHeight / 2;

    _interpolator.update(_player.mo.score);

    String scoreString = String.Format("%d", _interpolator.getValue());
    int    scoreWidth  = _font.StringWidth(scoreString) * CleanXFac_1;
    int    x           = (Screen.GetWidth() - scoreWidth) / 2;
    Screen.DrawText(_font, Font.CR_Blue, x, y, scoreString, DTA_CleanNoMove_1, true);

    return lineHeight * 2;
  }

// private: ////////////////////////////////////////////////////////////////////

  const MARGIN = 10;

// private: ////////////////////////////////////////////////////////////////////

  mixin zc_FontUser;

  private PlayerInfo _player;

  private DynamicValueInterpolator _interpolator;

} // class zc_View
