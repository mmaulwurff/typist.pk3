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
 */
class tt_TargetRegistry : tt_KnownTargetSource
{

// public: /////////////////////////////////////////////////////////////////////

  tt_TargetRegistry init( tt_TargetSource         targetSource
                        , tt_QuestionSource       questionSource
                        , tt_DisabledTargetSource disabledTargetSource
                        )
  {
    _targetSource         = targetSource;
    _questionSource       = questionSource;
    _disabledTargetSource = disabledTargetSource;

    _registry = new("tt_KnownTargets").init();

    return self;
  }

// public: // tt_KnownTargetSource /////////////////////////////////////////////

  override
  tt_KnownTargets getTargets() const
  {
    return _registry;
  }

  override
  bool isEmpty() const
  {
    return (_registry.size() == 0);
  }

  override
  void update()
  {
    let newTargets = _targetSource.getTargets();
    merge(newTargets);

    let disabledTargets = _disabledTargetSource.getTargets();
    subtract(disabledTargets);
  }

// private: ////////////////////////////////////////////////////////////////////

  // Adds targets that are not already registered to the registry.
  private
  void merge(tt_Targets targets)
  {
    // Given that tt_KnownTargets.contains() is O(n), this function is O(n^2).
    // There is a room for optimization.

    uint nTargets = targets.size();
    let newKnownTargets = new("tt_KnownTargets").init();

    for (uint i = 0; i < nTargets; ++i)
    {
      let target = targets.at(i);
      if (_registry.contains(target.id())) { continue; }
      newKnownTargets.add(makeKnownTarget(target));
    }

    _registry.addMany(newKnownTargets);
  }

  private
  void subtract(tt_DisabledTargets targets)
  {
    // Given that tt_KnownTargets.remove() is at least O(n), this function is
    // at least O(n^2).
    // There is a room for optimization.

    uint nTargets = targets.size();
    for (uint i = 0; i < nTargets; ++i)
    {
      _registry.remove(targets.at(i).id());
    }
  }

  private
  tt_KnownTarget makeKnownTarget(tt_Target target) const
  {
    let question       = _questionSource.getQuestion();
    let newKnownTarget = new("tt_KnownTarget").init(target, question);

    return newKnownTarget;
  }

// private: // dependencies ////////////////////////////////////////////////////

  private tt_TargetSource         _targetSource;
  private tt_QuestionSource       _questionSource;
  private tt_DisabledTargetSource _disabledTargetSource;

// private: ////////////////////////////////////////////////////////////////////

  private tt_KnownTargets _registry;

} // class tt_TargetRegistry
