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
RED_A2ADispatcher_Aleppo:SetTacticalDisplay( false )


-- Setup the squadrons.

RED_A2ADispatcher_Aleppo:SetSquadron( "RU_CAP_Aleppo_Mig21", "Aleppo", { "RU_CAP_Aleppo_Mig21" }, 20 )
RED_CAPZone_Aleppo = ZONE_POLYGON:New( "RU_BORDER_Aleppo_CAP", GROUP:FindByName( "RU_BORDER_Aleppo_CAP" ) )
RED_A2ADispatcher_Aleppo:SetSquadronCap("RU_CAP_Aleppo_Mig21",RED_CAPZone_Aleppo,3000,5000,600,900,600,1200,"BARO")
RED_A2ADispatcher_Aleppo:SetSquadronCapInterval( "RU_CAP_Aleppo_Mig21", 4, 30, 120, 1 )
RED_A2ADispatcher_Aleppo:SetSquadronTakeoffFromParkingCold("RU_CAP_Aleppo_Mig21")
RED_A2ADispatcher_Aleppo:__Start(1)