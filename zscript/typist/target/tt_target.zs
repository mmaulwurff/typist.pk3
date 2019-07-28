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

/** This class represents an attack target.
 */
class tt_Target
{

  // public: ///////////////////////////////////////////////////////////////////

  static tt_Target fromActor(Actor a)
  {
    tt_Target result;
    result._pos = a.pos;
    result._id  = tt_TargetID.fromActor(a);

    return result;
  }

  //static tt_Target fromLine(Line l)
  //{
  //  console.printf("zscript/typist/target/tt_target.zs:36: T: using unimplemented function!");
  //  tt_Target result;

  //  return result;
  //}

  // public: ///////////////////////////////////////////////////////////////////

  // Get position in game space of this target.
  Vector3 position() const { return _pos; }

  // Get an identifier of this target.
  tt_TargetID id() const { return _id; }

  // private: //////////////////////////////////////////////////////////////////

  private Vector3     _pos;
  private tt_TargetID _id;

} // class tt_Target
