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
redIADSAleppo                    = SkynetIADS:create("RU_IADS_Aleppo")
redIADSDamascus                  = SkynetIADS:create("RU_IADS_Damascus")
redIADSPalmyra                   = SkynetIADS:create("RU_IADS_Palmyra")
redIADSHoms                      = SkynetIADS:create("RU_IADS_Homs")
redIADSHama                      = SkynetIADS:create("RU_IADS_Hama")
redIADSBasselAlAssad             = SkynetIADS:create("RU_IADS_BasselAlAssad")


-- Add the EWRs for each sector
redIADSAleppo:addEarlyWarningRadarsByPrefix(          'S_RU_IADS_EWR_Aleppo')
redIADSDamascus:addEarlyWarningRadarsByPrefix(        'S_RU_IADS_EWR_Damascus')
redIADSPalmyra:addEarlyWarningRadarsByPrefix(         'S_RU_IADS_EWR_Palmyra')
redIADSHoms:addEarlyWarningRadarsByPrefix(            'S_RU_IADS_EWR_Homs')
redIADSHama:addEarlyWarningRadarsByPrefix(            'S_RU_IADS_EWR_Hama')
redIADSBasselAlAssad:addEarlyWarningRadarsByPrefix(   'S_RU_IADS_EWR_BasselAlAssad')


-- Add the SAMs for each sector
redIADSAleppo:addSAMSitesByPrefix(                    'S_RU_IADS_SAM_Aleppo')
redIADSDamascus:addSAMSitesByPrefix(                  'S_RU_IADS_EWR_Damascus')
redIADSPalmyra:addSAMSitesByPrefix(                   'S_RU_IADS_EWR_Palmyra')
redIADSHoms:addSAMSitesByPrefix(                      'S_RU_IADS_EWR_Homs')
redIADSHama:addSAMSitesByPrefix(                      'S_RU_IADS_EWR_Hama')
redIADSBasselAlAssad:addSAMSitesByPrefix(             'S_RU_IADS_EWR_BasselAlAssad')


-------- ALEPPO CC and PP START ---------------------
--##################################################################################################################

-- Define CommandCenter Aleppo
    local IADS_RED_Aleppo_CC      = StaticObject.getByName("RU_IADS_Aleppo_CMD_CMD1")
    
    -- Define PowerPlants Aleppo
    local  IADS_RED_Aleppo_PP_1   = StaticObject.getByName("RU_IADS_Aleppo_POWER_Power1")
    local  IADS_RED_Aleppo_PP_2   = StaticObject.getByName("RU_IADS_Aleppo_POWER_Power2")
    local  IADS_RED_Aleppo_PP_3   = StaticObject.getByName("RU_IADS_Aleppo_POWER_Power3")
    local  IADS_RED_Aleppo_PP_4   = StaticObject.getByName("RU_IADS_Aleppo_POWER_Power4")
    
-- Assign the PowerPlants to the SAM Sites and to the Command Center
    redIADSAleppo:addCommandCenter(IADS_RED_Aleppo_CC):addPowerSource(IADS_RED_Aleppo_PP_1)
    --redIADSAleppo:getSAMSiteByGroupName(          "S_RU_IADS_SAM_Aleppo_SA2#2"):addPowerSource(IADS_RED_Aleppo_PP_3)
    --redIADSAleppo:getSAMSiteByGroupName(          "S_RU_IADS_SAM_Aleppo_SA2#3-1"):addPowerSource(IADS_RED_Aleppo_PP_2)
    --redIADSAleppo:getSAMSiteByGroupName(          "S_RU_IADS_SAM_Aleppo_SA2#3"):addPowerSource(IADS_RED_Aleppo_PP_1)
    --redIADSAleppo:getEarlyWarningRadarByUnitName( 'S_RU_IADS_EWR_Aleppo_EWR-1'):addPowerSource(IADS_RED_Aleppo_PP_4)
-------- ALEPPO CC and PP END ---------------------







-------- DAMASCUS CC and PP START------------------
--##################################################################################################################
-- Define CC Damascus
  local IADS_RED_Damascus_CC   = StaticObject.getByName(     "RU_IADS_Damascus_CC1")
  
-- Define PowerPlants Damascus
  local IADS_RED_Damascus_PP_1 = StaticObject.getByName(      "RU_IADS_Damascus_Power-1")
  local IADS_RED_Damascus_PP_2 = StaticObject.getByName(      "RU_IADS_Damascus_Power-2")
  
-- Assign the PowerPlants to the SAM Sites and to the Command Center
    redIADSDamascus:addCommandCenter(IADS_RED_Damascus_CC):addPowerSource(IADS_RED_Damascus_PP_1):addPowerSource(IADS_RED_Damascus_PP_2)

