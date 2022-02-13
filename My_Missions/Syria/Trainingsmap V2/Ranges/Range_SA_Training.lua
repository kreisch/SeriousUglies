local MissionInitialized = false

local function initMission ()
    _configuration = nil
    MissionName                                 = "SA_Training"
    Range_SA_Training_Zones_Set                 = SET_ZONE:New():FilterPrefixes(MissionName):FilterOnce()
    Range_SA_Training_Zones_Table               = zoneSetToList(Range_SA_Training_Zones_Set)
    Range_SA_Training_Delete_Zone               = ZONE:New("SA_TrainingDelete")
    Range_SA_Training_Delete_Zone_Marker        = nil
    Mission_Active                              = false

    UnitTable_Easy          = {"Template_Red_AAATruck", "Template_Red_ZU23" ,"Template_Red_ZSU57-2","Template_Red_Shilka"}
    UnitTable_Medium        = {"Template_Red_SA-8OSA", "Template_Red_SA-9Strela", "Template_Red_ManpadTeam"}
    UnitTable_Hard          = {"Template_Red_SA-15Tor"}
    
end

local function spawnUnits(configuration)
    _configuration = configuration
    if (Mission_Active == true) then
        trigger.action.outText("Mission " .. MissionName .. " already spawned, Despawn it first!", 30)

    elseif (Mission_Active == false) then
        if (configuration >= 1) then
            SpawnGroupsOfTemplatesInListOfZones(15, Range_SA_Training_Zones_Table, UnitTable_Easy, "SA_Training_Easy",100)
        end
        if (configuration >=2) then
            SpawnGroupsOfTemplatesInListOfZones(10, Range_SA_Training_Zones_Table, UnitTable_Medium, "SA_Training_Medium",100)
        end
        if (configuration >= 3) then
            SpawnGroupsOfTemplatesInListOfZones(2, Range_SA_Training_Zones_Table, UnitTable_Hard, "SA_Training_Hard",100) 
        end
    end

end

local function DespawnUnits()
    local zoneRemover = Range_SA_Training_Delete_Zone
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
    if Mission_Active == false then
        Range_SA_Training_Delete_Zone_Marker        = MARKER:New(Range_SA_Training_Delete_Zone:GetCoordinate(), "Zone of SA-Training, be careful."):ReadOnly():ToAll()
    end

end

local function removeF10Marker()
    Range_SA_Training_Delete_Zone_Marker:Remove()
end

local function endMission()
    removeF10Marker()
    DespawnUnits()
    Mission_Active = false
end

local function startMission(configuration)
    if MissionInitialized == false then
        initMission()
        MissionInitialized = true
    end
    spawnUnits(configuration)
    addF10Marker()
    Mission_Active = true
end

-- Add Menu
local MenuCoalitionBlueRangeSaTraining        = MENU_COALITION:New( coalition.side.BLUE,          "SA-Training", MenuCoalitionBlueTrainingsRanges )
local MenuCoalitionBlueRangeSaTrainingMenuStart   = MENU_COALITION_COMMAND:New( coalition.side.BLUE,  "Start SA-Training: Easy", MenuCoalitionBlueRangeSaTraining, startMission, 1)
local MenuCoalitionBlueRangeSaTrainingMenuStart   = MENU_COALITION_COMMAND:New( coalition.side.BLUE,  "Start SA-Training: Medium", MenuCoalitionBlueRangeSaTraining, startMission, 2)
local MenuCoalitionBlueRangeSaTrainingMenuStart   = MENU_COALITION_COMMAND:New( coalition.side.BLUE,  "Start SA-Training: Hard", MenuCoalitionBlueRangeSaTraining, startMission, 3)

local MenuCoalitionBlueRangeSaTrainingMenuEnd     = MENU_COALITION_COMMAND:New( coalition.side.BLUE,  "End SA-Training", MenuCoalitionBlueRangeSaTraining, endMission)
