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
    if (_playerHandler == NULL) { return; }

    _playerHandler.tick();

    self.IsUiProcessor = _playerHandler.isCapturingKeys();
  }

  override
  bool UiProcess(UiEvent event)
  {
    if (_playerHandler == NULL) { return false; }

    int code = event.keyChar;
    int type = event.type;

    //Console.Printf("type: %d, code: %d, string: %s", type, code, event.keyString);

    if (type == UiEvent.Type_KeyUp && code == tt_Ascii.Enter)
    {
      type = UiEvent.Type_KeyDown;
      code = tt_Ascii.EndOfText;
    }

    bool isChar    = (type == UiEvent.Type_Char);
    bool isDown    = (type == UiEvent.Type_KeyDown);
    bool isControl = (code == tt_Ascii.Backspace
                   || code == tt_Ascii.Enter
                   || code == tt_Ascii.EndOfText);

    if (isChar || (isDown && isControl))
    {
      let character = new("tt_Character").init(code, event.isShift, event.isCtrl);
      _playerHandler.processKey(character);
    }

    return false;
  }

  override
  void PlayerEntered(PlayerEvent event)
  {
    int playerNumber = event.PlayerNumber;
    if (playerNumber != consolePlayer) { return; }
    if (gameState != GS_Level && gameState != GS_StartUp) { return; }

    initPlayer(playerNumber);

    tt_GameTweaks.tweakPlayer(players[playerNumber]);
  }

  override
  void WorldThingDied(WorldEvent event)
  {
    if (_playerHandler == NULL) { return; }

    _playerHandler.reportDead(event.Thing);
  }

  override
  void RenderOverlay(RenderEvent event)
  {
    if (_playerHandler == NULL) { return; }

    _playerHandler.draw(event);
  }

  override
  void NetworkProcess(ConsoleEvent event)
  {
    if (_playerHandler == NULL) { return; }

    String command = event.Name;

    if      (command == "tt_unlock_mode"  ) _playerHandler.unlockMode();
    else if (command == "tt_reset_targets") initPlayer(consolePlayer);
  }

  override
  void OnRegister()
  {
    self.RequireMouse = true;
  }

// private: ////////////////////////////////////////////////////////////////////

  void initPlayer(int playerNumber)
  {
    _playerHandler = new("tt_PlayerSupervisor").init(playerNumber);
  }

// private: ////////////////////////////////////////////////////////////////////

  private tt_PlayerHandler _playerHandler;

} // class tt_EventHandler
