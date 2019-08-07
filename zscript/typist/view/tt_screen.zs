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

  tt_Screen init(tt_TargetWidgetSource targetWidgetSource)
  {
    _targetWidgetSource = targetWidgetSource;

    return self;
  }

// public: // tt_View //////////////////////////////////////////////////////////

  override
  void draw()
  {
    let  widgets  = _targetWidgetSource.getWidgets();
    uint nWidgets = widgets.size();

    for (uint i = 0; i < nWidgets; ++i)
    {
      let widget   = widgets.at(i);
      let question = widget.target().question().getDescription();
      let position = widget.position();
      Screen.DrawText(SmallFont, Font.CR_WHITE, position.x, position.y, question);
    }
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_TargetWidgetSource _targetWidgetSource;

} // class tt_Screen
