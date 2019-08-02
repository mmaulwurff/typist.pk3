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

// private: //////////////////////////////////////////////////////////////////

  private
  void testActorOriginSource()
  {
    Describe("Checking Actor Origin Source");

    double x   = 1;
    double y   = 2;
    double z   = 3;
    let    imp = Spawn("DoomImp", (x, y, z));

    let actorSource  = new("tt_ActorSourceMock").init();
    let originSource = new("tt_ActorOriginSource").init(actorSource);

    actorSource.expect_getActor(imp);

    let origin = originSource.getOrigin().position();
    let impZ   = imp.height / 2 + z;

    It("X matches", AssertEval(x,    "==", origin.x));
    It("Y matches", AssertEval(y,    "==", origin.y));
    It("Z matches", AssertEval(impZ, "==", origin.z));
    It("Actor source is satisfied", Assert(actorSource.isSatisfied_getActor()));

    EndDescribe();
  }

// private: //////////////////////////////////////////////////////////////////

  private play
  Actor Spawn(class<Actor> type, vector3 pos) const
  {
    return Actor.Spawn(type, pos);
  }

} // class tt_DynamicTest
