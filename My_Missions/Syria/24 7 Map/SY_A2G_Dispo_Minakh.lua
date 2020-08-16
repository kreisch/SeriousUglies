
env.info("A2G Dispo: Loading Minakh")


-- Define a SET_GROUP object that builds a collection of groups that define the recce network.
-- Here we build the network with all the groups that have a name starting with CCCP Recce.
local DetectionSetGroup_Minakh = SET_GROUP:New()
DetectionSetGroup_Minakh:FilterPrefixes( { "RU_RECCE_Minakh" } )
DetectionSetGroup_Minakh:FilterStart()

local Detection_Minakh = DETECTION_AREAS:New( DetectionSetGroup_Minakh, 1000 )

-- Setup the A2A dispatcher, and initialize it.
A2GDispatcher_Minakh = AI_A2G_DISPATCHER:New( Detection_Minakh )

-- The Command Center (HQ) is the defense point and will also handle the communication to the coalition.
local HQ_Group_Minakh = GROUP:FindByName( "RU_HQ_Minakh" )
local HQ_CC_Minakh = COMMANDCENTER:New( HQ_Group_Minakh, "RU_HQ_Minakh" )

-- Add defense coordinates.
A2GDispatcher_Minakh:AddDefenseCoordinate( "HQ_Minakh", HQ_Group_Minakh:GetCoordinate() )
A2GDispatcher_Minakh:SetDefenseReactivityHigh() -- High defense reactivity. So far proximity of a threat will trigger a defense action.
A2GDispatcher_Minakh:SetDefenseRadius( 200000 ) -- Defense radius wide enough to also trigger defenses far away.

-- Communication to the players within the coalition. The HQ services the communication of the defense actions.
A2GDispatcher_Minakh:SetCommandCenter( HQ_CC_Minakh )

-- Show a tactical display.
A2GDispatcher_Minakh:SetTacticalDisplay( true )


-- Setup the patrols.

-- The patrol zone.
local PatrolZone = ZONE_POLYGON:New( "RU_BORDER_A2G_MINAKH", GROUP:FindByName( "RU_BORDER_A2G_MINAKH" ) )


-- Close Air Support from the CAS farp.
A2GDispatcher_Minakh:SetSquadron( "Kuweires_CAS_SU25", "Kuweires", { "Kuweires_CAS_SU25" }, 10 )
A2GDispatcher_Minakh:SetSquadronCasPatrol2( "Kuweires_CAS_SU25", PatrolZone, nil, nil, 5000, 8000, "BARO", 200, 600, 300, 2000, "RADIO" ) -- New API
A2GDispatcher_Minakh:SetSquadronCasPatrolInterval( "Kuweires_CAS_SU25", 2, 30, 60, 1 )
A2GDispatcher_Minakh:SetSquadronTakeoffFromParkingHot( "Kuweires_CAS_SU25" )
A2GDispatcher_Minakh:SetSquadronOverhead( "Kuweires_CAS_SU25", 0.25 )


-- We set for each squadron a takeoff interval, as each helicopter will launch from a FARP.
-- This to prevent helicopters to clutter.
-- Each helicopter group is taking off the FARP in hot start.
A2GDispatcher_Minakh:SetSquadronTakeoffInterval( "Kuweires_CAS_SU25", 10 )
A2GDispatcher_Minakh:Start()


env.info("A2G Dispo: Loaded Minakh")