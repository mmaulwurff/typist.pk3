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
 * This class provides a screen saver for GZDoom.
 *
 * Appearance: Matrix-style green running numbers.
 * Screen saver activates after 1 minute in the menu.
 */
class tt_ScreenSaver : StaticEventHandler
{

// public: // StaticEventHandler ///////////////////////////////////////////////

  override void RenderOverlay(RenderEvent event)
  {
    if (!menuActive)
    {
      _idle = 0;
      return;
    }

    ++_idle;

    if (_idle < TIMEOUT) { return; }

    ++_throttle;

    int screenWidth  = Screen.GetWidth();
    int screenHeight = Screen.GetHeight();

    if (!_initialized)
    {
      for (int i = 0; i < N_HEADS; ++i)
      {
        _heads[i] = (random(0, screenWidth - 1), random(0, screenHeight - 1));
      }

      resetChars();

      _initialized = true;
    }

    Screen.Dim(GREEN, 0.1, 0, 0, screenWidth, screenHeight);

    Font fnt         = NewSmallFont;
    int  fntHeight   = fnt.GetHeight();
    bool isShiftTime = (_throttle % REFRESH_RATE) == 0;

    for (int i = 0; i < N_HEADS; ++i)
    {
      double alpha = 1;

      for (int j = 0; j < TAIL_LENGTH; ++j)
      {
        double offset = j * fntHeight;
        int    index  = i * TAIL_LENGTH + j;

        int  ch       = _chars    [index];
        bool flippedX = _flippedXs[index];
        bool flippedY = _flippedYs[index];

        Screen.DrawChar( fnt, Font.CR_GREEN, _heads[i].x, _heads[i].y - offset, ch
                       , DTA_Alpha, alpha
                       , DTA_FlipX, flippedX
                       , DTA_FlipY, flippedY
                       );

        alpha -= ALPHA_STEP;
      }

      if (isShiftTime)
      {
        resetChars();
        _heads[i].y += fntHeight;
        if (_heads[i].y - TAIL_LENGTH * fntHeight > screenHeight)
        {
          _heads[i].x = random(0, screenWidth - 1);
          _heads[i].y = 0;
        }
      }
    }
  }

// private: ////////////////////////////////////////////////////////////////////

  private ui void resetChars()
  {
    for (int i = 0; i < N_CHARS; ++i)
    {
      _chars    [i] = random(41, 126); // printable ASCII characters
      _flippedXs[i] = random(0, 1);
      _flippedYs[i] = random(0, 1);
    }
  }

// private: ////////////////////////////////////////////////////////////////////

  const N_HEADS      = 40;
  const TAIL_LENGTH  = 15;
  const ALPHA_STEP   = 1.0 / TAIL_LENGTH;
  const N_CHARS      = N_HEADS * TAIL_LENGTH;
  const REFRESH_RATE = 35 / 8;
  const TIMEOUT      = 35 * 60; // 1 minute
  const GREEN        = "008800";

  ui int     _idle;
  ui int     _throttle;
  ui bool    _initialized;
  ui vector2 _heads[N_HEADS];
  ui int     _chars    [N_CHARS];
  ui bool    _flippedXs[N_CHARS];
  ui bool    _flippedYs[N_CHARS];

} // class tt_ScreenSaver
