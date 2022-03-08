

-- Helper
local function __zoneSetToList(zoneSet)
--   env.info("function zoneSetToList")
   local _zoneList = {}
   _zoneSet = zoneSet
   local k = 1
   _zoneSet:ForEachZone(function(zoneElement)
      _zoneList[k] = zoneElement
       k = k + 1
   end)
   return _zoneList
end

local function __SpawnGroupsOfTemplatesInListOfZones(NumberOfGroups, ZoneTable, Templates, Prefix, radius)

   if NumberOfGroups == nil then
      env.info("NumberOfGroups is nil - cannot spawn something.")
      return false
   end

   if ZoneTable == nil then
      env.info("ZoneTable is nil - cannot spawn something.")
      return false
   end

   if Templates == nil then
      env.info("Templates is nil - cannot spawn something.")
      return false
   end

   if Prefix == nil then
      env.info("Prefix is nil - cannot spawn something.")
      return false
   end

   if radius == nil then
       radius = 5
   end

   local spawns = {}
   for k = 1, NumberOfGroups, 1 do
       local tempGrpAlias = Prefix .. k
       spawns[k] = SPAWN:NewWithAlias("Randomizer", tempGrpAlias):InitRandomizeZones(ZoneTable):InitRandomizePosition(
           true, radius):InitRandomizeTemplate(Templates):Spawn()
--       AddAdditionalScriptsToGroups(spawns[k])
   end

   return true
end



-- Default Mission Parameter
Mission = {
   MissionName             = "Default Mission", 
   MissionLevel            = -1, 

   MissionBriefing         = "Put your mission briefing here...",
   Mission_Active          = false, -- DON'T TOUCH THIS FLAG

   Zones_Set_Prefix        = nil,
   Zones_Set               = nil,
   Zones_Table             = nil,
   Zones_Marker            = nil,

   NumberOfSpawns_Easy     = 3,  -- The number groups to spawn in EASY mode
   NumberOfSpawns_Medium   = 2,  -- The number groups to spawn in MEDIUM mode
   NumberOfSpawns_Hard     = 1,  -- The number groups to spawn in HARD mode
   UnitTable_Easy          = {}, -- The pool of groups to radomize the easy spawn from {"Template_Red_AAATruck", "Template_Red_ZU23" ,"Template_Red_ZSU57-2","Template_Red_Shilka"}
   UnitTable_Medium        = {}, -- The pool of groups to radomize the medium spawn from {"Template_Red_SA-8OSA", "Template_Red_SA-9Strela", "Template_Red_ManpadTeam"}
   UnitTable_Hard          = {}  -- The pool of groups to radomize the hard spawn from {"Template_Red_SA-15Tor"}
}

local __meta = {__index = Mission}

