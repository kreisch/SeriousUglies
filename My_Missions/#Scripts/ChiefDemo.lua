-- CHIEF test/demo mission by dogjutsu
-- Tested against MOOSE develop branch:
-- *** MOOSE GITHUB Commit Hash ID: 2021-11-16T21:08:00.0000000Z-e73545d296b3d2466e17d8da1fa8953d007a8d7c ***

-- SET_ZONES for initializing CHIEF
local BlueBorderZones = SET_ZONE:New():FilterPrefixes("BlueBorderZone"):FilterOnce()
local ConflictZones = SET_ZONE:New():FilterPrefixes("ConflictZone"):FilterOnce()
local BlueAttackZones = SET_ZONE:New():FilterPrefixes("BlueAttackZone"):FilterOnce()
local ReconZone1 = SET_ZONE:New():FilterPrefixes("ReconZone1"):FilterOnce()
local ReconZone2= SET_ZONE:New():FilterPrefixes("ReconZone2"):FilterOnce()
local BlueStrategicZone = OPSZONE:New("Kutaisi", coalition.side.RED)
local RearmingZone = ZONE:New("RearmingZone")
local RefuelingZone = ZONE:New("RefuelingZone")
local BlueBorderZone = ZONE:New("BlueBorderZone")
local AwacsZone = ZONE:New("AwacsZone")
local TankerZone = ZONE:New("TankerZone")

local RedBorderZones = SET_ZONE:New():FilterPrefixes("RedBorderZone"):FilterOnce()
local RedAttackZones = SET_ZONE:New():FilterPrefixes("RedAttackZone"):FilterOnce()
local RedStrategicZone = OPSZONE:New("Kobuleti", coalition.side.BLUE)
local RedIntelProviders = SET_GROUP:New():FilterCoalitions(coalition.side.RED):FilterStart()


local RedChief = CHIEF:New(coalition.side.RED, RedIntelProviders, "Red Chief")
RedChief:SetVerbosity(5)
RedChief:SetClusterAnalysis(true,true)   -- Enable Intel clusters and markers
RedChief:SetBorderZones(RedBorderZones)
RedChief:SetConflictZones(ConflictZones)
RedChief:SetAttackZones(RedAttackZones)
RedChief:AddStrategicZone(RedStrategicZone, 50, 5)

RedChief:SetDefcon(CHIEF.DEFCON.GREEN)
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
BlueChief:SetConflictZones(ConflictZones)
BlueChief:SetAttackZones(BlueAttackZones)
BlueChief:AddStrategicZone(BlueStrategicZone, 50, 5)
BlueChief:AddRearmingZone(RearmingZone)
BlueChief:AddRefuellingZone(RefuelingZone)
BlueChief:AddCapZone(BlueBorderZone, 25000, 350, 60, 10) --CHIEF:AddCapZone(Zone, Altitude, Speed, Heading, Leg)
BlueChief:AddAwacsZone(AwacsZone, 30000, 320, 330, 30) --CHIEF:AddAwacsZone(Zone, Altitude, Speed, Heading, Leg)
-- @field #number refuelsystem Refueling system type: `0=Unit.RefuelingSystem.BOOM_AND_RECEPTACLE`, `1=Unit.RefuelingSystem.PROBE_AND_DROGUE`.
BlueChief:AddTankerZone(TankerZone, 22000, 240, 330, 30, 0)--CHIEF:AddTankerZone(Zone, Altitude, Speed, Heading, Leg, RefuelSystem)

BlueChief:SetDefcon(CHIEF.DEFCON.GREEN)
BlueChief:SetStrategy(CHIEF.Strategy.PASSIVE)
-- Currently threat of a target is additive of all units,
-- So setting big number so Chief can target anything
BlueChief:SetThreatLevelRange(1, 1000) 



--- START AIRWING

-- Viper Squadron for A2A missions (and anti-ship for fun)
local BlueCAP=SQUADRON:New("BlueCAP", 2, "Blue CAP Squadron")
BlueCAP:SetGrouping(2) -- Chief will dispatch 2-ship groups
BlueCAP:SetTakeoffCold()
BlueCAP:SetSkill(AI.Skill.EXCELLENT)
BlueCAP:AddMissionCapability({AUFTRAG.Type.GCICAP, AUFTRAG.Type.INTERCEPT, AUFTRAG.Type.ALERT5, AUFTRAG.Type.CAP, AUFTRAG.Type.ESCORT})

