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
 * This class implements a view by taking another view, and calling draw()
 * only if conditions are met.
 *
 * The list of conditions:
 * - not in a menu
 * - there are monsters on the level
 *
 * @attention this class reads data from global scope.
 */
class tt_ConditionalView : tt_View
{

// public: /////////////////////////////////////////////////////////////////////

  tt_ConditionalView init(tt_View view)
  {
    _view = view;

    return self;
  }

// public: // tt_View //////////////////////////////////////////////////////////

  override
  void draw(RenderEvent event)
  {
    bool areConditionsMet = !isInMenu()
                         && !isLevelClear()
                          ;
    if (areConditionsMet)
    {
      _view.draw(event);
    }
  }

// private: ////////////////////////////////////////////////////////////////////

  private ui
  bool isInMenu()
  {
    return menuActive;
  }

  private ui
  bool isLevelClear()
  {
    int  nMonsters = level.total_monsters - level.killed_monsters;
    bool isClear   = (nMonsters == 0);
    return isClear;
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_View _view;

} // class tt_ConditionalView
