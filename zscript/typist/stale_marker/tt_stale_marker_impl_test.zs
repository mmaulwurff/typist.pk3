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

/**
 * This is a test for tt_StaleMarkerImpl.
 */
class tt_StaleMarkerImplTest : tt_Clematis
{

// public: // tt_Clematis //////////////////////////////////////////////////////

  override
  void TestSuites()
  {
    Describe("Checking tt_StaleMarkerImpl");

    checkFirstRead();
    checkNotYetStale();
    checkAlreadyStale();

    EndDescribe();
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void checkFirstRead()
  {
    setUp();

    bool isStale = _staleMarker.isStale();
    It("First read: stale", Assert(isStale));
  }

  private
  void checkNotYetStale()
  {
    setUp();

    bool isStale1 = _staleMarker.isStale();

    _clock.expect_since(0);
    bool isStale2 = _staleMarker.isStale();
    It("Same tick: not stale", Assert(!isStale2));
  }

  private
  void checkAlreadyStale()
  {
    setUp();

    bool isStale1 = _staleMarker.isStale();

    _clock.expect_since(1);
    bool isStale2 = _staleMarker.isStale();
    It("New tick: stale", Assert(isStale2));
  }

  private
  void setUp()
  {
    _clock = tt_ClockMock.of();
    _staleMarker = tt_StaleMarkerImpl.of(_clock, 1);
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_ClockMock   _clock;
  private tt_StaleMarker _staleMarker;

} // class tt_CacheTest