-- Hornet Squadron for attack missions
local BlueStrike=SQUADRON:New("BlueStrike", 2, "Blue Strike Squadron")
BlueStrike:SetGrouping(2) -- Chief will dispatch 2-ship groups
BlueStrike:SetTakeoffCold()
BlueStrike:SetSkill(AI.Skill.EXCELLENT)
BlueStrike:AddMissionCapability({AUFTRAG.Type.ANTISHIP, AUFTRAG.Type.BAI, AUFTRAG.Type.STRIKE, AUFTRAG.Type.SEAD, AUFTRAG.Type.BOMBING })

-- Hawg Squadron for CAS missions
local BlueCAS=SQUADRON:New("BlueCAS", 2, "Blue CAS Squadron")
BlueCAS:SetGrouping(2) -- Chief will dispatch 2-ship groups
BlueCAS:SetTakeoffCold()
BlueCAS:SetSkill(AI.Skill.EXCELLENT)
BlueCAS:AddMissionCapability({AUFTRAG.Type.CAS})

-- Flying gas station for refueling missions
local BlueTanker=SQUADRON:New("BlueTanker", 2, "Blue Tanker Squadron")
BlueTanker:SetGrouping(1)
BlueTanker:SetTakeoffCold()
BlueTanker:SetSkill(AI.Skill.EXCELLENT)
BlueTanker:AddMissionCapability({AUFTRAG.Type.TANKER})

-- AWACS for AWACS
local BlueAwacs=SQUADRON:New("BlueAwacs", 2, "Blue AWACS Squadron")
BlueAwacs:SetGrouping(1)
BlueAwacs:SetTakeoffCold()
BlueAwacs:SetSkill(AI.Skill.EXCELLENT)
BlueAwacs:AddMissionCapability({AUFTRAG.Type.AWACS})

-- Helos for Transport and Rescue Missions
local BlueHelo=SQUADRON:New("BlueHelo", 2, "Blue Rotary Squadron")
BlueHelo:SetGrouping(2) -- Chief will dispatch 2-ship groups
BlueHelo:SetTakeoffCold()
BlueHelo:SetSkill(AI.Skill.EXCELLENT)
-- Looks like AUFTRAG.Type.OPSTRANSPORT for Chief-assigned capture not ready/enabled yet
BlueHelo:AddMissionCapability({AUFTRAG.Type.TROOPTRANSPORT, AUFTRAG.Type.OPSTRANSPORT,AUFTRAG.Type.RESCUEHELO})

-- Drone for Recon missions
local BlueDrone=SQUADRON:New("BlueDrone", 2, "Blue UAV Squadron")
BlueDrone:SetGrouping(1) -- Chief will dispatch 2-ship groups
BlueDrone:SetTakeoffCold()
BlueDrone:SetSkill(AI.Skill.EXCELLENT)
BlueDrone:AddMissionCapability({AUFTRAG.Type.RECON})

-- Create an Airwing
local BlueWing=AIRWING:New("Kobuleti Warehouse", "Blue Fighter Wing")

-- Add squadrons to the Airwing
BlueWing:AddSquadron(BlueCAP)
BlueWing:AddSquadron(BlueStrike)
BlueWing:AddSquadron(BlueCAS)
BlueWing:AddSquadron(BlueTanker)
BlueWing:AddSquadron(BlueAwacs)
BlueWing:AddSquadron(BlueHelo)
BlueWing:AddSquadron(BlueDrone)

-- Use loadout of BlueCAP group in ME for A2A missions
BlueWing:NewPayload(GROUP:FindByName("BlueCAP"), 20, {AUFTRAG.Type.GCICAP, AUFTRAG.Type.INTERCEPT, AUFTRAG.Type.ALERT5, AUFTRAG.Type.CAP, AUFTRAG.Type.ESCORT}, 80)
-- F-18 loadouts
BlueWing:NewPayload(GROUP:FindByName("BlueAntiShip"), 20, {AUFTRAG.Type.ANTISHIP}, 80)
BlueWing:NewPayload(GROUP:FindByName("BlueStrike"), 20, {AUFTRAG.Type.BAI, AUFTRAG.Type.STRIKE, AUFTRAG.Type.BOMBING}, 80)
BlueWing:NewPayload(GROUP:FindByName("BlueSEAD"), 20, {AUFTRAG.Type.SEAD}, 80)
-- Use loadout of BlueCAS group in ME for A2A missions
BlueWing:NewPayload(GROUP:FindByName("BlueCAS"), 20, {AUFTRAG.Type.CAS}, 80)
-- Use loadout of BlueHelo group in ME for rotary missions
BlueWing:NewPayload(GROUP:FindByName("BlueHelo"), 20, {AUFTRAG.Type.TROOPTRANSPORT,AUFTRAG.Type.OPSTRANSPORT,AUFTRAG.Type.RESCUEHELO}, 80)
-- Use loadout of BlueHelo group in ME for rotary missions
BlueWing:NewPayload(GROUP:FindByName("BlueDrone"), 100, {AUFTRAG.Type.RECON}, 80)

