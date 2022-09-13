-- AIRBOSS DOC https://flightcontrol-master.github.io/MOOSE_DOCS_DEVELOP/Documentation/Ops.Airboss.html

--AIRBOSS SETTINGS
-- airboss_enable = true

-- airboss_enable_markzones = true

-- airboss_enable_smokezones = true

-- airboss_enable_niceguy = true

-- airboss_enable_tanker = true

-- airboss_enable_rescue_helo = true

if airboss_enable == true and mission_era == "modern" and env.mission.theatre ~= "Nevada" then

local airbossCVN = AIRBOSS:New("CVN-7X", "CVN-7X")

airbossCVN:SetTACAN(43, "X", "CVN")
airbossCVN:SetICLS(5, "LSO")
airbossCVN:SetLSORadio(261)
airbossCVN:SetMarshalRadio(261)
airbossCVN:SetPatrolAdInfinitum(true)
airbossCVN:SetCarrierControlledArea(45)
airbossCVN:SetStaticWeather(true)
airbossCVN:SetMenuSingleCarrier()
airbossCVN:SetRecoveryCase(1)
airbossCVN:SetMaxLandingPattern(3)
airbossCVN:SetDefaultPlayerSkill(AIRBOSS.Difficulty.NORMAL) -- other options EASY / HARD
airbossCVN:SetHandleAIOFF()
airbossCVN:SetMenuRecovery(30, 20, true)
airbossCVN:SetMenuMarkZones(airboss_enable_markzones)
airbossCVN:SetMenuSmokeZones(airboss_enable_smokezones)
airbossCVN:SetAirbossNiceGuy(airboss_enable_niceguy)
airbossCVN:SetRadioRelayMarshal("CVN7X Relay")
airbossCVN:SetRadioRelayLSO("CVN7X Relay")
airbossCVN:SetSoundfilesFolder("Airboss Soundfiles/")
--airbossCVN:Load(nil, "Greenie Board.csv")
--airbossCVN:SetAutoSave(nil, "Greenie Board.csv")

-- create fake recovery window at the end of the mission play
local window1 = airbossCVN:AddRecoveryWindow("07:31", "23:55", 1, 0, false)

airbossCVN:Start()

if airboss_enable_tanker == true then
local carrierTanker = nil  --Ops.RecoveryTanker#RECOVERYTANKER
carrierTanker = RECOVERYTANKER:New("CVN-7X", "CVNTanker")
carrierTanker:SetTakeoffHot()
carrierTanker:SetTACAN(31, "KST")
carrierTanker:SetRadio(253, "AM")
carrierTanker:SetRespawnOn()
carrierTanker:Start()
airbossCVN:SetRecoveryTanker(CVNTanker)
end

if airboss_enable_rescue_helo == true then
local RescueheloStennis=RESCUEHELO:New(UNIT:FindByName("CVN-7X"), "CVNRescue")
RescueheloStennis:SetTakeoffHot()
RescueheloStennis:Start()
end

env.info('Airboss ... OK')
trigger.action.outText("AIRBOSS scripts Loaded...", 10)
-- ADD TO CONFIG FILE
-- airboss_enable_markzones = true
-- airboss_enable_smokezones = true
-- airboss_enable_niceguy = true

	timer.scheduleFunction(function() 
	trigger.action.outText(	"<< If the AIRBOSS option does not appear in your F10 - Other Menu, try switching slots a few times and you will get the AIRBOSS message popups! Check the AIRBOSS documentation (link in briefing for more info) >>", 30)
	end, nil, timer.getTime() + 30  )

end

if airboss_enable == false then

	timer.scheduleFunction(function() 
	trigger.action.outText("AIRBOSS script disabled...", 10)
	end, nil, timer.getTime() + 8  )

end

if mission_era == "modern" and env.mission.theatre ~= "Nevada" then
Group.getByName("CVN7X Relay"):activate()
end

-- SETUP:

-- Carrier needs to be nammed "Stennis" (UNIT NAME not GROUP, you can do both if that helps.)
-- S-3B tanker added to the map and needs to be named "StennisTanker" and set on the map as late activation (UNIT NAME not GROUP, you can do both if that helps.)
-- recovery helo added to the map needs to be named "StennisRescue" and set on the map as late activation. (UNIT NAME not GROUP, you can do both if that helps.)