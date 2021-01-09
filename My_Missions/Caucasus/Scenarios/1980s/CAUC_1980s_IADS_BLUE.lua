env.info("IADS:Loading Blue configuration")

blueIADS = SkynetIADS:create("American IADS")
blueIADS:addEarlyWarningRadarsByPrefix('S_IADS_BLUE_EWR')
blueIADS:addSAMSitesByPrefix('S_IADS_Blue_SAM')


blueIADS:addRadioMenu()
blueIADS:setupSAMSitesAndThenActivate()
local commandCenterUS = StaticObject.getByName("C_IADS_South")
local comPowerSourceUS = StaticObject.getByName("P_IADS_East_1-1")
blueIADS:addCommandCenter(commandCenterUS):addPowerSource(comPowerSourceUS)
blueIADS:getSAMSites():setAutonomousBehaviour(SkynetIADSAbstractRadarElement.AUTONOMOUS_STATE_DARK):addPowerSource(comPowerSourceUS)
blueIADS:getEarlyWarningRadars():addPowerSource(comPowerSourceUS)

blueIADS:activate()


env.info("IADS:Loaded Blue configuration")  



