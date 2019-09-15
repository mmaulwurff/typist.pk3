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
 * This class implement tt_View by getting a list of Target Widgets and drawing
 * them.
 */
class tt_TargetOverlay : tt_View
{

// public: /////////////////////////////////////////////////////////////////////

  tt_TargetOverlay init( tt_TargetWidgetSource targetWidgetSource
                       , tt_AnswerSource       answerSource
                       , tt_Settings           settings
                       )
  {
    _targetWidgetSource = targetWidgetSource;
    _answerSource       = answerSource;
    _settings           = settings;

    return self;
  }

// public: // tt_View //////////////////////////////////////////////////////////

  override
  void draw(RenderEvent event)
  {
    let answer  = _answerSource.getAnswer().getString();
    let widgets = _targetWidgetSource.getWidgets(event);

    uint nWidgets = widgets.size();
    for (uint i = 0; i < nWidgets; ++i)
    {
      let widget = widgets.at(i);
      drawWidget(widget, answer);
    }
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void drawWidget(tt_TargetWidget widget, String answer)
  {
    int  scale        = _settings.getScale();
    Font fnt          = NewSmallFont;
    int  screenWidth  = Screen.GetWidth()  / scale;
    int  screenHeight = Screen.GetHeight() / scale;

    let  question = widget.getTarget().getQuestion().getDescription();
    let  position = widget.getPosition() / scale;
    int  height   = fnt.GetHeight();
    int  width    = max(fnt.StringWidth(question), fnt.StringWidth(answer));

    double center = position.x - width / 2;
    int x = int(Clamp(center,     BORDER + PADDING, screenWidth  - BORDER - PADDING - width     ));
    int y = int(Clamp(position.y, BORDER + PADDING, screenHeight - BORDER - PADDING - height * 2));

    drawBoxes(x, y, width, height, screenWidth, screenHeight);
    drawText(x, y, height, fnt, question, answer, screenWidth, screenHeight);
  }

  private
  void drawBoxes( int x
                , int y
                , int width
                , int lineHeight
                , int screenWidth
                , int screenHeight
                )
  {
    // Texture is necessary for drawing, but in fact it isn't used.
    // The color is specified with DTA_FillColor.
    let dummyTexture = TexMan.CheckForTexture("tt-white", TexMan.Type_Any);

    drawBox(dummyTexture, x, y, width, lineHeight, screenWidth, screenHeight, RGB_GOLD);

    int lowerY = y + lineHeight + (BORDER + PADDING) * 2;
    drawBox(dummyTexture, x, lowerY, width, lineHeight, screenWidth, screenHeight, RGB_GREEN);
  }

  private
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
    {
      int borderX      = x - BORDER - PADDING;
      int borderY      = y - BORDER - PADDING;
      int borderWidth  = (BORDER + PADDING) * 2 + width;
      int borderHeight = (BORDER + PADDING) * 2 + lineHeight;

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
                        );
    }

    { // background
      int backgroundX      = x - PADDING;
      int backgroundY      = y - PADDING;
      int backgroundWidth  = PADDING * 2 + width;
      int backgroundHeight = PADDING * 2 + lineHeight;

      // background
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
                        );
    }
  }

  private
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
                   , question
                   , DTA_KeepRatio     , true
                   , DTA_VirtualWidth  , screenWidth
                   , DTA_VirtualHeight , screenHeight
                   );
    Screen.DrawText( fnt
                   , Font.CR_DarkGreen
                   , x
                   , y + height + (BORDER + PADDING) * 2
                   , answer
                   , DTA_KeepRatio     , true
                   , DTA_VirtualWidth  , screenWidth
                   , DTA_VirtualHeight , screenHeight
                   );
  }

// private: ////////////////////////////////////////////////////////////////////

  const BORDER       = 1;
  const PADDING      = 2;

  const NOT_ANIMATED = 0; // false

  const RGB_BLACK    = 0x000000;
  const RGB_GOLD     = 0xF4AF31;
  const RGB_GREEN    = 0x408436;

// private: ////////////////////////////////////////////////////////////////////

  private tt_TargetWidgetSource _targetWidgetSource;
  private tt_AnswerSource       _answerSource;
  private tt_Settings           _settings;

} // class tt_TargetOverlay