-- Add the wing to Chief
BlueChief:AddAirwing(BlueWing)

--- END AIRWING

--- START BRIGADE ---

-- Infantry Platoon, Hooah!
local BlueGrunts=PLATOON:New("BlueGrunts", 8, "Blue Infantry Platoon")
BlueGrunts:SetGrouping(1)
BlueGrunts:SetSkill(AI.Skill.EXCELLENT)
BlueGrunts:AddMissionCapability({AUFTRAG.Type.ONGUARD, AUFTRAG.Type.PATROLZONE, AUFTRAG.Type.RECON},20)

-- King of Battle
local BlueArty=PLATOON:New("BlueArty", 2, "Blue Artillery Battery")
BlueArty:SetGrouping(1)
BlueArty:SetSkill(AI.Skill.EXCELLENT)
BlueArty:AddMissionCapability({AUFTRAG.Type.ARTY},80)
BlueArty:AddWeaponRange(1, 10) -- Range 1-10nm

-- Tanker Squadron
local BlueArmor=PLATOON:New("BlueArmor", 4, "Blue Tank Squadron")
BlueArmor:SetGrouping(1)
BlueArmor:SetSkill(AI.Skill.EXCELLENT)
BlueArmor:AddMissionCapability({AUFTRAG.Type.ONGUARD, AUFTRAG.Type.PATROLZONE},80)

local BlueBrigade = BRIGADE:New("Blue Army Barracks", "Blue Army Brigade")
BlueBrigade:AddPlatoon(BlueGrunts)
BlueBrigade:AddPlatoon(BlueArty)
BlueBrigade:AddPlatoon(BlueArmor)

BlueChief:AddBrigade(BlueBrigade)

--- END BRIGADE ---


local RedCAS=SQUADRON:New("RedCAS", 2, "Red CAS Squadron")
RedCAS:SetGrouping(2) -- Chief will dispatch 2-ship groups
RedCAS:SetTakeoffCold()
RedCAS:SetSkill(AI.Skill.EXCELLENT)
RedCAS:AddMissionCapability({AUFTRAG.Type.CAS})

local RedHelo=SQUADRON:New("RedHelo", 2, "Red Rotary Squadron")
RedHelo:SetGrouping(2) -- Chief will dispatch 2-ship groups
RedHelo:SetTakeoffCold()
RedHelo:SetSkill(AI.Skill.EXCELLENT)
-- Looks like AUFTRAG.Type.OPSTRANSPORT for Chief-assigned capture not ready/enabled yet
RedHelo:AddMissionCapability({AUFTRAG.Type.TROOPTRANSPORT, AUFTRAG.Type.OPSTRANSPORT,AUFTRAG.Type.RESCUEHELO})

local RedWing=AIRWING:New("Kutaisi Warehouse", "Red Fighter Wing")

RedWing:AddSquadron(RedCAS)
RedWing:AddSquadron(RedHelo)

RedWing:NewPayload(GROUP:FindByName("RedCAS"), 20, {AUFTRAG.Type.CAS}, 80)
RedWing:NewPayload(GROUP:FindByName("RedHelo"), 20, {AUFTRAG.Type.TROOPTRANSPORT,AUFTRAG.Type.OPSTRANSPORT,AUFTRAG.Type.RESCUEHELO}, 80)



--- START BRIGADE ---

-- Infantry Platoon, Hooah!
local RedGrunts=PLATOON:New("RedGrunts", 8, "Red Infantry Platoon")
RedGrunts:SetGrouping(1)
RedGrunts:SetSkill(AI.Skill.EXCELLENT)
RedGrunts:AddMissionCapability({AUFTRAG.Type.ONGUARD, AUFTRAG.Type.PATROLZONE, AUFTRAG.Type.RECON},20)

