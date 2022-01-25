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
local UrbanHellZoneTable = {ZONE:New( "UrbanHell-1" ), ZONE:New( "UrbanHell-2" ), ZONE:New( "UrbanHell-3" ), ZONE:New( "UrbanHell-4" ), ZONE:New( "UrbanHell-5" )
                            , ZONE:New( "UrbanHell-6" ), ZONE:New( "UrbanHell-7") , ZONE:New( "UrbanHell-8" ), ZONE:New( "UrbanHell-9" ), ZONE:New( "UrbanHell-10" ), ZONE:New( "UrbanHell-11" )
                            , ZONE:New( "UrbanHell-12" ), ZONE:New( "UrbanHell-13" ), ZONE:New( "UrbanHell-14" ), ZONE:New( "UrbanHell-15" ), ZONE:New( "UrbanHell-16" ), ZONE:New( "UrbanHell-17" )
                            , ZONE:New( "UrbanHell-18" ), ZONE:New( "UrbanHell-19" ), ZONE:New( "UrbanHell-20" ), ZONE:New( "UrbanHell-21" )}
local UrbanHellSet = SET_ZONE:New():FilterPrefixes("UrbanHell-"):FilterOnce()

local UrbanHellZoneTable22 = {}
local UrbanHellZoneDeletion = {ZONE:New("UrbanHellDelete")}
local UrbanHellUnitsEasy    = {"Template_Red_Mortar_Team", "Template_Red_15Inf", "Template_Red_SupplyTrucks", "Template_Red_BTR82", "Template_Red_FlatbedTruck" ,"Template_Red_KamazTruck"}
local UrbanHellUnitsMedium  = {"Template_Red_RPGTeam", "Template_Red_T55", "Template_Red_BTR82"}
local UrbanHellUnitsHard    = {"Template_Red_ZU23WithStrela"}
local UrbanHellUnitsMANPAD  = {"Template_Red_ManpadTeam"}
local UrbanHellUnitsAAA     = {"Template_Red_ZU23WithStrela", "Template_Red_AAATruck"}
local spawnedUnitsUrbanHellEasy = {}
local spawnedUnitsUrbanHellMedium = {}
local spawnedUnitsUrbanHellHard = {}
local UrbanHellActive = false

function SpawnUrbanHell(difficulty)
  if (UrbanHellActive) == false then
    if difficulty >= 1 then
        UrbanHellZoneTable22 = zoneSetToList(UrbanHellSet)
        spawnedUnitsUrbanHellEasy   = SpawnGroupsOfTemplatesInListOfZones(15, UrbanHellZoneTable22,UrbanHellUnitsEasy, "UrbanHellEasy")
        UrbanHellActive = true
    end
    if difficulty >= 2 then
        spawnedUnitsUrbanHellMedium = SpawnGroupsOfTemplatesInListOfZones(8, UrbanHellZoneTable,UrbanHellUnitsMedium, "UrbanHellMedium")
    end
    if difficulty >=3 then
        spawnedUnitsUrbanHellHard   = SpawnGroupsOfTemplatesInListOfZones(5, UrbanHellZoneTable,UrbanHellUnitsHard, "UrbanHellHard")
    end
    -- Now activate the marks for the mission
    trigger.action.markToAll(UrbanHell_id, "Urban Hell" , UrbanHellZoneTable[1]:GetVec3() , true, "Urban Hell Marker")
  end
end

function DeSpawnUrbanHell()
    for k = 1, #spawnedUnitsUrbanHellEasy, 1 do
        spawnedUnitsUrbanHellEasy[k]:Destroy()
    end
    for k = 1, #spawnedUnitsUrbanHellMedium, 1 do
        spawnedUnitsUrbanHellMedium[k]:Destroy()
    end
    for k = 1, #spawnedUnitsUrbanHellHard, 1 do
        spawnedUnitsUrbanHellHard[k]:Destroy()
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
    spawnedUnitsUrbanHellEasy = {}
    spawnedUnitsUrbanHellMedium = {}
    spawnedUnitsUrbanHellHard = {}
    -- Housekeeping, remove Mark
    trigger.action.removeMark(UrbanHell_id)
    UrbanHellActive = false
end


-- Definition of F10 structure
-- Define A2G Operations
local MenuCoalitionBlueA2G = MENU_COALITION:New( coalition.side.BLUE, "Mission Setup A2G" )
local MenuCoalitionBlueA2GMissions = MENU_COALITION:New( coalition.side.BLUE, "CAS Missions", MenuCoalitionBlueA2G )
local MenuCoalitionBlueA2GMissionTaftanaz = MENU_COALITION:New( coalition.side.BLUE, "Mission: CAS Urban Hell", MenuCoalitionBlueA2GMissions)
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Urban Hell Easy: Start", MenuCoalitionBlueA2GMissionTaftanaz, SpawnUrbanHell, 1 )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Urban Hell Medium: Start", MenuCoalitionBlueA2GMissionTaftanaz, SpawnUrbanHell, 2 )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Urban Hell Hard: Start", MenuCoalitionBlueA2GMissionTaftanaz, SpawnUrbanHell, 3 )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Urban Hell: End", MenuCoalitionBlueA2GMissionTaftanaz, DeSpawnUrbanHell )

-- Define CSAR
local MenuCoalitionBlueCSAR             = MENU_COALITION:New( coalition.side.BLUE, "Mission Setup CSAR" )
local MenuCoalitionBlueCSARRayak        = MENU_COALITION:New( coalition.side.BLUE, "Region: Rayak", MenuCoalitionBlueCSAR)
local MenuCoalitionBlueCSARHoms         = MENU_COALITION:New( coalition.side.BLUE, "Region: Homs", MenuCoalitionBlueCSAR)
local MenuCoalitionBlueCSARRayakStart   = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Start CSAR", MenuCoalitionBlueCSARRayak, SpawnCSAR, 1)
local MenuCoalitionBlueCSARRayakEnd     = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "End CSAR", MenuCoalitionBlueCSARRayak)
local MenuCoalitionBlueCSARHomsStart    = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Start CSAR", MenuCoalitionBlueCSARHoms)
local MenuCoalitionBlueCSARHomsEnd      = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "End CSAR", MenuCoalitionBlueCSARHoms)
