
-- S-3B Recovery Tanker spawning in air. Groupname
local tanker2=RECOVERYTANKER:New("CVN-73 George Washington", "ShellCarrier GWashington")
--tanker:SetTakeoffAir()
tanker2:SetRadio(267)
tanker2:SetModex(912)
tanker2:SetTACAN(67, "SHL")
tanker2:Start()

---- E-2D AWACS spawning on Stennis.
local awacs2=RECOVERYTANKER:New("CVN-73 George Washington", "E-2D Wizard North")
awacs2:SetAWACS()
awacs2:SetRadio(251)
awacs2:SetAltitude(20000)
awacs2:SetCallsign(CALLSIGN.AWACS.Wizard)
awacs2:SetRacetrackDistances(30, 15)
awacs2:SetModex(611)
awacs2:__Start(1)

-- Rescue Helo with home base Lake Erie. Has to be a global object! Group name for helo
rescuehelo2=RESCUEHELO:New("CVN-73 George Washington", "Rescue Helo GWashington")
rescuehelo2:SetHomeBase(AIRBASE:FindByName("Unit #118"))
rescuehelo2:SetModex(41)
rescuehelo2:SetTakeoffAir()
rescuehelo2:__Start(1)



-- Create AIRBOSS object. Use Unit name
local AirbossGWashington=AIRBOSS:New("CVN-73 George Washington")
AirbossGWashington:SetDebugModeON()

AirbossGWashington:SetICLS(7,"STN")
AirbossGWashington:SetTACAN(73,"X","STN")
-- Erlaubt das Einfliegen in das Landepattern ohne Marshall
AirbossGWashington:SetAirbossNiceGuy(true)
-- Stackhöhe setzen
AirbossGWashington:SetMaxMarshalStacks(4)
AirbossGWashington:SetMaxLandingPattern(6)
-- Setze Radiofrequenzen
AirbossGWashington:SetMarshalRadio(250.600,"AM")
AirbossGWashington:SetLSORadio(250.800,"AM")


-- Radio relay units.
AirbossGWashington:SetRadioRelayLSO(tanker2:GetUnitName())
AirbossGWashington:SetRadioRelayMarshal("E-2D Wizard North")

-- Set folder of airboss sound files within miz file.
AirbossGWashington:SetSoundfilesFolder("Airboss Soundfiles/")

-- Skipper menu.
AirbossGWashington:SetMenuRecovery(90, 20, true)

-- Carrier fährt nach letztem WP zum ersten.
AirbossGWashington:SetPatrolAdInfinitum(true)

-- Remove landed AI planes from flight deck.
AirbossGWashington:SetDespawnOnEngineShutdown()

-- Load all saved player grades from your "Saved Games\DCS" folder (if lfs was desanitized).
AirbossGWashington:Load()

-- Automatically save player results to your "Saved Games\DCS" folder each time a player get a final grade from the LSO.
AirbossGWashington:SetAutoSave()

-- Enable trap sheet.
AirbossGWashington:SetTrapSheet()

-- Set recovery tanker.
AirbossGWashington:SetRecoveryTanker(tanker2)

-- Set AWACS.
AirbossGWashington:SetAWACS(awacs2)

--AirbossGWashington:SetHandleAION()

AirbossGWashington:SetInitialMaxAlt(1500)
AirbossGWashington:SetRefuelAI(15)
AirbossGWashington:SetStaticWeather(false)


-- Start airboss class.
AirbossGWashington:Start()