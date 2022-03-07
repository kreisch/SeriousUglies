local MCAS02_Fires_ZoneSet        = SET_ZONE:New():FilterPrefixes("MCAS02_Fire-"):FilterOnce()
local MCAS02_Fires_ZoneList       = zoneSetToList(MCAS02_Fires_ZoneSet)
local MCAS02_Spawns_RU_ZoneSet    = SET_ZONE:New():FilterPrefixes("MCAS02_RuSpawn"):FilterOnce()
local MCAS02_Spawns_RU_ZoneList   = zoneSetToList(MCAS02_Spawns_RU_ZoneSet)

local MCAS02_RuStaging1             = ZONE:New("MCAS02_RuStaging-1")
local MCAS02_RuStaging2             = ZONE:New("MCAS02_RuStaging-2")
local MCAS02_RuStaging3             = ZONE:New("MCAS02_RuStaging-3")
local MCAS02_RuStagingSet           = SET_ZONE:New():FilterPrefixes("MCAS02_RuStaging-"):FilterOnce()
local MCAS02_RuStagingList          = zoneSetToList(MCAS02_RuStagingSet)

local MCAS02_ConflictZonesSet       = SET_ZONE:New():FilterPrefixes("MCAS02_Conflict-"):FilterOnce()
local MCAS02_ConflictZonesTable     = zoneSetToList(MCAS02_ConflictZonesSet)

local SupplyTruckTemplate           = {"MCAS02_Template_Red_Truckconvoy"}
--local SupplyTrucks                  = {} -- Table of spawned Supply Truck, shall be size 1 at first stage
local SupplyTroopsTemplate          = {"Template_Red_15Inf","Template_Red_15Inf","Template_Red_15Inf","Template_Red_15Inf", 
                                      "Template_Red_Mortar_Team","Template_Red_Mortar_Team",
                                      "Template_Red_ManpadTeam"}
local spawnSupplyTrucksScheduler    = nil
local blueDefenderTroops            = {}

trigger.action.outText("Size of Zone MCAS02_Fires_ZoneList Table.." .. #MCAS02_Fires_ZoneList, 30)

local listOfFires                   = StartAFireZoneList(MCAS02_Fires_ZoneList, false)


--local endFire = TIMER:New(StopAFireZoneList,listOfFires)
--endFire:Start(30)




-- local function checkSupplyGroupAlive(group)
--     local isGroupDead = SCHEDULER:New( nil,
--                 function()
--                   if group:IsAlive() then
--                   MESSAGE:New("Is alive " .. group:GetName(), 5):ToCoalition(coalition.side.BLUE)
--                   else   
--                     MESSAGE:New("Is dead", 25):ToCoalition(coalition.side.BLUE)
--                     isGroupDead:Stop()  
--                     spawnSupplyTrucks()
--                   end
--               end, {}, 15, 30 )  
-- end

local function spawnMortarsInStageZones(group, zone)
    if group:IsAlive() then
        --group:Destroy()
        MESSAGE:New("Spawn mortar because " .. group:GetName() .. " is alive", 30):ToCoalition(coalition.side.BLUE)
        local randomValue = math.random(1,9999)
        SpawnGroupsOfTemplatesInListOfZones(3, {zone}, SupplyTroopsTemplate, "MCAS02_ResupplyTroops".. randomValue , 50)
    end
end

local function spawnMortarsInStageZonesTimer(group, zone)
    local spawnMortarsTimer = TIMER:New(spawnMortarsInStageZones,group, zone)
    MESSAGE:New("SpawnMortar Timer running", 30):ToCoalition(coalition.side.BLUE)
    spawnMortarsTimer:Start(30)
end

local function checkSupplyGroupArrivedAtDestination(group)
  local messager = nil
    messager = SCHEDULER:New( nil,
    function()
        MESSAGE:New("Is group in zone?  " .. group:GetName(), 30):ToCoalition(coalition.side.BLUE)
      if group:IsCompletelyInZone( MCAS02_RuStaging1 ) then
        MESSAGE:New("Arrived in Staging Zone 1", 30):ToCoalition(coalition.side.BLUE)
        spawnMortarsInStageZonesTimer(group, MCAS02_RuStaging1)
        messager:Stop()
      end
      if group:IsCompletelyInZone( MCAS02_RuStaging2 ) then
        MESSAGE:New("Arrived in Staging Zone 2", 30):ToCoalition(coalition.side.BLUE)
        spawnMortarsInStageZonesTimer(group, MCAS02_RuStaging2)
        messager:Stop()
      end
      if group:IsCompletelyInZone( MCAS02_RuStaging3 ) then
        MESSAGE:New("Arrived in Staging Zone 3", 30):ToCoalition(coalition.side.BLUE)
        spawnMortarsInStageZonesTimer(group, MCAS02_RuStaging3)
        messager:Stop()
      end
      if group:IsAlive() then
        MESSAGE:New("Is alive " .. group:GetName(), 5):ToCoalition(coalition.side.BLUE)
        else   
          MESSAGE:New("Is dead" .. group:GetName(), 25):ToCoalition(coalition.side.BLUE)
          messager:Stop()
        end
    end, 
    {}, 10, 60 )

end

local function ActivateSupplyTrucks() 
    spawnSupplyTrucksScheduler = SCHEDULER:New( nil,
    function()
        local randomValue = math.random(1,9999)
        local SupplyTrucks = SpawnGroupsOfTemplatesInListOfZones(1, MCAS02_Spawns_RU_ZoneList, SupplyTruckTemplate, "MCAS02_Supplytrucks" .. randomValue,100)
        local GroundGroup = SupplyTrucks[1]
        local randomZonePicker = math.random(1, #MCAS02_RuStagingList)
        RouteTask = GroundGroup:TaskRouteToVec2( MCAS02_RuStagingList[randomZonePicker]:GetRandomVec2(), 50 , "Off Road")
        -- Set the task to be executed by the GroundGroup
        GroundGroup:SetTask( RouteTask, 1 )
        --trigger.action.outText("Lebst noch script?", 30)
        --checkSupplyGroupAlive(SupplyTrucks[1])
        checkSupplyGroupArrivedAtDestination(SupplyTrucks[1])
    end, 
    {}, 10, 60*5, 0.2, 60*120 )

end

local function deactivateSupplyTrucksScheduler()
    spawnSupplyTrucksScheduler:Stop()
end

local function spawnBlueTroops()
  for i = 1, 8, 1 do
      blueDefenderTroops[i] = SPAWN:NewWithAlias("Randomizer", "MCAS02_BlueTroops" .. i):InitRandomizeZones(MCAS02_ConflictZonesTable):InitRandomizePosition(
      true, 100):InitRandomizeTemplate({"Template_Blue_Inf21"}):InitLimit( 21, 5 )
      :SpawnScheduled( 5, .5 )
  end
end

ActivateSupplyTrucks()
spawnBlueTroops()