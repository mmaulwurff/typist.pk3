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
 * This class draws a note at the bottom of the screen.
 *
 * It respects tt_show_notes CVar.
 */
class tt_ListMenuNote : ListMenuItem
{

// public: /////////////////////////////////////////////////////////////////////

  tt_ListMenuNote init()
  {
    add("\"The situation is so much better for programmers today - a cheap used PC, "
        "a linux CD, and an internet account, and you have all the tools necessary "
        "to work your way to any level of programming skill you want to shoot for.\"\n"
        " - John Carmack");

    add("Tip: Look for an ancient guardian beast in the code.");

    add("\"Explicit is better than implicit.\"\n"
        " - Tim Peters, The Zen of Python");

    add("doomwiki.org is the Doom Wiki.");

    add("\"For every complex problem there is an answer that is clear, simple, and wrong.\"\n"
        " - H. L. Mencken");

    add("#include <stdio.h>\n"
        "int main() { printf(\"Hello, World!\"); return 0; }");

    add("#include <iostream>\n"
        "int main() { std::cout << \"Hello, World!\" << std::endl; return 0; }");

    add("#!/bin/sh\n"
        "echo \"Hello, World!\"");

    add("#!python3\n"
        "if __name__ == \"__main__\":\n"
        "    print(\"Hello, World!\")");

    add("\"Never send a human to do a machine’s job.\"\n"
        " - Agent Smith, The Matrix");

    Super.Init();
    return self;
  }

// public: // ListMenuItem /////////////////////////////////////////////////////

  override
  void OnMenuCreated()
  {
    _iString = random(0, _strings.size() - 1);
  }

  override
  void Drawer(bool selected)
  {
    // unused: selected

    if (!tt_show_notes)
    {
      return;
    }

    int    width  = (Screen.GetWidth() / CleanXFac_1) * 3 / 4;
    let    lines  = NewSmallFont.BreakLines(_strings[_iString], width);
    int    nLines = lines.Count();
    double height = NewSmallFont.GetHeight();
    double y      = Screen.GetHeight() - MARGIN - height * nLines * CleanYFac_1;

    for (int i = 0; i < nLines; ++i)
    {
      double x = Screen.GetWidth() - MARGIN - lines.StringWidth(i) * CleanXFac_1;
      Screen.DrawText( NewSmallFont, Font.CR_WHITE, x, y, lines.StringAt(i)
                     , DTA_CleanNoMove_1, true
                     );
      y += height * CleanYFac_1;
    }
  }

// private: ////////////////////////////////////////////////////////////////////

  private ui
  void add(String s)
  {
    _strings.push(s);
  }

// private: ////////////////////////////////////////////////////////////////////

  const MARGIN = 10;

// private: ////////////////////////////////////////////////////////////////////

  /// Must contain at least 1 string.
  private ui Array<String> _strings;
  private ui uint          _iString;

} // class tt_ListMenuNote
