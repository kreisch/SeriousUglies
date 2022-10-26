-----------------------
----  Goto Groups  ----
-----------------------
--
--  v 0.1 24.10.2022
--  By Skyfire
--  Script that sends groups in intervalls to a given point on the map
--  Place a zone with name "GOTO_XYZ_WHATEVER". 
--  A scheduler will collect all zones with the name "GOTO_". For each zone it will find all GROUPS 
--  with the name of each zone as prefix and send them to the center of the zones.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local zonePrefix = "GOTO_"
local gotoFrequency = 600 -- in seconds - 600s equals 10min
local numberPerStep = 1 -- how many units are moved each iteration
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- helper queue structure

GotoList = {}
local theList = {}

function GotoList.new ()
  return {first = 0, last = -1}
end

--[[
function GotoList.pushleft (list, value)
  local first = list.first - 1
  list.first = first
  list[first] = value
end
]]

function GotoList.pushright (list, value)
  local last = list.last + 1
  list.last = last
  list[last] = value
end

function GotoList.popleft (list)
  local first = list.first

  if first > list.last then 
    return nil
  end

  local value = list[first]
  list[first] = nil        -- to allow garbage collection
  list.first = first + 1
  return value
end

--[[
function GotoList.popright (list)
  local last = list.last

  if list.first > last then
    return nil
  end

  local value = list[last]
  list[last] = nil         -- to allow garbage collection
  list.last = last - 1
  return value
end
]]

-- Call this function for each zone that should be observed
function CheckGotosForZone(_zone)
  env.info("CheckGotosForZone: " .. _zone:GetName())

  local SetGroups = SET_GROUP:New():FilterCoalitions("red"):FilterCategoryGround():FilterPrefixes(_zone:GetName()): FilterOnce()

  SetGroups:ForEachGroupNotInZone(_zone, function(groupToMove)
    env.info("Rerouting group: " .. groupToMove:GetName())
    local destVec2 = _zone:GetRandomVec2()
    local gotoData = {group = groupToMove, dest = destVec2}
    GotoList.pushright(theList, gotoData)
  end
  )

  TIMER:New(CheckGotosForZone, _zone):Start(gotoFrequency)
end


function ExecuteAllGotos()
  env.info("Start ExecuteAllGotos...")
  --  local gotoData = {group = groupToMove, dest = destVec2}

  for i = 1, numberPerStep do
    local gotoData = GotoList.popleft(theList)
    if gotoData then
      if gotoData.group ~= nil then
        env.info("ExecuteAllGoto for: " .. gotoData.group:GetName())
        gotoData.group:RouteGroundOnRoad(COORDINATE:NewFromVec2(gotoData.dest), 50)--, 1, "Vee", respawnAtLastWP)
      end
    else
      break
    end
  end

  env.info("End ExecuteAllGotos...")
  TIMER:New(ExecuteAllGotos):Start(1)
end

theList = GotoList.new()

-- init for all GoTo zones
local SetZones = SET_ZONE:New():FilterPrefixes(zonePrefix):FilterOnce()
SetZones:ForEachZone(function(zoneToMoveTo)
  env.info("Init Goto for zone: " .. zoneToMoveTo:GetName())
  CheckGotosForZone(zoneToMoveTo)
end
)

ExecuteAllGotos()
