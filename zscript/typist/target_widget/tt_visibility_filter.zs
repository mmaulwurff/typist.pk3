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

/** This class implements TargetWidgetSource by taking target widgets from
 * source and removing widgets that represent targets not visible by the player.
 */
class tt_VisibilityFilter : tt_TargetWidgetSource
{

// public: /////////////////////////////////////////////////////////////////////

  tt_VisibilityFilter init(tt_TargetWidgetSource widgetSource, tt_PawnSource pawnSource)
  {
    _widgetSource = widgetSource;
    _pawnSource   = pawnSource;

    return self;
  }

// public: // tt_TargetWidgetSource ////////////////////////////////////////////

  override
  tt_TargetWidgets getWidgets(RenderEvent event)
  {
    let pawn = _pawnSource.getPawn();
    if (pawn == NULL) { return NULL; }

    let widgets = _widgetSource.getWidgets(event);
    if (widgets == NULL) { return NULL; }

    tt_TargetWidgets result = new("tt_TargetWidgets").init();

    uint nWidgets = widgets.size();
    for (uint i = 0; i < nWidgets; ++i)
    {
      let widget = widgets.at(i);

      if (isVisible(widget, pawn))
      {
        result.add(widget);
      }
    }

    return result;
  }

// private: ////////////////////////////////////////////////////////////////////

  private play
  bool isVisible(tt_TargetWidget widget, PlayerPawn pawn) const
  {
    let  targetActor = widget.getTarget().getTarget().getActor();
    bool visible     = pawn.IsVisible(targetActor, false);

    return visible;
  }

// private: ////////////////////////////////////////////////////////////////////

  const DISTANCE = 4000.0;

// private: ////////////////////////////////////////////////////////////////////

  private tt_TargetWidgetSource _widgetSource;
  private tt_PawnSource         _pawnSource;

} // class tt_VisibilityFilter
