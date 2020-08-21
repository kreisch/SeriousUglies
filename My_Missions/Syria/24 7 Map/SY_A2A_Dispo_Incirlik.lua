env.info("A2A_Dispatcher: Loading Incirlik")

-- Define a SET_GROUP object that builds a collection of groups that define the EWR network.
-- Here we build the network with all the groups that have a name starting with DF CCCP AWACS and DF CCCP EWR.
US_DetectionSetGroupIncirlik = SET_GROUP:New()
US_DetectionSetGroupIncirlik:FilterPrefixes( { "US_IADS_EWR_Incirlik"} )
US_DetectionSetGroupIncirlik:FilterStart()

DetectionIncirlik = DETECTION_AREAS:New( US_DetectionSetGroupIncirlik, 30000 )
--Detection:BoundDetectedZones()

-- Setup the A2A dispatcher, and initialize it.
US_A2ADispatcher_Incirlik = AI_A2A_DISPATCHER:New( DetectionIncirlik )


-- Initialize the dispatcher, setting up a radius of 100km where any airborne friendly 
-- without an assignment within 100km radius from a detected target, will engage that target.
US_A2ADispatcher_Incirlik:SetEngageRadius( 200000 )
US_A2ADispatcher_Incirlik:SetDisengageRadius( 200000 )
US_A2ADispatcher_Incirlik:SetTacticalDisplay( false )

local HQ_Group = GROUP:FindByName( "US_HQ" )
local HQ_CC = COMMANDCENTER:New( HQ_Group, "HQ" )
US_A2ADispatcher_Incirlik:SetCommandCenter( HQ_CC )


-- Setup the squadrons.

US_A2ADispatcher_Incirlik:SetSquadron( "US_Incirlik_CAP_F15C", "Incirlik", { "US_Incirlik_CAP_F15C" }, 100 )
US_CAPZone_North = ZONE_POLYGON:New( "US_BORDER_Incirlik_CAP", GROUP:FindByName( "US_BORDER_Incirlik_CAP" ) )
US_A2ADispatcher_Incirlik:SetSquadronCap("US_Incirlik_CAP_F15C",US_CAPZone_North,3000,5000,600,900,600,1200,"BARO")
US_A2ADispatcher_Incirlik:SetSquadronCapInterval( "US_Incirlik_CAP_F15C", 4, 30, 300, 1 )



US_A2ADispatcher_Incirlik:SetSquadron( "US_Incirlik_CAP_F16C", "Incirlik", { "US_Incirlik_CAP_F16C" }, 100 )
US_CAPZone_Incirlik = ZONE_POLYGON:New( "US_BORDER_Incirlik_GCI", GROUP:FindByName( "US_BORDER_Incirlik_GCI" ) )
US_A2ADispatcher_Incirlik:SetSquadronCap("US_Incirlik_CAP_F16C",US_CAPZone_Incirlik,3000,5000,600,900,600,1200,"BARO")

US_A2ADispatcher_Incirlik:SetSquadronCapInterval( "US_Incirlik_CAP_F16C", 4, 30, 300, 1 )

US_A2ADispatcher_Incirlik:SetSquadronRadioFrequency("US_Incirlik_CAP_F16C",251.0)
US_A2ADispatcher_Incirlik:SetSquadronRadioFrequency("US_Incirlik_CAP_F15C",251.0)


US_A2ADispatcher_Incirlik:SetSquadronOverhead( "US_Incirlik_CAP_F16C", 2.0 )
US_A2ADispatcher_Incirlik:SetSquadronOverhead( "US_Incirlik_CAP_F15C", 2.0 )

US_A2ADispatcher_Incirlik:SetSquadronGrouping( "US_Incirlik_CAP_F16C", 4 )
US_A2ADispatcher_Incirlik:SetSquadronGrouping( "US_Incirlik_CAP_F15C", 4 )

US_A2ADispatcher_Incirlik:SetSquadronLandingAtRunway( "US_Incirlik_CAP_F16C" )
US_A2ADispatcher_Incirlik:SetSquadronLandingAtRunway( "US_Incirlik_CAP_F15C" )

US_A2ADispatcher_Incirlik:SetSquadronTakeoffFromParkingCold("US_Incirlik_CAP_F16C")
US_A2ADispatcher_Incirlik:SetSquadronTakeoffFromParkingCold("US_Incirlik_CAP_F15C")



US_A2ADispatcher_Incirlik:__Start(1)


env.info("A2A_Dispatcher: Loaded Incirlik")