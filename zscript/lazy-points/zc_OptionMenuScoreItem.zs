/* Copyright Alexander 'm8f' Kromm (mmaulwurff@gmail.com) 2020
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

/**
 * This class is similar to OptionMenuItemTextField. The difference is that this
 * class doesn't use a CVar.
 *
 * Code is partially borrowed from
 * gzdoom/wadsrc/static/zscript/ui/menu/optionmenuitems.zs.
 */
class OptionMenuScoreItem : OptionMenuItem
{

// public: /////////////////////////////////////////////////////////////////////

  OptionMenuScoreItem Init(String label, String name, int index, bool isLatest)
  {
    Super.Init(label, "");

    _name     = name;
    _index    = index;
    _enter    = NULL;
    _isLatest = isLatest;

    return self;
  }

  override
  int Draw (OptionMenuDescriptor d, int y, int indent, bool selected)
  {
    if (_enter)
    {
      // reposition the text so that the cursor is visible when in entering mode.
      int tLen      = Menu.OptionWidth(_name) * CleanXfac_1;
      int newIndent = screen.GetWidth() - tLen - CursorSpace();

      if (newIndent < indent)
      {
        indent = newIndent;
      }
    }

    String display = _enter ? (_enter.GetText() .. Menu.OptionFont().GetCursor()) : _name;

    int unselectedColor = _isLatest ? Font.CR_BLUE : Font.CR_WHITE;
    int selectedColor   = OptionMenuSettings.mFontColorSelection;
    int color           = selected ? selectedColor : unselectedColor;

    drawLabel(indent, y, color);
    drawValue(indent, y, color, display);

    return indent;
  }

  override
  bool, String GetString(int i)
  {
    if (i == 0)
    {
      return true, _name;
    }

    return false, "";
  }

  override
  bool SetString(int i, String s)
  {
    _name = s;
    zc_ScoreStorage.rename(Level.GetChecksum(), _index, _name);
    return true;
  }

  override
  bool MenuEvent (int mKey, bool fromController)
  {
    if (mKey == Menu.MKey_Enter)
    {
      bool b;
      String s;
      [b, s] = GetString(0);
      Menu.MenuSound("menu/choose");
      _enter = TextEnterMenu.OpenTextEnter( Menu.GetCurrentMenu()
                                          , Menu.OptionFont()
                                          , s
                                          , -1
                                          , fromController
                                          );
      _enter.ActivateMenu();
      return true;
    }
    else if (mKey == Menu.MKey_Input)
    {
      SetString(0, _enter.GetText());
      _enter = NULL;
      return true;
    }
    else if (mKey == Menu.MKey_Abort)
    {
      _enter = NULL;
      return true;
    }

    return Super.MenuEvent(mkey, fromController);
  }

// private: ////////////////////////////////////////////////////////////////////

  private String _name;
  private int    _index;
  private bool   _isLatest;

  private TextEnterMenu _enter;

} // class OptionMenuScoreItem
