env.info("IADS:Loading Red West configuration")

redIADS = SkynetIADS:create("Russian West IADS")
redIADS:addEarlyWarningRadarsByPrefix('S_IADS_Red_West_EWR')
redIADS:addSAMSitesByPrefix('S_IADS_Red_SAM_West')
redIADS:addRadioMenu()
redIADS:setupSAMSitesAndThenActivate()


env.info("IADS:Loaded Red West configuration") 