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
class tt_DynamicTest
{

// private: ////////////////////////////////////////////////////////////////////

  private
  void testDeathReporter()
  {
    testDeathReporterSetUp("Checking Death Reporter");

    let targetsBefore = _deathReporter.getTargets();
    It("No targets before reporting", AssertEval(targetsBefore.size(), "==", 0));

    let something = Spawn("DoomImp", (0, 0, 0));
    _deathReporter.reportDead(something);
    let targetsAfter = _deathReporter.getTargets();
    It("Single target after reporting", AssertEval(targetsAfter.size(), "==", 1));

    let targetsAfterAfter = _deathReporter.getTargets();
    It("No new targets", AssertEval(targetsAfterAfter.size(), "==", 0));

    testDeathReporterTearDown();
  }

  private
  void testDeathReporterSetUp(string description)
  {
    Describe(description);

    _deathReporter = new("tt_DeathReporter").init();
  }

  private
  void testDeathReporterTearDown()
  {
    _deathReporter = NULL;

    EndDescribe();
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_DeathReporter _deathReporter;

} // class tt_DynamicTest
