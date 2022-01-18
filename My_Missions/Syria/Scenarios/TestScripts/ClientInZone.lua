-- Example how to check group amount in zones.
-- Do this in a scheduler and check if >0 to see if a zone is entered by player(s).

function group_counter (zone , side )
    local count = 0
    SetGroupObject = SET_GROUP:New():FilterCoalitions(side):FilterActive():FilterOnce()
    SetGroupObject:ForEachGroupCompletelyInZone( zone, function( GroupObject )
        count = count + 1
    end )

return count
end


ZonePlayer =ZONE:New("ZonePlayer")
zone1      =ZONE:New("Zone1")
--SetZone = SET_ZONE:New():FilterStart()
--SetZone:ForEachZone(function(zone)


local tmp = group_counter (ZonePlayer , "blue" )
local tmp2 = group_counter (zone1 , "blue" )
env.info(ZonePlayer:GetName() .."has " .. tmp .. " blue groups.")
env.info(zone1:GetName() .."has " .. tmp2 .. " blue groups.")
--end)