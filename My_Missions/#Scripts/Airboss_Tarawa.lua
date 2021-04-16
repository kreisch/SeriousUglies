env.info("AIRBOSS: Loading configuration Tarawa")


-- Rescue Helo with home base Lake Erie. Has to be a global object! Group name for helo
rescuehelo2=RESCUEHELO:New("LHA-1 Tarawa", "Rescue Helo LHA-1 Tarawa")
rescuehelo2:SetHomeBase(AIRBASE:FindByName("LHA-1 Tarawa"))
rescuehelo2:SetModex(41)
rescuehelo2:SetTakeoffCold()
rescuehelo2:__Start(1)



-- Create AIRBOSS object. Use Unit name
local AirbossTRW=AIRBOSS:New("LHA-1 Tarawa")
AirbossTRW:SetICLS(9,"TRW")
AirbossTRW:SetTACAN(69,"X","TRW")
-- Erlaubt das Einfliegen in das Landepattern ohne Marshall
AirbossTRW:SetAirbossNiceGuy(true)
-- Stackhöhe setzen
AirbossTRW:SetMaxMarshalStacks(4)
AirbossTRW:SetMaxLandingPattern(6)
-- Setze Radiofrequenzen
AirbossTRW:SetMarshalRadio(127.600,"AM")
AirbossTRW:SetLSORadio(127.600,"AM")


-- Radio relay units.
AirbossTRW:SetRadioRelayLSO("Rescue Helo LHA-1 Tarawa")
AirbossTRW:SetRadioRelayMarshal("Rescue Helo LHA-1 Tarawa")

-- Set folder of airboss sound files within miz file.
AirbossTRW:SetSoundfilesFolder("Airboss Soundfiles/")

-- Skipper menu.
AirbossTRW:SetMenuRecovery(90, 20, true)

-- Carrier fährt nach letztem WP zum ersten.
AirbossTRW:SetPatrolAdInfinitum(true)

-- Remove landed AI planes from flight deck.
AirbossTRW:SetDespawnOnEngineShutdown()

---- Load all saved player grades from your "Saved Games\DCS" folder (if lfs was desanitized).
--AirbossGWashington:Load()
--
---- Automatically save player results to your "Saved Games\DCS" folder each time a player get a final grade from the LSO.
--AirbossGWashington:SetAutoSave()
--
---- Enable trap sheet.
--AirbossGWashington:SetTrapSheet()


AirbossTRW:SetHandleAION()

AirbossTRW:SetInitialMaxAlt(1500)
AirbossTRW:SetRefuelAI(15)
AirbossTRW:SetStaticWeather(true)


-- Start airboss class.
AirbossTRW:Start()

env.info("AIRBOSS: Loaded configuration Tarawa")