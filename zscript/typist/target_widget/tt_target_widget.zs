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

/** This class represents a target displayed on the screen.
 */
class tt_TargetWidget
{

// public: /////////////////////////////////////////////////////////////////////

  tt_TargetWidget init(tt_KnownTarget target, Vector2 position)
  {
    _target          = target;
    _alpha           = 1.0;
    _startPosition   = position;
    _desiredPosition = _startPosition;
    _stepsDone       = 0;

    return self;
  }

// public: /////////////////////////////////////////////////////////////////////

  tt_KnownTarget target() const { return _target; }

  double alpha() const { return _alpha; }

  Vector2 position() const
  {
    Vector2 step     = (_desiredPosition - _startPosition) / N_STEPS;
    Vector2 progress = step * _stepsDone;
    return _startPosition + progress;
  }

// public: /////////////////////////////////////////////////////////////////////

  void setAlpha(double alpha) { _alpha = alpha; }

  /** sets the position of the widget.
   * @attention the position returned by position() may be not the same as
   * the position after this function call.
   *
   * position() will come closer to this position with every stepPosition()
   * call.
   */
  void setPosition(Vector2 position)
  {
    _desiredPosition = position;
    _stepsDone = 0;
  }

// public: /////////////////////////////////////////////////////////////////////

  void stepPosition()
  {
    ++_stepsDone;
  }

// public: /////////////////////////////////////////////////////////////////////

  const N_STEPS = 10;

// private:

  private tt_KnownTarget _target;
  private double         _alpha;
  private Vector2        _startPosition;
  private Vector2        _desiredPosition;
  private int            _stepsDone;

} // class tt_TargetWidget
