


-- Create AIRBOSS object. Use Unit name
local AirbossStennis=AIRBOSS:New("CVN-74 Stennis")

AirbossStennis:SetICLS(7,"STN")
AirbossStennis:SetTACAN(74,"X","STN")
-- Erlaubt das Einfliegen in das Landepattern ohne Marshall
AirbossStennis:SetAirbossNiceGuy(true)
-- Stackhöhe setzen
AirbossStennis:SetMaxMarshalStacks(4)
AirbossStennis:SetMaxLandingPattern(6)
-- Setze Radiofrequenzen
AirbossStennis:SetMarshalRadio(250.200,"AM")
AirbossStennis:SetLSORadio(250.400,"AM")
AirbossStennis:SetMenuSingleCarrier(true)

--AirbossStennis:SetCollisionDistance(dist,distance)

-- Radio relay units.
AirbossStennis:SetRadioRelayLSO(tanker:GetUnitName())
AirbossStennis:SetRadioRelayMarshal("ShellCarrier")

-- Set folder of airboss sound files within miz file.
AirbossStennis:SetSoundfilesFolder("Airboss Soundfiles/")

-- Skipper menu.
AirbossStennis:SetMenuRecovery(60, 20, true)

-- Carrier fährt nach letztem WP zum ersten.
AirbossStennis:SetPatrolAdInfinitum(true)

-- Remove landed AI planes from flight deck.
AirbossStennis:SetDespawnOnEngineShutdown()


-- Set recovery tanker.
AirbossStennis:SetRecoveryTanker(tanker)

---- Set AWACS.
--AirbossStennis:SetAWACS(awacs)

AirbossStennis:SetHandleAION()

AirbossStennis:SetInitialMaxAlt(1500)
--AirbossStennis:SetRefuelAI(20)
AirbossStennis:SetStaticWeather(false)

-- Start airboss class.
AirbossStennis:Start()