-------- DAMASCUS CC and PP END -------------------





-------- Palmyra CC and PP START------------------
--##################################################################################################################
-- Define CommandCenter Aleppo
    local IADS_RED_Palmyra_CC      = StaticObject.getByName("RU_IADS_Palmyra_CMD_CMD1")
    
    -- Define PowerPlants Aleppo
    local  IADS_RED_Palmyra_PP_1   = StaticObject.getByName("RU_IADS_Palmyra_POWER_Power1")
    local  IADS_RED_Palmyra_PP_2   = StaticObject.getByName("RU_IADS_Palmyra_POWER_Power2")
    
-- Assign the PowerPlants to the SAM Sites and to the Command Center
    redIADSPalmyra:addCommandCenter(IADS_RED_Palmyra_CC):addPowerSource(IADS_RED_Palmyra_PP_1):addPowerSource(IADS_RED_Palmyra_PP_2)
-------- Palmyra CC and PP END -------------------


-------- Homs CC and PP START------------------
--##################################################################################################################
-- Define CommandCenter Homs
    local IADS_RED_Homs_CC      = StaticObject.getByName("RU_IADS_Homs_CMD_CMD1")
    
    -- Define PowerPlants Homs
    local  IADS_RED_Homs_PP_1   = StaticObject.getByName("RU_IADS_Homs_POWER_Power1")
    local  IADS_RED_Homs_PP_2   = StaticObject.getByName("RU_IADS_Homs_POWER_Power2")
    
-- Assign the PowerPlants to the SAM Sites and to the Command Center
    redIADSHoms:addCommandCenter(IADS_RED_Homs_CC):addPowerSource(IADS_RED_Homs_PP_1):addPowerSource(IADS_RED_Homs_PP_2)
-------- Homs CC and PP END -------------------



-------- Hama CC and PP START------------------
--##################################################################################################################
-- Define CommandCenter Hama
    local IADS_RED_Hama_CC      = StaticObject.getByName("RU_IADS_Hama_CMD_CMD1")
    
    -- Define PowerPlants Hama
    local  IADS_RED_Hama_PP_1   = StaticObject.getByName("RU_IADS_Hama_POWER_Power1")
    local  IADS_RED_Hama_PP_2   = StaticObject.getByName("RU_IADS_Hama_POWER_Power2")
    
-- Assign the PowerPlants to the SAM Sites and to the Command Center
    redIADSHoms:addCommandCenter(IADS_RED_Hama_CC):addPowerSource(IADS_RED_Hama_PP_1):addPowerSource(IADS_RED_Hama_PP_2)
-------- Hama CC and PP END -------------------




---------- BasselAlAssad  CC and PP START------------------
--##################################################################################################################
-- Define CommandCenter BasselAlAssad 
    local IADS_RED_BasselAlAssad_CC      = StaticObject.getByName("RU_IADS_BasselAlAssad_CMD_CMD1")
    
    -- Define PowerPlants BasselAlAssad 
    local  IADS_RED_BasselAlAssad_PP_1   = StaticObject.getByName("RU_IADS_BasselAlAssad_POWER_Power1")
    local  IADS_RED_BasselAlAssad_PP_2   = StaticObject.getByName("RU_IADS_BasselAlAssad_POWER_Power2")
    
-- Assign the PowerPlants to the SAM Sites and to the Command Center
    redIADSHoms:addCommandCenter(IADS_RED_BasselAlAssad_CC):addPowerSource(IADS_RED_BasselAlAssad_PP_1):addPowerSource(IADS_RED_BasselAlAssad_PP_2)
-------- BasselAlAssad  CC and PP END -------------------





-- Each IADS sector must quickly activate and then go dark -> So the SAMs are ready to fire
redIADSAleppo:setupSAMSitesAndThenActivate()
redIADSDamascus:setupSAMSitesAndThenActivate()
redIADSPalmyra:setupSAMSitesAndThenActivate()
redIADSHoms:setupSAMSitesAndThenActivate()
redIADSHama:setupSAMSitesAndThenActivate()
redIADSBasselAlAssad:setupSAMSitesAndThenActivate()


local iadsDebug = redIADSAleppo:getDebugSettings()  
iadsDebug.IADSStatus = true
iadsDebug.samWentDark = true
iadsDebug.radarWentLive = true
iadsDebug.ewRadarNoConnection = true
iadsDebug.samNoConnection = true
iadsDebug.addedEWRadar = true
iadsDebug.hasNoPower = true
iadsDebug.addedSAMSite = true
iadsDebug.warnings = true
iadsDebug.samSiteStatusEnvOutput = true
iadsDebug.earlyWarningRadarStatusEnvOutput = true






env.info("IADS: Loaded Configuration")