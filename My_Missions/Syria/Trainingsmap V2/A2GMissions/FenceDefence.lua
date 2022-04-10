-- On the Fence scripting by Mr Nobody
-- v1.05 21 Mar 22 for Syria
-- Updated script to operate with the mission editor compatible text string flags rather than setting variables directly
-- There is now an additional, larger zone used specifically for checking enemy presence so that dispersed enemy spawns outside the radius are still counted
-- Infantry group templates to spawn

-- Modified April 2022 by Skyfire for integration into the Ugly Syria Map
-- Patrol in zone code adapted from RotorOps https://forum.dcs.world/topic/290744-rotorops-dynamic-mission-generator/

FDF = {}

FDF.infantryGroups = {"Inf Group 1", "Inf Group 2", "Inf Group 3", "Inf Group 4", "Inf Group 5", "Inf Group 6",
                        "Inf Group 7"}

-- Vehicle group templates to spawn
FDF.vehicleGroups = {"Veh Group 1", "Veh Group 2", "Veh Group 3", "Veh Group 4", "Veh Group 5", "Veh Group 6",
                       "Veh Group 7"}

-- List of trigger zones the enemy can attack
FDF.combatZones = {"Defence Alpha", "Defence Bravo", "Defence Charlie", "Defence Delta", "Defence Echo",
                     "Defence Golf", "Defence Foxtrot", "Defence Hotel", "Defence India", "Defence Juliet", "Defence Kilo"}

FDF.FenceDefenceStarted = false
FDF.currentConfMultiplier = 1

FDF.activeZones = 0
FDF.zoneState = {} -- table if zone with active state
FDF.totalAttacks = 0
FDF.maxActiveZones = 4
FDF.avgAttackTime = 180
FDF.maxAttackAmount = 5
FDF.minInfantryGroups = 1
FDF.maxInfantryGroups = 2
FDF.minVehicleGroups = 1
FDF.maxVehicleGroups = 1
FDF.finalMessage = false

-- Colors for the map markers
FDF.redOutline = {0.95, 0.1, 0.15, 0.7}
FDF.redFill = {0.95, 0.1, 0.15, 0.25}
FDF.blueOutline = {0, 0.7, 0.9, 0.7}
FDF.blueFill = {0, 0.7, 0.9, 0.25}
FDF.blackText = {0, 0, 0, 0.7}
FDF.clearBackground = {0, 0, 0, 0}

-- this is the base value for the marker/circles added. Take care - wrong too low values can mess with the markers/drawings already in the mission
FDF.UserIDFlag = 1000 

local function hasValue (tab, val)
  for index, value in ipairs(tab) do
      if value == val then
          return true
      end
  end
  return false
end

local function getObjectVolume(obj)
  local length = (obj:getDesc().box.max.x + math.abs(obj:getDesc().box.min.x))
  local height = (obj:getDesc().box.max.y + math.abs(obj:getDesc().box.min.y))
  local depth = (obj:getDesc().box.max.z + math.abs(obj:getDesc().box.min.z))
  return length * height * depth
end

