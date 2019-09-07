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

/**
 * This class implements TargetWidgetSource by taking another TargetWidgetSource
 * and sorting the widgets from it by a distance to origin from OriginSource.
 *
 * Sorting algorithm: merge sort
 * https://en.wikipedia.org/wiki/Merge_sort
 */
class tt_SorterByDistance : tt_TargetWidgetSource
{

// public: /////////////////////////////////////////////////////////////////////

  tt_SorterByDistance init(tt_TargetWidgetSource targetWidgetSource, tt_OriginSource originSource)
  {
    _targetWidgetSource = targetWidgetSource;
    _originSource       = originSource;

    return self;
  }

// public: // tt_TargetWidgetSource ////////////////////////////////////////////

  override
  tt_TargetWidgets getWidgets(RenderEvent event)
  {
    let widgets = _targetWidgetSource.getWidgets(event);
    let origin  = _originSource.getOrigin().getPosition();
    let sorted  = sort(widgets, origin);

    return sorted;
  }

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_TargetWidgets sort(tt_TargetWidgets widgets, Vector3 origin)
  {
    let result    = widgets;
    let workplace = widgets.copy();

    TopDownSplitMerge(workplace, 0, widgets.size(), result, origin);

    return result;
  }

// private: ////////////////////////////////////////////////////////////////////

  private static
  void TopDownSplitMerge( tt_TargetWidgets B
                        , uint             begin
                        , uint             end
                        , tt_TargetWidgets A
                        , Vector3          origin
                        )
  {
    if ((end - begin) < 2) // if run size == 1 consider it sorted
    {
      return;
    }

    // split the run longer than 1 item into halves
    uint middle = (end + begin) / 2; // mid point

    // recursively sort both runs from array A into B
    TopDownSplitMerge(A, begin,  middle, B, origin); // sort the left  run
    TopDownSplitMerge(A, middle,    end, B, origin); // sort the right run

    // merge the resulting runs from array B into A
    TopDownMerge(B, begin, middle, end, A, origin);
  }

  private static
  void TopDownMerge( tt_TargetWidgets A
                   , uint             begin
                   , uint             middle
                   , uint             end
                   , tt_TargetWidgets B
                   , Vector3          origin
                   )
  {
    uint i = begin;
    uint j = middle;

    // While there are elements in the left or right runs...
    for (uint k = begin; k < end; ++k)
    {
      // If left run head exists and is >= existing right run head.
      if (i < middle
          && (j >= end || A.at(i).getDistanceTo(origin) >= A.at(j).getDistanceTo(origin)))
      {
        B.set(k, A.at(i));
        ++i;
      }
      else
      {
        B.set(k, A.at(j));
        ++j;
      }
    }
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_TargetWidgetSource _targetWidgetSource;
  private tt_OriginSource       _originSource;

} // class tt_SorterByDistance
