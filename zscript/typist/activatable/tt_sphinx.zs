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
 * Kills all monsters on the level.
 */
class tt_Sphinx : tt_Activatable
{

  static
  tt_Sphinx of()
  {
    let result = new("tt_Sphinx"); // construct
    return result;
  }

// public: /////////////////////////////////////////////////////////////////////

  override
  void activate()
  {
    ThinkerIterator i = ThinkerIterator.Create("Actor");
    Actor a;
    while (a = Actor(i.Next()))
    {
      if (a.bIsMonster) { a.A_Die(); }
    }
  }

  override
  tt_Strings getCommands()
  {
    let strings = tt_Strings.of();
    strings.add("Sphinx_of_black_quartz,_judge_my_vow.");
    return strings;
  }

  override
  bool isVisible()
  {
    return false;
  }

// private: ////////////////////////////////////////////////////////////////////

} // class tt_Sphinx
