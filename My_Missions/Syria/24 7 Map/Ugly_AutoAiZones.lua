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
assert(Ugly ~= nil, "\n\n** HEY MISSION-DESIGNER! **\n\Ugly_Framework has not been loaded!\n\nMake sure it's running\n*before* running Ugly_AutoAiZones.lua!\n")

local version = "1.0"

local function setAIOfGroups(_groupSet, _on, _shootFlare)
  _groupSet:ForEachGroup( function (grp)
    grp:SetAIOnOff(_on)

    if _shootFlare ~= nil and _shootFlare == true then
      if _on == true then
        grp:FlareGreen()
      else
        grp:FlareRed()
      end
    end
  end)
end


local GroupsOfZoneList = {}
local AutomaticAIZones = SET_ZONE:New():FilterPrefixes( AutoZonePrefix ):FilterStart()
local AllGroupsSet = SET_GROUP:New():FilterCategories("ground"):FilterActive(true):FilterStart()
local AllZoneGroupsSet = SET_GROUP:New()
local ActiveZoneTable = {}
local OldActiveZoneTable = {}

local InfoOfZones = ""

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
  setAIOfGroups(GroupsOfZone, false, true)

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

  -- Check player status
  _DATABASE:ForEachPlayerUnit(function (unit)
--  trigger.action.outText("Testing " .. unit:GetName() , 10)
    
    AutomaticAIZones:ForEachZone(function (zone)
      if unit:IsInZone(zone) then
        ActiveZoneTable[zone] = true
        if ActiveZoneTable[zone] ~= OldActiveZoneTable[zone] then
          triggerInfoText = "Triggered by " .. unit:GetPlayerName() .. ".\n\n"
        end
      end
    end)
  end)

  -- Check status change
  for k,v in pairs(ActiveZoneTable) do
    if ActiveZoneTable[k] ~= OldActiveZoneTable[k] then
      OldActiveZoneTable[k] = ActiveZoneTable[k]
      setAIOfGroups(GroupsOfZoneList[k], OldActiveZoneTable[k], true)

      triggerInfoText =  triggerInfoText .. "Set AI of zone [" .. k:GetName() .. "] to ["
      if OldActiveZoneTable[k] == true then
        triggerInfoText =  triggerInfoText .. "On]\n"
      else
        triggerInfoText =  triggerInfoText .. "Off]\n"
      end
  
      if OldActiveZoneTable[k] == false then
        k:FlareZone(FLARECOLOR.Red)
      else
        k:FlareZone(FLARECOLOR.Green)
      end

      trigger.action.outText(triggerInfoText, 10)

    end
  end

end, {}, 5, ZoneCheckInterval)

--------------------
-- Ready

trigger.action.outText("Automatic zone AI control has started for zones:\n\n" .. InfoOfZones, 10)














