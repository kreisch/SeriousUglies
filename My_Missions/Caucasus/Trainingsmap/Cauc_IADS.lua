env.info("IADS:Loading configuration")
  
  redIADS = SkynetIADS:create("Russian IADS")
  redIADS:addEarlyWarningRadarsByPrefix('Red_SAM_Global_EWR')
  redIADS:addSAMSitesByPrefix('Red_SAM_Global_Defense')
  
  redIADS:addRadioMenu()
  redIADS:setupSAMSitesAndThenActivate()
  local commandCenter = StaticObject.getByName("RU_CommandCenter_East")
  local comPowerSource = StaticObject.getByName("RU_Powerplant_East")
  redIADS:addCommandCenter(commandCenter):addPowerSource(comPowerSource)
  redIADS:getSAMSites():setAutonomousBehaviour(SkynetIADSAbstractRadarElement.AUTONOMOUS_STATE_DARK):addPowerSource(comPowerSource)
  redIADS:getEarlyWarningRadars():addPowerSource(comPowerSource)
  
  
  redIADS:activate()

 
  
  
  -- START MOOSE CODE:
  -- Define a SET_GROUP object that builds a collection of groups that define the EWR network.
  DetectionSetGroup_RU_East = SET_GROUP:New()
--  DetectionSetGroupUS = SET_GROUP:New()
  
  -- Setup the detection and group targets to a 30km range!
  Detection_RU_East = DETECTION_AREAS:New( DetectionSetGroup_RU_East, 30000 )
--  DetectionUS = DETECTION_AREAS:New( DetectionSetGroupUS, 30000 )
  
  -- add the MOOSE SET_GROUP to the IADS, from now on Skynet will update active radars that the MOOSE SET_GROUP can use for EW detection.
  redIADS:addMooseSetGroup(DetectionSetGroup_RU_East)
--  blueIADS:addMooseSetGroup(DetectionSetGroupUS)


env.info("IADS:Loaded configuration")