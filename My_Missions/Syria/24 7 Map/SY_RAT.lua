------ This is the RANDOM AIR TRAFFIC script for the syria map.
-- It creates random flights using the templates defined in the mission
-- 
-- 
-- 
-- 
-- 
-- 
-- RED Section
-- 
env.info("RAT: Loading configuration")
local RU_RAT_IL76 = RAT:New("RU_RAT_IL76")
RU_RAT_IL76:SetTakeoff("cold")
RU_RAT_IL76:ContinueJourney()
RU_RAT_IL76:SetCoalition("sameonly")
RU_RAT_IL76:SpawnScheduled(120,0.5):InitLimit(1,0):SpawnScheduleStart()

local RU_RAT_AN30M = RAT:New("RU_RAT_AN30M")
RU_RAT_AN30M:SetTakeoff("cold")
RU_RAT_AN30M:ContinueJourney()
RU_RAT_AN30M:SetCoalition("sameonly")
RU_RAT_AN30M:SpawnScheduled(240,0.5):InitLimit(3,0):SpawnScheduleStart()

local RU_RAT_AN26B = RAT:New("RU_RAT_AN26B")
RU_RAT_AN26B:SetTakeoff("cold")
RU_RAT_AN26B:ContinueJourney()
RU_RAT_AN26B:SetCoalition("sameonly")
RU_RAT_AN26B:RespawnAfterCrashON()
RU_RAT_AN26B:SpawnScheduled(360,0.5):InitLimit(2,0):SpawnScheduleStart()

---------
-- BLUE Section

local US_RAT_C130 = RAT:New("US_RAT_C130")
US_RAT_C130:SetTakeoff("cold")
US_RAT_C130:SetDeparture( {"Incirlik","Beirut-Rafic Hariri"})
US_RAT_C130:SetDestination( {"Incirlik","Beirut-Rafic Hariri"})
US_RAT_C130:ContinueJourney()
US_RAT_C130:SetCoalition("sameonly")
US_RAT_C130:SpawnScheduled(360,0.5):InitLimit(1,0):SpawnScheduleStart()

local US_RAT_C17 = RAT:New("US_RAT_C17")
US_RAT_C17:SetTakeoff("cold")
US_RAT_C17:SetDeparture( {"Incirlik","Beirut-Rafic Hariri"})
US_RAT_C17:SetDestination( {"Incirlik","Beirut-Rafic Hariri"})
US_RAT_C17:ContinueJourney()
US_RAT_C17:SetCoalition("sameonly")
US_RAT_C17:SpawnScheduled(400,0.5):InitLimit(1,0):SpawnScheduleStart()

local US_RAT_UH60 = RAT:New("US_RAT_UH60")
US_RAT_UH60:SetTakeoff("cold")
US_RAT_UH60:SetDeparture( {"US_CSG11_Tarawa"})
US_RAT_UH60:SetDestination( {"US_FARP_London"})
US_RAT_UH60:ExcludedAirports("CVN-72 Lincoln")
US_RAT_UH60:ContinueJourney()
US_RAT_UH60:SetCoalition("sameonly")
US_RAT_UH60:SpawnScheduled(100,0.5):InitLimit(1,0):SpawnScheduleStart()

local US_RAT_CH53 = RAT:New("US_RAT_CH53")
US_RAT_CH53:SetTakeoff("cold")
US_RAT_CH53:SetDeparture( {"US_CSG11_Tarawa","Incirlik"})
US_RAT_CH53:SetDestination( {"US_FARP_London" })
US_RAT_CH53:ExcludedAirports("CVN-72 Lincoln")
US_RAT_CH53:ContinueJourney()
US_RAT_CH53:SetCoalition("sameonly")
US_RAT_CH53:SpawnScheduled(600,0.5):InitLimit(2,0):SpawnScheduleStart()

env.info("RAT: Loaded configuration")