-- King of Battle
local RedArty=PLATOON:New("RedArty", 2, "Red Artillery Battery")
RedArty:SetGrouping(1)
RedArty:SetSkill(AI.Skill.EXCELLENT)
RedArty:AddMissionCapability({AUFTRAG.Type.ARTY},80)
RedArty:AddWeaponRange(1, 10) -- Range 1-10nm

-- Tanker Squadron
local RedArmor=PLATOON:New("RedArmor", 4, "Red Tank Squadron")
RedArmor:SetGrouping(1)
RedArmor:SetSkill(AI.Skill.EXCELLENT)
RedArmor:AddMissionCapability({AUFTRAG.Type.ONGUARD, AUFTRAG.Type.PATROLZONE},80)

local RedBrigade = BRIGADE:New("Red Army Barracks", "Red Army Brigade")
RedBrigade:AddPlatoon(RedGrunts)
RedBrigade:AddPlatoon(RedArty)
RedBrigade:AddPlatoon(RedArmor)

RedChief:AddBrigade(RedBrigade)

--- END BRIGADE ---

--- BEGIN FLOTILLA ---

-- Not yet implemented

--- END FLOTILLA ---

-- Just for fun: Artillery fire mission if target cluster located within 10nm of FARP (Hint: Send recce mission to ReconZone2).
function BlueChief:OnAfterNewCluster(From, Event, To, Contact, Cluster)
      if Contact.isground and not Contact.mission then
        local FarpZone = ZONE:New("BlueFarp")
        local TargetDistance = UTILS.MetersToNM(Cluster.coordinate:DistanceFromPointVec2(FarpZone:GetPointVec2()))
        local NewContactMessage = string.format("Untargeted ground contact detected %i nm from FARP.", TargetDistance)
        MessageToAll(NewContactMessage, 5, "Ground Contact" )
        if TargetDistance < 10 then
          local FireMission = AUFTRAG:NewARTY(TARGET:AddObject(Contact.group), 12, 25, nil)
          FireMission:SetFormation(ENUMS.Formation.Vehicle.Rank)
          local FireMissionMessage = string.format("Fire for effect, grid %s", Contact.position:ToStringMGRS())
          MessageToAll(FireMissionMessage,10,"FFE")
          BlueChief:AddMission(FireMission)
        end
      end
end

-- Interactive menu to do some things.

local ChiefMenu=MENU_MISSION:New("CHIEF Control")

function ChiefSetPriorityPassive()
  BlueChief:SetStrategy(CHIEF.Strategy.PASSIVE)
end

function ChiefSetPriorityDefensive()
  BlueChief:SetStrategy(CHIEF.Strategy.DEFENSIVE)
end

function ChiefSetPriorityOffensive()
  BlueChief:SetStrategy(CHIEF.Strategy.OFFENSIVE)
end

function ChiefSetPriorityAggressive()
  BlueChief:SetStrategy(CHIEF.Strategy.AGGRESSIVE)
end

function ChiefSetPriorityTotalWar()
  BlueChief:SetStrategy(CHIEF.Strategy.TOTALWAR)
end

function ChiefReconZone1()
  BlueChief:AddMission(AUFTRAG:NewRECON(ReconZone1, 160, 20000, false, false))
end

function ChiefReconZone2()
  BlueChief:AddMission(AUFTRAG:NewRECON(ReconZone2, 160, 20000, false, false))
end

local chiefMenu1 = MENU_MISSION_COMMAND:New("Set Passive Strategy", ChiefMenu, ChiefSetPriorityPassive)
local chiefMenu2 = MENU_MISSION_COMMAND:New("Set Defensive Strategy", ChiefMenu, ChiefSetPriorityDefensive)
local chiefMenu3 = MENU_MISSION_COMMAND:New("Set Offensive Strategy", ChiefMenu, ChiefSetPriorityOffensive)
local chiefMenu4 = MENU_MISSION_COMMAND:New("Set Aggressive Strategy", ChiefMenu, ChiefSetPriorityAggressive)
local chiefMenu5 = MENU_MISSION_COMMAND:New("Set Total War Strategy", ChiefMenu, ChiefSetPriorityTotalWar)
local chiefMenu6 = MENU_MISSION_COMMAND:New("Launch recce mission to ReconZone1", ChiefMenu, ChiefReconZone1)
local chiefMenu7 = MENU_MISSION_COMMAND:New("Launch recce to mission ReconZone2", ChiefMenu, ChiefReconZone2)

BlueChief:__Start(2)