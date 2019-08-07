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

/** This class implements tt_TargetWidgetSource by accumulating Target Widgets.
 * Target Widgets expire when they go out of sight.
 */
class tt_TargetWidgetRegistry : tt_TargetWidgetSource
{

// public: /////////////////////////////////////////////////////////////////////

  tt_TargetWidgetRegistry init(tt_KnownTargetSource knownTargetSource)
  {
    _knownTargetSource = knownTargetSource;

    return self;
  }

// public: // tt_TargetWidgetSource ////////////////////////////////////////////

  override
  tt_TargetWidgets getWidgets()
  {
    let  targets  = _knownTargetSource.getTargets();
    let  result   = new("tt_TargetWidgets").init();
    uint nTargets = targets.size();

    for (uint i = 0; i < nTargets; ++i)
    {
      let target   = targets.at(i);
      let position = (10, 10 + i * 30);
      let widget   = new("tt_TargetWidget").init(target, position);
      result.add(widget);
    }

    return result;
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_KnownTargetSource _knownTargetSource;

} // class tt_TargetWidgetRegistry
