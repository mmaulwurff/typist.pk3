/* Copyright Alexander 'm8f' Kromm (mmaulwurff@gmail.com) 2019-2020
 *
 * This file is a part of Lazy Points.
 *
 * Lazy Points is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later
 * version.
 *
 * Lazy Points is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
 * details.
 *
 * You should have received a copy of the GNU General Public License along with
 * Lazy Points.  If not, see <https://www.gnu.org/licenses/>.
 */

class zc_TopHintView
{

// public: /////////////////////////////////////////////////////////////////////

  zc_TopHintView init()
  {
    _showed = false;

    return self;
  }

  void show()
  {
    if (gameState != GS_Intermission)
    {
      _showed = false;
      return;
    }

    if (_showed)
    {
      return;
    }

    _showed = true;

    int key1;
    int key2;
    [key1, key2] = Bindings.GetKEysForCommand("zc_top");

    if (key1 == 0 && key2 == 0)
    {
      return;
    }

    String keyString  = KeyBindings.NameKeys(key1, key2);
    String hintString = String.Format("\cfPress \ct\"%s\"\cf to show score points.", keyString);
    Console.Printf(hintString);

  }

// private: ////////////////////////////////////////////////////////////////////

  bool _showed;

} // class zc_TopHintView
