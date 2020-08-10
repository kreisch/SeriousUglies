----
--
-- ---------IADS 
-- --- BLUE
-- 
-- Sektoren:
-- Incirlik / NW / Bereich Türkei     -- US_BORDER_Incirlik_CAP
-- Incirlik                           -- US_BORDER_Incirlik_GCI
-- 
-- Support:
-- US_IADS_Comm_Incirlik_Tower1
-- US_IADS_Comm_Incirlik_Tower2
-- US_IADS_Power_Incirlik_Plant1
-- US_IADS_Power_Incirlik_Plant2
-- 
-- SAMs:
-- US_IADS_SAM_Incirlik_Patriot1
-- US_IADS_SAM_Adana_Rapier1
-- 
-- EWRs:
-- US_IADS_EWR_Incirlik_1
-- 
-- 
-- 
-- --- RED
-- Sektoren:
-- Aleppo                             -- RU_BORDER_Aleppo_GCI
-- Damascus
-- Palmyra                            -- RU_BORDER_Central_CAP
-- Homs
--

-- Tell the log file IADS is loading
env.info("IADS: Loading configuration")

-- Create multiple IADS systems.
-- BLUE




-- Create multiple IADS systems.
-- RED
redIADSAleppo           = SkynetIADS:create("RU_IADS_Aleppo")
redIADSDamascus         = SkynetIADS:create("RU_IADS_Damascus")
redIADSPalmyra          = SkynetIADS:create("RU_IADS_Palmyra")
redIADSHoms             = SkynetIADS:create("RU_IADS_Homs")


-- Add the EWRs for each sector
redIADSAleppo:addEarlyWarningRadarsByPrefix('RU_IADS_EWR_Aleppo')
redIADSPalmyra:addEarlyWarningRadarsByPrefix('RU_IADS_EWR_Palmyra')


-- Add the SAMs for each sector
redIADSAleppo:addSAMSitesByPrefix('RU_IADS_SAM_Aleppo')
redIADSPalmyra:addSAMSitesByPrefix('RU_IADS_SAM_Palmyra')

redIADSAleppo:addRadioMenu()
redIADSPalmyra:addRadioMenu()

-------- ALEPPO CC and PP START ---------------------
-- Define CommandCenter Aleppo
    local IADS_RED_Aleppo_CC = StaticObject.getByName("RU_IADS_Aleppo_CMD_CMD1")
    -- Define PowerPlants
    local  IADS_RED_Aleppo_PP_1 = StaticObject.getByName("RU_IADS_Aleppo_POWER_Power1")
    local  IADS_RED_Aleppo_PP_2 = StaticObject.getByName("RU_IADS_Aleppo_POWER_Power2")
    local  IADS_RED_Aleppo_PP_3 = StaticObject.getByName("RU_IADS_Aleppo_POWER_Power3")
    local  IADS_RED_Aleppo_PP_4 = StaticObject.getByName("RU_IADS_Aleppo_POWER_Power4")
-- Assign the PowerPlants to the SAM Sites and to the Command Center
    redIADSAleppo:addCommandCenter(IADS_RED_Aleppo_CC):addPowerSource(IADS_RED_Aleppo_PP_1)
    redIADSAleppo:getSAMSiteByGroupName("RU_IADS_SAM_Aleppo_SA2#2"):addPowerSource(IADS_RED_Aleppo_PP_3)
    redIADSAleppo:getSAMSiteByGroupName("RU_IADS_SAM_Aleppo_SA2"):addPowerSource(IADS_RED_Aleppo_PP_2)
    redIADSAleppo:getSAMSiteByGroupName("RU_IADS_SAM_Aleppo_SA2#3"):addPowerSource(IADS_RED_Aleppo_PP_1)
    redIADSAleppo:getEarlyWarningRadarByUnitName('RU_IADS_EWR_Aleppo_EWR-1'):addPowerSource(IADS_RED_Aleppo_PP_4)
-------- ALEPPO CC and PP END ---------------------


---- Define CAP for ALEPPO
-- 
-- RU_CAP_Aleppo_Mig21

DetectionSetGroupAleppo = SET_GROUP:New()


--

-- Each IADS sector must quickly activate and then go dark -> So the SAMs are ready to fire
redIADSAleppo:setupSAMSitesAndThenActivate()
redIADSPalmyra:setupSAMSitesAndThenActivate()


env.info("IADS: Loaded Configuration")