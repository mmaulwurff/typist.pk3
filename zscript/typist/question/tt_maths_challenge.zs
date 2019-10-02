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
 * This class implements tt_QuestionSource by composing arithmetic tasks.
 */
class tt_MathsChallenge : tt_QuestionSource
{

// public: /////////////////////////////////////////////////////////////////////

  tt_MathsChallenge init()
  {
    return self;
  }

// public: // tt_QuestionSource ////////////////////////////////////////////////

  override
  tt_Question getQuestion()
  {
    int operation = random(Addition, Division);

    switch (operation)
    {
    case Addition:       return makeAdditionQuestion();
    case Subtraction:    return makeSubtractionQuestion();
    case Multiplication: return makeMultiplicationQuestion();
    case Division:       return makeDivisionQuestion();
    }

    Console.Printf("zscript/typist/question/tt_maths_challenge.zs:46: T: unknown operation!");
    return NULL;
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  tt_Question makeAdditionQuestion()
  {
    int leftAddend  = random(11, 49);
    int rightAddend = random(11, 50);
    int sum         = leftAddend + rightAddend;

    String description = String.Format("%d + %d", leftAddend,  rightAddend);
    String answer      = String.Format("%d", sum);

    let question = new("tt_Match").init(answer, description);
    return question;
  }

  private
  tt_Question makeSubtractionQuestion()
  {
    int minuend    = random(50, 99);
    int subtrahend = random(11, 50);
    int difference = minuend - subtrahend;

    String description = String.Format("%d - %d", minuend, subtrahend);
    String answer      = String.Format("%d", difference);

    let question = new("tt_Match").init(answer, description);
    return question;
  }

  private
  tt_Question makeMultiplicationQuestion()
  {
    int multiplicand = random(2, 9);
    int multiplier   = random(2, 9);
    int product      = multiplicand * multiplier;

    String description = String.Format("%d * %d", multiplicand, multiplier);
    String answer      = String.Format("%d", product);

    let question = new("tt_Match").init(answer, description);
    return question;
  }

  private
  tt_Question makeDivisionQuestion()
  {
    int quotient = random(2, 9);
    int divisor  = random(2, 9);
    int dividend = quotient * divisor;

    String description = String.Format("%d / %d", dividend, divisor);
    String answer      = String.Format("%d", quotient);

    let question = new("tt_Match").init(answer, description);
    return question;
  }

// private: ////////////////////////////////////////////////////////////////////

  enum Operations
  {
    Addition,
    Subtraction,
    Multiplication,
    Division,
  }

} // class tt_MathsChallenge
