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

/** This class represents target identifier.
 * Target identifier is used to check if two Targets point to the same game
 * entity. This checking is done via isEqual() function.
 */
class tt_TargetID
{

// public: /////////////////////////////////////////////////////////////////////

  // Create target identifier from an actor.
  static tt_TargetID fromActor(Actor a)
  {
    tt_TargetID result;
    result._type = TARGET_ACTOR;
    result._a    = a;

    return result;
  }

  // Create target identifier from a line.
  static tt_TargetID fromLine(Line l)
  {
    tt_TargetID result;
    result._type = TARGET_LINE;
    result._l    = l;

    return result;
  }

// public: /////////////////////////////////////////////////////////////////////

  // Check if two target identifiers are the same.
  bool isEqual(tt_TargetID other) const
  {
    if (_type != other._type) { return false; }

    switch (_type)
    {
    case TARGET_ACTOR: return _a == other._a;
    case TARGET_LINE:  return _l == other._l;
    }

    console.printf("./zscript/typist/target/tt_TargetID.zs:60: T: unknown target type!");
    return false;
  }

// private: ////////////////////////////////////////////////////////////////////

  enum TargetTypes
  {
    TARGET_ACTOR,
    TARGET_LINE,
  }

// private: ////////////////////////////////////////////////////////////////////

  private TargetTypes _type;

  private Actor _a;
  private Line  _l;

} // class tt_TargetID
