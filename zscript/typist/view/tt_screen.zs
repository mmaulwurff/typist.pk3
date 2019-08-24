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

/** This class implement tt_View by getting a list of Target Widgets and drawing
 * them.
 */
class tt_Screen : tt_View
{

// public: /////////////////////////////////////////////////////////////////////

  tt_Screen init(tt_TargetWidgetSource targetWidgetSource, tt_AnswerSource answerSource)
  {
    _targetWidgetSource = targetWidgetSource;
    _answerSource       = answerSource;

    return self;
  }

// public: // tt_View //////////////////////////////////////////////////////////

  override
  void draw(RenderEvent event)
  {
    let    answer  = _answerSource.getAnswer().getString();
    let    widgets = _targetWidgetSource.getWidgets(event);

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
    Font   fnt      = NewSmallFont;
    let    question = widget.getTarget().getQuestion().getDescription();
    let    position = widget.getPosition();
    double x        = position.x;
    double y        = position.y;
    int    height   = fnt.GetHeight();
    int    width    = max(fnt.StringWidth(question), fnt.StringWidth(answer)) + 4;
    let    black    = TexMan.CheckForTexture("tt_black", TexMan.Type_Any);
    int    frameX   = int(round(x)) - 2;
    int    frameY   = int(round(y));

    Screen.DrawTexture( black, false, x - 2, y
                      , DTA_DestWidth,  width
                      , DTA_DestHeight, height * 2
                      , DTA_FillColor,  0
                      );
    Screen.DrawFrame(frameX, frameY, width, height);
    Screen.DrawFrame(frameX, frameY, width, height * 2);
    Screen.DrawText(fnt, Font.CR_WHITE, x, y, question);
    Screen.DrawText(fnt, Font.CR_WHITE, x, y + height, answer);
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_TargetWidgetSource _targetWidgetSource;
  private tt_AnswerSource       _answerSource;

} // class tt_Screen
