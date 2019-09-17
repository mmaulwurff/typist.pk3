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
 * Entry point for Typist.pk3.
 */
class tt_EventHandler : EventHandler
{

// public: // EventHandler /////////////////////////////////////////////////////

  override
  void WorldTick()
  {
    if (_supervisor == NULL) { return; }

    _supervisor.tick();

    int  mode            = _supervisor.getMode();
    bool isCapturingKeys = (mode == tt_Mode.MODE_COMBAT);

    self.IsUiProcessor = isCapturingKeys;
  }

  override
  bool UiProcess(UiEvent event)
  {
    if (_supervisor == NULL) { return false; }

    if (event.type == UiEvent.Type_KeyDown)
    {
      let character = new("tt_Character").init(event.keyChar, event.isShift);
      _supervisor.processKey(character);
    }

    return false;
  }

  override
  void PlayerEntered(PlayerEvent event)
  {
    int playerNumber = event.PlayerNumber;
    if (playerNumber != consolePlayer) { return; }

    _supervisor = new("tt_Supervisor").init(playerNumber);

    PlayerInfo player = players[playerNumber];
    _gameTweaks.tweakPlayer(player);
  }

  override
  void WorldThingDied(WorldEvent event)
  {
    if (_supervisor == NULL) { return; }

    _supervisor.reportDead(event.Thing);
  }

  override
  void RenderOverlay(RenderEvent event)
  {
    if (_supervisor == NULL) { return; }

    _supervisor.draw(event);
  }

  override
  void NetworkProcess(ConsoleEvent event)
  {
    if (_supervisor == NULL) { return; }

    String command = event.Name;

    if (command == "tt_unlock_mode")
    {
      _supervisor.unlockMode();
    }
  }

  override
  void WorldThingSpawned(WorldEvent event)
  {
    let thing = event.thing;
    if (thing == NULL) { return; }

    _gameTweaks.processSpawnedThing(thing);
  }

  override
  void OnRegister()
  {
    _gameTweaks = new("tt_GameTweaks").init();
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_Supervisor _supervisor;
  private tt_GameTweaks _gameTweaks;

} // class tt_EventHandler
