env.info("IADS:Loading Red East configuration")

redIADS = SkynetIADS:create("Russian East IADS")
redIADS:addEarlyWarningRadarsByPrefix('S_IADS_Red_East_EWR')
redIADS:addSAMSitesByPrefix('S_IADS_Red_SAM_East')
redIADS:addRadioMenu()
redIADS:setupSAMSitesAndThenActivate()


env.info("IADS:Loaded Red East configuration") 

env.info("IADS:Loading EAST CAP") 

-- Define a SET_GROUP object that builds a collection of groups that define the EWR network.
DetectionSetGroup = SET_GROUP:New()

-- add the MOOSE SET_GROUP to the Skynet IADS, from now on Skynet will update active radars that the MOOSE SET_GROUP can use for EW detection.
redIADS:addMooseSetGroup(DetectionSetGroup)

-- Setup the detection and group targets to a 30km range!
Detection = DETECTION_AREAS:New( DetectionSetGroup, 50000 )

-- Setup the A2A dispatcher, and initialize it.
A2ADispatcher = AI_A2A_DISPATCHER:New( Detection )

-- Set 100km as the radius to engage any target by airborne friendlies.
A2ADispatcher:SetEngageRadius() -- 100000 is the default value.

-- Set 200km as the radius to ground control intercept.
A2ADispatcher:SetGciRadius() -- 200000 is the default value.

CCCPBorderZone = ZONE_POLYGON:New( "Border-Red", GROUP:FindByName( "Border-Red" ) )
A2ADispatcher:SetBorderZone( CCCPBorderZone )

A2ADispatcher:SetSquadron( "Tblisi_CAP_Mig21", AIRBASE.Caucasus.Tbilisi_Lochini, { "Tblisi_CAP_Mig21" }, 2 )
A2ADispatcher:SetSquadronGrouping( "Tblisi_CAP_Mig21", 2 )
A2ADispatcher:SetSquadronGci( "Tblisi_CAP_Mig21", 900, 1200 )
A2ADispatcher:SetTacticalDisplay(true)
A2ADispatcher:Start()

env.info("IADS:Loaded EAST CAP") 