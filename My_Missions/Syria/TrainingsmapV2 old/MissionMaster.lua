---- Mastermission File to start the necessary mission functionality and initialize setup.

-- Use Dismounts to make using APCS fun 
SCHEDULER:New(nil,function()
  local DismountsGroupSet=SET_GROUP:New():FilterCategoryGround():FilterOnce()
  if #DismountsGroupSet > 0 then
    AddDismountsToGroup(DismountsGroupSet)
  end
  DismountsGroupSet = nil
end,{},5)


-- Mission: UrbanHell
-- Define Template-Sets of Units and Zones
local UrbanHellSet          = SET_ZONE:New():FilterPrefixes("UrbanHell-"):FilterOnce()
local UrbanHellFarpsSet     = SET_ZONE:New():FilterPrefixes("FARPS_UH-"):FilterOnce()
local UrbanHellZoneTable    = {}
local UrbanHellFarpsTable   = {}
local UrbanHellZoneDeletion = {ZONE:New("UrbanHellDelete")}
local UrbanHellUnitsEasy    = {"Template_Red_Mortar_Team", "Template_Red_15Inf", "Template_Red_SupplyTrucks", "Template_Red_BTR82", "Template_Red_FlatbedTruck" ,"Template_Red_KamazTruck"}
local UrbanHellUnitsMedium  = {"Template_Red_RPGTeam", "Template_Red_T55", "Template_Red_BTR82"}
local UrbanHellUnitsHard    = {"Template_Red_ZU23WithStrela"}
local UrbanHellUnitsMANPAD  = {"Template_Red_ManpadTeam"}
local UrbanHellUnitsAAA     = {"Template_Red_ZU23WithStrela", "Template_Red_AAATruck"}
local UrbanHellFARPUnits    = {"Template_FARP_Equipment_RefRep"}
local UrbanHellSpawnFarpUnits        = nil
local UrbanHellspawnedUnitsEasy      = {}
local UrbanHellspawnedUnitsMedium    = {}
local UrbanHellspawnedUnitsHard      = {}
local UrbanHellActive                = false
local UrbanHellMarkerTGT             = nil
local UrbanHellMarkerFARP            = nil
local MarkerHelipads                 = {}
local MarkerMASH                     = {}

MT01MissionActive = false

