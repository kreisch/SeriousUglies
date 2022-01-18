-- SET_ZONES for initializing CHIEF
local BlueBorderZones = SET_ZONE:New():FilterPrefixes("BlueBorderZone"):FilterOnce()
local BlueAttackZones = SET_ZONE:New():FilterPrefixes("BlueAttackZone"):FilterOnce()
local BlueStrategicZone = OPSZONE:New("StrategicZoneBlue", coalition.side.RED)


local ReconZone = SET_ZONE:New():FilterPrefixes("ReconZone"):FilterOnce()

local RedBorderZones = SET_ZONE:New():FilterPrefixes("RedBorderZone"):FilterOnce()
local RedAttackZones = SET_ZONE:New():FilterPrefixes("RedAttackZone"):FilterOnce()
local RedIntelProviders = SET_GROUP:New():FilterCoalitions(coalition.side.RED):FilterStart()


local RedChief = CHIEF:New(coalition.side.RED, RedIntelProviders, "Red Chief")
RedChief:SetVerbosity(5)
RedChief:SetClusterAnalysis(true,true)   -- Enable Intel clusters and markers
--RedChief:SetBorderZones(RedBorderZones)
--RedChief:SetConflictZones(ConflictZones)
RedChief:SetAttackZones(RedAttackZones)
--RedChief:AddStrategicZone(RedStrategicZone, 50, 5)
RedChief:SetDefcon(CHIEF.DEFCON.RED)
RedChief:SetStrategy(CHIEF.Strategy.AGGRESSIVE)
-- Currently threat of a target is additive of all units,
-- So setting big number so Chief can target anything
RedChief:SetThreatLevelRange(1, 1000) 


-- Allow any Blue unit to provide intel to Chief
local BlueIntelProviders = SET_GROUP:New():FilterCoalitions(coalition.side.BLUE):FilterStart()
local BlueChief = CHIEF:New(coalition.side.BLUE, BlueIntelProviders, "Blue Chief")
BlueChief:SetVerbosity(5)
BlueChief:SetClusterAnalysis(true,true)   -- Enable Intel clusters and markers
BlueChief:SetBorderZones(BlueBorderZones)
--BlueChief:SetConflictZones(ConflictZones)
BlueChief:SetAttackZones(BlueAttackZones)
BlueChief:AddStrategicZone(BlueStrategicZone, 50, 5)
--BlueChief:AddCapZone(BlueBorderZone, 25000, 350, 60, 10) --CHIEF:AddCapZone(Zone, Altitude, Speed, Heading, Leg)


BlueChief:SetDefcon(CHIEF.DEFCON.RED)
BlueChief:SetStrategy(CHIEF.Strategy.AGGRESSIVE)
-- Currently threat of a target is additive of all units,
-- So setting big number so Chief can target anything
BlueChief:SetThreatLevelRange(1, 1000) 



--- START BRIGADE ---

-- Inf Platoon
local BlueGrunts=PLATOON:New("BlueInf", 11, "Blue Infantry Platoon")
BlueGrunts:SetGrouping(5)
BlueGrunts:SetSkill(AI.Skill.EXCELLENT)
BlueGrunts:AddMissionCapability({AUFTRAG.Type.ONGUARD, AUFTRAG.Type.PATROLZONE, AUFTRAG.Type.RECON},20)

-- Armor Platoon
local BlueArmor=PLATOON:New("BlueArmor", 10, "Blue Tank Squadron")
BlueArmor:SetGrouping(4)
BlueArmor:SetSkill(AI.Skill.EXCELLENT)
BlueArmor:AddMissionCapability({AUFTRAG.Type.ONGUARD, AUFTRAG.Type.PATROLZONE, AUFTRAG.Type.ARMORATTACK},80)

local BlueBrigade = BRIGADE:New("Blue Warehouse 1", "Blue Army Brigade")
BlueBrigade:AddPlatoon(BlueArmor)

BlueChief:AddBrigade(BlueBrigade)

--- END BRIGADE ---
--
-- Create an Airwing
local BlueWing=AIRWING:New("SK Warehouse", "Blue Fighter Wing")

-- Helos for Transport and Rescue Missions
local BlueHelo=SQUADRON:New("BlueHelo", 2, "Blue Rotary Squadron")
BlueHelo:SetGrouping(1) -- Chief will dispatch 2-ship groups
BlueHelo:SetTakeoffCold()
BlueHelo:SetSkill(AI.Skill.EXCELLENT)
BlueHelo:AddMissionCapability({AUFTRAG.Type.TROOPTRANSPORT, AUFTRAG.Type.OPSTRANSPORT,AUFTRAG.Type.RESCUEHELO})

-- Helos for Transport and Rescue Missions
local BlueScoutHelo=SQUADRON:New("BlueScoutHelo", 10, "Blue RotaryScout Squadron")
BlueScoutHelo:SetGrouping(2) -- Chief will dispatch 2-ship groups
BlueScoutHelo:SetTakeoffCold()
BlueScoutHelo:SetSkill(AI.Skill.EXCELLENT)
BlueScoutHelo:AddMissionCapability({AUFTRAG.Type.RECON})


BlueWing:NewPayload(GROUP:FindByName("BlueHelo"), 20, {AUFTRAG.Type.TROOPTRANSPORT,AUFTRAG.Type.OPSTRANSPORT,AUFTRAG.Type.RESCUEHELO}, 100)
BlueWing:NewPayload(GROUP:FindByName("BlueScoutHelo"), 20, {AUFTRAG.Type.RECON}, 100)

-- Add squadrons to the Airwing
BlueWing:AddSquadron(BlueHelo)
BlueWing:AddSquadron(BlueScoutHelo)
-- Add the wing to Chief
BlueChief:AddAirwing(BlueWing)

BlueChief:__Start(2)
RedChief:__Start(2)
