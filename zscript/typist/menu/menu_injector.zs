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
 * This class is a part of a workaround to run ZScript code before the level is
 * started.
 *
 * tt_MenuInjector menu item needs to be instantiated in some menu in menudef.
 * Menu itself doesn't have to be included anywhere.
 */
class OptionMenuItemtt_MenuInjector : OptionMenuItem
{

// public: /////////////////////////////////////////////////////////////////////

  void Init()
  {
    let mainDescriptor = ListMenuDescriptor(MenuDescriptor.GetDescriptor("MainMenu"));
    let textDescriptor = ListMenuDescriptor(MenuDescriptor.GetDescriptor("MainMenuTextOnly"));

    mainDescriptor.mItems.Push(new("tt_ListMenuNote").init()); // construct
    textDescriptor.mItems.Push(new("tt_ListMenuNote").init()); // construct
  }

} // class OptionMenuItemtt_MenuInjector
