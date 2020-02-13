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
 *
 */
class tt_MixedLesson : tt_QuestionSource
{

// public: /////////////////////////////////////////////////////////////////////

  tt_MixedLesson init(tt_Settings settings)
  {
    _settings = settings;

    return self;
  }

  void add(tt_QuestionSource questionSource)
  {
    _lessons.Push(questionSource);
  }

// public: // tt_QuestionSource ////////////////////////////////////////////////

  override
  tt_Question getQuestion()
  {
    readSettings();

    Array<tt_QuestionSource> enabledLessons;

    uint nLessons = _lessons.size();

    for (uint i = 0; i < nLessons; ++i)
    {
      if (_isLessonEnabled[i])
      {
        enabledLessons.Push(_lessons[i]);
      }
    }

    uint nEnabledLessons = enabledLessons.size();
    if (nEnabledLessons == 0)
    {
      return NULL;
    }

    uint randomLessonIndex = Random(0, nEnabledLessons - 1);
    let  questionSource    = enabledLessons[randomLessonIndex];
    let  question          = questionSource.getQuestion();

    return question;
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void readSettings()
  {
    uint nLessons = _lessons.size();
    _isLessonEnabled.Resize(nLessons);

    for (uint i = 0; i < nLessons; ++i)
    {
      _isLessonEnabled[i] = _settings.getLessonEnabled(i);
    }
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_Settings _settings;

  private Array<tt_QuestionSource> _lessons;
  private Array<bool>              _isLessonEnabled;

} // class tt_MixedLesson
