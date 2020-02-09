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

class zc_ScoreStorage
{

// public: /////////////////////////////////////////////////////////////////////

  static
  void saveScore(String mapChecksum, int score)
  {
    CVar   scoreCVar   = CVar.FindCVar(STORAGE_CVAR_NAME);
    String scoreString = scoreCVar.GetString();
    let    scoreDict   = Dictionary.FromString(scoreString);

    String mapScoresString = scoreDict.At(mapChecksum);

    Array<int>    scores;
    Array<bool>   isLatests;
    Array<String> names;

    read(mapScoresString, scores, isLatests, names);

    for (int i = 0; i < N_TOP; ++i)
    {
      isLatests[i] = false;
    }

    for (int i = 0; i < N_TOP; ++i)
    {
      if (score > scores[i])
      {
        scores   .Insert(i, score);
        isLatests.Insert(i, true);
        names    .Insert(i, "");
        break;
      }
    }

    String newMapScoresString = write(scores, isLatests, names);
    scoreDict.Insert(mapChecksum, newMapScoresString);

    String newScoreString = scoreDict.ToString();
    scoreCVar.SetString(newScoreString);
  }

  static
  void rename(String mapChecksum, int index, String name)
  {
    CVar   scoreCVar   = CVar.FindCVar(STORAGE_CVAR_NAME);
    String scoreString = scoreCVar.GetString();
    let    scoreDict   = Dictionary.FromString(scoreString);

    String mapScoresString = scoreDict.At(mapChecksum);

    Array<int>    scores;
    Array<bool>   isLatests;
    Array<String> names;

    read(mapScoresString, scores, isLatests, names);

    names[index] = name;

    String newMapScoresString = write(scores, isLatests, names);
    scoreDict.Insert(mapChecksum, newMapScoresString);

    String newScoreString = scoreDict.ToString();
    scoreCVar.SetString(newScoreString);
  }

  static
  void loadScores( String            mapChecksum
                 , out Array<int>    scores
                 , out Array<bool>   isLatests
                 , out Array<String> names
                 )
  {
    CVar   scoreCVar   = CVar.FindCVar(STORAGE_CVAR_NAME);
    String scoreString = scoreCVar.GetString();
    let    scoreDict   = Dictionary.FromString(scoreString);

    String mapScoresString = scoreDict.At(mapChecksum);

    read(mapScoresString, scores, isLatests, names);
  }

// private: ////////////////////////////////////////////////////////////////////

  // Format:
  // <score>\n<is_latest>\n<name>\n
  // repeated N_TOP times.
  private static
  void read( String            scoresString
           , out Array<int>    scores
           , out Array<bool>   isLatests
           , out Array<String> names
           )
  {
    if (scoresString.Length() == 0)
    {
      for (int i = 0; i < N_TOP; ++i)
      {
        scores   .Push(0);
        isLatests.Push(0);
        names    .Push("");
      }
      return;
    }

    Array<String> tokens;
    scoresString.Split(tokens, "\n");

    int tokenIndex = 0;
    for (int i = 0; i < N_TOP; ++i)
    {
      scores   .Push(tokens[tokenIndex++].ToInt());
      isLatests.Push(tokens[tokenIndex++].ToInt());
      names    .Push(tokens[tokenIndex++]);
    }
  }

  private static
  String write(Array<int> scores, Array<bool> isLatests, Array<String> names)
  {
    String result;
    for (int i = 0; i < N_TOP; ++i)
    {
      result.appendFormat("%d\n%d\n%s\n", scores[i], isLatests[i], names[i]);
    }
    return result;
  }

// private: ////////////////////////////////////////////////////////////////////

  const N_TOP = 10;

  const STORAGE_CVAR_NAME = "lp_score";

} // class zc_ScoreStorage
