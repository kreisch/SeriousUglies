----
--
-- ---------IADS 
-- --- BLUE
-- 
-- Sektoren:
-- Incirlik / NW / Bereich Türkei
-- 
-- 
-- Support:
-- US_IADS_Comm_Tower1_Incirlik
-- US_IADS_Comm_Tower2_Incirlik
-- US_IADS_Power_Plant1_Incirlik
-- US_IADS_Power_Plant2_Incirlik
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
-- Aleppo
-- Damascus
-- Palmyra
-- Homs
--

-- Tell the log file IADS is loading
env.info("IADS: Loading configuration")

-- Create multiple IADS systems. One for each sector
redIADSAleppo           = SkynetIADS:create("RU_IADS_Aleppo")
redIADSMilresearchbase  = SkynetIADS:create("RU_IADS_Milresearchbase")


-- Add the EWRs for each sector
redIADSAleppo:addEarlyWarningRadarsByPrefix('RU_IADS_EWR_Aleppo')
redIADSAleppo:addSAMSitesByPrefix('RU_IADS_SAM_Aleppo')


-- Define CommandCenter Aleppo
local Aleppo_CommandCenter = StaticObject.getByName("RU_IADS_Aleppo_CMD_CMD1")
-- Define PowerPlants
local  Aleppo_PowerPlant_1 = StaticObject.getByName("RU_IADS_Aleppo_POWER_Power1")
local  Aleppo_PowerPlant_2 = StaticObject.getByName("RU_IADS_Aleppo_POWER_Power2")
local  Aleppo_PowerPlant_3 = StaticObject.getByName("RU_IADS_Aleppo_POWER_Power3")
-- Assign the PowerPlants to the SAM Sites and to the Command Center
redIADSAleppo:addCommandCenter(Aleppo_CommandCenter):addPowerSource(Aleppo_PowerPlant_1)
redIADSAleppo:getSAMSiteByGroupName("RU_IADS_SAM_Aleppo_SA2#2"):addPowerSource(Aleppo_PowerPlant_3)
redIADSAleppo:getSAMSiteByGroupName("RU_IADS_SAM_Aleppo_SA2"):addPowerSource(Aleppo_PowerPlant_2)
redIADSAleppo:getSAMSiteByGroupName("RU_IADS_SAM_Aleppo_SA2#3"):addPowerSource(Aleppo_PowerPlant_1)



---- Define CAP for ALEPPO
-- 
-- RU_CAP_Aleppo_Mig21

DetectionSetGroupAleppo = SET_GROUP:New()


-- Each IADS sector must quickly activate and then go dark -> So the SAMs are ready to fire
redIADSAleppo:setupSAMSitesAndThenActivate()
redIADSMilresearchbase:setupSAMSitesAndThenActivate()


env.info("IADS: Loaded Configuration")