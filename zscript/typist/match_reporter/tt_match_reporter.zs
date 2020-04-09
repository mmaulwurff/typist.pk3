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
 * This class reports match and not-match events by looking at tt_AnswerSource,
 * tt_OriginSource (for having an origin), and only once per attempt.
 */
class tt_MatchReporter
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_MatchReporter of( tt_EventReporter eventReporter
                     , tt_OriginSource  originSource
                     )
  {
    let result = new("tt_MatchReporter"); // construct

    result._eventReporter = eventReporter;
    result._originSource  = originSource;

    result._isReported = false;

    return result;
  }

  void report()
  {
    if (_isReported)
    {
      return;
    }

    bool hasOrigin = (_originSource.getOrigin() != NULL);
    if (hasOrigin)
    {
      _eventReporter.reportAnswerMatch();
    }
    else
    {
      _eventReporter.reportAnswerNotMatch();
    }

    _isReported = true;
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_EventReporter _eventReporter;
  private tt_OriginSource  _originSource;

  private bool _isReported;

} // class tt_MatchReporter
