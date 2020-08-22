Spawn_Vehicle_1 = SPAWN:New( "US_Incirlik_CAP_F15C" ):InitLimit( 2, 1 ):SpawnScheduled( 5, 0 )




--------- Below is control, must be in function, above shall be respawn
CapIncirlikGroup = GROUP:FindByName( "US_Incirlik_CAP_F15C" )

PatrolZoneGroup = GROUP:FindByName( "US_BORDER_Incirlik_CAP" )

PatrolZone = ZONE_POLYGON:New( "US_BORDER_Incirlik_CAP", PatrolZoneGroup )

CapIncirlikZone = AI_CAP_ZONE:New( PatrolZoneIncirlik, 1500, 6000, 500, 600 )

EngageZoneGroup = GROUP:FindByName( "US_BORDER_Incirlik_CAP" )

CapEngageZone = ZONE_POLYGON:New( "US_BORDER_Incirlik_CAP", EngageZoneGroup )

CapIncirlikZone:SetControllable( CapIncirlikGroup )
CapIncirlikZone:SetEngageZone( CapEngageZone ) -- Set the Engage Zone. The AI will only engage when the bogeys are within the CapEngageZone.

CapIncirlikZone:__Start( 1 ) -- They should statup, and start patrolling in the PatrolZone.