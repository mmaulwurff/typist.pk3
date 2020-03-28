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
 * This class implements tt_KnownTargetSource by reading.of targets from
 * tt_TargetSource, assigning them questions, and storing them.
 *
 * Deactivated targets are removed from storage.
 *
 * Updating is cached and won't happen more than once per specified amount of
 * ticks.
 */
class tt_TargetRegistry : tt_KnownTargetSource
{

// public: /////////////////////////////////////////////////////////////////////

  static
  tt_TargetRegistry of( tt_TargetSource   targetSource
                      , tt_QuestionSource questionSource
                      , tt_TargetSource   disabledTargetSource
                      , tt_Clock          clock
                      )
  {
    let result = new("tt_TargetRegistry"); // construct

    result._targetSource         = targetSource;
    result._questionSource       = questionSource;
    result._disabledTargetSource = disabledTargetSource;
    result._clock                = clock;

    result._registry  = tt_KnownTargets.of();
    result._isEmpty   = true;
    result._oldMoment = 0;

    return result;
  }

// public: // tt_KnownTargetSource /////////////////////////////////////////////

  override
  tt_KnownTargets getTargets() const
  {
    update();
    return _registry;
  }

  override
  bool isEmpty() const
  {
    update();
    return (_registry.size() == 0);
  }

// private: ////////////////////////////////////////////////////////////////////

  private
  void update()
  {
    if (_isEmpty)
    {
      read();

      _oldMoment = _clock.getNow();
      _isEmpty   = false;

      return;
    }

    int  passed     = _clock.since(_oldMoment);
    bool isObsolete = (passed >= REREAD_TICS);

    if (isObsolete)
    {
      read();

      _oldMoment = _clock.getNow();
    }
  }

  private
  void read()
  {
    let newTargets = _targetSource.getTargets();
    merge(newTargets);

    let disabledTargets = _disabledTargetSource.getTargets();
    subtract(disabledTargets);

    pruneNulls();
  }

  /**
   * Adds targets that are not already registered to the registry.
   *
   * Given that tt_KnownTargets.contains() is O(n), this function is O(n^2).
   * Optimization possible.
   */
  private
  void merge(tt_Targets targets)
  {
    uint nTargets        = targets.size();
    let  newKnownTargets = tt_KnownTargets.of();

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

  /**
   * Given that tt_KnownTargets.remove() is at least O(n), this function is
   * at least O(n^2).
   * Optimization possible.
   */
  private
  void subtract(tt_Targets targets)
  {
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

    let newKnownTarget = tt_KnownTarget.of(target, question);

    return newKnownTarget;
  }

  private
  void pruneNulls()
  {
    let pruned = tt_KnownTargets.of();

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
  private tt_Clock          _clock;

// private: ////////////////////////////////////////////////////////////////////

  const REREAD_TICS = 1;

  private tt_KnownTargets _registry;

  private bool _isEmpty;
  private int  _oldMoment;

} // class tt_TargetRegistry
