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
 * This is a test for tt_SorterByDistance class.
 */
class tt_SorterByDistanceTest : tt_Clematis
{

// public: /////////////////////////////////////////////////////////////////////

  override
  void TestSuites()
  {
    checkEmpty();
    checkSorted();
    checkReverse();
    checkMiddle();
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void checkEmpty()
  {
    Describe("Checking SorterByDistance: empty");

    let before = tt_TargetWidgets.of();
    let origin = tt_Origin.of((0, 0, 0));
    let after  = tt_SorterByDistance.sort(before, origin.getVector());

    It("Empty collection must remain empty", AssertEval(after.size(), "==", 0));

    EndDescribe();
  }

  private
  void checkSorted()
  {
    Describe("Checking SorterByDistance: sorted");

    let origin = tt_Origin.of((0, 0, 0));
    let before = tt_TargetWidgets.of();
    before.add(createAtPosition((0, 0, 2)));
    before.add(createAtPosition((0, 0, 1)));
    before.add(createAtPosition((0, 0, 0)));

    It("Before: sorted", Assert(isSorted(before, origin.getVector())));

    let after = tt_SorterByDistance.sort(before, origin.getVector());

    It("Size of collection must the same", AssertEval(after.size(), "==", before.size()));
    It("Contains same elements", Assert(isSameElements(before, after)));
    It("After: sorted", Assert(isSorted(after, origin.getVector())));

    EndDescribe();
  }

  private
  void checkReverse()
  {
    Describe("Checking SorterByDistance: reverse");

    let origin = tt_Origin.of((0, 0, 0));
    let before = tt_TargetWidgets.of();
    before.add(createAtPosition((0, 0, 0)));
    before.add(createAtPosition((0, 0, 1)));
    before.add(createAtPosition((0, 0, 2)));

    It("Before: not sorted", Assert(!isSorted(before, origin.getVector())));

    let after = tt_SorterByDistance.sort(before, origin.getVector());

    It("Size of collection must the same", AssertEval(after.size(), "==", before.size()));
    It("Contains same elements", Assert(isSameElements(before, after)));
    It("After: sorted", Assert(isSorted(after, origin.getVector())));

    EndDescribe();
  }

  private
  void checkMiddle()
  {
    Describe("Checking SorterByDistance: middle");

    let origin = tt_Origin.of((0, 0, 0));
    let before = tt_TargetWidgets.of();
    before.add(createAtPosition((0, 0, 1)));
    before.add(createAtPosition((0, 0, 2)));
    before.add(createAtPosition((0, 0, 0)));

    It("Before: not sorted", Assert(!isSorted(before, origin.getVector())));

    let after = tt_SorterByDistance.sort(before, origin.getVector());

    It("Size of collection must the same", AssertEval(after.size(), "==", before.size()));
    It("Contains same elements", Assert(isSameElements(before, after)));
    It("After: sorted", Assert(isSorted(after, origin.getVector())));

    EndDescribe();
  }

  private static
  bool isSorted(tt_TargetWidgets targetWidgets, Vector3 origin)
  {
    uint nWidgets = targetWidgets.size();

    if (nWidgets < 2) { return true; }

    for (uint i = 1; i < nWidgets; ++i)
    {
      let prevDistance = targetWidgets.at(i - 1).getDistanceTo(origin);
      let thisDistance = targetWidgets.at(i    ).getDistanceTo(origin);

      if (prevDistance < thisDistance)
      {
        return false;
      }
    }

    return true;
  }

  private static
  bool isSameElements(tt_TargetWidgets t1, tt_TargetWidgets t2)
  {
    uint nWidgets1 = t1.size();
    uint nWidgets2 = t2.size();

    if (nWidgets1 != nWidgets2)
    {
      return false;
    }

    for (uint i = 0; i < nWidgets1; ++i)
    {
      if (!t2.containsWidget(t1.at(i)))
      {
        return false;
      }
    }

    for (uint i = 0; i < nWidgets2; ++i)
    {
      if (!t1.containsWidget(t2.at(i)))
      {
        return false;
      }
    }

    return true;
  }

  private
  tt_TargetWidget createAtPosition(Vector3 position)
  {
    let target      = tt_Target.of(Spawn("Demon", position));
    let question    = tt_QuestionMock.of();
    let knownTarget = tt_KnownTarget.of(target, question);
    let widget      = tt_TargetWidget.of(knownTarget, (0, 0));

    return widget;
  }

} // class tt_SorterByDistanceTest
