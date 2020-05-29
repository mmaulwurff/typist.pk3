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
 * This class implements tt_OriginSource by selecting one of the two supplied
 * origin sources based on a certain value from tt_Settings.
 */
class tt_SelectableOriginSource : tt_OriginSource
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_SelectableOriginSource of( tt_OriginSource source1
                              , tt_OriginSource source2
                              , tt_Settings     settings
                              )
  {
    let result = new("tt_SelectableOriginSource"); // construct;

    result._source1 = source1;
    result._source2 = source2;
    result._settings = settings;

    return result;
  }

  override
  tt_Origin getOrigin()
  {
    return _settings.isFastConfirmation()
      ? _source1.getOrigin()
      : _source2.getOrigin()
      ;
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_OriginSource _source1;
  private tt_OriginSource _source2;
  private tt_Settings     _settings;

} // class tt_SelectableOriginSource
