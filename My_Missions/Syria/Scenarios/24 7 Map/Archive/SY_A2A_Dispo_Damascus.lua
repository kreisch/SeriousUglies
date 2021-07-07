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
RED_A2ADispatcher_Damascus:SetEventPriority(2)
RED_A2ADispatcher_Damascus:SetRefreshTimeInterval(60)


-- Setup the squadrons.
-- TODO for Airfields; Moose update pending

RED_A2ADispatcher_Damascus:SetSquadron( "RU_CAP_Damascus", "Aleppo", { "RU_Damascus_CAP_Mig25PD",
                                                                           "RU_Damascus_CAP_Mig21",
                                                                           "RU_Damascus_CAP_Mig19" }, 0 )
RED_CAPZone_Aleppo = ZONE_POLYGON:New( "RU_BORDER_South_CAP", GROUP:FindByName( "RU_BORDER_South_CAP" ) )
RED_A2ADispatcher_Damascus:SetSquadronCap("RU_CAP_Damascus",RED_CAPZone_Aleppo,3000,5000,600,900,600,1200,"BARO")
RED_A2ADispatcher_Damascus:SetSquadronCapInterval( "RU_CAP_Damascus", 4, 30, 120, 1 )
RED_A2ADispatcher_Damascus:SetSquadronTakeoffFromParkingCold("RU_CAP_Damascus")
RED_A2ADispatcher_Damascus:__Start(1)