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
 * This class implements TargetWidgetSource by accumulating Target Widgets.
 *
 * @attention This class has no tests. Modifications must be checked manually.
 */
class tt_Projector : tt_TargetWidgetSource
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_Projector of(tt_KnownTargetSource knownTargetSource, tt_PlayerSource playerSource)
  {
    let result = new("tt_Projector"); // construct

    result._knownTargetSource = knownTargetSource;
    result._playerSource      = playerSource;
    result._cvarRenderer      = tt_Cvar.of(playerSource, "vid_rendermode");

    result._glProjection = new("tt_Le_GlScreen"); // construct (silencing check_init.sh).
    result._swProjection = new("tt_Le_SwScreen"); // construct (silencing check_init.sh).

    return result;
  }

// public: // tt_TargetWidgetSource ////////////////////////////////////////////

  override
  tt_TargetWidgets getWidgets(RenderEvent event)
  {
    let targets = _knownTargetSource.getTargets();
    let info    = _playerSource.getInfo();
    let result  = tt_TargetWidgets.of();

    prepareProjection();

    _projection.CacheResolution();
    _projection.CacheFov(info.fov);
    _projection.OrientForRenderOverlay(event);
    _projection.BeginProjection();

    tt_Le_Viewport viewport;
    viewport.FromHud();

    uint nTargets = targets.size();
    for (uint i = 0; i < nTargets; ++i)
    {
      let target = targets.at(i);

      let targetActor = target.getTarget().getActor();
      if (targetActor == NULL)
      {
        continue;
      }

      Vector3 targetPos = target.getTarget().getPosition().getVector();
      Vector2 position;
      bool    isPositionSuccessful;
      [position, isPositionSuccessful] = makeDrawPos(targetPos, viewport);

      if (isPositionSuccessful)
      {
        let widget = tt_TargetWidget.of(target, position);
        result.add(widget);
      }
    }

    return result;
  }

// private: ////////////////////////////////////////////////////////////////////

  /**
   * Calculates the screen position (draw position).
   * @returns screen position and success flag.
   */
  private ui
  Vector2, bool makeDrawPos(Vector3 targetPos, tt_Le_Viewport viewport)
  {
    _projection.ProjectWorldPos(targetPos);

    if(!_projection.IsInFront())
    {
      return (0, 0), false;
    }

    Vector2 drawPos = viewport.SceneToWindow(_projection.ProjectToNormal());

    return drawPos, true;
  }

  private
  void prepareProjection()
  {
    if(_cvarRenderer.isDefined())
    {
      switch (_cvarRenderer.getInt())
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
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_KnownTargetSource _knownTargetSource;
  private tt_PlayerSource      _playerSource;

  private tt_Le_ProjScreen _projection;
  private tt_Le_GlScreen   _glProjection;
  private tt_Le_SwScreen   _swProjection;

  private transient bool _isInitialized;

  private tt_Cvar _cvarRenderer;

} // class tt_Projector
