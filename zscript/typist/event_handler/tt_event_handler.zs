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

// public: // EventHandler /////////////////////////////////////////////////////

  override
  void OnRegister()
  {
    if (isTestingEnabled()) { runTests(); }
  }

// private: ////////////////////////////////////////////////////////////////////

  private bool isTestingEnabled() const
  {
    CVar isTestEnabledCVar = CVar.FindCVar("tt_is_test_enabled");
    return (isTestEnabledCVar != NULL && isTestEnabledCVar.GetBool());
  }

  private void runTests()
  {
    tt_Clematis.Create("tt_Test");

    // This console log is required for test script to understand that it
    // should stop GZDoom execution.
    Console.Printf("zscript/typist/event_handler/tt_event_handler.zs:45: T: Test finished.");
  }

} // class tt_EventHandler
