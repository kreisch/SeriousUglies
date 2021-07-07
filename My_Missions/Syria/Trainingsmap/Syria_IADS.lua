--- Updated by kreisch 18.04.2021

env.info("IADS: Loading configuration")


--Create Syria IADS
redIADS = SkynetIADS:create('Syria')
blueIADS = SkynetIADS:create('Israel')

--Add EWRs to IADS
redIADS:addEarlyWarningRadarsByPrefix('IADS_RED_EWR')
blueIADS:addEarlyWarningRadarsByPrefix('IADS_BLUE_EWR')

--Add SAMs to IADS
redIADS:addSAMSitesByPrefix('IADS_RED_SAM')
blueIADS:addSAMSitesByPrefix('IADS_BLUE_SAM')

-- Reduce Performance impact and lower the reaction time
redIADS:setUpdateInterval(15)
blueIADS:setUpdateInterval(15)


-- Set specific range
redIADS:getSAMSitesByNatoName('SA-2'):setGoLiveRangeInPercent(80)
redIADS:getSAMSitesByNatoName('SA-3'):setGoLiveRangeInPercent(80)
redIADS:getSAMSitesByNatoName('SA-10'):setGoLiveRangeInPercent(80)

-- Each IADS sector must quickly activate and then go dark -> So the SAMs are ready to fire
redIADS:setupSAMSitesAndThenActivate()
blueIADS:setupSAMSitesAndThenActivate()


env.info("IADS: Loaded Configuration")