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
 * This class implements View by collecting and displaying various information:
 * - game mode
 * - list of commands
 * - current input string
 * - several targets
 */
class tt_InfoPanel : tt_View
{

// public: /////////////////////////////////////////////////////////////////////

  tt_InfoPanel init( tt_ModeSource        modeSource
                   , tt_AnswerSource      answerSource
                   , tt_Activatable       activatable
                   , tt_KnownTargetSource knownTargetSource
                   , tt_Settings          settings
                   , tt_PlayerSource      playerSource
                   )
  {
    _modeSource   = modeSource;
    _answerSource = answerSource;
    _activatable  = activatable;
    _targetSource = knownTargetSource;
    _settings     = settings;
    _playerSource = playerSource;

    return self;
  }

// public: // tt_View //////////////////////////////////////////////////////////

  override
  void draw(RenderEvent event)
  {
    int     screenWidth = Screen.GetWidth();
    int     xStart      = screenWidth / 2;
    Vector2 position    = (xStart, Y_START);
    Font    fnt         = NewSmallFont;

    drawMode(position);
    position.y += fnt.GetHeight();

    drawTargets (position);
    drawCommands(position);
  }

// private: ////////////////////////////////////////////////////////////////////

  private ui
  void drawMode(Vector2 xy)
  {
    int scale = _settings.getScale();
    xy /= scale;

    Font   fnt          = NewSmallFont;
    int    mode         = _modeSource.getMode();
    let    color        = (mode == tt_Mode.Combat ? Font.CR_RED : Font.CR_BLUE);
    String modeNames[]  = { "$TT_MODE_UNKNOWN"
                          , "$TT_MODE_COMBAT"
                          , "$TT_MODE_EXPLORE"
                          , "$TT_MODE_NONE"
                          };
    String modeName     = StringTable.Localize(modeNames[mode]);
    int    xStart       = int(xy.x - fnt.StringWidth(modeName) / 2);
    int    screenWidth  = Screen.GetWidth() / scale;
    int    screenHeight = Screen.GetHeight() / scale;

    Screen.DrawText( fnt
                   , color
                   , xStart
                   , xy.y
                   , modeName
                   , DTA_KeepRatio     , true
                   , DTA_VirtualWidth  , screenWidth
                   , DTA_VirtualHeight , screenHeight
                   );
  }

  private ui
  void drawTargets(Vector2 xy)
  {
    int scale       = _settings.getScale();
    int screenWidth = Screen.GetWidth();
    int x           = int(xy.x + HORIZONTAL_MARGIN);
    int y           = int(xy.y + (VERTICAL_MARGIN * scale));
    let targets     = _targetSource.getTargets();
    let answer      = _answerSource.getAnswer();
    let nTargets    = targets.size();
    let player      = _playerSource.getPawn();

    for (uint i = 0; i < nTargets; ++i)
    {
      let target = targets.at(i);

      if (!isVisible(player, target.getTarget().getActor())) { continue; }

      let    question       = target.getQuestion();
      String questionString = question.getDescription();
      String hintedAnswer   = question.getHintFor(answer);
      int    targetWidth    = tt_Drawing.getWidthForTarget(questionString, hintedAnswer, _settings);

      if (x + targetWidth > screenWidth) { return; }

      Vector2 position = (x, y);
      tt_Drawing.drawTarget(position, questionString, hintedAnswer, _settings, NOT_CENTERED);

      x += targetWidth + 2;
    }
  }

  private ui
  void drawCommands(Vector2 xy)
  {
    int scale        = _settings.getScale();
    let  commands    = _activatable.getCommands();
    int  screenWidth = Screen.GetWidth();
    uint nCommands   = commands.size();
    int  x           = int(xy.x - HORIZONTAL_MARGIN);
    int  y           = int(xy.y + (VERTICAL_MARGIN * scale));
    let answer       = _answerSource.getAnswer().getString();

    for (uint i = 0; i < nCommands; ++i)
    {
      let command     = commands.at(i);
      int targetWidth = tt_Drawing.getWidthForTarget(command, answer, _settings);

      if (x - targetWidth < 0) { return; }

      Vector2 position = (x - targetWidth, y);
      tt_Drawing.drawTarget(position, command, answer, _settings, NOT_CENTERED);

      x -= targetWidth + 2;
    }
  }

// private: ////////////////////////////////////////////////////////////////////

  private play
  bool isVisible(Actor player, Actor other) const
  {
    return player.IsVisible(other, ALL_AROUND);
  }

// private: ////////////////////////////////////////////////////////////////////

  const Y_START = 10;

  const HORIZONTAL_MARGIN = 10;
  const VERTICAL_MARGIN   = 20;

  const NOT_CENTERED = 0; // false

  const ALL_AROUND = 1; // true

// private: ////////////////////////////////////////////////////////////////////

  private tt_ModeSource        _modeSource;
  private tt_AnswerSource      _answerSource;
  private tt_Activatable       _activatable;
  private tt_KnownTargetSource _targetSource;
  private tt_Settings          _settings;
  private tt_PlayerSource      _playerSource;

} // class tt_InfoPanel