function SpawnUrbanHell(difficulty)
  if (UrbanHellActive) == false then
    UrbanHellZoneTable = zoneSetToList(UrbanHellSet)
    UrbanHellFarpsTable= zoneSetToList(UrbanHellFarpsSet)
    MessageToAll ("Table Zones Urban Hell" .. #UrbanHellZoneTable,60,"YB34 Range activated")
    MessageToAll ("Table FARPS Urban Hell" .. #UrbanHellFarpsTable,60,"YB34 Range activated")
    UrbanHellSpawnFarpUnits                  = SpawnGroupsOfTemplatesInListOfZones(1, UrbanHellFarpsTable,UrbanHellFARPUnits, "UrbanHellEasyFarp")
    
    if difficulty >= 1 then
        UrbanHellspawnedUnitsEasy   = SpawnGroupsOfTemplatesInListOfZones(15, UrbanHellZoneTable,UrbanHellUnitsEasy, "UrbanHellEasy", 200)
        UrbanHellActive = true
    end
    if difficulty >= 2 then
        UrbanHellspawnedUnitsMedium = SpawnGroupsOfTemplatesInListOfZones(8, UrbanHellZoneTable,UrbanHellUnitsMedium, "UrbanHellMedium", 200)
    end
    if difficulty >=3 then
        UrbanHellspawnedUnitsHard   = SpawnGroupsOfTemplatesInListOfZones(5, UrbanHellZoneTable,UrbanHellUnitsHard, "UrbanHellHard", 200)
    end
    -- Now activate the marks for the mission
        UrbanHellMarkerTGT  = MARKER:New(UrbanHellZoneTable[1]:GetCoordinate(), "Urban Hell Target Area"):ReadOnly():ToAll()
        UrbanHellMarkerFARP = MARKER:New(UrbanHellSpawnFarpUnits[1]:GetCoordinate(), "Urban Hell FARP"):ReadOnly():ToAll()
  end
end

function DeSpawnUrbanHell()
    for k = 1, #UrbanHellspawnedUnitsEasy, 1 do
        UrbanHellspawnedUnitsEasy[k]:Destroy()
    end
    for k = 1, #UrbanHellspawnedUnitsMedium, 1 do
        UrbanHellspawnedUnitsMedium[k]:Destroy()
    end
    for k = 1, #UrbanHellspawnedUnitsHard, 1 do
        UrbanHellspawnedUnitsHard[k]:Destroy()
    end
    for k = 1, #UrbanHellSpawnFarpUnits, 1 do
        UrbanHellSpawnFarpUnits[k]:Destroy()
    end   
    local DismountsInfantry=SET_GROUP:New():FilterCoalitions("red"):FilterPrefixes("Dismounts_"):FilterZones(UrbanHellZoneDeletion):FilterActive(true):FilterOnce()
    if DismountsInfantry:Count() > 0 then
    DismountsInfantry:ForEachGroup( 
    function( MooseGroup ) 
        local _g = MooseGroup --Wrapper.GROUP object    
        _g:Destroy()
      end 
    )
    end
    DismountsInfantry = {}
    -- Housekeeping, free ressources
    UrbanHellspawnedUnitsEasy = {}
    UrbanHellspawnedUnitsMedium = {}
    UrbanHellspawnedUnitsHard = {}
    -- Housekeeping, remove Mark
    UrbanHellMarkerTGT:Remove()
    UrbanHellMarkerFARP:Remove()
    UrbanHellActive = false
end

function MarkHeliPorts()
    local HeliPortSet = SET_ZONE:New():FilterPrefixes("Helipad"):FilterStart()
    local index = 1
    if HeliPortSet:Count() > 0 then
    HeliPortSet:ForEachZone( 
    function( MooseZone ) 
        local _z = MooseZone --Wrapper.GROUP object    
        MarkerHelipads[index]= MARKER:New(_z:GetCoordinate(), "Heliport"):ToAll()
        index = index + 1
      end 
    )
    end
end

function RemoveHeliPortMarks()
  for k = 1, #MarkerHelipads, 1 do
  MarkerHelipads[k]:Remove()
  end
  MarkerHelipads = {}
end

function MarkMASH()
    local MashSet = SET_GROUP:New():FilterPrefixes("MASH"):FilterStart()
    local index = 1
    if MashSet:Count() > 0 then
    MashSet:ForEachGroup( 
    function( MooseZone ) 
        local _z = MooseZone --Wrapper.GROUP object    
        MarkerMASH[index]= MARKER:New(_z:GetCoordinate(), "MASH"):ToAll()
        index = index + 1
      end 
    )
    end
end

function RemoveMASHMarks()
  for k = 1, #MarkerMASH, 1 do
    MarkerMASH[k]:Remove()
  end
  MarkerMASH = {}
end


-- Definition of F10 structure
-- Define A2G Operations
local MenuCoalitionBlueA2G                = MENU_COALITION:New( coalition.side.BLUE, "Mission Setup A2G" )
local MenuCoalitionBlueA2GMissions        = MENU_COALITION:New( coalition.side.BLUE, "CAS Missions", MenuCoalitionBlueA2G )
local MenuCoalitionBlueA2GMissionTaftanaz = MENU_COALITION:New( coalition.side.BLUE, "Mission: CAS Urban Hell", MenuCoalitionBlueA2GMissions)
local MenuAdd                             = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Urban Hell Easy: Start", MenuCoalitionBlueA2GMissionTaftanaz, SpawnUrbanHell, 1 )
local MenuAdd                             = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Urban Hell Medium: Start", MenuCoalitionBlueA2GMissionTaftanaz, SpawnUrbanHell, 2 )
local MenuAdd                             = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Urban Hell Hard: Start", MenuCoalitionBlueA2GMissionTaftanaz, SpawnUrbanHell, 3 )
local MenuAdd                             = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Urban Hell: End", MenuCoalitionBlueA2GMissionTaftanaz, DeSpawnUrbanHell )

-- Define CSAR
local MenuCoalitionBlueCSAR             = MENU_COALITION:New( coalition.side.BLUE, "Mission Setup CSAR" )
local MenuCoalitionBlueCSARRayak        = MENU_COALITION:New( coalition.side.BLUE, "Region: Rayak", MenuCoalitionBlueCSAR)
local MenuCoalitionBlueCSARHoms         = MENU_COALITION:New( coalition.side.BLUE, "Region: Homs", MenuCoalitionBlueCSAR)
local MenuCoalitionBlueCSARRoshPina     = MENU_COALITION:New( coalition.side.BLUE, "Region: Rosh Pina", MenuCoalitionBlueCSAR)
local MenuCoalitionBlueCSARMarker     = MENU_COALITION:New( coalition.side.BLUE, "Help: Region Markers", MenuCoalitionBlueCSAR)
local MenuCoalitionBlueMarkHeliports    = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Mark Heli Ports", MenuCoalitionBlueCSARMarker, MarkHeliPorts)
local MenuCoalitionBlueRemoveMarkHeliports    = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Remove Mark Heli Ports", MenuCoalitionBlueCSARMarker, RemoveHeliPortMarks)
local MenuCoalitionBlueMarkHeliports    = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Mark MASH", MenuCoalitionBlueCSARMarker, MarkMASH)
local MenuCoalitionBlueRemoveMash    = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Remove MASH Marks", MenuCoalitionBlueCSARMarker, RemoveMASHMarks)

local MenuCoalitionBlueCSARRayakStart   = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Start CSAR", MenuCoalitionBlueCSARRayak, SpawnCSAR, CSAR_ZONE_RAYAK)
local MenuCoalitionBlueCSARRayakEnd     = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "End CSAR", MenuCoalitionBlueCSARRayak, EndCSAR, CSAR_ZONE_RAYAK)
local MenuCoalitionBlueCSARHomsStart    = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Start CSAR", MenuCoalitionBlueCSARHoms, SpawnCSAR, CSAR_ZONE_HOMS)
local MenuCoalitionBlueCSARHomsEnd      = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "End CSAR", MenuCoalitionBlueCSARRayak, EndCSAR, CSAR_ZONE_HOMS)
local MenuCoalitionBlueCSARRPStart    = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Start CSAR", MenuCoalitionBlueCSARRoshPina, SpawnCSAR, CSAR_ZONE_ROSHPINA)
local MenuCoalitionBlueCSARRPEnd      = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "End CSAR", MenuCoalitionBlueCSARRoshPina, EndCSAR, CSAR_ZONE_ROSHPINA)

-- Define TransportMissions
local MenuCoalitionBlueTransport            = MENU_COALITION:New( coalition.side.BLUE, "Mission Setup Transport" )
local MenuCoalitionBlueTransportMT01        = MENU_COALITION:New( coalition.side.BLUE, "MT01: YB64", MenuCoalitionBlueTransport )
local MenuCoalitionBlueTransportMT01Start   = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Start MT01", MenuCoalitionBlueTransportMT01, startMissionMT01)
local MenuCoalitionBlueTransportMT01End     = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "End MT01", MenuCoalitionBlueTransportMT01, stopMissionMT01)
