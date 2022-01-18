-- Tell the log file IADS is loading
env.info("IADS: Loading configuration")

-- Create multiple IADS systems.
-- RED
redIADS                    = SkynetIADS:create("RED_IADS_Nightmare")
-- Add the EWRs for each sector
redIADS:addEarlyWarningRadarsByPrefix(          'RED_EWR')
-- Add the SAMs for each sector
redIADS:addSAMSitesByPrefix(                    'RED_SAM')


-- Each IADS sector must quickly activate and then go dark -> So the SAMs are ready to fire
redIADS:setupSAMSitesAndThenActivate()


env.info("IADS: Loaded Configuration")