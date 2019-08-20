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

class tt_TargetWidgetTest : tt_Clematis
{

// public: /////////////////////////////////////////////////////////////////////

  override
  void TestSuites()
  {
    Describe("Testing Target Widget");

    tt_KnownTarget target;
    Vector2        initialPosition;
    initialPosition.x = 0;
    initialPosition.y = 0;
    let widget = new("tt_TargetWidget").init(target, initialPosition);

    It("store initial position", Assert(initialPosition == widget.position()), LOG_Error);

    Vector2 newPosition;
    newPosition.x = 1;
    newPosition.y = 2;

    widget.setPosition(newPosition);
    It("still initial position", Assert(initialPosition == widget.position()), LOG_Error);

    widget.stepPosition();
    It("position changed", Assert(initialPosition != widget.position()), LOG_Error);

    // Make the remaining steps.
    for (int i = 0; i < tt_TargetWidget.N_STEPS - 1; ++i) { widget.stepPosition(); }
    It("now position is set", Assert(newPosition == widget.position()), LOG_Error);

    EndDescribe();
  }

} // class tt_TargetWidgetTest
