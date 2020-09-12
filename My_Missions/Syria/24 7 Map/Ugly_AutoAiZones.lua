-----------------------------------
--
-- Ugly Automatic AI Zones
-- Copyright Skyfire 2020
-- 
-- Needs Moose to be loaded
--
-----------------------------------
-- AI Zone Configuration
-----------------------------------

local ZoneCheckInterval = 1  -- Check interval in seconds
local AutoZonePrefix = "AutoOnOffZone"


-----------------------------------
--Do not edit below here
-----------------------------------

-- Sanity checks for development (copied from CSAR)
assert(Ugly ~= nil, "\n\n** HEY MISSION-DESIGNER! **\nUgly_Framework has not been loaded!\n\nMake sure it's running\n*before* running Ugly_AutoAiZones.lua!\n")

local version = "2.0"

local GroupsOfZoneList = {}
local AutomaticAIZones = SET_ZONE:New():FilterPrefixes( AutoZonePrefix ):FilterStart()
local AllGroupsSet = SET_GROUP:New():FilterCategories("ground"):FilterActive(true):FilterStart()
local AllZoneGroupsSet = SET_GROUP:New()
local ActiveZoneTable = {}
local OldActiveZoneTable = {}

local InfoOfZones = ""

local function setAIOfGroups(_groupSet, _on)
  _groupSet:ForEachGroup( function (grp)
    grp:SetAIOnOff(_on)
  end)
end

-- Initialization and collection of zone data
AutomaticAIZones:ForEachZone(function (zone)
  -- default, zone is off
  OldActiveZoneTable[zone] = false
  ActiveZoneTable[zone] = false
  local GroupsOfZone = SET_GROUP:New()

  InfoOfZones = InfoOfZones .. "Zone: " .. zone:GetName()

  local numberOfUnits = 0

  AllGroupsSet:ForEachGroupCompletelyInZone(zone, function (grp)
    if Ugly.startsWith(grp:GetName(), "S_") == false then
      AllZoneGroupsSet:AddGroup(grp)
      GroupsOfZone:AddGroup(grp)
      numberOfUnits = numberOfUnits + #grp:GetUnits()
    end
  end)

  GroupsOfZoneList[zone] = GroupsOfZone
  setAIOfGroups(GroupsOfZone, false)

  InfoOfZones = InfoOfZones .. ", with " .. numberOfUnits .. " unit"

  if numberOfUnits ~= 1 then
    InfoOfZones = InfoOfZones .. "s"
  end

  InfoOfZones = InfoOfZones .. ".\n"
end)


-- Zone-check scheduler 
-- 
-- In each iteration check the relation of all players to the defined zones.
-- Any zone that contains a player unit is turned on. Any vacant zone is turned off.

SCHEDULER:New( nil, function()

  local triggerInfoText = ""

  -- Init status of active table
  for k,v in pairs(ActiveZoneTable) do
    ActiveZoneTable[k] = false
  end

  local _activeZoneSet = SET_ZONE:New()

  -- Check player status
  _DATABASE:ForEachPlayerUnit(function (_player)
--  trigger.action.outText("Testing " .. _player:GetName() , 10)
    
    AutomaticAIZones:ForEachZone(function (zone)
      if _player:IsInZone(zone) then
        ActiveZoneTable[zone] = true
        _activeZoneSet:AddZone(zone)
        if ActiveZoneTable[zone] ~= OldActiveZoneTable[zone] then
          triggerInfoText = "Triggered by " .. _player:GetPlayerName() .. ".\n\n"
        end
      end
    end)
  end)


  -- Check status change
  for k,v in pairs(ActiveZoneTable) do
    if ActiveZoneTable[k] ~= OldActiveZoneTable[k] then -- Something changed - on to off, or off to on
      OldActiveZoneTable[k] = ActiveZoneTable[k]

      -- turn all on, when zone is turned on
      if ActiveZoneTable[k] == true then
        setAIOfGroups(GroupsOfZoneList[k], true)
        triggerInfoText =  triggerInfoText .. "Set AI of zone [" .. k:GetName() .. "] to [On]\n"
      else
        -- only turn off, when objects are not in another active zone
        --foreach group of zone, check if in another active zone

        triggerInfoText =  triggerInfoText .. "Check how much to turn off in zone [" .. k:GetName() .. "]"

        GroupsOfZoneList[k]:ForEachGroup( function (grp)
          local _canBeOff = true
          _activeZoneSet:ForEachZone( function (zone)
            if grp:IsInZone(zone) then
              _canBeOff = false
--              trigger.action.outText(grp:GetName() .. " must be on!\n", 10)
              end
          end)

          if _canBeOff then
            grp:SetAIOnOff(false)
--            triggerInfoText =  "Set AI of group [" .. grp:GetName() .. "] to [Off]\n"
--            trigger.action.outText(triggerInfoText, 10)
          end    
        end)
      end

      trigger.action.outText(triggerInfoText, 10)
      
      if OldActiveZoneTable[k] == false then
        k:FlareZone(FLARECOLOR.Red)
      else
        k:FlareZone(FLARECOLOR.Green)
      end
    end
  end
end, {}, 5, ZoneCheckInterval)

--------------------
-- Ready

trigger.action.outText("Ugly AI Zones Version: " .. version .. "\nAutomatic zone AI control has started for zones:\n\n" .. InfoOfZones, 10)














