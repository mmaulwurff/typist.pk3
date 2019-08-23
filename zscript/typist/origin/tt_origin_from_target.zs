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

/** This class implements tt_OriginSource by taking getting the origin of the
 * first target from Target Source.
 */
class tt_OriginFromTarget : tt_OriginSource
{

// public: /////////////////////////////////////////////////////////////////////

  tt_OriginFromTarget init(tt_TargetSource targetSource)
  {
    _targetSource = targetSource;

    return self;
  }

// public: // tt_OriginSource //////////////////////////////////////////////////

  override
  tt_Origin getOrigin()
  {
    let targets = _targetSource.getTargets();
    if (targets == NULL || targets.size() == 0) { return NULL; }

    let target = targets.at(0);
    if (target == NULL) { return NULL; }

    let origin = new("tt_Origin").init(target.position());
    return origin;
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_TargetSource _targetSource;

} // class tt_OriginFromTarget
