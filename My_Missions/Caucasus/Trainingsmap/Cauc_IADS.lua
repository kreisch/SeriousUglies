env.info("IADS:Loading configuration")
  
  redIADS = SkynetIADS:create("Russian IADS")
  redIADS:addEarlyWarningRadarsByPrefix('Red_SAM_Global_EWR')
  redIADS:addSAMSitesByPrefix('Red_SAM_Global_Defense')
  
  
--  blueIADS = SkynetIADS:create("American IADS")
--  blueIADS:addEarlyWarningRadarsByPrefix('US_EWR')
--  blueIADS:addSAMSitesByPrefix('US_IADS_SAM')
  
  redIADS:addRadioMenu()
  redIADS:setupSAMSitesAndThenActivate()
  local commandCenter = StaticObject.getByName("RU_CommandCenter_East")
  local comPowerSource = StaticObject.getByName("RU_Powerplant_East")
  redIADS:addCommandCenter(commandCenter):addPowerSource(comPowerSource)
  redIADS:getSAMSites():setAutonomousBehaviour(SkynetIADSAbstractRadarElement.AUTONOMOUS_STATE_DARK):addPowerSource(comPowerSource)
  redIADS:getEarlyWarningRadars():addPowerSource(comPowerSource)
  
  
--  blueIADS:addRadioMenu()
--  blueIADS:setupSAMSitesAndThenActivate()
--  local commandCenterUS = StaticObject.getByName("US_CommandCenter")
--  local comPowerSourceUS = StaticObject.getByName("US_Powerplant")
--  blueIADS:addCommandCenter(commandCenterUS):addPowerSource(comPowerSourceUS)
--  blueIADS:getSAMSites():setAutonomousBehaviour(SkynetIADSAbstractRadarElement.AUTONOMOUS_STATE_DARK):addPowerSource(comPowerSourceUS)
--  blueIADS:getEarlyWarningRadars():addPowerSource(comPowerSourceUS)
  
  redIADS:activate()
--  blueIADS:activate()
  
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
  DetectionSetGroup_RU_East = SET_GROUP:New()
--  DetectionSetGroupUS = SET_GROUP:New()
  
  -- Setup the detection and group targets to a 30km range!
  Detection_RU_East = DETECTION_AREAS:New( DetectionSetGroup_RU_East, 30000 )
--  DetectionUS = DETECTION_AREAS:New( DetectionSetGroupUS, 30000 )
  -- Setup the A2A dispatcher, and initialize it.
  A2ADispatcher_RU_East = AI_A2A_DISPATCHER:New( Detection_RU_East )
--  A2ADispatcherUS = AI_A2A_DISPATCHER:New( DetectionUS )
  
  -- Set 100km as the radius to engage any target by airborne friendlies.
  A2ADispatcher_RU_East:SetEngageRadius() -- 100000 is the default value.
--  A2ADispatcherUS:SetEngageRadius()
  
  -- Set 200km as the radius to ground control intercept.
  A2ADispatcher_RU_East:SetGciRadius() -- 200000 is the default value.
--  A2ADispatcherUS:SetGciRadius()
  
  CCCPBorderZone = ZONE_POLYGON:New( "RU_BORDER_EAST", GROUP:FindByName( "RU_BORDER_EAST" ) )
  A2ADispatcher_RU_East:SetBorderZone( CCCPBorderZone )
  A2ADispatcher_RU_East:SetSquadron( "Mozdok", AIRBASE.Caucasus.Mozdok, { "RU_CAP_Mozdok_Mig29" }, 2 )
  A2ADispatcher_RU_East:SetSquadronGrouping( "Mozdok", 2 )
  A2ADispatcher_RU_East:SetSquadronGci( "Mozdok", 900, 1200 )
  A2ADispatcher_RU_East:SetTacticalDisplay(false)
  A2ADispatcher_RU_East:SetDefaultTakeoffFromParkingHot()
  A2ADispatcher_RU_East:Start()
  
--  USBorderZone = ZONE_POLYGON:New( "US_BORDER", GROUP:FindByName( "US_BORDER_Zone" ) )
--  A2ADispatcherUS:SetBorderZone( USBorderZone )
--  A2ADispatcherUS:SetSquadron( "AlDhafra", AIRBASE.PersianGulf.Al_Dhafra_AB, { "US_CAP_AlDhafra" }, 2 )
--  A2ADispatcherUS:SetSquadronGrouping( "AlDhafra", 2 )
--  A2ADispatcherUS:SetSquadronGci( "AlDhafra", 900, 1200 )
--  A2ADispatcherUS:SetTacticalDisplay(false)
--  A2ADispatcherUS:SetDefaultTakeoffFromParkingHot()
--  A2ADispatcherUS:Start()
  --END MOOSE CODE
  

  
  -- add the MOOSE SET_GROUP to the IADS, from now on Skynet will update active radars that the MOOSE SET_GROUP can use for EW detection.
  redIADS:addMooseSetGroup(DetectionSetGroup_RU_East)
--  blueIADS:addMooseSetGroup(DetectionSetGroupUS)


env.info("IADS:Loaded configuration")