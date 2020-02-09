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

class zc_MapScore
{

// public: /////////////////////////////////////////////////////////////////////

  zc_MapScore init(int playerNumber)
  {
    _playerNumber  = playerNumber;
    _startingScore = players[_playerNumber].mo.score;

    return self;
  }

// public: /////////////////////////////////////////////////////////////////////

  void save()
  {
    if (_playerNumber != consolePlayer)
    {
      return;
    }

    int    score    = players[_playerNumber].mo.score - _startingScore;
    String checksum = Level.GetChecksum();

    zc_ScoreStorage.saveScore(checksum, score);
  }

// private: ////////////////////////////////////////////////////////////////////

  private int _playerNumber;
  private int _startingScore;

} // class zc_MapScore
