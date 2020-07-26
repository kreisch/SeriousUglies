env.info("IADS:Loading configuration")
redIADS = SkynetIADS:create("Russian IADS")
redIADS:addEarlyWarningRadarsByPrefix('RU_EWR')
redIADS:addSAMSitesByPrefix('RU_SAM')

redIADS:addRadioMenu()
redIADS:setupSAMSitesAndThenActivate()
local commandCenter = StaticObject.getByName("RU_CommandCenter")
local comPowerSource = StaticObject.getByName("RU_Powerplant")
redIADS:addCommandCenter(commandCenter):addPowerSource(comPowerSource)
redIADS:getSAMSites():setAutonomousBehaviour(SkynetIADSAbstractRadarElement.AUTONOMOUS_STATE_DARK):addPowerSource(comPowerSource)
redIADS:getEarlyWarningRadars():addPowerSource(comPowerSource)

redIADS:activate()

local iadsDebug = redIADS:getDebugSettings()  
iadsDebug.IADSStatus = true
iadsDebug.samWentDark = true
iadsDebug.contacts = true
iadsDebug.radarWentLive = true
iadsDebug.ewRadarNoConnection = true
iadsDebug.samNoConnection = true
iadsDebug.jammerProbability = true
iadsDebug.addedEWRadar = true
iadsDebug.hasNoPower = true
iadsDebug.addedSAMSite = true
iadsDebug.warnings = true
iadsDebug.harmDefence = true
iadsDebug.samSiteStatusEnvOutput = true
iadsDebug.earlyWarningRadarStatusEnvOutput = true


-- START MOOSE CODE:
-- Define a SET_GROUP object that builds a collection of groups that define the EWR network.
DetectionSetGroup = SET_GROUP:New()

-- Setup the detection and group targets to a 30km range!
Detection = DETECTION_AREAS:New( DetectionSetGroup, 30000 )
-- Setup the A2A dispatcher, and initialize it.
A2ADispatcher = AI_A2A_DISPATCHER:New( Detection )

-- Set 100km as the radius to engage any target by airborne friendlies.
A2ADispatcher:SetEngageRadius() -- 100000 is the default value.

-- Set 200km as the radius to ground control intercept.
A2ADispatcher:SetGciRadius() -- 200000 is the default value.

CCCPBorderZone = ZONE_POLYGON:New( "RED-BORDER", GROUP:FindByName( "RED-BORDER" ) )
A2ADispatcher:SetBorderZone( CCCPBorderZone )
A2ADispatcher:SetSquadron( "Mozdok", AIRBASE.Caucasus.Mozdok, { "RU_CAP_Mozdok_Mig29" }, 2 )
A2ADispatcher:SetSquadronGrouping( "Mozdok", 2 )
A2ADispatcher:SetSquadronGci( "Mozdok", 900, 1200 )
A2ADispatcher:SetTacticalDisplay(true)
A2ADispatcher:SetDefaultTakeoffFromParkingHot()
A2ADispatcher:Start()
--END MOOSE CODE

-- add the MOOSE SET_GROUP to the IADS, from now on Skynet will update active radars that the MOOSE SET_GROUP can use for EW detection.
redIADS:addMooseSetGroup(DetectionSetGroup)


local jammerGrowlerSource = Unit.getByName("Growler1")
jammerGrowler = SkynetIADSJammer:create(jammerGrowlerSource, redIADS)

jammerGrowler:addRadioMenu()

env.info("IADS:Loaded configuration")  



