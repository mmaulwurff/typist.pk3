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

/**
 * This class implements tt_QuestionSource by selecting a question source
 * according to the index from settings.
 */
class tt_SelectedQuestionSource : tt_QuestionSource
{

// public: /////////////////////////////////////////////////////////////////////

  tt_SelectedQuestionSource init(tt_Settings settings)
  {
    _settings = settings;

    return self;
  }

  void add(tt_QuestionSource questionSource)
  {
    _questionSources.Push(questionSource);
  }

// public: // tt_QuestionSource ////////////////////////////////////////////////

  override
  tt_Question getQuestion()
  {
    int questionSourceIndex = _settings.getQuestionSourceIndex();

    if (questionSourceIndex >= _questionSources.size())
    {
      String message = String.Format("no question source at index %d", questionSourceIndex);
      Console.Printf("zscript/typist/question/tt_selected_question_source.zs:49: T: %s.", message);
      return NULL;
    }

    return _questionSources[questionSourceIndex].getQuestion();
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_Settings              _settings;
  private Array<tt_QuestionSource> _questionSources;

} // class tt_SelectedQuestionSource
