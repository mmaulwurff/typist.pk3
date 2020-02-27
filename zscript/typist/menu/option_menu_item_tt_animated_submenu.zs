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

class OptionMenuItemtt_AnimatedSubmenu : OptionMenuItemSubmenu
{

// public: /////////////////////////////////////////////////////////////////////

  OptionMenuItemtt_AnimatedSubmenu Init( String label
                                       , Name   command
                                       , int    param    = 0
                                       , bool   centered = false
                                       )
  {
    Super.Init(label, command, param, centered);

    _originalLabel  = StringTable.Localize(label);
    _originalLength = _originalLabel.CodePointCount();
    _period         = DELAY_TICS + _originalLength * CHARACTER_TIMEOUT_TICS;

    return self;
  }

// public: // OptionMenuItem ///////////////////////////////////////////////////

  override
  int Draw(OptionMenuDescriptor desc, int y, int indent, bool selected)
  {
    int highlightedLetterIndex = _state / CHARACTER_TIMEOUT_TICS;

    if (highlightedLetterIndex < _originalLength)
    {
      int letterCode;
      int charPos = 0;
      for (int i = 0; i < highlightedLetterIndex; ++i)
      {
        [letterCode, charPos] = _originalLabel.GetNextCodePoint(charPos);
      }

      String left           = _originalLabel.Left(charPos);
      [letterCode, charPos] = _originalLabel.GetNextCodePoint(charPos);
      String right          = _originalLabel.Mid(charPos, _originalLabel.Length() - charPos);

      mLabel = String.Format("%s\cd%c\c-%s", left, letterCode, right);
    }
    else
    {
      mLabel = _originalLabel;
    }

    ++_state;
    if (_state >= _period)
    {
      _state = 0;
    }

    return Super.Draw(desc, y, indent, selected);
  }

// private: ////////////////////////////////////////////////////////////////////

  const DELAY_TICS = 5 * Thinker.TicRate;
  const CHARACTER_TIMEOUT_TICS = 3;

// private: ////////////////////////////////////////////////////////////////////

  private int    _state;
  private int    _period;
  private String _originalLabel;
  private int    _originalLength;

} // class OptionMenuItemtt_AnimatedSubmenu
