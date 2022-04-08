-- On the Fence scripting by Mr Nobody
-- v1.05 21 Mar 22 for Syria
-- Updated script to operate with the mission editor compatible text string flags rather than setting variables directly
-- There is now an additional, larger zone used specifically for checking enemy presence so that dispersed enemy spawns outside the radius are still counted
-- Infantry group templates to spawn

-- Updated April 2022 for integration into the Ugly Syria Map

local infantryGroups = {"Inf Group 1", "Inf Group 2", "Inf Group 3", "Inf Group 4", "Inf Group 5", "Inf Group 6",
                  "Inf Group 7"}

-- Vehicle group templates to spawn
local vehicleGroups =
    {"Veh Group 1", "Veh Group 2", "Veh Group 3", "Veh Group 4", "Veh Group 5", "Veh Group 6", "Veh Group 7"}

-- List of trigger zones the enemy can attack
local combatZones = {"Defence Alpha", "Defence Bravo", "Defence Charlie", "Defence Delta", "Defence Echo", "Defence Golf", "Defence Foxtrot"}

local FenceDefenceStarted = false
local currentConfMultiplier = 1

local activeZones = 0
local totalAttacks = 0
local maxActiveZones = 2
local avgAttackTime = 180
local maxAttackAmount = 3
local minInfantryGroups = 1
local maxInfantryGroups = 3
local minVehicleGroups = 1
local maxVehicleGroups = 2
local finalMessage = false


-- Colors for the map markers
local redOutline = {0.95, 0.1, 0.15, 0.7}
local redFill = {0.95, 0.1, 0.15, 0.25}
local blueOutline = {0, 0.7, 0.9, 0.7}
local blueFill = {0, 0.7, 0.9, 0.25}
local blackText = {0, 0, 0, 0.7}
local clearBackground = {0, 0, 0, 0}


