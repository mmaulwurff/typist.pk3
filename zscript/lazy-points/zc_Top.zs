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

class zc_Top : OptionMenu
{
  override void Init(Menu parent, OptionMenuDescriptor desc)
  {
    Super.Init(parent, desc);
    mDesc.mItems.Clear();

    if (gameState != GS_LEVEL && gameState != GS_INTERMISSION)
    {
      String label = "No map detected.";
      addLabel(label);
      return;
    }

    String checksum = Level.GetChecksum();

    Array<int>    scores;
    Array<bool>   isLatests;
    Array<String> names;

    zc_ScoreStorage.loadScores(checksum, scores, isLatests, names);

    int maxLength = 0;
    for (int i = 0; i < zc_ScoreStorage.N_TOP; ++i)
    {
      int length = String.Format("%d", scores[i]).Length();
      if (length > maxLength)
      {
        maxLength = length;
      }
    }

    // %% will become %. Adds spacing to string output.
    String format = String.Format("%%d. %%%dd", maxLength);

    for (int i = 0; i < zc_ScoreStorage.N_TOP; ++i)
    {
      String label = String.Format(format, i + 1, scores[i]);
      addCommand(label, names[i], i, isLatests[i]);
    }
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void addLabel(String label)
  {
    mDesc.mItems.Push(new("OptionMenuItemStaticText").InitDirect(label, Font.CR_WHITE));
  }

  private
  void addCommand(String label, String name, int index, bool isLatest)
  {
    mDesc.mItems.Push(new("OptionMenuScoreItem").Init(label, name, index, isLatest));
  }
}
