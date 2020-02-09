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

class zc_BonusView
{

// public: /////////////////////////////////////////////////////////////////////

  zc_BonusView init(zc_TimerBonus timerBonus, zc_HealthBonus healthBonus)
  {
    _timerBonus  = timerBonus;
    _healthBonus = healthBonus;

    return self;
  }

  ui
  int show(int y)
  {
    loadFont();

    int lineHeight = _font.GetHeight() * CleanYFac_1;
    y += MARGIN + lineHeight / 2;

    int    bonus      = _timerBonus.getBonus();
    double multiplier = _healthBonus.getMultiplier();

    if (bonus == 0 && multiplier == 1.0)
    {
      return 0;
    }

    String bonusString;
    if (bonus)
    {
      bonusString.appendFormat("+%d", bonus);
    }

    if (multiplier != 1.0)
    {
      if (bonusString.length()) bonusString.appendFormat(" ");
      bonusString.appendFormat("x%.1f", multiplier);
    }

    int bonusWidth = _font.StringWidth(bonusString) * CleanXFac_1;
    int x          = (Screen.GetWidth() - bonusWidth) / 2;
    Screen.DrawText(_font, Font.CR_Blue, x, y, bonusString, DTA_CleanNoMove_1, true);

    return lineHeight * 2;
  }

// private: ////////////////////////////////////////////////////////////////////

  const MARGIN = 10;

// private: ////////////////////////////////////////////////////////////////////

  mixin zc_FontUser;

  private zc_TimerBonus  _timerBonus;
  private zc_HealthBonus _healthBonus;

} // class zc_BonusView
