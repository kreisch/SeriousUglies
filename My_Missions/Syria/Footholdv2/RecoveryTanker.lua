-- S-3B Recovery Tanker spawning in air. Groupname
local recoveryTanker=RECOVERYTANKER:New("GeorgeWashington", "RecoveryTanker")
--tanker:SetTakeoffAir()
recoveryTanker:SetRadio(122)
recoveryTanker:SetModex(912)
recoveryTanker:SetTACAN(22, "SHL21")
recoveryTanker:SetTakeoffCold()
recoveryTanker:Start()

rescuehelo=RESCUEHELO:New("USS Rafael Peralta", "RescueHelo")
rescuehelo:SetHomeBase(AIRBASE:FindByName("USS Rafael Peralta"))
rescuehelo:SetModex(41)
rescuehelo:SetTakeoffAir()
rescuehelo:__Start(1)