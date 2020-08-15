------ This is the RANDOM AIR TRAFFIC script for the syria map.
-- It creates random flights using the templates defined in the mission
-- 
-- 
-- 
-- 
-- 
-- 
-- RED Section
local RU_RAT_IL76 = RAT:New("RU_RAT_IL76")
RU_RAT_IL76:SetTakeoff("cold")
RU_RAT_IL76:ContinueJourney()
RU_RAT_IL76:SetCoalition("sameonly")
RU_RAT_IL76:Spawn(6)

local RU_RAT_AN30M = RAT:New("RU_RAT_AN30M")
RU_RAT_AN30M:SetTakeoff("cold")
RU_RAT_AN30M:ContinueJourney()
RU_RAT_AN30M:SetCoalition("sameonly")
RU_RAT_AN30M:Spawn(6)

local RU_RAT_AN26B = RAT:New("RU_RAT_AN26B")
RU_RAT_AN26B:SetTakeoff("cold")
RU_RAT_AN26B:ContinueJourney()
RU_RAT_AN26B:SetCoalition("sameonly")
RU_RAT_AN26B:RespawnAfterCrashON()
RU_RAT_AN26B:SpawnScheduled(30,0.5):SpawnScheduleStart()