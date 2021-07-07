-- S-3B Recovery Tanker spawning in air. Groupname
local tanker=RECOVERYTANKER:New("AbrahamLincoln", "ShellCarrier")

--tanker:SetTakeoffAir()
tanker:SetRadio(121)
tanker:SetModex(911)
tanker:SetTACAN(21, "SHL11")
tanker:Start()

---- E-2D AWACS spawning on Stennis.
local awacs=RECOVERYTANKER:New("AbrahamLincoln", "E-2D Wizard South")
awacs:SetAWACS()
awacs:SetRadio(251)
awacs:SetAltitude(20000)
awacs:SetCallsign(CALLSIGN.AWACS.Wizard)
awacs:SetRacetrackDistances(30, 15)
awacs:SetModex(611)
awacs:__Start(1)

-- Rescue Helo with home base Lake Erie. Has to be a global object! Group name for helo
rescuehelo=RESCUEHELO:New("AbrahamLincoln", "Rescue Helo")
rescuehelo:SetHomeBase(AIRBASE:FindByName("Naval-1-4"))
rescuehelo:SetModex(42)
rescuehelo:SetTakeoffAir()
rescuehelo:__Start(1)

  
-- Create AIRBOSS object. Use Unit name
local AirbossStennis=AIRBOSS:New("AbrahamLincoln")

AirbossStennis:SetICLS(2,"ABLNCLN")
AirbossStennis:SetTACAN(72,"X","ABLNCLN")
-- Erlaubt das Einfliegen in das Landepattern ohne Marshall
AirbossStennis:SetAirbossNiceGuy(true)
-- Stackh�he setzen
AirbossStennis:SetMaxMarshalStacks(4)
AirbossStennis:SetMaxLandingPattern(6)
-- Setze Radiofrequenzen
AirbossStennis:SetMarshalRadio(250.200,"AM")
AirbossStennis:SetLSORadio(250.400,"AM")

AirbossStennis:SetMenuSingleCarrier(false)
-- Radio relay units.
AirbossStennis:SetRadioRelayLSO(tanker:GetUnitName())
AirbossStennis:SetRadioRelayMarshal("Rescue Helo")

-- Set folder of airboss sound files within miz file.
AirbossStennis:SetSoundfilesFolder("Airboss Soundfiles/")

-- Skipper menu.
AirbossStennis:SetMenuRecovery(90, 20, true)

-- Carrier f�hrt nach letztem WP zum ersten.
AirbossStennis:SetPatrolAdInfinitum(true)

---- Remove landed AI planes from flight deck.
--AirbossStennis:SetDespawnOnEngineShutdown()

-- Load all saved player grades from your "Saved Games\DCS" folder (if lfs was desanitized).
AirbossStennis:Load()

-- Automatically save player results to your "Saved Games\DCS" folder each time a player get a final grade from the LSO.
AirbossStennis:SetAutoSave()

-- Enable trap sheet.
AirbossStennis:SetTrapSheet()

-- Set recovery tanker.
AirbossStennis:SetRecoveryTanker(tanker)

---- Set AWACS.
AirbossStennis:SetAWACS(awacs)

AirbossStennis:SetHandleAIOFF()

AirbossStennis:SetInitialMaxAlt(1500)
AirbossStennis:SetStaticWeather(true)

-- Start airboss class.
AirbossStennis:Start()


-- ##############################################


