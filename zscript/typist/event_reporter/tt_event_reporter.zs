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
 * This class is an interface for reporting events.
 */
class tt_EventReporter abstract
{

// public: /////////////////////////////////////////////////////////////////////

  virtual
  void reportNewMode(int mode)
  {
    tt_Log.log("zscript/typist/event_reporter/tt_event_reporter.zs:29: T: override this!");
  }

  virtual
  void reportKeyPressed()
  {
    tt_Log.log("zscript/typist/event_reporter/tt_event_reporter.zs:35: T: override this!");
  }

  virtual
  void reportAnswerMatch()
  {
    tt_Log.log("zscript/typist/event_reporter/tt_event_reporter.zs:41: T: override this!");
  }

  virtual
  void reportAnswerNotMatch()
  {
    tt_Log.log("zscript/typist/event_reporter/tt_event_reporter.zs:47: T: override this!");
  }

} // class tt_EventReporter
