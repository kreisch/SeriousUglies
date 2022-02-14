local MissionInitialized = false

-- Für eine neue Mission müssen lediglich in dieser Funktion die entsprechenden Variablen angepasst werden.
local function initMission ()
    _configuration = nil

    -- Beginn: Werte eintragen!
    MissionName                     = "MISSIONNAME" -- Die Trigger-Zonen in der Mission dürfen nur einen "-" enthalten! 
                                                    -- Sie MÜSSEN im Format "NAME_NAME" sein und werden mit "-X" am Ende iteriert, sprich "NAME_NAME-X"
                                                    -- Erstellt einfach einen Trigger mit bspw. "MEINE_MISSION-1" und kopiert diesen, so oft ihr wollt.
                                                    -- HINWEIS: Ihr MÜSST eine Zone erstellen, die alle anderen Zonen beinhaltet. Diese muss "MISSIONNAME_Delete" heißen!
    MissionBriefing                 = "BRIEFING"    -- Hier tragt ihr eine kurze Beschreibung ein, was im Einsatz zu erwarten ist. Dieser Text wird mittels F10 Marker angezeigt.

    NumberOfTable1Spawns            = 15    -- The number of how many groups of this Table you want to spawn
    NumberOfTable2Spawns            = 10    -- The number of how many groups of this Table you want to spawn
    NumberOfTable3Spawns            = 2     -- The number of how many groups of this Table you want to spawn
    UnitTable_1                     = {"TEMPLATE_NAME","TEMPLATE_NAME2"} -- Die Gruppen-Namen der "Late-Activated" Gruppen, die gespawned werden sollen - Stufe 1
    UnitTable_2                     = {"TEMPLATE_NAME","TEMPLATE_NAME2"} -- Die Gruppen-Namen der "Late-Activated" Gruppen, die gespawned werden sollen - Stufe 2
    UnitTable_3                     = {"TEMPLATE_NAME","TEMPLATE_NAME2"} -- Die Gruppen-Namen der "Late-Activated" Gruppen, die gespawned werden sollen - Stufe 3

    -- Ende! Verändert ab hier nur noch dann die Werte, wenn ihr wisst, was ihr tut!
    -- --------------------------------------
    -- ######################################
    -- ######################################


    MISSIONNAME_Zones_Set           = SET_ZONE:New():FilterPrefixes(MissionName):FilterOnce() --Note: NEVER use "-" in your ZoneNames! ONLY use "_"!
    MISSIONNAME_Zones_Table         = zoneSetToList(MISSIONNAME_Zones_Set)
    MISSIONNAME_Delete_Zone         = ZONE:New(MissionName .. "_Delete")
    MISSIONNAME_Delete_Zone_Marker  = nil
    Mission_Active                  = false
end

-- Function to spawn a Table of Units in a Table of Zones.
local function spawnUnits(configuration)
    _configuration = configuration
    if (Mission_Active == true) then
        trigger.action.outText("Mission " .. MissionName .. " already spawned, Despawn it first!", 30)
    elseif (Mission_Active == false) then
        if (configuration >= 1) then
            SpawnGroupsOfTemplatesInListOfZones(NumberOfTable1Spawns, MISSIONNAME_Zones_Table, UnitTable_1, MissionName .."_Table1",100)
        end
        if (configuration >=2) then
            SpawnGroupsOfTemplatesInListOfZones(NumberOfTable2Spawns, MISSIONNAME_Zones_Table, UnitTable_2, MissionName .."_Table2",100)
        end
        if (configuration >= 3) then
            SpawnGroupsOfTemplatesInListOfZones(NumberOfTable3Spawns, MISSIONNAME_Zones_Table, UnitTable_3, MissionName .."_Table3",100) 
        end
    end
end

-- Removes all Ground units of all coalitions within the "MISSIONNAME_Delete_Zone" zone
local function DespawnUnits()
    local unitsToKill = SET_GROUP:New():FilterCategoryGround():FilterZones({MISSIONNAME_Delete_Zone}):FilterOnce()
    if unitsToKill:Count() > 0 then
        unitsToKill:ForEachGroup( 
        function( MooseGroup ) 
            local _g = MooseGroup --Wrapper.GROUP object    
            _g:Destroy()
          end 
        )
     end

end

-- Adds an F10 Marker to the Deletion-Zone and with this to the center of the mission. Contains the briefing.
local function addF10Marker()
    MISSIONNAME_Delete_Zone_Marker      = MARKER:New(MISSIONNAME_Delete_Zone:GetCoordinate(), MissionBriefing):ReadOnly():ToAll()
end

-- Removes the F10 Marker.
local function removeF10Marker()
    MISSIONNAME_Delete_Zone_Marker:Remove()
end

-- Ends the mission and calls all necessary functions to despawn units and markers.
local function endMission()
    removeF10Marker()
    DespawnUnits()
    Mission_Active = false
end

-- Default Function to start a mission
-- @param configuration An integer which is set to 1-3; Represents the difficulty and the Unit-Tables which are to spawn
-- The "Mission_Active" prevents respawning without despawning first.
local function startMission(configuration)
    if MissionInitialized == false then
        initMission()
        MissionInitialized = true
    end
    spawnUnits(configuration)
    addF10Marker()
    Mission_Active = true
end

-- Add Menu-Entries
local MenuCoalitionBlueMISSIONNAME            = MENU_COALITION          :New( coalition.side.BLUE, MissionName, MenuCoalitionBlueA2GMissions )
local MenuCoalitionBlueMISSIONNAMEMenuStart   = MENU_COALITION_COMMAND  :New( coalition.side.BLUE,  "Start " .. MissionName .. " Easy", MenuCoalitionBlueMISSIONNAME, startMission, 1)
local MenuCoalitionBlueMISSIONNAMEMenuStart   = MENU_COALITION_COMMAND  :New( coalition.side.BLUE,  "Start " .. MissionName .. " Medium", MenuCoalitionBlueMISSIONNAME, startMission, 2)
local MenuCoalitionBlueMISSIONNAMEMenuStart   = MENU_COALITION_COMMAND  :New( coalition.side.BLUE,  "Start " .. MissionName .. " Hard", MenuCoalitionBlueMISSIONNAME, startMission, 3)
local MenuCoalitionBlueMISSIONNAMEMenuEnd     = MENU_COALITION_COMMAND  :New( coalition.side.BLUE,  "End " .. MissionName, MenuCoalitionBlueMISSIONNAME, endMission)
