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
 */
class tt_TargetRegistry : tt_KnownTargetSource
{

// public: /////////////////////////////////////////////////////////////////////

  tt_TargetRegistry init( tt_TargetSource   targetSource
                        , tt_QuestionSource questionSource
                        , tt_TargetSource   disabledTargetSource
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

    pruneNulls();
  }

// private: ////////////////////////////////////////////////////////////////////

  // Adds targets that are not already registered to the registry.
  private
  void merge(tt_Targets targets)
  {
    // Given that tt_KnownTargets.contains() is O(n), this function is O(n^2).
    // There is a room for optimization.

    uint nTargets        = targets.size();
    let  newKnownTargets = new("tt_KnownTargets").init();

    for (uint i = 0; i < nTargets; ++i)
    {
      let target   = targets.at(i);
      let existing = _registry.findTarget(target);

      if (existing == NULL)
      {
        let knownTarget = makeKnownTarget(target);

        if (knownTarget != NULL)
        {
          newKnownTargets.add(knownTarget);
        }
      }
    }

    _registry.addMany(newKnownTargets);
  }

  private
  void subtract(tt_Targets targets)
  {
    // Given that tt_KnownTargets.remove() is at least O(n), this function is
    // at least O(n^2).
    // There is a room for optimization.

    uint nTargets = targets.size();
    for (uint i = 0; i < nTargets; ++i)
    {
      _registry.remove(targets.at(i));
    }
  }

  private
  tt_KnownTarget makeKnownTarget(tt_Target target) const
  {
    let question = _questionSource.getQuestion();

    if (question == NULL)
    {
      return NULL;
    }

    let newKnownTarget = new("tt_KnownTarget").init(target, question);

    return newKnownTarget;
  }

  private
  void pruneNulls()
  {
    let pruned = new("tt_KnownTargets").init();

    uint nTargets = _registry.size();
    for (uint i = 0; i < nTargets; ++i)
    {
      let target      = _registry.at(i).getTarget();
      let targetActor = target.getActor();

      if (targetActor != NULL)
      {
        pruned.add(_registry.at(i));
      }
    }

    _registry = pruned;
  }

// private: // dependencies ////////////////////////////////////////////////////

  private tt_TargetSource   _targetSource;
  private tt_QuestionSource _questionSource;
  private tt_TargetSource   _disabledTargetSource;

// private: ////////////////////////////////////////////////////////////////////

  private tt_KnownTargets _registry;

} // class tt_TargetRegistry
