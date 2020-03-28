/* Copyright Alexander 'm8f' Kromm (mmaulwurff@gmail.com) 2019-2020
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

class tt_TotalClockTest : tt_Clematis
{

// public: tt_Clematis /////////////////////////////////////////////////////////

  override
  void TestSuites()
  {
    Describe("Checking TotalClock");

    checkNow();
    checkSince();

    EndDescribe();
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void checkNow()
  {
    let clock = tt_TotalClock.of();

    int now1 = clock.getNow();
    int now2 = clock.getNow();

    It("Now is now", AssertEval(now1, "==", now2));
  }

  private play
  void checkSince() const
  {
    let clock = tt_TotalClock.of();
    int now   = clock.getNow();

    // Store somewhere
    players[consolePlayer].mo.score = now;

    // See the rest of the test in class tt_TotalClockTestPostCheck.
  }

} // class tt_TotalClockTest
