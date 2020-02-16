/* Copyright Alexander 'm8f' Kromm (mmaulwurff@gmail.com) 2019-2020
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
 * This class is a namespace for common drawing functions.
 */
class tt_Drawing
{

// public: /////////////////////////////////////////////////////////////////////

  static
  int getWidthForTarget(String question, String answer, tt_Settings settings)
  {
    Font fnt         = NewSmallFont;
    int  width       = max(fnt.StringWidth(question), fnt.StringWidth(answer));
    int  borderWidth = makeBorderWidth(width) * settings.getScale();
    return borderWidth;
  }

  static
  void drawTarget( Vector2     pos
                 , String      question
                 , String      answer
                 , tt_Settings settings
                 , bool        isCentered
                 , int         color
                 )
  {
    int  scale        = settings.getScale();
    Font fnt          = NewSmallFont;
    int  screenWidth  = Screen.GetWidth()  / scale;
    int  screenHeight = Screen.GetHeight() / scale;

    let  position = pos / scale;
    int  height   = fnt.GetHeight();
    int  width    = max(fnt.StringWidth(question), fnt.StringWidth(answer));

    double xStart = isCentered
                  ? (position.x - width / 2)
                  : position.x;
    int x = int(Clamp(xStart,     FRAME, screenWidth  - FRAME - width         ));
    int y = int(Clamp(position.y, FRAME, screenHeight - FRAME * 3 - height * 2));

    drawBoxes(x, y, width, height, screenWidth, screenHeight, color);
    drawText(x, y, height, fnt, question, answer, screenWidth, screenHeight);
  }

  static
  int getColorForMode(int mode)
  {
    return (mode == tt_Mode.Combat) ? COMBAT_COLOR : EXPLORE_COLOR;
  }

// private: ////////////////////////////////////////////////////////////////////

  private static
  int makeBorderWidth(int width)
  {
    int borderWidth  = FRAME * 2 + width;
    return borderWidth;
  }

  private static
  void drawBoxes( int x
                , int y
                , int width
                , int lineHeight
                , int screenWidth
                , int screenHeight
                , int color
                )
  {
    // Texture is necessary for drawing, but in fact it isn't used.
    // The color is specified with DTA_FillColor.
    let dummyTexture = TexMan.CheckForTexture("tt-white", TexMan.Type_Any);

    drawBox(dummyTexture, x, y, width, lineHeight, screenWidth, screenHeight, RGB_GOLD);

    int lowerY = y + lineHeight + FRAME * 2;
    drawBox(dummyTexture, x, lowerY, width, lineHeight, screenWidth, screenHeight, color);
  }

  private static
  void drawBox( TextureID tex
              , int x
              , int y
              , int width
              , int lineHeight
              , int screenWidth
              , int screenHeight
              , int color
              )
  {
    { // border
      int borderX      = x - FRAME;
      int borderY      = y - FRAME;
      int borderWidth  = makeBorderWidth(width);
      int borderHeight = FRAME * 2 + lineHeight;

      Screen.DrawTexture( tex
                        , NOT_ANIMATED
                        , borderX
                        , borderY
                        , DTA_DestWidth     , borderWidth
                        , DTA_DestHeight    , borderHeight
                        , DTA_FillColor     , color
                        , DTA_KeepRatio     , true
                        , DTA_VirtualWidth  , screenWidth
                        , DTA_VirtualHeight , screenHeight
                        , DTA_Alpha         , BORDER_ALPHA
                        );
    }

    { // background
      int backgroundX      = x - PADDING;
      int backgroundY      = y - PADDING;
      int backgroundWidth  = PADDING * 2 + width;
      int backgroundHeight = PADDING * 2 + lineHeight;

      Screen.DrawTexture( tex
                        , NOT_ANIMATED
                        , backgroundX
                        , backgroundY
                        , DTA_DestWidth     , backgroundWidth
                        , DTA_DestHeight    , backgroundHeight
                        , DTA_FillColor     , RGB_BLACK
                        , DTA_KeepRatio     , true
                        , DTA_VirtualWidth  , screenWidth
                        , DTA_VirtualHeight , screenHeight
                        , DTA_Alpha         , BACKGROUND_ALPHA
                        );
    }
  }

  private static
  void drawText( int    x
               , int    y
               , int    height
               , Font   fnt
               , String question
               , String answer
               , int    screenWidth
               , int    screenHeight
               )
  {
    Screen.DrawText( fnt
                   , Font.CR_Yellow
                   , x
                   , y
                   , "$" .. question
                   , DTA_KeepRatio     , true
                   , DTA_VirtualWidth  , screenWidth
                   , DTA_VirtualHeight , screenHeight
                   );
    Screen.DrawText( fnt
                   , Font.CR_DarkGreen
                   , x
                   , y + height + FRAME * 2
                   , "$" .. answer
                   , DTA_KeepRatio     , true
                   , DTA_VirtualWidth  , screenWidth
                   , DTA_VirtualHeight , screenHeight
                   );
  }

// private: ////////////////////////////////////////////////////////////////////

  const BORDER       = 1;
  const PADDING      = 2;
  const FRAME        = BORDER + PADDING;

  const NOT_ANIMATED = 0; // false

  const RGB_BLACK    = 0x000000;
  const RGB_GOLD     = 0xF4AF31;

  const BORDER_ALPHA     = 0.2;
  const BACKGROUND_ALPHA = 0.2;

  const COMBAT_COLOR  = 0xFF0000;
  const EXPLORE_COLOR = 0x0000FF;

} // class tt_Drawing
