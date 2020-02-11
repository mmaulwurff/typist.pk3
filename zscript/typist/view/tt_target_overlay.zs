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
 * This class implement tt_View by getting a list of Target Widgets and drawing
 * them.
 */
class tt_TargetOverlay : tt_View
{

// public: /////////////////////////////////////////////////////////////////////

  tt_TargetOverlay init( tt_TargetWidgetSource targetWidgetSource
                       , tt_AnswerSource       answerSource
                       , tt_Settings           settings
                       )
  {
    _targetWidgetSource = targetWidgetSource;
    _answerSource       = answerSource;
    _settings           = settings;

    return self;
  }

// public: // tt_View //////////////////////////////////////////////////////////

  override
  void draw(RenderEvent event)
  {
    let widgets = _targetWidgetSource.getWidgets(event);
    let answer  = _answerSource.getAnswer();

    uint nWidgets = widgets.size();
    for (uint i = 0; i < nWidgets; ++i)
    {
      let    widget         = widgets.at(i);
      let    question       = widget.getTarget().getQuestion();
      String questionString = question.getDescription();
      String hintedAnswer   = question.getHintFor(answer);
      let    position       = widget.getPosition();

      tt_Drawing.drawTarget(position, questionString, hintedAnswer, _settings, CENTERED);
    }
  }

// private: ////////////////////////////////////////////////////////////////////

  const CENTERED = 1; // true

// private: ////////////////////////////////////////////////////////////////////

  private tt_TargetWidgetSource _targetWidgetSource;
  private tt_AnswerSource       _answerSource;
  private tt_Settings           _settings;

} // class tt_TargetOverlay
