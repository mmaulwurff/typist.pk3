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
 *
 * @attention Do not compare tt_TargetID instances by "==" and "!=".
 * It will check object equality, not ID equality. Use isEqual().
 */
class tt_TargetID
{

// public: /////////////////////////////////////////////////////////////////////

  tt_TargetID init()
  {
    _type = TARGET_UNKNOWN;

    return self;
  }

// public: /////////////////////////////////////////////////////////////////////

  // Create target identifier from an actor.
  static tt_TargetID fromActor(Actor a)
  {
    let result = new("tt_TargetID").init();
    result._type = TARGET_ACTOR;
    result._a    = a;

    return result;
  }

  // Create target identifier from a line.
  static tt_TargetID fromLine(Line l)
  {
    let result = new("tt_TargetID").init();
    result._type = TARGET_LINE;
    result._l    = l;

    return result;
  }

  // Create a target identifier identified by a number.
  static tt_TargetID fromNumber(int id)
  {
    let result = new("tt_TargetID").init();
    result._type = id;

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
    default:           return true; // type equality check is done already.
    }

    Console.Printf("zscript/typist/target/tt_target_id.zs:82: T: unreachable code!");
    return false;
  }

// private: ////////////////////////////////////////////////////////////////////

  enum TargetTypes
  {
    TARGET_UNKNOWN,
    TARGET_ACTOR,
    TARGET_LINE,
    TARGET_USER, ///< May be used to create unique targets.
  }

// private: ////////////////////////////////////////////////////////////////////

  private TargetTypes _type;

  private Actor _a;
  private Line  _l;

} // class tt_TargetID