-- Mission new method
function Mission:new (_name)
   local o = {}
   setmetatable(o, __meta)
   o.MissionName = _name or "Default Mission"
   o.MissionLevel = 1

   -- Init objects/zones for mission
   o.initMission = function ()
      if o.Zones_Set_Prefix == nil then
         trigger.action.outText("No Zone Sets definded for " .. o.MissionName .. ", or there's an error with the Zones_Set_Prefix!", 30)
         env.info("No Zone Sets definded for " .. o.MissionName .. ", or there's an error with the Zones_Set_Prefix!")
         return false
      end

      o.Zones_Set    = SET_ZONE:New():FilterPrefixes(o.Zones_Set_Prefix):FilterOnce()
      o.Zones_Table  = zoneSetToList(o.Zones_Set)
      return true
   end

   -- Start the mission
   o.startMission = function (_difLevel)
      o.MissionLevel = _difLevel or "1"
      env.info("Mission:startMission " .. o.MissionName .. ", Level: " .. o.MissionLevel)

      if o.initMission() == false then
         trigger.action.outText("Error initializing the mission: " .. o.MissionName .. ". Mission not started!", 30)
         return
      end

      if o.spawnUnits() == false then
         trigger.action.outText("Error initializing the mission: " .. o.MissionName .. ". Spawning failed!", 30)
         return
      end

      if o.startAdditional ~= nil then
         env.info("Mission:startAdditional...")
         o.startAdditional(_difLevel)
      end

      o.placeMarker()
      o.Mission_Active = true
     
      trigger.action.outText("Mission: " .. o.MissionName .. " successfully started!", 15)
   end

   -- End the mission 
   o.endMission = function ()
      o.despawnUnits()
      o.removeMarker()

      if o.stopAdditional ~= nil then
         env.info("Mission:stopAdditional...")
         o.stopAdditional()
      end

      o.Mission_Active = false

      trigger.action.outText("Mission: " .. o.MissionName .. " stopped!", 15)
      env.info("Mission:endMission " .. o.MissionName .. ", Level: " .. o.MissionLevel)
   end
   
   -- End the mission 
   o.placeMarker = function ()
      local coordCenter = {x = 0, y = 0, z = 0}
      local numCoords = 0

      o.Zones_Set:ForEachZone(function(zoneElement)
         local theVec3 = zoneElement:GetCoordinate():GetVec3()
         coordCenter.x = coordCenter.x + theVec3.x 
         coordCenter.y = coordCenter.y + theVec3.y
         coordCenter.z = coordCenter.z + theVec3.z 
         numCoords = numCoords + 1
      end)

      if numCoords > 0 then
         coordCenter.x = coordCenter.x / numCoords
         coordCenter.y = coordCenter.y / numCoords
         coordCenter.z = coordCenter.z / numCoords

         local coordinate = COORDINATE:NewFromVec3(coordCenter)
         o.Zones_Marker = MARKER:New(coordinate, o.MissionBriefing):ReadOnly():ToAll()
      end
   end
   
   -- End the mission 
   o.removeMarker = function ()
      o.Zones_Marker:Remove()
      o.Zones_Marker = {}
   end
   
   -- Spawn untits according to tables declared
   o.spawnUnits =  function()
      if (o.Mission_Active == true) then
          trigger.action.outText("Mission " .. o.MissionName .. " already spawned, Despawn it first!", 15)
          return false
      end
  
      spawnWorked = true
      if (o.MissionLevel >= 1) then
         env.info("Mission:spawnUnits easy: " .. o.MissionName .. ", Level: " .. o.MissionLevel)
         spawnWorked = SpawnGroupsOfTemplatesInListOfZones(o.NumberOfSpawns_Easy, o.Zones_Table, o.UnitTable_Easy, o.MissionName .."_GroupsEasy", 100)
         if spawnWorked == false then
            return false
         end
      end
      if (o.MissionLevel >=2) then
         env.info("Mission:spawnUnits medium: " .. o.MissionName .. ", Level: " .. o.MissionLevel)
         spawnWorked = SpawnGroupsOfTemplatesInListOfZones(o.NumberOfSpawns_Medium, o.Zones_Table, o.UnitTable_Medium, o.MissionName .."_GroupsMedium", 100)
         if spawnWorked == false then
            return false
         end
      end
      if (o.MissionLevel >= 3) then
         env.info("Mission:spawnUnits hard: " .. o.MissionName .. ", Level: " .. o.MissionLevel)
         spawnWorked = SpawnGroupsOfTemplatesInListOfZones(o.NumberOfSpawns_Hard, o.Zones_Table, o.UnitTable_Hard, o.MissionName .."_GroupsHard", 100) 
         if spawnWorked == false then
            return false
         end
      end

      return spawnWorked
   end

   -- Despawn all previously spawned objects
   o.despawnUnits =  function()
      local unitsToKill = SET_GROUP:New():FilterCategoryGround():FilterPrefixes({o.MissionName .."_GroupsEasy", o.MissionName .."_GroupsMedium", o.MissionName .."_GroupsHard"}):FilterOnce()
      if unitsToKill:Count() > 0 then
          unitsToKill:ForEachGroup( 
          function( MooseGroup ) 
              local _g = MooseGroup --Wrapper.GROUP object    
              _g:Destroy()
            end 
          )
       end
   end
   
   -- Return name of mission
   o.getName = function()
      return o.MissionName
   end
 
   -- Optional callbacks. Add those functions in your mission to enable additional start/stop logic
   -- E.g. spawn specific units, create Scheduler, etc. (see M03S how to use it.)
   o.startAdditional = nil
   o.stopAdditional = nil

   return o
end

function addToF10Menu(_theMission, _targetSubMenu)
   local missionSubMenu        = MENU_COALITION:New( coalition.side.BLUE, _theMission:getName(), _targetSubMenu )
   local missionSubMenuEasy    = MENU_COALITION_COMMAND:New( coalition.side.BLUE,  "Start " .. _theMission:getName() .. " Easy", missionSubMenu, _theMission.startMission, 1)
   local missionSubMenuMedium  = MENU_COALITION_COMMAND:New( coalition.side.BLUE,  "Start " .. _theMission:getName() .. " Medium", missionSubMenu, _theMission.startMission, 2)
   local missionSubMenuHard    = MENU_COALITION_COMMAND:New( coalition.side.BLUE,  "Start " .. _theMission:getName() .. " Hard", missionSubMenu, _theMission.startMission, 3)
   local missionSubMenuEnd     = MENU_COALITION_COMMAND:New( coalition.side.BLUE,  "End " .. _theMission:getName() , missionSubMenu, _theMission.endMission)
end
