---------------------------------------
----  Patrol in Zone Script  ----
---------------------------------------
--
--  v 0.1 23.10.2022
--  By Skyfire
--  Simple patrol script, that takes a zone, collects all groups that contain the string "Patrol" 
--  and assigns each 5 minutes a new waypoint to each patrol group
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local patrolPrefix = "PATROL_"
local patrolFrequency = 1800 -- in seconds - 600s equals 10min

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Call this function for each zone that should be observed

function DoPatrolsInZone(_zone)
  env.info("DoPatrolsInZone: " .. _zone:GetName())

  local SetGroups = SET_GROUP:New():FilterCoalitions("red"):FilterZones({_zone}):FilterCategoryGround():FilterPrefixes(patrolPrefix): FilterOnce()

  SetGroups:ForEachGroup(function(groupToMove)
    env.info("Patrolling group: " .. groupToMove:GetName())
    local spawnVec2 = _zone:GetRandomVec2()

    groupToMove:RouteGroundOnRoad(COORDINATE:NewFromVec2(spawnVec2), 30)--, 1, "Vee", respawnAtLastWP)
  end
  )

  TIMER:New(DoPatrolsInZone, _zone):Start(patrolFrequency)
end

