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

/** This interface provides a source of target widgets.
 */
class tt_TargetWidgetSource abstract
{

// public: /////////////////////////////////////////////////////////////////////

  /** Get a list of target widgets.
   *
   * @returns a list of target widgets.
   */
  ui virtual
  tt_TargetWidgets getWidgets(RenderEvent event)
  {
    Console.Printf("zscript/typist/target_widget/tt_target_widget_source.zs:32: T: override this!");
    return NULL;
  }

  /** Makes necessary preparations.
   */
  virtual
  void prepare()
  {
    Console.Printf("zscript/typist/target_widget/tt_target_widget_source.zs:41: T: override this!");
  }

} // class tt_TargetWidgetSource
