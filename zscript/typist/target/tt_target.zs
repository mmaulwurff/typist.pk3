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
class tt_Target abstract
{

// public: /////////////////////////////////////////////////////////////////////

  // Get position in game space of this target.
  virtual
  Vector3 position() const
  {
    Console.Printf("zscript/typist/target/tt_target.zs:29: T: override this!");
    return (0, 0, 0);
  }

  // Get an identifier of this target.
  virtual
  tt_TargetID id() const
  {
    Console.Printf("zscript/typist/target/tt_target.zs:37: T: override this!");
    return NULL;
  }

// public: /////////////////////////////////////////////////////////////////////

  virtual
  void setPosition(vector3 position)
  {
    Console.Printf("zscript/typist/target/tt_target.zs:46: T: override this!");
  }

} // class tt_Target
