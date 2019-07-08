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

/** Entry point for Typist.pk3.
 */
class tt_EventHandler : EventHandler
{

  // public: // EventHandler ///////////////////////////////////////////////////

  override
  void WorldTick()
  {
    console.printf("./zscript/typist/tt_event_handler.zs:28: T: hello %d", i);
    if (i >= 10)
    {

      console.printf("./zscript/typist/tt_event_handler.zs:32: T: Test finished.");
    }
    ++i;
  }

  override
  void OnRegister()
  {
    tt_Clematis.Create("tt_Test");

    console.printf("./zscript/typist/tt_event_handler.zs:42: T: onRegister");

    for (int i = 0; i < 10; ++i)
    {
      console.printf("./zscript/typist/tt_event_handler.zs:46: T: hello %d", i);
    }
    console.printf("./zscript/typist/tt_event_handler.zs:48: T: Test finished.");
  }

  private int i;

} // class tt_EventHandler