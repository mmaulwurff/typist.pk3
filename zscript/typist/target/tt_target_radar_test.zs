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
  void testTargetRadar()
  {
    checkActorsAround();
    checkDistantActor();
    checkNonLivingActor();
    checkDeadActor();
  }

  private
  void checkActorsAround()
  {
    targetRadarTestSetUp("Checking Target Radar: actors around");

    Array<Actor> actors;
    actors.push(Spawn("DoomImp", ( 5,  0,  0)));
    actors.push(Spawn("DoomImp", (-5,  0,  0)));
    actors.push(Spawn("DoomImp", ( 0,  5,  0)));
    actors.push(Spawn("DoomImp", ( 0, -5,  0)));
    actors.push(Spawn("DoomImp", ( 0,  0,  5)));
    actors.push(Spawn("DoomImp", ( 0,  0, -5)));

    _targetRadarTestOriginSource.expect_getOrigin(new("tt_Origin").init((0, 0, 0)));

    let targets  = _targetRadarTestTargetRadar.getTargets();
    uint nActors = actors.size();
    for (uint i = 0; i < nActors; ++i)
    {
      let id = tt_TargetID.fromActor(actors[i]);
      It(String.Format("Actor %d is present in list", i), Assert(targets.contains(id)));
    }

    targetRadarTestTearDown();
  }

  private
  void checkDistantActor()
  {
    targetRadarTestSetUp("Checking Target Radar: distant actor");

    _targetRadarTestOriginSource.expect_getOrigin(new("tt_Origin").init((0, 0, 0)));

    let distantActor = Spawn("DoomImp", (1000, 0, 0));
    let targets      = _targetRadarTestTargetRadar.getTargets();
    let distantID    = tt_TargetID.fromActor(distantActor);

    It("Distant actor is not in list", AssertFalse(targets.contains(distantID)));

    targetRadarTestTearDown();
  }

  private
  void checkNonLivingActor()
  {
    targetRadarTestSetUp("Checking Target Radar: non-living actor");

    _targetRadarTestOriginSource.expect_getOrigin(new("tt_Origin").init((0, 0, 0)));

    let nonLiving   = Spawn("Medikit", (1, 0, 0));
    let targets     = _targetRadarTestTargetRadar.getTargets();
    let nonLivingID = tt_TargetID.fromActor(nonLiving);

    It("Non-living actor is not in list", AssertFalse(targets.contains(nonLivingID)));

    targetRadarTestTearDown();
  }

  private
  void checkDeadActor()
  {
    targetRadarTestSetUp("Checking Target Radar: dead actor");

    _targetRadarTestOriginSource.expect_getOrigin(new("tt_Origin").init((0, 0, 0)));

    let deadActor   = Spawn("DoomImp", (1, 0, 0));
    Kill(deadActor);
    let targets     = _targetRadarTestTargetRadar.getTargets();
    let deadActorID = tt_TargetID.fromActor(deadActor);

    It("Dead actor is not in list", AssertFalse(targets.contains(deadActorID)));

    targetRadarTestTearDown();
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void targetRadarTestSetUp(string description)
  {
    Describe(description);

    _targetRadarTestOriginSource = new("tt_OriginSourceMock").init();
    _targetRadarTestTargetRadar  = new("tt_TargetRadar").init(_targetRadarTestOriginSource);
  }

  private
  void targetRadarTestTearDown()
  {
    It("Origin Source is satisfied", Assert(_targetRadarTestOriginSource.isSatisfied_getOrigin()));

    _targetRadarTestOriginSource = NULL;
    _targetRadarTestTargetRadar  = NULL;

    EndDescribe();
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_OriginSourceMock _targetRadarTestOriginSource;
  private tt_TargetRadar      _targetRadarTestTargetRadar;

} // class tt_DynamicTests