-- Define a SET_GROUP object that builds a collection of groups that define the EWR network.
-- Here we build the network with all the groups that have a name starting with DF CCCP AWACS and DF CCCP EWR.
DetectionSetGroupDamascus = SET_GROUP:New()
DetectionSetGroupDamascus:FilterPrefixes( { "RU_IADS_EWR_Damascus"} )
DetectionSetGroupDamascus:FilterStart()

DetectionDamascus = DETECTION_AREAS:New( DetectionSetGroupDamascus, 30000 )
--Detection:BoundDetectedZones()

-- Setup the A2A dispatcher, and initialize it.
RED_A2ADispatcher_Damascus = AI_A2A_DISPATCHER:New( DetectionDamascus )

-- Initialize the dispatcher, setting up a radius of 100km where any airborne friendly 
-- without an assignment within 100km radius from a detected target, will engage that target.
RED_A2ADispatcher_Damascus:SetEngageRadius( 200000 )
RED_A2ADispatcher_Damascus:SetDisengageRadius( 200000 )
RED_A2ADispatcher_Damascus:SetTacticalDisplay( false )


-- Setup the squadrons.
-- TODO for Airfields; Moose update pending

RED_A2ADispatcher_Damascus:SetSquadron( "RU_CAP_Damascus", "Aleppo", { "RU_Damascus_CAP_Mig25PD",
                                                                           "RU_Damascus_CAP_Mig21",
                                                                           "RU_Damascus_CAP_Mig19" }, 0 )
RED_CAPZone_Aleppo = ZONE_POLYGON:New( "RU_BORDER_South_CAP", GROUP:FindByName( "RU_BORDER_South_CAP" ) )
RED_A2ADispatcher_Damascus:SetSquadronCap( "RU_CAP_Damascus", 800, 1200, 4000, 8000, RED_CAPZone_Aleppo, 600, 800, 4000, 8000, "BARO" )
RED_A2ADispatcher_Damascus:SetSquadronCapInterval( "RU_CAP_Damascus", 4, 30, 120, 1 )
RED_A2ADispatcher_Damascus:__Start(1)