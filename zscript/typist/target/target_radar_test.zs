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

class tt_TargetRadarTest : tt_Clematis
{

// public: /////////////////////////////////////////////////////////////////////

  override
  void TestSuites()
  {
    checkActorsAround();
    checkDistantActor();
    checkNonLivingActor();
    checkDeadActor();
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void checkActorsAround()
  {
    setUp("Checking Target Radar: actors around");

    Array<Actor> actors;
    actors.push(Spawn("DoomImp", ( 5,  0,  0)));
    actors.push(Spawn("DoomImp", (-5,  0,  0)));
    actors.push(Spawn("DoomImp", ( 0,  5,  0)));
    actors.push(Spawn("DoomImp", ( 0, -5,  0)));
    actors.push(Spawn("DoomImp", ( 0,  0,  5)));
    actors.push(Spawn("DoomImp", ( 0,  0, -5)));

    _targetRadarTestOriginSource.expect_getOrigin(tt_Origin.of((0, 0, 0)));

    let targets  = _targetRadarTestTargetRadar.getTargets();
    uint nActors = actors.size();
    for (uint i = 0; i < nActors; ++i)
    {
      let a = tt_Target.of(actors[i]);
      It(String.Format("Actor %d is present in list", i), Assert(targets.contains(a)));
    }

    tearDown();
  }

  private
  void checkDistantActor()
  {
    setUp("Checking Target Radar: distant actor");

    _targetRadarTestOriginSource.expect_getOrigin(tt_Origin.of((0, 0, 0)));

    let distantActor  = Spawn("DoomImp", (1000, 0, 0));
    let distantTarget = tt_Target.of(distantActor);
    let targets       = _targetRadarTestTargetRadar.getTargets();

    It("Distant actor is not in list", AssertFalse(targets.contains(distantTarget)));

    tearDown();
  }

  private
  void checkNonLivingActor()
  {
    setUp("Checking Target Radar: non-living actor");

    _targetRadarTestOriginSource.expect_getOrigin(tt_Origin.of((0, 0, 0)));

    let nonLiving       = Spawn("Medikit", (1, 0, 0));
    let targets         = _targetRadarTestTargetRadar.getTargets();
    let nonLivingTarget = tt_Target.of(nonLiving);

    It("Non-living actor is not in list", AssertFalse(targets.contains(nonLivingTarget)));

    tearDown();
  }

  private
  void checkDeadActor()
  {
    setUp("Checking Target Radar: dead actor");

    _targetRadarTestOriginSource.expect_getOrigin(tt_Origin.of((0, 0, 0)));

    let deadActor  = Spawn("DoomImp", (1, 0, 0));
    Kill(deadActor);
    let targets    = _targetRadarTestTargetRadar.getTargets();
    let deadTarget = tt_Target.of(deadActor);

    It("Dead actor is not in list", AssertFalse(targets.contains(deadTarget)));

    tearDown();
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void setUp(String description)
  {
    Describe(description);

    _targetRadarTestOriginSource = tt_OriginSourceMock.of();
    _targetRadarTestTargetRadar  = tt_TargetRadar.of(_targetRadarTestOriginSource);
  }

  private
  void tearDown()
  {
    It("Origin Source is satisfied", Assert(_targetRadarTestOriginSource.isSatisfied_getOrigin()));

    _targetRadarTestOriginSource = NULL;
    _targetRadarTestTargetRadar  = NULL;

    EndDescribe();
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_OriginSourceMock _targetRadarTestOriginSource;
  private tt_TargetRadar      _targetRadarTestTargetRadar;

} // class tt_TargetRadarTest
