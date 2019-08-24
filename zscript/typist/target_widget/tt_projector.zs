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

/** This class implements TargetWidgetSource by accumulating Target Widgets.
 *
 * @attention This class has no tests. Modifications must be checked manually.
 */
class tt_Projector : tt_TargetWidgetSource
{

// public: /////////////////////////////////////////////////////////////////////

  tt_Projector init(tt_KnownTargetSource knownTargetSource, tt_PlayerInfoSource playerInfoSource)
  {
    _knownTargetSource = knownTargetSource;
    _playerInfoSource  = playerInfoSource;

    return self;
  }

// public: // tt_TargetWidgetSource ////////////////////////////////////////////

  override
  tt_TargetWidgets getWidgets(RenderEvent event)
  {
    let targets = _knownTargetSource.getTargets();
    let info    = _playerInfoSource.getPlayerInfo();
    let result  = new("tt_TargetWidgets").init();

    uint nTargets = targets.size();
    for (uint i = 0; i < nTargets; ++i)
    {
      let target    = targets.at(i);
      let targetPos = target.getTarget().getPosition();
      Vector2 position;
      bool    isPositionSuccessful;
      [position, isPositionSuccessful] = makeDrawPos(info, event, targetPos);

      if (isPositionSuccessful)
      {
        let widget = new("tt_TargetWidget").init(target, position);
        result.add(widget);
      }
    }

    return result;
  }

  override
  void prepare()
  {
    if (!_isInitialized) { initialize(); }
    prepareProjection();
  }

// private: ////////////////////////////////////////////////////////////////////

  /**
   * Calculates the screen position (draw position).
   * @returns screen position and success flag.
   */
  private ui
  Vector2, bool makeDrawPos(PlayerInfo player, RenderEvent event, Vector3 targetPos)
  {
    _projection.CacheResolution();
    _projection.CacheFov(player.fov);
    _projection.OrientForRenderOverlay(event);
    _projection.BeginProjection();

    _projection.ProjectWorldPos(targetPos);

    if(!_projection.IsInFront())
    {
      return (0, 0), false;
    }

    tt_Le_Viewport viewport;
    viewport.FromHud();

    Vector2 drawPos = viewport.SceneToWindow(_projection.ProjectToNormal());

    return drawPos, true;
  }

  private
  void initialize()
  {
    _glProjection = new("tt_Le_GlScreen"); // init() (silencing code check for a third-party class).
    _swProjection = new("tt_Le_SwScreen"); // init() (silencing code check for a third-party class).

    let info = _playerInfoSource.getPlayerInfo();
    _cvarRenderer  = Cvar.GetCvar("vid_rendermode", info);

    _isInitialized = true;
  }

  private
  void prepareProjection()
  {
    if(_cvarRenderer)
    {
      switch (_cvarRenderer.GetInt())
      {
      case 0:
      case 1:  _projection = _swProjection; break;
      default: _projection = _glProjection; break;
      }
    }
    else // cannot get render mode.
    {
      _projection = _glProjection;
    }

    _isPrepared = (_projection != NULL);
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_KnownTargetSource _knownTargetSource;
  private tt_PlayerInfoSource  _playerInfoSource;

  private tt_Le_ProjScreen _projection;
  private tt_Le_GlScreen   _glProjection;
  private tt_Le_SwScreen   _swProjection;

  private transient bool   _isInitialized;
  private transient bool   _isPrepared;
  private transient CVar   _cvarRenderer;

} // class tt_Projector
