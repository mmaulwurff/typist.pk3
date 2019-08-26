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

/** This class implements TargetWidgetSource by storing target widgets, getting
 * new widgets from the source, and updating the coordinates of the widgets that
 * are already registered.
 */
class tt_TargetWidgetRegistry : tt_TargetWidgetSource
{

// public: /////////////////////////////////////////////////////////////////////

  tt_TargetWidgetRegistry init(tt_TargetWidgetSource source)
  {
    _source   = source;
    _registry = new("tt_TargetWidgets").init();

    return self;
  }

// public: // tt_TargetWidgetSource ////////////////////////////////////////////

  override
  tt_TargetWidgets getWidgets(RenderEvent event)
  {
    let widgets     = _source.getWidgets(event);
    let newRegistry = new("tt_TargetWidgets").init();

    uint nWidgets = widgets.size();
    for (uint i = 0; i < nWidgets; ++i)
    {
      let widget   = widgets.at(i);
      let target   = widget.getTarget().getTarget();
      let existing = _registry.find(target);

      if (existing == NULL)
      {
        newRegistry.add(widget);
      }
      else
      {
        newRegistry.add(existing);
        let newPosition      = widget.getPosition();
        let existingPosition = existing.getPosition();
        let middle           = (newPosition + existingPosition) / 2;
        existing.setPosition(middle);
      }
    }

    // Widgets that are not new or not updated are thrown away.
    _registry = newRegistry;

    return _registry;
  }

  override
  void prepare()
  {
    // do nothing - nothing to do.
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_TargetWidgetSource _source;
  private tt_TargetWidgets      _registry;

} // class tt_TargetWidgetRegistry
