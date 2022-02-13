local function initMission ()
    _configuration = nil
    MissionName                     = "MISSIONNAME"
    MissionBriefing                 = "BRIEFING"
    MISSIONNAME_Zones_Set           = SET_ZONE:New():FilterPrefixes(MissionName):FilterOnce() --Note: NEVER use "-" in your ZoneNames! ONLY use "_"!
    MISSIONNAME_Zones_Table         = zoneSetToList(MISSIONNAME_Zones_Set)
    MISSIONNAME_Delete_Zone         = ZONE:New("MISSIONNAME_Delete")                            --Note: NEVER use "-" in your ZoneNames! ONLY use "_"!
    MISSIONNAME_Delete_Zone_Marker  = nil
    Mission_Active                  = false
    NumberOfTable1Spawns            = 15 -- The number of how many groups of this Table you want to spawn
    NumberOfTable2Spawns            = 10 -- The number of how many groups of this Table you want to spawn
    NumberOfTable3Spawns            = 2 -- The number of how many groups of this Table you want to spawn
    UnitTable_1                     = {"TEMPLATE_NAME","TEMPLATE_NAME2"}
    UnitTable_2                     = {"TEMPLATE_NAME","TEMPLATE_NAME2"}
    UnitTable_3                     = {"TEMPLATE_NAME","TEMPLATE_NAME2"}

end

local function spawnUnits(configuration)
    _configuration = configuration
    if (Mission_Active == true) then
        trigger.action.outText("Mission " .. MissionName .. " already spawned, Despawn it first!", 10)
    end
    if (configuration >= 1 and Mission_Active == false) then
        SpawnGroupsOfTemplatesInListOfZones(NumberOfTable1Spawns, MISSIONNAME_Zones_Table, UnitTable_1, MissionName .."_Table1",100)
        Mission_Active = true
    end
    if (configuration >=2 and Mission_Active == false) then
        SpawnGroupsOfTemplatesInListOfZones(NumberOfTable2Spawns, MISSIONNAME_Zones_Table, UnitTable_2, MissionName .."_Table2",100)
        Mission_Active = true
    end
    if (configuration >= 3 and Mission_Active == false) then
        SpawnGroupsOfTemplatesInListOfZones(NumberOfTable3Spawns, MISSIONNAME_Zones_Table, UnitTable_3, MissionName .."_Table3",100) 
        Mission_Active = true
    end

end

local function DespawnUnits()
    local nameOfRemoveZone = ""
    local zoneRemover = ZONE:New(nameOfRemoveZone)
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

local function addF10Marker()
    MISSIONNAME_Delete_Zone_Marker      = MARKER:New(MISSIONNAME_Delete_Zone:GetCoordinate(), MissionBriefing):ReadOnly():ToAll()
end

local function removeF10Marker()
    MISSIONNAME_Delete_Zone_Marker:Remove()
end

local function endMission()
    removeF10Marker()
    DespawnUnits()
    Mission_Active = false
end

local function startMission()
    initMission ()
    spawnUnits()
    addF10Marker()

end

-- Add Menu
local MenuCoalitionBlueMISSIONNAME        = MENU_COALITION:New( coalition.side.BLUE,          "MISSIONNAME", MenuCoalitionBlueA2GMissions )
local MenuCoalitionBlueMISSIONNAMEMenuStart   = MENU_COALITION_COMMAND:New( coalition.side.BLUE,  "Start MISSIONNAME", MenuCoalitionBlueMISSIONNAME, startMission, 1)
local MenuCoalitionBlueMISSIONNAMEMenuEnd     = MENU_COALITION_COMMAND:New( coalition.side.BLUE,  "End MISSIONNAME", MenuCoalitionBlueMISSIONNAME, endMission)