function FDF.sortOutInfantry(mixed_units)
  local _infantry = {}
  local _not_infantry = {}
  for index, unit in pairs(mixed_units)
  do
    if unit:hasAttribute("Infantry") then
      _infantry[#_infantry + 1] = unit
    else _not_infantry[#_not_infantry + 1] = unit
    end
  end
  return {infantry = _infantry, not_infantry = _not_infantry} 
end


function FDF.groupsFromUnits(units, table)  
  local groups = {}
  for i = 1, #units do 
   if units[i]:isExist() then
     if hasValue(groups, units[i]:getGroup():getName()) == false then 
         groups[#groups + 1] = units[i]:getGroup():getName()
     else 
     end
   end
  end
  return groups
end

FDF.removeMarkers = function()
  for i = 1, #FDF.combatZones do
    local markerId = i + FDF.UserIDFlag
    local textId = i + FDF.UserIDFlag + #FDF.combatZones
    trigger.action.removeMark(markerId)
    trigger.action.removeMark(textId)
  end
end

FDF.resetFenceDefence = function()
  -- Cleaning up zones

  for zone, state in pairs(FDF.zoneState) do 
    if state then
      env.info("FDF Debug: removing units of zone: " .. zone)
      trigger.action.effectSmokeStop(zone)

      local attacking_ground_units = mist.getUnitsInZones(mist.makeUnitTable({'[red][vehicle]'}), {zone .. " Large"})
      local attacking_groups = FDF.groupsFromUnits(attacking_ground_units)

      for index, group in pairs(attacking_groups) do 
        if group then
          Group.getByName(group):destroy()
        end
      end
    end
  end

  FDF.removeMarkers()
  FDF.zoneState = {}
end

FDF.patrolRadius = function(_grp, _zone)
  env.info("FDF Debug: patrolRadius of: " .. _grp)

  local grp = Group.getByName(_grp)
  local first_valid_unit
  if grp == nil or grp:isExist() ~= true then
      return
  end
  for index, unit in pairs(grp:getUnits()) do
      if unit:isExist() == true then
          first_valid_unit = unit
          break
      else -- trigger.action.outText("a unit no longer exists", 15) 
      end
  end
  if first_valid_unit == nil then
      return
  end
  local start_point = first_valid_unit:getPoint()
  local object_vol_thresh = 0
  local max_waypoints = 5
  local foundUnits = {}
  -- local sphere = trigger.misc.getZone('town')
  local volS = {
      id = world.VolumeType.SPHERE,
      params = {
          point = trigger.misc.getZone(_zone).point, -- check if exists, maybe itterate through grp
          radius = trigger.misc.getZone(_zone).radius
      }
  }

  local ifFound = function(foundItem, val)
      -- trigger.action.outText("found item: "..foundItem:getTypeName(), 5)  
      if foundItem:hasAttribute("Infantry") ~= true then -- disregard infantry...we only want objects that might provide cover
          if getObjectVolume(foundItem) > object_vol_thresh then
              foundUnits[#foundUnits + 1] = foundItem
              -- trigger.action.outText("valid cover item: "..foundItem:getTypeName(), 5) 
          else -- debugMsg("object not large enough: "..foundItem:getTypeName()) 
          end
      else -- trigger.action.outText("object not the right type", 5)  
      end
      return true
  end

  world.searchObjects(1, volS, ifFound)
  world.searchObjects(3, volS, ifFound)
  world.searchObjects(5, volS, ifFound)
  -- world.searchObjects(Object.Category.BASE, volS, ifFound)
  local path = {}
  path[1] = mist.ground.buildWP(start_point, '', 5)
  local m = math.min(#foundUnits, max_waypoints)
  for i = 1, m, 1 do
      local rand_index = math.random(1, #foundUnits)
      path[i + 1] = mist.ground.buildWP(foundUnits[rand_index]:getPoint(), '', 5)
      --trigger.action.outText("waypoint to: "..foundUnits[rand_index]:getTypeName(), 5) 
  end
  if #path <= 3 then
      for i = #path, max_waypoints, 1 do
          path[#path + 1] = mist.ground.buildWP(mist.getRandPointInCircle(trigger.misc.getZone(_zone).point, trigger.misc.getZone(_zone).radius), '', 5)
      end
  end
  
--  trigger.action.outText("new waypoints created: "..(#path - 1), 5) 
  mist.goRoute(grp, path)
end
 
FDF.schedulePatrol = function()
  env.info("FDF Debug: schedulePatrol")

  for zone, state in pairs(FDF.zoneState) do 
    if state then
      env.info("FDF Debug: scheduling patrol in zone: " .. zone)

      local attacking_ground_units = mist.getUnitsInZones(mist.makeUnitTable({'[red][vehicle]'}), {zone .. " Large"})
      local attacking_infantry = FDF.sortOutInfantry(attacking_ground_units).infantry
      --local attacking_vehicles = RotorOps.sortOutInfantry(attacking_ground_units).not_infantry

      local attacking_infantry_groups = FDF.groupsFromUnits(attacking_infantry)

      for index, group in pairs(attacking_infantry_groups) do 
        if group then
          FDF.patrolRadius(group, zone)
        end
      end
   
    end
  end

--  local attackerUnits = mist.getUnitsInZones(mist.makeUnitTable({'[red][vehicle]'}), {zoneName .. " Large"}) -- Added a slightly larger zone than the spawn one in v1.1 to account for unit dispersion
--  local attackerUnitsQty = #attackerUnits

  if FDF.FenceDefenceStarted == true then
    timer.scheduleFunction(FDF.schedulePatrol, nil, timer.getTime() + 120)
  end
end

-- Check the active zones table ocasionally to see if they've been cleared of REDFOR
FDF.checkZoneCompletion = function(zoneId)
  env.info("FDF Debug: FDF.checkZoneCompletion.")

  local zoneName = FDF.combatZones[zoneId]
  local attackerUnits = mist.getUnitsInZones(mist.makeUnitTable({'[red][vehicle]'}), {zoneName .. " Large"}) -- Added a slightly larger zone than the spawn one in v1.1 to account for unit dispersion
  local attackerUnitsQty = #attackerUnits

  if attackerUnitsQty == 0 then
      trigger.action.outText("We've successfully cleared the enemy from " .. zoneName .. ".  Well done.", 15)
      trigger.action.outSound("clear.ogg")
      trigger.action.setMarkupColor(zoneId + FDF.UserIDFlag, FDF.blueOutline)
      trigger.action.setMarkupColorFill(zoneId + FDF.UserIDFlag, FDF.blueFill)
      trigger.action.setMarkupText((zoneId + FDF.UserIDFlag + #FDF.combatZones), "Zone: " .. zoneName .. "\nStatus: CLEAR")
      trigger.action.effectSmokeStop(zoneName)
      FDF.activeZones = FDF.activeZones - 1
      FDF.zoneState[zoneName] = nil
      env.info("FDF Debug: Zone " .. zoneName .. " reported as clear.")
  elseif FDF.FenceDefenceStarted == false then
    FDF.resetFenceDefence()
  elseif attackerUnitsQty > 0 then
      trigger.action.setMarkupText((zoneId + FDF.UserIDFlag + #FDF.combatZones), "Zone: " .. zoneName ..
          "\nStatus: UNDER ATTACK\nEnemy Strength: " .. attackerUnitsQty .. " hostiles")
      timer.scheduleFunction(FDF.checkZoneCompletion, zoneId, timer.getTime() + 20)
      FDF.zoneState[zoneName] = true
      env.info("FDF Debug: Zone " .. zoneName .. " reported as under attack, enemy count updated.")
  end
end

-- Check for activeZones to equal 0 periodically once the final wave has spawned
FDF.finalZoneCheck = function()
  env.info("FDF Debug: FDF.finalZoneCheck.")

  -- Only send this message the first time the check occurs
  if not FDF.finalMessage then
      trigger.action.outText(
          "Alright, this looks like the final enemy push.  Finish off all their remaining forces and the day is ours!",
          30)
      trigger.action.outSound("final.ogg")
      FDF.finalMessage = true
  end

  if FDF.activeZones == 0 then
      trigger.action.outText(
          "Enemy forces have been completely wiped out.  Well done, everyone.  Mission is complete, you are cleared to return to base.\n\n === MISSION COMPLETE ===",
          60)
      trigger.action.outSound("complete.ogg")
      -- Remove the markers
      FDF.removeMarkers()

      env.info("FDF Debug: Mission complete!")
      FDF.FenceDefenceStarted = false
  else
      timer.scheduleFunction(FDF.finalZoneCheck, nil, timer.getTime() + 30)
      env.info("FDF Debug: Mission not yet finished, checking again in 30 seconds.")
  end

end

-- Create an attack if the maximum amount isn't exceeded
FDF.createZoneAttack = function()
  env.info("FDF Debug: FDF.createZoneAttack.")

  if FDF.FenceDefenceStarted == false then
    return -- do nothing, quit here
  end

  if not FDF.activeZones then
    FDF.activeZones = 0
  end
  if not FDF.totalAttacks then
    FDF.totalAttacks = 0
  end

  -- Pick a zone to attack
  local zoneSelect = math.random(1, #FDF.combatZones)
  local zoneChoice = FDF.combatZones[zoneSelect]

  -- If the zone already has an enemy presence, the roll also gets canceled to avoid stacking a zone
  local enemyPresent = mist.getUnitsInZones(mist.makeUnitTable({'[red][vehicle]'}), {zoneChoice})

  if #enemyPresent == 0 then
    if FDF.activeZones < FDF.maxActiveZones then
      local spawnNumInf = math.random(FDF.minInfantryGroups, FDF.maxInfantryGroups) * FDF.currentConfMultiplier
      local spawnNumVeh = math.random(FDF.minVehicleGroups, FDF.maxVehicleGroups) * FDF.currentConfMultiplier

      --local spawnNumInf = 2 * FDF.currentConfMultiplier -- math.random(minInfantryGroups, maxInfantryGroups) --
      --local spawnNumVeh = 1 * FDF.currentConfMultiplier -- math.random(minVehicleGroups, maxVehicleGroups) -- * currentConfMultiplier

      env.info("FDF Debug: spawnNumInf: " .. spawnNumInf)
      env.info("FDF Debug: spawnNumVeh: " .. spawnNumVeh)

      -- Infantry template spawns
      for i = 1, spawnNumInf do
          local infGroupSelect = math.random(1, #FDF.infantryGroups)
          local infGroupChoice = FDF.infantryGroups[infGroupSelect]
          mist.cloneInZone(infGroupChoice, zoneChoice, true, 60)
      end

      -- Vehicle template spawns
      for i = 1, spawnNumVeh do
          local vehGroupSelect = math.random(1, #FDF.vehicleGroups)
          local vehGroupChoice = FDF.vehicleGroups[vehGroupSelect]
          mist.cloneInZone(vehGroupChoice, zoneChoice, true, 150)
      end

      -- Increment the amount of active combat zones, and the total attacks the enemy has made
      FDF.activeZones = FDF.activeZones + 1
      FDF.totalAttacks = FDF.totalAttacks + 1

      trigger.action.outText("Enemy forces are attacking " .. zoneChoice .. "!", 15)
      trigger.action.outSound("attack.ogg")

      trigger.action.setMarkupColor(zoneSelect + FDF.UserIDFlag, FDF.redOutline)
      trigger.action.setMarkupColorFill(zoneSelect + FDF.UserIDFlag, FDF.redFill)
      trigger.action.setMarkupText((zoneSelect + FDF.UserIDFlag + #FDF.combatZones),
          "Zone: " .. zoneChoice .. "\nStatus: UNDER ATTACK")

      trigger.action.effectSmokeBig(mist.utils.makeVec3GL(trigger.misc.getZone(zoneChoice).point), 7, 0.1,
          zoneChoice)
      timer.scheduleFunction(FDF.checkZoneCompletion, zoneSelect, timer.getTime() + 5)
      env.info("FDF Debug: New zone attack created.")
    else
      env.info("FDF Debug: Active zones at max, skipping spawn process.")
    end

    if FDF.totalAttacks < FDF.maxAttackAmount then
      -- Schedule the next attack on the usual time
      timer.scheduleFunction(FDF.createZoneAttack, nil, timer.getTime() + math.random(FDF.avgAttackTime * 0.8, FDF.avgAttackTime * 1.2))
    else
      timer.scheduleFunction(FDF.finalZoneCheck, nil, timer.getTime() + 30)
    end

  else
    -- Schedule the next attack quickly since the roll was a dud
    if FDF.totalAttacks < FDF.maxAttackAmount then
      timer.scheduleFunction(FDF.createZoneAttack, nil, timer.getTime() + 5)
    else
      timer.scheduleFunction(FDF.finalZoneCheck, nil, timer.getTime() + 30)
    end
  end
end

-- Automatically mark all the zones
FDF.initMarkZones = function()
  env.info("FDF Debug: FDF.initMarkZones.")

  for i = 1, #FDF.combatZones do
      local markerId = i + FDF.UserIDFlag
      local zoneName = FDF.combatZones[i]
      local textId = markerId + #FDF.combatZones
      local zonePos = trigger.misc.getZone(zoneName)
      trigger.action.circleToAll(-1, markerId, zonePos.point, zonePos.radius, FDF.blueOutline, FDF.blueFill, 2, true,
          "Outpost marked.")
      trigger.action.textToAll(-1, textId, zonePos.point, FDF.blackText, FDF.clearBackground, 14, true,
          "Zone: " .. zoneName .. "\nStatus: CLEAR")
  end
  env.info("FDF Debug: Combat zones marked on map.")
end

-- Define some variables and sanity check the user options a few seconds after mission start
FDF.setup = function()
  env.info("FDF Debug: FDF.setup.")

  -- Grab the ME flags for user options since they can be named in DCS 2.7.11
  if trigger.misc.getUserFlag("Maximum Active Zones") > 0 then
    FDF.maxActiveZones = trigger.misc.getUserFlag("Maximum Active Zones")
  end

  if trigger.misc.getUserFlag("Time Between Attacks") > 0 then
    FDF.avgAttackTime = (trigger.misc.getUserFlag("Time Between Attacks") * 60)
  end

  if trigger.misc.getUserFlag("Zones Cleared To Win") > 0 then
    FDF.maxAttackAmount = trigger.misc.getUserFlag("Zones Cleared To Win")
  end

  if trigger.misc.getUserFlag("Minimum Infantry Presence") > 0 then
    env.info("FDF Debug: Minimum Infantry Presence")
    FDF.minInfantryGroups = trigger.misc.getUserFlag("Minimum Infantry Presence")
  end

  if trigger.misc.getUserFlag("Maximum Infantry Presence") > 0 then
    FDF.maxInfantryGroups = trigger.misc.getUserFlag("Maximum Infantry Presence")
  end

  if trigger.misc.getUserFlag("Minimum Vehicle Presence") > 0 then
    FDF.minVehicleGroups = trigger.misc.getUserFlag("Minimum Vehicle Presence")
  end

  if trigger.misc.getUserFlag("Maximum Vehicle Presence") > 0 then
    FDF.maxVehicleGroups = trigger.misc.getUserFlag("Maximum Vehicle Presence")
  end

  -- stop the user from putting in some really inane or silly values for settings or just straight up deleting them
  if not FDF.maxActiveZones or FDF.maxActiveZones <= 0 then
    FDF.maxActiveZones = 2
  end
  if not FDF.avgAttackTime or FDF.avgAttackTime < 60 then
    FDF.avgAttackTime = 900
  end
  if not FDF.maxAttackAmount then
    FDF.maxAttackAmount = 6
  end
  if not FDF.minInfantryGroups or FDF.minInfantryGroups < 0 or FDF.minInfantryGroups > 10 then
    FDF.minInfantryGroups = 2
  end
  if not FDF.maxInfantryGroups or FDF.maxInfantryGroups < FDF.minInfantryGroups or FDF.maxInfantryGroups > 10 then
    FDF.maxInfantryGroups = 4
  end
  if not FDF.minVehicleGroups or FDF.minVehicleGroups < 0 or FDF.minVehicleGroups > 10 then
    FDF.minVehicleGroups = 1
  end
  if not FDF.maxVehicleGroups or FDF.maxVehicleGroups < FDF.minVehicleGroups or FDF.maxVehicleGroups > 10 then
    FDF.maxVehicleGroups = 3
  end

  -- Start the attack generation
  --    timer.scheduleFunction(FDF.createZoneAttack, nil, timer.getTime() + 30)
  timer.scheduleFunction(FDF.createZoneAttack, nil, timer.getTime() + math.random(60 * 0.8, 60 * 1.2))
  timer.scheduleFunction(FDF.schedulePatrol, nil, timer.getTime() + 10)

  -- Draw the initial markers
  FDF.initMarkZones()
  trigger.action.outText(
      "The friendly border outposts have been marked on the map.  We'll keep you updated with any reports of insurgent attacks.  Good luck and stay safe out there.",
      60, true)
  trigger.action.outSound("intro.ogg")
  env.info("FDF Debug: FDF.setup completed!")

end

-- Ends the mission and calls all necessary functions to despawn units and markers.
FDF.endFenceDefence = function()
  env.info("FDF Debug: FDF.endFenceDefence: ")
  trigger.action.outText(
    "Fence Defence will be terminated. It will take a few seconds to completely remove all units and marker.",
    20, true)

  FDF.FenceDefenceStarted = false
  FDF.currentConfMultiplier = 1
end

-- Default Function to start a mission
-- @param configuration An integer which is set to 1-3; Represents the difficulty and the Unit-Tables which are to spawn
-- The "Mission_Active" prevents respawning without despawning first.
FDF.startFenceDefence = function(configuration)
  env.info("FDF Debug: FDF.startFenceDefence: " .. configuration)

  if FDF.FenceDefenceStarted == false then
      timer.scheduleFunction(FDF.setup, nil, timer.getTime() + 5)
      FDF.currentConfMultiplier = configuration
      FDF.FenceDefenceStarted = true
  end
end

-- Add Menu-Entries
local FenceDefenceMenuMain = MENU_COALITION:New(coalition.side.BLUE, "Fence Defence", MenuCoalitionBlueA2G)
local MenuCoalitionBlueMISSIONNAMEMenuStart = MENU_COALITION_COMMAND:New(coalition.side.BLUE, "Start " .. "Fence Defence" .. " Easy", FenceDefenceMenuMain, FDF.startFenceDefence, 1)
local MenuCoalitionBlueMISSIONNAMEMenuStart = MENU_COALITION_COMMAND:New(coalition.side.BLUE, "Start " .. "Fence Defence" .. " Medium", FenceDefenceMenuMain, FDF.startFenceDefence, 2)
local MenuCoalitionBlueMISSIONNAMEMenuStart = MENU_COALITION_COMMAND:New(coalition.side.BLUE, "Start " .. "Fence Defence" .. " Hard", FenceDefenceMenuMain, FDF.startFenceDefence, 3)
local MenuCoalitionBlueMISSIONNAMEMenuEnd = MENU_COALITION_COMMAND:New(coalition.side.BLUE, "End " .. "Fence Defence", FenceDefenceMenuMain, FDF.endFenceDefence)

env.info("FDF Debug: Scripts loaded successfully!")
