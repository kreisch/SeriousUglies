-- Define a SET_GROUP object that builds a collection of groups that define the EWR network.
-- Here we build the network with all the groups that have a name starting with DF CCCP AWACS and DF CCCP EWR.
DetectionSetGroupAleppo = SET_GROUP:New()
DetectionSetGroupAleppo:FilterPrefixes( { "RU_IADS_EWR_Aleppo"} )
DetectionSetGroupAleppo:FilterStart()

DetectionAleppo = DETECTION_AREAS:New( DetectionSetGroupAleppo, 30000 )
--Detection:BoundDetectedZones()

-- Setup the A2A dispatcher, and initialize it.
RED_A2ADispatcher_Aleppo = AI_A2A_DISPATCHER:New( DetectionAleppo )

-- Initialize the dispatcher, setting up a radius of 100km where any airborne friendly 
-- without an assignment within 100km radius from a detected target, will engage that target.
RED_A2ADispatcher_Aleppo:SetEngageRadius( 200000 )
RED_A2ADispatcher_Aleppo:SetDisengageRadius( 200000 )
RED_A2ADispatcher_Aleppo:SetTacticalDisplay( true )


-- Setup the squadrons.
-- TODO for Airfields; Moose update pending

--RED_A2ADispatcher_Aleppo:SetSquadron( "Kras1", AIRBASE.Caucasus.Krasnodar_Pashkovsky, { "SQ CCCP SU-27" }, 20 )
--RED_CAPZone_Aleppo = ZONE_POLYGON:New( "RU_BORDER_Aleppo_CAP", GROUP:FindByName( "RU_BORDER_Aleppo_CAP" ) )
--RED_A2ADispatcher_Aleppo:SetSquadronCap( "Kras1", 800, 1200, 4000, 8000, RED_CAPZone_Aleppo, 600, 800, 4000, 8000, "BARO" )
--RED_A2ADispatcher_Aleppo:SetSquadronCapInterval( "Kras1", 4, 30, 120, 1 )




-------- WORKAROUND STARTS HERE TODO

CapPlane = GROUP:FindByName( "RU_CAP_Aleppo_Mig21" )

PatrolZoneGroup = GROUP:FindByName( "RU_BORDER_Aleppo_GCI" )
PatrolZone = ZONE_POLYGON:New( "Patrol Zone", PatrolZoneGroup )
AICapZone = AI_CAP_ZONE:New( PatrolZone, 500, 1000, 500, 600 )


EngageZoneGroup = GROUP:FindByName( "RU_BORDER_Aleppo_CAP" )
CapEngageZone = ZONE_POLYGON:New( "Engage Zone", EngageZoneGroup )

AICapZone:SetControllable( CapPlane )
AICapZone:SetEngageZone( CapEngageZone ) -- Set the Engage Zone. The AI will only engage when the bogeys are within the CapEngageZone.

AICapZone:__Start( 1 ) -- They should statup, and start patrolling in the PatrolZone.