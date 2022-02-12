local function initMission ()

end

local function spawnUnits()

end

local function DespawnUnits()

end

local function addF10Marker()

end

local function removeF10Marker()

end

local function endMission()

end

local function startMission()

end

-- Add Menu
local MenuCoalitionBlueMISSIONNAME        = MENU_COALITION:New( coalition.side.BLUE,          "MISSIONNAME", MenuCoalitionBlueA2GMissions )
local MenuCoalitionBlueMISSIONNAMEMenuStart   = MENU_COALITION_COMMAND:New( coalition.side.BLUE,  "Start MISSIONNAME", MenuCoalitionBlueMISSIONNAME, startMission, 1)
local MenuCoalitionBlueMISSIONNAMEMenuEnd     = MENU_COALITION_COMMAND:New( coalition.side.BLUE,  "End MISSIONNAME", MenuCoalitionBlueMISSIONNAME, endMission)
