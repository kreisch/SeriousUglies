local function initMission()
    -- Fortschrittsvariablen
    TraindepotDestroyed   = false
    Traindepot1Destroyed   = false
    Traindepot2Destroyed   = false
    Traindepot3Destroyed   = false
    Traindepot4Destroyed   = false
    Traindepot5Destroyed   = false
    Traindepot6Destroyed   = false
    Traindepot7Destroyed   = false


    -- Zones to define targets
    TraindepotZone        = ZONE:New("Traindepot")
    TraindepotMarker      = nil
    Traindepot1Zone       = ZONE:New("Traindepot-1")
    Traindepot1Marker     = nil
    Traindepot2Zone       = ZONE:New("Traindepot-2")
    Traindepot2Marker     = nil
    Traindepot3Zone       = ZONE:New("Traindepot-3")
    Traindepot3Marker     = nil
    Traindepot4Zone       = ZONE:New("Traindepot-4")
    Traindepot4Marker     = nil
    Traindepot5Zone       = ZONE:New("Traindepot-5")
    Traindepot5Marker     = nil
    Traindepot6Zone       = ZONE:New("Traindepot-6")
    Traindepot6Marker     = nil
    Traindepot7Zone       = ZONE:New("Traindepot-7")
    Traindepot7Marker     = nil

    MS01_TrainStrike_Zones_Set    = SET_ZONE:New():FilterPrefixes("MS01Trainstrike"):FilterOnce()
    MS01_TrainStrike_Zones_Table  = zoneSetToList(MS01_TrainStrike_Zones_Set)
    trigger.action.outText("Size of Zone Trainstrike Table.." .. #MS01_TrainStrike_Zones_Table, 30)


    UnitTable_ShoRads                       = {"Template_Red_SAM_SA6", "Template_Red_SAM_SA8", "Template_Red_SAM_SA3"}
    UnitTable_SamUnitsMANPAD                = {"Template_Red_ManpadTeam"}
    UnitTable_SamUnitsAAA                   = {"Template_Red_ZU23", "Template_Red_AAATruck" ,"Template_Red_ZSU57-2","Template_Red_Shilka"}
    
    -- SpawnedShorads  = {}
    -- SpawnedManpads  = {}
    -- SpawnedAAA      = {}
end

local function addF10Marker()
  TraindepotMarker  = MARKER:New(TraindepotZone:GetCoordinate(), "What a fookin' nice Train Depot...a...shame"):ReadOnly():ToAll()
  Traindepot1Marker = MARKER:New(Traindepot1Zone:GetCoordinate(), "What a fookin' nice Train Depot...a...shame"):ReadOnly():ToAll()
  Traindepot2Marker = MARKER:New(Traindepot2Zone:GetCoordinate(), "What a fookin' nice Train Depot...a...shame"):ReadOnly():ToAll()
  Traindepot3Marker = MARKER:New(Traindepot3Zone:GetCoordinate(), "What a fookin' nice Train Depot...a...shame"):ReadOnly():ToAll()
  Traindepot4Marker = MARKER:New(Traindepot4Zone:GetCoordinate(), "What a fookin' nice Train Depot...a...shame"):ReadOnly():ToAll()
  Traindepot5Marker = MARKER:New(Traindepot5Zone:GetCoordinate(), "What a fookin' nice Train Depot...a...shame"):ReadOnly():ToAll()
  Traindepot6Marker = MARKER:New(Traindepot6Zone:GetCoordinate(), "What a fookin' nice Train Depot...a...shame"):ReadOnly():ToAll()
  Traindepot7Marker = MARKER:New(Traindepot7Zone:GetCoordinate(), "What a fookin' nice Train Depot...a...shame"):ReadOnly():ToAll()
end

local function SpawnUnits(configuration)
  if configuration == 1 then
    trigger.action.outText("Size of Zone Trainstrike Table.." .. #MS01_TrainStrike_Zones_Table, 30)
    SpawnGroupsOfTemplatesInListOfZones(3, MS01_TrainStrike_Zones_Table, UnitTable_ShoRads, "Trainstrike_Shorads",100)
    SpawnGroupsOfTemplatesInListOfZones(10, MS01_TrainStrike_Zones_Table, UnitTable_SamUnitsAAA, "Trainstrike_AAA",100)
    SpawnGroupsOfTemplatesInListOfZones(2, MS01_TrainStrike_Zones_Table, UnitTable_SamUnitsMANPAD, "Trainstrike_Manpad",100)
  end
end

local function removeF10Marker()
  TraindepotMarker:Remove()
  Traindepot1Marker:Remove()
  Traindepot2Marker:Remove()
  Traindepot3Marker:Remove()
  Traindepot4Marker:Remove()
  Traindepot5Marker:Remove()
  Traindepot6Marker:Remove()
  Traindepot7Marker:Remove()

end

local function DespawnUnits()
  local zoneRemover = ZONE:New("MS01Remove-1")
  local unitsToKill = SET_GROUP:New():FilterCategoryGround():FilterZones({zoneRemover}):FilterOnce()
  if unitsToKill:Count() > 0 then
      unitsToKill:ForEachGroup( 
      function( MooseGroup ) 
          local _g = MooseGroup --Wrapper.GROUP object    
          _g:Destroy()
        end 
      )
   end
end

local function endMissionTrainStrike()
   removeF10Marker()
   DespawnUnits()
  -- Todo: Wie kriegt man den Eventhandler inaktiv?
end

--- Function to handle SCENERY Death EVENTS
local function HandleSceneryEvents()
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
          TraindepotDestroyed = true
        end 
        if name == 174588481 then -- Traindepot-1
          trigger.action.outText("Traindepot-1 down", 10)
          Traindepot1Marker:Remove()
          Traindepot1Destroyed = true
        end
        if name == 174588464 then -- Traindepot-2
          trigger.action.outText("Traindepot-2 down", 10)
          Traindepot2Marker:Remove()
          Traindepot2Destroyed = true
        end
        if name == 108232988 then -- Traindepot-3
          trigger.action.outText("Traindepot-3 down", 10)
          Traindepot3Marker:Remove()
          Traindepot3Destroyed = true
        end
        if name == 108232901 then -- Traindepot-4
          trigger.action.outText("Traindepot-4 down", 10)
          Traindepot4Marker:Remove()
          Traindepot4Destroyed = true
        end
        if name == 108233344 then -- Traindepot-5
          trigger.action.outText("Traindepot-5 down", 10)
          Traindepot5Marker:Remove()
          Traindepot5Destroyed = true
        end
        if name == 108235055 then -- Traindepot-6
          trigger.action.outText("Traindepot-5 down", 10)
          Traindepot6Marker:Remove()
          Traindepot6Destroyed = true
        end
        if name == 108234939 then -- Traindepot-7
          trigger.action.outText("Traindepot-5 down", 10)
          Traindepot7Marker:Remove()
          Traindepot7Destroyed = true
        end
    end
  end
end

local function startMissionTrainStrike(configuration)
  initMission()
  HandleSceneryEvents()
  addF10Marker()
  SpawnUnits(configuration)
end

-- Build Menu
local MenuCoalitionBlueHomsTrainStrikeMenu        = MENU_COALITION:New( coalition.side.BLUE,          "Homs: Train Strike", MenuCoalitionBlueA2GMissions )
local MenuCoalitionBlueHomsTrainStrikeMenuStart   = MENU_COALITION_COMMAND:New( coalition.side.BLUE,  "Start Train Strike", MenuCoalitionBlueHomsTrainStrikeMenu, startMissionTrainStrike, 1)
local MenuCoalitionBlueHomsTrainStrikeMenuEnd     = MENU_COALITION_COMMAND:New( coalition.side.BLUE,  "End Train Strike", MenuCoalitionBlueHomsTrainStrikeMenu, endMissionTrainStrike)