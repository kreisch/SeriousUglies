-- Define a SET_GROUP object that builds a collection of groups that define the EWR network.
-- Here we build the network with all the groups that have a name starting with DF CCCP AWACS and DF CCCP EWR.
DetectionSetGroupCarrier = SET_GROUP:New()
DetectionSetGroupCarrier:FilterPrefixes( { "Naval-1"} )
DetectionSetGroupCarrier:FilterStart()

DetectionCarrier = DETECTION_AREAS:New( DetectionSetGroupCarrier, 30000 )
--Detection:BoundDetectedZones()

-- Setup the A2A dispatcher, and initialize it.
US_A2ADispatcher_Carrier = AI_A2A_DISPATCHER:New( DetectionCarrier )

-- Initialize the dispatcher, setting up a radius of 100km where any airborne friendly 
-- without an assignment within 100km radius from a detected target, will engage that target.
US_A2ADispatcher_Carrier:SetEngageRadius( 100000 )
US_A2ADispatcher_Carrier:SetDisengageRadius( 200000 )
US_A2ADispatcher_Carrier:SetTacticalDisplay( false )


-- Setup the squadrons.

US_A2ADispatcher_Carrier:SetSquadron( "US_Carrier_CAP_Tomcat", "CVN-72 Lincoln", { "US_Carrier_CAP_Tomcat" }, 20 )
US_CAPZone_Carrier = ZONE_POLYGON:New( "US_BORDER_CARRIER_CAP", GROUP:FindByName( "US_BORDER_CARRIER_CAP" ) )
US_A2ADispatcher_Carrier:SetSquadronCap("US_Carrier_CAP_Tomcat",US_CAPZone_Carrier,3000,5000,600,900,600,1200,"BARO")
US_A2ADispatcher_Carrier:SetSquadronCapInterval( "US_Carrier_CAP_Tomcat", 4, 30, 600, 1 )
US_A2ADispatcher_Carrier:SetSquadronOverhead( "US_Carrier_CAP_Tomcat", 2.0 )
US_A2ADispatcher_Carrier:SetSquadronGrouping( "US_Carrier_CAP_Tomcat", 2 )
US_A2ADispatcher_Carrier:SetSquadronLandingAtRunway( "US_Carrier_CAP_Tomcat" )
US_A2ADispatcher_Carrier:SetSquadronTakeoffFromParkingCold("US_Carrier_CAP_Tomcat")

US_A2ADispatcher_Carrier:__Start(1)