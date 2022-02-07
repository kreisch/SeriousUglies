-- Fortschrittsvariablen
local TraindepotDestroyed   = false
local Traindepot1Destroyed   = false
local Traindepot2Destroyed   = false
local Traindepot3Destroyed   = false
local Traindepot4Destroyed   = false
local Traindepot5Destroyed   = false
local Traindepot6Destroyed   = false
local Traindepot7Destroyed   = false

-- Zones to define targets
local TrainbridgeZone       = ZONE:New("Trainbridge")
local TrainbridgeZoneMarker = nil
local Trainbridge13Zone     = ZONE:New("Trainbridge-13")
local TraindepotZone        = ZONE:New("Traindepot")
local TraindepotMarker      = nil
local Traindepot1Zone       = ZONE:New("Traindepot-1")
local Traindepot1Marker     = nil
local Traindepot2Zone       = ZONE:New("Traindepot-2")
local Traindepot2Marker     = nil
local Traindepot3Zone       = ZONE:New("Traindepot-3")
local Traindepot3Marker     = nil
local Traindepot4Zone       = ZONE:New("Traindepot-4")
local Traindepot4Marker     = nil
local Traindepot5Zone       = ZONE:New("Traindepot-5")
local Traindepot5Marker     = nil
local Traindepot6Zone       = ZONE:New("Traindepot-6")
local Traindepot6Marker     = nil
local Traindepot7Zone       = ZONE:New("Traindepot-7")
local Traindepot7Marker     = nil
-- Vec3 of Zones
--local TrainbridgeV3     = TrainbridgeZone:GetVec3()

function startMissionTrainStrike()
  HandleSceneryEvents()
  TraindepotMarker = MARKER:New(TraindepotZone:GetCoordinate(), "What a fookin' nice Train Depot...a...shame"):ReadOnly():ToAll()
  Traindepot1Marker = MARKER:New(Traindepot1Zone:GetCoordinate(), "What a fookin' nice Train Depot...a...shame"):ReadOnly():ToAll()
  Traindepot2Marker = MARKER:New(Traindepot2Zone:GetCoordinate(), "What a fookin' nice Train Depot...a...shame"):ReadOnly():ToAll()
  Traindepot3Marker = MARKER:New(Traindepot3Zone:GetCoordinate(), "What a fookin' nice Train Depot...a...shame"):ReadOnly():ToAll()
  Traindepot4Marker = MARKER:New(Traindepot4Zone:GetCoordinate(), "What a fookin' nice Train Depot...a...shame"):ReadOnly():ToAll()
  Traindepot5Marker = MARKER:New(Traindepot5Zone:GetCoordinate(), "What a fookin' nice Train Depot...a...shame"):ReadOnly():ToAll()
  Traindepot6Marker = MARKER:New(Traindepot6Zone:GetCoordinate(), "What a fookin' nice Train Depot...a...shame"):ReadOnly():ToAll()
  Traindepot7Marker = MARKER:New(Traindepot7Zone:GetCoordinate(), "What a fookin' nice Train Depot...a...shame"):ReadOnly():ToAll()

end

function endMissionTrainStrike()
  -- Remove Marks
  -- Remove Eventhandler

end


--- Function to handle SCENERY Death EVENTS
function HandleSceneryEvents()
  DeathEventHandler = EVENTHANDLER:New()
  DeathEventHandler:HandleEvent(EVENTS.Dead)
    function DeathEventHandler:OnEventDead(EventData)
      --BASE:F({EventData})
      --BASE:E("Goals Info: ---------------------- Something Died ---------------------------")
      -- Assign userflag
      local deadUnit = EventData.IniUnit --Wrapper.Unit#UNIT
      local name = deadUnit:GetName()
      BASE:E("Dead Unit is " .. tostring(name))
      if type(name) ~= "string" then -- Scenery destroyed
        if name == 174588516 then -- Traindepot
          trigger.action.outText("Traindepot down", 10)
          TraindepotMarker:Remove()
        end 
        if name == 174588481 then -- Traindepot-1
          trigger.action.outText("Traindepot-1 down", 10)
          Traindepot1Marker:Remove()
        end
        if name == 174588464 then -- Traindepot-2
          trigger.action.outText("Traindepot-2 down", 10)
          Traindepot2Marker:Remove()
        end
        if name == 108232988 then -- Traindepot-3
          trigger.action.outText("Traindepot-3 down", 10)
          Traindepot3Marker:Remove()
        end
        if name == 108232901 then -- Traindepot-4
          trigger.action.outText("Traindepot-4 down", 10)
          Traindepot4Marker:Remove()
        end
        if name == 108233344 then -- Traindepot-5
          trigger.action.outText("Traindepot-5 down", 10)
          Traindepot5Marker:Remove()
        end
        if name == 108235055 then -- Traindepot-6
          trigger.action.outText("Traindepot-5 down", 10)
          Traindepot6Marker:Remove()
        end
        if name == 108234939 then -- Traindepot-7
          trigger.action.outText("Traindepot-5 down", 10)
          Traindepot7Marker:Remove()
        end
    end
  end
end




-- Build Menu
local MenuCoalitionBlueHomsTrainStrikeMenu        = MENU_COALITION:New( coalition.side.BLUE,          "Homs: Train Strike", MenuCoalitionBlueA2GMissions )
local MenuCoalitionBlueHomsTrainStrikeMenuStart   = MENU_COALITION_COMMAND:New( coalition.side.BLUE,  "Start Train Strike", MenuCoalitionBlueHomsTrainStrikeMenu, startMissionTrainStrike)
local MenuCoalitionBlueHomsTrainStrikeMenuEnd     = MENU_COALITION_COMMAND:New( coalition.side.BLUE,  "End Train Strike", MenuCoalitionBlueHomsTrainStrikeMenu, endMissionTrainStrike)