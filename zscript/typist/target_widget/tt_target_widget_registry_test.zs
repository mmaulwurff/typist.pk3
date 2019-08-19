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

extend
class tt_Test
{

// private: ////////////////////////////////////////////////////////////////////

  private
  void testTargetWidgetRegistry()
  {
    Describe("Checking Target Widget Registry");

    let knownTargetSource = new("tt_KnownTargetSourceMock").init();
    let registry          = new("tt_TargetWidgetRegistry").init(knownTargetSource);
    let target            = new("tt_TargetMock").init();
    let knownTargets      = new("tt_KnownTargets").init();
    let knownTarget       = new("tt_KnownTarget").init(target, NULL);
    knownTargets.add(knownTarget);

    target.expect_position((0, 100, 0));
    knownTargetSource.expect_getTargets(knownTargets);

    let widgets  = registry.getWidgets();
    let position = widgets.at(0).position();

    It("Screen X position must be reasonable", AssertEval(position.x, ">", 0));
    It("Screen Y position must be reasonable", AssertEval(position.y, ">", 0));
    It("Target must be registered", AssertEval(widgets.size(), "==", 1));
    It("Target Source must be satisfied", Assert(knownTargetSource.isSatisfied_getTargets()));

    EndDescribe();
  }

} // class tt_Test
