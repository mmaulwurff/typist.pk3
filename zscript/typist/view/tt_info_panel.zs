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
 * This class implements View by collecting and displaying various information:
 * - game mode
 * - list of commands
 * - current input string
 */
class tt_InfoPanel : tt_View
{

// public: /////////////////////////////////////////////////////////////////////

  tt_InfoPanel init( tt_ModeSource   modeSource
                   , tt_AnswerSource answerSource
                   , tt_Activatable  activatable
                   )
  {
    _modeSource   = modeSource;
    _answerSource = answerSource;
    _activatable  = activatable;

    return self;
  }

// public: // tt_View //////////////////////////////////////////////////////////

  override
  void draw(RenderEvent event)
  {
    Vector2 position = (X_START, Y_START);

    position = drawMode    (position, _modeSource);
    position = drawAnswer  (position, _answerSource);
    position = drawCommands(position, _activatable);
  }

// private: ////////////////////////////////////////////////////////////////////

  private static ui
  Vector2 drawMode(Vector2 xy, tt_ModeSource modeSource)
  {
    Font   fnt         = NewSmallFont;
    let    color       = Font.CR_WHITE;
    int    mode        = modeSource.getMode();
    String modeNames[] = { "$TT_MODE_UNKNOWN"
                         , "$TT_MODE_COMBAT"
                         , "$TT_MODE_EXPLORE"
                         , "$TT_MODE_NONE"
                         };
    String modeName    = StringTable.Localize(modeNames[mode]);

    Screen.DrawText(fnt, color, xy.x, xy.y, modeName);

    return (xy.x, xy.y + fnt.GetHeight());
  }

  private static ui
  Vector2 drawAnswer(Vector2 xy, tt_AnswerSource answerSource)
  {
    Font   fnt    = NewSmallFont;
    let    color  = Font.CR_WHITE;
    String answer = answerSource.getAnswer().getString();

    Screen.DrawText(fnt, color, xy.x, xy.y, answer);

    return (xy.x, xy.y + fnt.GetHeight());
  }

  private static ui
  Vector2 drawCommands(Vector2 xy, tt_Activatable activatable)
  {
    Font fnt        = NewSmallFont;
    let  color      = Font.CR_WHITE;
    int  lineHeight = fnt.GetHeight();
    let  commands   = activatable.getCommands();
    uint nCommands  = commands.size();

    for (uint i = 0; i < nCommands; ++i)
    {
      let command = commands.at(i);
      Screen.DrawText(fnt, color, xy.x, xy.y, command);
      xy.y += lineHeight;
    }

    return xy;
  }

// private: ////////////////////////////////////////////////////////////////////

  const X_START = 10;
  const Y_START = 10;

// private: ////////////////////////////////////////////////////////////////////

  private tt_ModeSource   _modeSource;
  private tt_AnswerSource _answerSource;
  private tt_Activatable  _activatable;

} // class tt_InfoPanel