-- Check the active zones table ocasionally to see if they've been cleared of REDFOR
local function checkZoneCompletion(zoneId)

  local zoneName = combatZones[zoneId]
  local attackerUnits = mist.getUnitsInZones(mist.makeUnitTable({'[red][vehicle]'}), {zoneName .. " Large"}) -- Added a slightly larger zone than the spawn one in v1.1 to account for unit dispersion
  local attackerUnitsQty = #attackerUnits

  if attackerUnitsQty == 0 then
      trigger.action.outText("We've successfully cleared the enemy from " .. zoneName .. ".  Well done.", 15)
      trigger.action.outSound("clear.ogg")
      trigger.action.setMarkupColor(zoneId + 1000, blueOutline)
      trigger.action.setMarkupColorFill(zoneId + 1000, blueFill)
      trigger.action.setMarkupText((zoneId + 1000 + #combatZones), "Zone: " .. zoneName .. "\nStatus: CLEAR")
      trigger.action.effectSmokeStop(zoneName)
      activeZones = activeZones - 1
      env.info("OTF Debug: Zone " .. zoneName .. " reported as clear.")
  elseif attackerUnitsQty > 0 then
      trigger.action.setMarkupText((zoneId + 1000 + #combatZones), "Zone: " .. zoneName ..
          "\nStatus: UNDER ATTACK\nEnemy Strength: " .. attackerUnitsQty .. " hostiles")
      timer.scheduleFunction(checkZoneCompletion, zoneId, timer.getTime() + 20)
      env.info("OTF Debug: Zone " .. zoneName .. " reported as under attack, enemy count updated.")
  end
end

-- Check for activeZones to equal 0 periodically once the final wave has spawned
local function finalZoneCheck()

  -- Only send this message the first time the check occurs
  if not finalMessage then
      trigger.action.outText(
          "Alright, this looks like the final enemy push.  Finish off all their remaining forces and the day is ours!",
          30)
      trigger.action.outSound("final.ogg")
      finalMessage = true
  end

  if activeZones == 0 then
      trigger.action.outText(
          "Enemy forces have been completely wiped out.  Well done, everyone.  Mission is complete, you are cleared to return to base.\n\n === MISSION COMPLETE ===",
          60)
      trigger.action.outSound("complete.ogg")
      -- Remove the markers
      for i = 1, #combatZones do
          local markerId = i + 1000
          local textId = i + #combatZones
          trigger.action.removeMark(markerId)
          trigger.action.removeMark(textId)
      end
      env.info("OTF Debug: Mission complete!")
      FenceDefenceStarted = false
    else
      timer.scheduleFunction(finalZoneCheck, nil, timer.getTime() + 30)
      env.info("OTF Debug: Mission not yet finished, checking again in 30 seconds.")
  end

end


-- Create an attack if the maximum amount isn't exceeded
local function createZoneAttack()

  trigger.action.outText("createZoneAttack", 60, true)

    if not activeZones then
        activeZones = 0
    end
    if not totalAttacks then
        totalAttacks = 0
    end

    -- Pick a zone to attack
    local zoneSelect = math.random(1, #combatZones)
    local zoneChoice = combatZones[zoneSelect]

    -- If the zone already has an enemy presence, the roll also gets canceled to avoid stacking a zone
    local enemyPresent = mist.getUnitsInZones(mist.makeUnitTable({'[red][vehicle]'}), {zoneChoice})

    if #enemyPresent == 0 then
        if activeZones < maxActiveZones then

          local spawnNumInf = 2 * currentConfMultiplier -- math.random(minInfantryGroups, maxInfantryGroups) --
          local spawnNumVeh = 1 * currentConfMultiplier -- math.random(minVehicleGroups, maxVehicleGroups) -- * currentConfMultiplier

--          local spawnNumInf = math.random(minInfantryGroups, maxInfantryGroups) -- * currentConfMultiplier
--          local spawnNumVeh = math.random(minVehicleGroups, maxVehicleGroups) -- * currentConfMultiplier

            -- Infantry template spawns
            for i = 1, spawnNumInf do
                local infGroupSelect = math.random(1, #infantryGroups)
                local infGroupChoice = infantryGroups[infGroupSelect]
                mist.cloneInZone(infGroupChoice, zoneChoice, true, 60)
            end

            -- Vehicle template spawns
            for i = 1, spawnNumVeh do
                local vehGroupSelect = math.random(1, #vehicleGroups)
                local vehGroupChoice = vehicleGroups[vehGroupSelect]
                mist.cloneInZone(vehGroupChoice, zoneChoice, true, 150)
            end

            -- Increment the amount of active combat zones, and the total attacks the enemy has made
            activeZones = activeZones + 1
            totalAttacks = totalAttacks + 1

            trigger.action.outText("Enemy forces are attacking " .. zoneChoice .. "!", 15)
            trigger.action.outSound("attack.ogg")

            trigger.action.setMarkupColor(zoneSelect + 1000, redOutline)
            trigger.action.setMarkupColorFill(zoneSelect + 1000, redFill)
            trigger.action.setMarkupText((zoneSelect + 1000 + #combatZones), "Zone: " .. zoneChoice .. "\nStatus: UNDER ATTACK")

            trigger.action.effectSmokeBig(mist.utils.makeVec3GL(trigger.misc.getZone(zoneChoice).point), 7, 0.1, zoneChoice)
            timer.scheduleFunction(checkZoneCompletion, zoneSelect, timer.getTime() + 5)
            env.info("OTF Debug: New zone attack created.")
        else
            env.info("OTF Debug: Active zones at max, skipping spawn process.")
        end

        if totalAttacks < maxAttackAmount then
            -- Schedule the next attack on the usual time
            timer.scheduleFunction(createZoneAttack, nil,
                timer.getTime() + math.random(avgAttackTime * 0.8, avgAttackTime * 1.2))
        else
            timer.scheduleFunction(finalZoneCheck, nil, timer.getTime() + 30)
        end

    else
        -- Schedule the next attack quickly since the roll was a dud
        if totalAttacks < maxAttackAmount then
            timer.scheduleFunction(createZoneAttack, nil, timer.getTime() + 5)
        else
            timer.scheduleFunction(finalZoneCheck, nil, timer.getTime() + 30)
        end
    end

end

-- Automatically mark all the zones
local function initMarkZones()

    for i = 1, #combatZones do
        local markerId = i + 1000
        local zoneName = combatZones[i]
        local textId = markerId + #combatZones
        local zonePos = trigger.misc.getZone(zoneName)
        trigger.action.circleToAll(-1, markerId, zonePos.point, zonePos.radius, blueOutline, blueFill, 2, true,
            "Outpost marked.")
        trigger.action.textToAll(-1, textId, zonePos.point, blackText, clearBackground, 14, true,
            "Zone: " .. zoneName .. "\nStatus: CLEAR")
    end
    env.info("OTF Debug: Combat zones marked on map.")
end

-- Define some variables and sanity check the user options a few seconds after mission start
local function otfSetup()

    -- Grab the ME flags for user options since they can be named in DCS 2.7.11
    if not trigger.misc.getUserFlag("Maximum Active Zones") then
        maxActiveZones = 2
    else
        maxActiveZones = trigger.misc.getUserFlag("Maximum Active Zones")
    end
    if not trigger.misc.getUserFlag("Time Between Attacks") then
        avgAttackTime = 70
    else
        avgAttackTime = (trigger.misc.getUserFlag("Time Between Attacks") * 60)
    end
    if not trigger.misc.getUserFlag("Zones Cleared To Win") then
        maxAttackAmount = 2
    else
        maxAttackAmount = trigger.misc.getUserFlag("Zones Cleared To Win")
    end
    if not trigger.misc.getUserFlag("Minimum Infantry Presence") then
        minInfantryGroups = 1
    else
        minInfantryGroups = trigger.misc.getUserFlag("Minimum Infantry Presence")
    end
    if not trigger.misc.getUserFlag("Maximum Infantry Presence") then
        maxInfantryGroups = 3
    else
        maxInfantryGroups = trigger.misc.getUserFlag("Maximum Infantry Presence")
    end
    if not trigger.misc.getUserFlag("Minimum Vehicle Presence") then
        minVehicleGroups = 1
    else
        minVehicleGroups = trigger.misc.getUserFlag("Minimum Vehicle Presence")
    end
    if not trigger.misc.getUserFlag("Maximum Vehicle Presence") then
        maxVehicleGroups = 2
    else
        maxVehicleGroups = trigger.misc.getUserFlag("Maximum Vehicle Presence")
    end

    -- stop the user from putting in some really inane or silly values for settings or just straight up deleting them
    if not maxActiveZones or maxActiveZones <= 0 then
        maxActiveZones = 2
    end
    if not avgAttackTime or avgAttackTime < 60 then
        avgAttackTime = 900
    end
    if not maxAttackAmount then
        maxAttackAmount = 6
    end
    if not minInfantryGroups or minInfantryGroups < 0 or minInfantryGroups > 10 then
        minInfantryGroups = 2
    end
    if not maxInfantryGroups or maxInfantryGroups < minInfantryGroups or maxInfantryGroups > 10 then
        maxInfantryGroups = 4
    end
    if not minVehicleGroups or minVehicleGroups < 0 or minVehicleGroups > 10 then
        minVehicleGroups = 1
    end
    if not maxVehicleGroups or maxVehicleGroups < minVehicleGroups or maxVehicleGroups > 10 then
        maxVehicleGroups = 3
    end

    -- Start the attack generation
--    timer.scheduleFunction(createZoneAttack, nil, timer.getTime() + 30)
    timer.scheduleFunction(createZoneAttack, nil, timer.getTime() + math.random(60 * 0.8, 60 * 1.2))
    -- Draw the initial markers
    initMarkZones()
    trigger.action.outText(
        "The friendly border outposts have been marked on the map.  We'll keep you updated with any reports of insurgent attacks.  Good luck and stay safe out there.",
        60, true)
    trigger.action.outSound("intro.ogg")
    env.info("OTF Debug: Setup completed!")
end

-- Ends the mission and calls all necessary functions to despawn units and markers.
local function endFenceDefence()
  FenceDefenceStarted = false
  currentConfMultiplier = 1
end

-- Default Function to start a mission
-- @param configuration An integer which is set to 1-3; Represents the difficulty and the Unit-Tables which are to spawn
-- The "Mission_Active" prevents respawning without despawning first.
local function startFenceDefence(configuration)
  if FenceDefenceStarted == false then
      timer.scheduleFunction(otfSetup, nil, timer.getTime() + 5)
      currentConfMultiplier = configuration
      FenceDefenceStarted = true
  end
end

-- Add Menu-Entries
local FenceDefenceMenuMain                    = MENU_COALITION          :New( coalition.side.BLUE, "Fence Defence", MenuCoalitionBlueA2G )
local MenuCoalitionBlueMISSIONNAMEMenuStart   = MENU_COALITION_COMMAND  :New( coalition.side.BLUE,  "Start " .. "Fence Defence" .. " Easy", FenceDefenceMenuMain, startFenceDefence, 1)
local MenuCoalitionBlueMISSIONNAMEMenuStart   = MENU_COALITION_COMMAND  :New( coalition.side.BLUE,  "Start " .. "Fence Defence" .. " Medium", FenceDefenceMenuMain, startFenceDefence, 2)
local MenuCoalitionBlueMISSIONNAMEMenuStart   = MENU_COALITION_COMMAND  :New( coalition.side.BLUE,  "Start " .. "Fence Defence" .. " Hard", FenceDefenceMenuMain, startFenceDefence, 3)
local MenuCoalitionBlueMISSIONNAMEMenuEnd     = MENU_COALITION_COMMAND  :New( coalition.side.BLUE,  "End " .. "Fence Defence", FenceDefenceMenuMain, endFenceDefence)


env.info("OTF Debug: Scripts loaded successfully!")
