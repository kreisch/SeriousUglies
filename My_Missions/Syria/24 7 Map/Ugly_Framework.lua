

-----------------------------------------------------------------------------------------
-- UGLY PERSISTENCE FRAMEWORK
--
-- 2020 Edition
--
-- Currently no dependency to other frameworks (no MOOSE, MIST, CTLD...)

-- Declare the Framework
Ugly = {}

-- The global save interval
Ugly.saveInterval = 666

-- If true, print any debug text
Ugly.showDebugText = false

-- How long in seconds is the message displayed
Ugly.messageShowTime = 10

-----------------------------------------------------------------------------------------
-- Check if the _toCheckString starts with the _toFindString

Ugly.startsWith = function (_toCheckString, _toFindString)
  return _toCheckString:sub(1, #_toFindString) == _toFindString
end

-----------------------------------------------------------------------------------------
-- Print the neat message to all on screen

Ugly.messageToAll = function (_theNeatMessage, _forceShow)
  if Ugly.showDebugText or (_forceShow ~= nil and _forceShow == true) then
    trigger.action.outText("UGLY: ".._theNeatMessage, Ugly.messageShowTime)
  end
end


-----------------------------------------------------------------------------------------
-- Detect Player Spawns

Ugly.currentPlayers = {}
Ugly.currentMarker = {}

Ugly.spawnmsg = {}

Ugly.spawnmsg.message = ""
Ugly.spawnmsg.eventHandler = {}


function Ugly.storeMarker(_markerEvent)

  local newMarker = {
    idx = _markerEvent.idx,
    time = _markerEvent.time,
    initiator = _markerEvent.initiator,
    coalition = _markerEvent.coalition,
    text = _markerEvent.text,
    pos = {x = _markerEvent.pos.x, y = _markerEvent.pos.y, z = _markerEvent.pos.z}
   }

   Ugly.currentMarker[_markerEvent.idx] = newMarker
end

function Ugly.removeMarker(_markerEvent)
  Ugly.currentMarker[_markerEvent.idx] = nil
end

function Ugly.spawnmsg.eventHandler:onEvent(_event)
  local status, err = pcall(function(_event)

    if _event == nil then
      return false

    elseif _event.id == world.event.S_EVENT_MARK_ADDED or _event.id == world.event.S_EVENT_MARK_CHANGE then --new marker added
      env.info("UGLY: Handled S_EVENT_MARK_ADDED: " .. _event.id)

      Ugly.storeMarker(_event)

      return true
    elseif _event.id == world.event.S_EVENT_MARK_REMOVED then --new marker removed
      env.info("UGLY: Handled S_EVENT_MARK_REMOVED: " .. _event.id)

      Ugly.removeMarker(_event)

      return true
    end

    if _event.initiator == nil then
        return false

    elseif _event.id == world.event.S_EVENT_PLAYER_ENTER_UNIT or _event.id == world.event.S_EVENT_TOOK_CONTROL then --player entered unit
      env.info("UGLY: Handled S_EVENT_PLAYER_ENTER_UNIT and S_EVENT_TOOK_CONTROL: " .. _event.id)

      if  _event.initiator:getPlayerName() then

        Ugly.currentPlayers[_event.initiator:getPlayerName()] = _event.initiator:getTypeName()

      end

      return true
    elseif _event.id == world.event.S_EVENT_PLAYER_LEAVE_UNIT then --player leave unit
      env.info("UGLY: Handled S_EVENT_PLAYER_LEAVE_UNIT: " .. _event.id)

      if  _event.initiator:getPlayerName() then

        Ugly.currentPlayers[_event.initiator:getPlayerName()] = nil

      end
      return true
    else
--      env.info("UGLY: Unhandled Event: " .. _event.id)
    end
  end, _event)

  if (not status) then
      env.error(string.format("Error while handling event %s", err),false)
  end

end


function Ugly.trackPlayerSpawn()
  world.addEventHandler(Ugly.spawnmsg.eventHandler)
end


  --- Creates a MapMarker on the location of a given static, visible for the enemy team
  -- @param #_staticName STRING The name of the static
  -- @param #_removeable BOOL True if the mark cannot be removed; false if the mark can be removed by users
  -- @param #_markertext STRING the text to be displayed.
  -- kreisch
function Ugly.setMarkerForStatic(_staticName, _fixedMarkpoint, _markertext)
    local  _static   = STATIC:FindByName(_staticName, false)
    local  _coalition = _static:GetCoalition()
    local  _coordinate = _static:GetCoordinate()
    local _coordinateText = _coordinate:ToStringLLDDM()
    if (_fixedMarkpoint == nil) then
        _fixedMarkpoint = true
    end
    if (_markertext == nil) then
      _markertext = " "
    end

    local  _finalText = "Target: " .. _staticName .. "\n ".. _markertext .. "Coordinates: " .. _coordinateText
    
    env.info("UGLY: SetMarkerForStatic " .. _staticName .. " with text " .. _markertext .. " for target of coalition " .. _coalition)
    local _coalitionEnemy = Ugly.getEnemyCoalition(_coalition)
    if (_coalitionEnemy == 0) then
      _coordinate:MarkToAll(_finalText,_fixedMarkpoint)
    else
      _coordinate:MarkToCoalition(_finalText, _coalitionEnemy, _fixedMarkpoint)
    end

end

  --- Returns the enemy team ID as INT - Neutral is not included.
  -- @param #_coalition the coalition you want to receive the enemy of
  -- @author kreisch
function Ugly.getEnemyCoalition(_coalition)
  local _enemy = 0
    if (_coalition == 1) then
      _enemy = 2
    elseif (_coalition == 2) then
     _enemy = 1
    end
  if (_enemy == nil) then
    env.error("UGLY: Warning, coalition is neutral! Setting mark to both sides.")
  end
  return _enemy
end

-- Framework END
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- Testing


Ugly.trackPlayerSpawn()

--timer.scheduleFunction(SEF_SaveUglyUnitDeadList, {}, timer.getTime() + SaveDeadListIntervall)

Ugly.EVENTS = {
  Shot =              world.event.S_EVENT_SHOT,
  Hit =               world.event.S_EVENT_HIT,
  Takeoff =           world.event.S_EVENT_TAKEOFF,
  Land =              world.event.S_EVENT_LAND,
  Crash =             world.event.S_EVENT_CRASH,
  Ejection =          world.event.S_EVENT_EJECTION,
  Refueling =         world.event.S_EVENT_REFUELING,
  Dead =              world.event.S_EVENT_DEAD,
  PilotDead =         world.event.S_EVENT_PILOT_DEAD,
  BaseCaptured =      world.event.S_EVENT_BASE_CAPTURED,
  MissionStart =      world.event.S_EVENT_MISSION_START,
  MissionEnd =        world.event.S_EVENT_MISSION_END,
  TookControl =       world.event.S_EVENT_TOOK_CONTROL,
  RefuelingStop =     world.event.S_EVENT_REFUELING_STOP,
  Birth =             world.event.S_EVENT_BIRTH,
  HumanFailure =      world.event.S_EVENT_HUMAN_FAILURE,
  EngineStartup =     world.event.S_EVENT_ENGINE_STARTUP,
  EngineShutdown =    world.event.S_EVENT_ENGINE_SHUTDOWN,
  PlayerEnterUnit =   world.event.S_EVENT_PLAYER_ENTER_UNIT,
  PlayerLeaveUnit =   world.event.S_EVENT_PLAYER_LEAVE_UNIT,
  PlayerComment =     world.event.S_EVENT_PLAYER_COMMENT,
  ShootingStart =     world.event.S_EVENT_SHOOTING_START,
  ShootingEnd =       world.event.S_EVENT_SHOOTING_END,
  -- Added with DCS 2.5.1
  MarkAdded =         world.event.S_EVENT_MARK_ADDED,
  MarkChange =        world.event.S_EVENT_MARK_CHANGE,
  MarkRemoved =       world.event.S_EVENT_MARK_REMOVED,
  -- Moose Events
  NewCargo =          world.event.S_EVENT_NEW_CARGO,
  DeleteCargo =       world.event.S_EVENT_DELETE_CARGO,
  NewZone =           world.event.S_EVENT_NEW_ZONE,
  DeleteZone =        world.event.S_EVENT_DELETE_ZONE,
  NewZoneGoal =       world.event.S_EVENT_NEW_ZONE_GOAL,
  DeleteZoneGoal =    world.event.S_EVENT_DELETE_ZONE_GOAL,
  RemoveUnit =        world.event.S_EVENT_REMOVE_UNIT,
  -- Added with DCS 2.5.6
  DetailedFailure =   world.event.S_EVENT_DETAILED_FAILURE or -1,  --We set this to -1 for backward compatibility to DCS 2.5.5 and earlier
  Kill =              world.event.S_EVENT_KILL or -1,
  Score =             world.event.S_EVENT_SCORE or -1,
  UnitLost =          world.event.S_EVENT_UNIT_LOST or -1,
  LandingAfterEjection = world.event.S_EVENT_LANDING_AFTER_EJECTION or -1,
}