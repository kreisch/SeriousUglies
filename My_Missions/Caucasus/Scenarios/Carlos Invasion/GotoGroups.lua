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
local gotoFrequency = 10 -- in seconds - 600s equals 10min

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Call this function for each zone that should be observed

function CheckGotosForZone(_zone)
  env.info("CheckGotosForZone: " .. _zone:GetName())

  local SetGroups = SET_GROUP:New():FilterCoalitions("red"):FilterCategoryGround():FilterPrefixes(_zone:GetName()): FilterOnce()

  SetGroups:ForEachGroupNotInZone(_zone, function(groupToMove)
    env.info("Rerouting group: " .. groupToMove:GetName())
    local spawnVec2 = _zone:GetRandomVec2()
    groupToMove:RouteGroundOnRoad(COORDINATE:NewFromVec2(spawnVec2), 30)--, 1, "Vee", respawnAtLastWP)
  end
  )

  TIMER:New(CheckGotosForZone, _zone):Start(gotoFrequency)
end

-- init for all GoTo zones
local SetZones = SET_ZONE:New():FilterPrefixes(zonePrefix):FilterOnce()
SetZones:ForEachZone(function(zoneToMoveTo)
  env.info("Init Goto for zone: " .. zoneToMoveTo:GetName())
  CheckGotosForZone(zoneToMoveTo)
end
)
