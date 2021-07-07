-- Tell the log file IADS is loading
env.info("IADS: Loading configuration")

-- Create multiple IADS systems.
-- RED
redIADCyprus                    = SkynetIADS:create("RU_IADS_Cyp")

-- Add the EWRs for each sector
redIADCyprus:addEarlyWarningRadarsByPrefix(          'S_RU_IADS_EWR_Cyp')

-- Add the SAMs for each sector
redIADCyprus:addSAMSitesByPrefix(                    'S_RU_IADS_SAM_Cyp')


-------- ALEPPO CC and PP START ---------------------
--##################################################################################################################

---- Define CommandCenter Aleppo
--    local IADS_RED_Aleppo_CC      = StaticObject.getByName("RU_IADS_Aleppo_CMD_CMD1")
--    
--    -- Define PowerPlants Aleppo
--    local  IADS_RED_Aleppo_PP_1   = StaticObject.getByName("RU_IADS_Aleppo_POWER_Power1")
--    local  IADS_RED_Aleppo_PP_2   = StaticObject.getByName("RU_IADS_Aleppo_POWER_Power2")
--    local  IADS_RED_Aleppo_PP_3   = StaticObject.getByName("RU_IADS_Aleppo_POWER_Power3")
--    local  IADS_RED_Aleppo_PP_4   = StaticObject.getByName("RU_IADS_Aleppo_POWER_Power4")
--    
--
--    
---- Assign the PowerPlants to the SAM Sites and to the Command Center
--    redIADCyprus:addCommandCenter(IADS_RED_Aleppo_CC):addPowerSource(IADS_RED_Aleppo_PP_1)
-------- ALEPPO CC and PP END ---------------------


-- Each IADS sector must quickly activate and then go dark -> So the SAMs are ready to fire
redIADCyprus:setupSAMSitesAndThenActivate()


env.info("IADS: Loaded Configuration")