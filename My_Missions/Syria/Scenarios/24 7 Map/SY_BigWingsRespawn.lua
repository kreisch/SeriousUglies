------------ Script to start the Bigwing Tankers and Awacs



env.info("SPAWNING: Spawning BigWings")


--Spawn_Arco11 = SPAWN:New("Arco 1-1"):InitLimit( 1, 2 ):InitKeepUnitNames(true)
--Spawn_Arco11:InitRepeatOnLanding()
--Spawn_Arco11:InitDelayOff()
--Spawn_Arco11:SpawnScheduled(180,0)
--
--Spawn_Arco21 = SPAWN:New("Arco 2-1"):InitLimit( 1, 2 ):InitKeepUnitNames(true)
--Spawn_Arco21:InitRepeatOnLanding()
--Spawn_Arco21:InitDelayOff()
--Spawn_Arco21:SpawnScheduled(180,0)
--
--Spawn_Texaco11 = SPAWN:New("Texaco 1-1"):InitLimit( 1, 2 )
--Spawn_Texaco11:InitRepeatOnLanding()
--Spawn_Texaco11:InitDelayOff()
--Spawn_Texaco11:SpawnScheduled(180,0)
--
--Spawn_Focus = SPAWN:New("Focus"):InitLimit( 1, 2 )
--Spawn_Focus:InitRepeatOnLanding()
--Spawn_Focus:InitDelayOff()
--Spawn_Focus:SpawnScheduled(180,0)


local lowFuelThresholdWarning = 0.10 -- Print message to player when tanker is about to RTB

-- Tanker RESPAWN Script
--RESPAWN SCRIPT; MISSION START -> DO SCRIPT
local oldGroupRemovalTime = 480 -- Time (seconds) after which old groups are removed

local messagePrinted = {}

barons_respawn_script = {}
barons_respawn_script.predicate = function(groupName, lowFuelThreshold, lowHealthThreshold)
    if barons_respawn_script and barons_respawn_script[groupName] then
        groupName = groupName .. barons_respawn_script[groupName]
    end
    local group = Group.getByName(groupName)
    if not group then
        return true
    end

    group = group:getUnits()[1]
    if not group or Unit.inAir(group) == false then
        return true
    end

    if group:getFuel() < lowFuelThresholdWarning and messagePrinted[group:getName()] == nil then
        trigger.action.outTextForCoalition(group:getCoalition(), "Attention - Tanker: " .. group:getName() .. " is about to RTB soon!", 10)
        messagePrinted[group:getName()] = true
        return false
    end

    if group:getFuel() < lowFuelThreshold or group:getLife() / group:getLife0() < lowHealthThreshold then
        return true
    end
return false
end

barons_respawn_script.removeGroup = function(group)
    group = Group.getByName(group)
    if group then
        trigger.action.deactivateGroup(group)
    end
end

barons_respawn_script.action = function(groupName)
    local oldName = groupName
    if barons_respawn_script[groupName] == nil then
        barons_respawn_script[groupName] = 0
    else
        oldName = groupName .. barons_respawn_script[groupName]
    end
    barons_respawn_script[groupName] = barons_respawn_script[groupName] + 1
    local newName = groupName .. barons_respawn_script[groupName]

    mist.scheduleFunction(barons_respawn_script.removeGroup, {oldName}, timer.getTime() + oldGroupRemovalTime)
    local group = Group.getByName(oldName)
    if group then
        group = group:getController()
        Controller.setCommand(group, {id = 'DeactivateBeacon', params = {}})
        Controller.setTask(group, {id = 'NoTask', params = {}})
    end

    group = mist.getGroupData(groupName)
    group.route = { points = mist.getGroupRoute(groupName, true) }
    group.groupName = newName
    group.groupId = nil
    group.units[1].unitId = nil
    group.units[1].unitName = newName
    group.category = 'AIRPLANE'

    mist.dynAdd(group)

    group = Group.getByName(newName)
    group = group:getController()
end

barons_respawn_script.checkstate = function(groupName, lowFuelThreshold, lowHealthThreshold, oldresult)
    local newresult = barons_respawn_script.predicate(groupName, lowFuelThreshold, lowHealthThreshold)
    if oldresult == false and newresult == true then
        barons_respawn_script.action(groupName)
    end
    
    mist.scheduleFunction(barons_respawn_script.checkstate, {groupName, lowFuelThreshold, lowHealthThreshold, newresult},  timer.getTime() + 1)
end


local lowFuelThreshold = 0.08 -- RTB when less then this amount of fuel
local lowHealthThreshold = 0.75 -- RTB when less then this amount of health

local groupName = 'Arco 1-1' -- Name of the group in the ME
barons_respawn_script.checkstate(groupName, lowFuelThreshold, lowHealthThreshold, true)

local groupName = 'Arco 2-1' -- Name of the group in the ME
barons_respawn_script.checkstate(groupName, lowFuelThreshold, lowHealthThreshold, true)

local groupName = 'Texaco 1-1' -- Name of the group in the ME
barons_respawn_script.checkstate(groupName, lowFuelThreshold, lowHealthThreshold, true)

local groupName = 'Focus' -- Name of the group in the ME
barons_respawn_script.checkstate(groupName, lowFuelThreshold, lowHealthThreshold, true)


env.info("SPAWNING: Spawned Bigwings")