-- SET_ZONES for initializing CHIEF
-- CAP Zones
local BlueCapZoneNorth    =  ZONE:New("BLUE_CAP_North")
local BlueCapZoneCentral  =  ZONE:New("BLUE_CAP_Central")
local BlueCapZoneSouth    =  ZONE:New("BLUE_CAP_South")
local BlueCapZoneWest     =  ZONE:New("BLUE_CAP_West")
local BlueAWACSZoneNorth  =  ZONE:New("Blue_AWACS_North")
local BlueAWACSZoneSouth  =  ZONE:New("Blue_AWACS_South")
local BlueTankerNorth     =  ZONE:New("Blue_Tanker_North")
local BlueTankerSouth     =  ZONE:New("Blue_Tanker_South")
local BlueAttackZones     =  SET_ZONE:New():FilterPrefixes("BlueAttackZone"):FilterOnce()
local BlueBorderZones     = SET_ZONE:New():FilterPrefixes("BLUE_CAP"):FilterOnce()

local RedCapZoneNorth     = ZONE:New("RED_CAP_North")
local RedCapZoneCentral   = ZONE:New("RED_CAP_Central")
local RedCapZoneSouth     = ZONE:New("RED_CAP_South")
local RedTankerNorth      = ZONE:New("RED_Tanker_North")
local RedTankerCentral    = ZONE:New("RED_Tanker_Central")
local RedTankerSouth      = ZONE:New("RED_Tanker_South")
local RedAttackZones      = SET_ZONE:New():FilterPrefixes("RedAttackZone"):FilterOnce()
local RedAWACSZoneNorth   =  ZONE:New("Red_AWACS_North")
local RedStrategicZone    = OPSZONE:New("Red_Strategy_Zone", coalition.side.BLUE)
local RedBorderZones      = SET_ZONE:New():FilterPrefixes("RED_CAP"):FilterOnce()


-- Intel
local BlueIntelProviders  = SET_GROUP:New():FilterCoalitions(coalition.side.BLUE):FilterStart()
local RedIntelProviders   = SET_GROUP:New():FilterCoalitions(coalition.side.RED):FilterStart()

--Create Chief instances
local BlueChief           = CHIEF:New(coalition.side.BLUE, BlueIntelProviders, "Blue Chief")
local RedChief            = CHIEF:New(coalition.side.RED, RedIntelProviders, "Red Chief")


--Configure Chiefs and add critical Zones
--BlueChief:SetVerbosity(5) -- Log level
BlueChief:SetClusterAnalysis(true,true)   -- Enable Intel clusters and markers
BlueChief:AddCapZone(BlueCapZoneNorth,22000,350,45,50)
BlueChief:AddCapZone(BlueCapZoneCentral,22000,350,45,50)
BlueChief:AddCapZone(BlueCapZoneSouth,22000,350,45,50)
BlueChief:AddCapZone(BlueCapZoneWest,22000,350,45,50)
BlueChief:SetBorderZones(BlueBorderZones)
--BlueChief:AddTankerZone(BlueTankerNorth,12000,230,36,30,1) -- Add refuel Task. 1 is Boom 0 is basket
--BlueChief:AddTankerZone(BlueTankerNorth,21000,300,36,30,1)-- Add refuel Task. 1 is Boom 0 is basket
--BlueChief:AddTankerZone(BlueTankerNorth,18000,300,36,30,0)-- Add refuel Task. 1 is Boom 0 is basket
--BlueChief:AddTankerZone(BlueTankerSouth,12000,230,36,30,1) -- Add refuel Task. 1 is Boom 0 is basket
--BlueChief:AddTankerZone(BlueTankerSouth,21000,300,36,30,1)-- Add refuel Task. 1 is Boom 0 is basket
--BlueChief:AddTankerZone(BlueTankerSouth,18000,300,36,30,0)-- Add refuel Task. 1 is Boom 0 is basket
BlueChief:AddAwacsZone(BlueAWACSZoneNorth,26000,300,360,30)
BlueChief:AddAwacsZone(BlueAWACSZoneSouth,26000,300,360,30)

BlueChief:SetDefcon(CHIEF.DEFCON.RED)
BlueChief:SetStrategy(CHIEF.Strategy.TOTALWAR)
BlueChief:SetThreatLevelRange(1, 10)

--RedChief:SetVerbosity(5) -- Log level
RedChief:SetClusterAnalysis(true,true)   -- Enable Intel clusters and markers
RedChief:AddStrategicZone(RedStrategicZone,10,10)
RedChief:SetBorderZones(RedBorderZones)
RedChief:AddCapZone(RedCapZoneNorth,22000,350,45,50)
RedChief:AddCapZone(RedCapZoneCentral,22000,350,45,50)
RedChief:AddCapZone(RedCapZoneSouth,22000,350,45,50)
RedChief:AddTankerZone(RedTankerNorth,18000,300,36,30,0)-- Add refuel Task. 1 is Boom 0 is basket
RedChief:AddTankerZone(RedTankerCentral,18000,300,36,30,0)-- Add refuel Task. 1 is Boom 0 is basket
RedChief:AddTankerZone(RedTankerSouth,18000,300,36,30,0)-- Add refuel Task. 1 is Boom 0 is basket
RedChief:AddAwacsZone(RedAWACSZoneNorth,26000,300,360,30)
RedChief:SetDefcon(CHIEF.DEFCON.RED)
RedChief:SetStrategy(CHIEF.Strategy.TOTALWAR)
RedChief:SetThreatLevelRange(1, 10)

-- Define the ressources AIR Blue

local f18Wildcats=SQUADRON:New("US_Squadron_F18_Wildcats", 3, "US_Wildcats") --Ops.Squadron#SQUADRON
f18Wildcats:SetCallsign(CALLSIGN.Aircraft.Dodge)
f18Wildcats:SetRadio(251)
f18Wildcats:SetTakeoffHot()
f18Wildcats:SetGrouping(2)
f18Wildcats:SetSkill(AI.Skill.HIGH)
f18Wildcats:AddMissionCapability({AUFTRAG.Type.CAP, AUFTRAG.Type.SEAD, AUFTRAG.Type.BAI, AUFTRAG.Type.PATROLZONE, AUFTRAG.Type.ESCORT}, 100)
f18Wildcats:SetMissionRange(150)

local e2Hawkers=SQUADRON:New("US_E2Hawkers", 3, "US_Hawkers") --Ops.Squadron#SQUADRON
e2Hawkers:SetCallsign(CALLSIGN.AWACS.Darkstar)
e2Hawkers:SetRadio(251)
e2Hawkers:SetTakeoffHot()
e2Hawkers:SetSkill(AI.Skill.HIGH)
e2Hawkers:AddMissionCapability(AUFTRAG.Type.AWACS,100)
e2Hawkers:SetMissionRange(300)

local tankerBoys=SQUADRON:New("US_S3Bs", 3, "US_Hawkers") --Ops.Squadron#SQUADRON
tankerBoys:SetRadio(251)
tankerBoys:SetTakeoffHot()
tankerBoys:SetCallsign(CALLSIGN.Tanker.Shell,1)
tankerBoys:SetSkill(AI.Skill.HIGH)
tankerBoys:AddMissionCapability({AUFTRAG.Type.TANKER, AUFTRAG.Type.RECOVERYTANKER},100)
tankerBoys:SetMissionRange(300)

local harriers=SQUADRON:New("US_Harriers", 5, "US_Harriers") --Ops.Squadron#SQUADRON
harriers:SetRadio(251)
harriers:SetGrouping(2)
harriers:SetTakeoffHot()
harriers:SetSkill(AI.Skill.HIGH)
harriers:AddMissionCapability({AUFTRAG.Type.CAS, AUFTRAG.Type.BAI},100)
harriers:SetMissionRange(200)

local KC135MPRS=SQUADRON:New("US_Payload_KC135MPRS", 3, "US_KC135MPRS") --Ops.Squadron#SQUADRON
KC135MPRS:SetRadio(251)
KC135MPRS:SetTakeoffHot()
KC135MPRS:SetSkill(AI.Skill.HIGH)
KC135MPRS:AddMissionCapability({AUFTRAG.Type.TANKER},100)
KC135MPRS:SetMissionRange(700)

local KC135=SQUADRON:New("US_Payload_KC135", 3, "US_KC135") --Ops.Squadron#SQUADRON
KC135:SetRadio(251)
KC135:SetTakeoffHot()
KC135:SetSkill(AI.Skill.HIGH)
KC135:AddMissionCapability({AUFTRAG.Type.TANKER},100)
KC135:SetMissionRange(700)

local US_F15C_Cap=SQUADRON:New("US_F15C_Cap", 6, "US_F15C") --Ops.Squadron#SQUADRON
US_F15C_Cap:SetRadio(251)
US_F15C_Cap:SetGrouping(2)
US_F15C_Cap:SetTakeoffHot()
US_F15C_Cap:SetSkill(AI.Skill.HIGH)
US_F15C_Cap:AddMissionCapability({AUFTRAG.Type.CAP, AUFTRAG.Type.ALERT5, AUFTRAG.Type.ESCORT, AUFTRAG.Type.GCICAP, AUFTRAG.Type.INTERCEPT},100)
US_F15C_Cap:SetMissionRange(300)

-- End of Air Assets Blue
-- Begin of Air Assets Red
local Red_Mig29_CAP_Damascus=SQUADRON:New("Red_Mig29_CAP_Damascus", 5, "Red_Mig29_CAP_Damascus") --Ops.Squadron#SQUADRON
Red_Mig29_CAP_Damascus:SetCallsign(CALLSIGN.Aircraft.Uzi)
Red_Mig29_CAP_Damascus:SetGrouping(2)
Red_Mig29_CAP_Damascus:SetTakeoffHot()
Red_Mig29_CAP_Damascus:SetSkill(AI.Skill.HIGH)
Red_Mig29_CAP_Damascus:AddMissionCapability({AUFTRAG.Type.CAP, AUFTRAG.Type.BAI, AUFTRAG.Type.PATROLZONE, AUFTRAG.Type.ESCORT}, 100)
Red_Mig29_CAP_Damascus:SetMissionRange(400)

local Red_Mig21_CAP_Damascus=SQUADRON:New("Red_Mig21_CAP_Damascus", 3, "Red_Mig21_CAP_Damascus") --Ops.Squadron#SQUADRON
Red_Mig21_CAP_Damascus:SetCallsign(CALLSIGN.Aircraft.Uzi)
Red_Mig21_CAP_Damascus:SetGrouping(2)
Red_Mig21_CAP_Damascus:SetTakeoffHot()
Red_Mig21_CAP_Damascus:SetSkill(AI.Skill.HIGH)
Red_Mig21_CAP_Damascus:AddMissionCapability({AUFTRAG.Type.BAI, AUFTRAG.Type.INTERCEPT}, 100)
Red_Mig21_CAP_Damascus:SetMissionRange(300)

local Red_Mig31_CAP_Damascus=SQUADRON:New("Red_Mig31_CAP_Damascus", 3, "Red_Mig21_CAP_Damascus") --Ops.Squadron#SQUADRON
Red_Mig31_CAP_Damascus:SetCallsign(CALLSIGN.Aircraft.Uzi)
Red_Mig31_CAP_Damascus:SetGrouping(2)
Red_Mig31_CAP_Damascus:SetTakeoffHot()
Red_Mig31_CAP_Damascus:SetSkill(AI.Skill.HIGH)
Red_Mig31_CAP_Damascus:AddMissionCapability({AUFTRAG.Type.INTERCEPT, AUFTRAG.Type.RECON}, 100)
Red_Mig31_CAP_Damascus:SetMissionRange(300)

local Red_Mig28_CAP_Damascus=SQUADRON:New("Red_Mig28_CAP_Damascus", 3, "Red_Mig28_CAP_Damascus") --Ops.Squadron#SQUADRON
Red_Mig28_CAP_Damascus:SetCallsign(CALLSIGN.Aircraft.Uzi)
Red_Mig28_CAP_Damascus:SetGrouping(2)
Red_Mig28_CAP_Damascus:SetTakeoffHot()
Red_Mig28_CAP_Damascus:SetSkill(AI.Skill.HIGH)
Red_Mig28_CAP_Damascus:AddMissionCapability({AUFTRAG.Type.INTERCEPT}, 50)
Red_Mig28_CAP_Damascus:SetMissionRange(200)

local Red_SU34_AntiShip_Damascus=SQUADRON:New("Red_SU34_AntiShip_Damascus", 3, "Red_SU34_AntiShip_Damascus") --Ops.Squadron#SQUADRON
Red_SU34_AntiShip_Damascus:SetCallsign(CALLSIGN.Aircraft.Uzi)
Red_SU34_AntiShip_Damascus:SetGrouping(2)
Red_SU34_AntiShip_Damascus:SetTakeoffHot()
Red_SU34_AntiShip_Damascus:SetSkill(AI.Skill.HIGH)
Red_SU34_AntiShip_Damascus:AddMissionCapability({AUFTRAG.Type.ANTISHIP}, 100)
Red_SU34_AntiShip_Damascus:SetMissionRange(300)

local Red_Awacs=SQUADRON:New("Red_Awacs", 3, "Red_Awacs") --Ops.Squadron#SQUADRON
Red_Awacs:SetGrouping(1)
Red_Awacs:SetTakeoffHot()
Red_Awacs:SetSkill(AI.Skill.HIGH)
Red_Awacs:AddMissionCapability({AUFTRAG.Type.AWACS}, 100)
Red_Awacs:SetMissionRange(300)

local Red_Tanker_IL78=SQUADRON:New("Red_Tanker_IL78", 3, "Red_Tanker_IL78") --Ops.Squadron#SQUADRON
Red_Tanker_IL78:SetSkill(AI.Skill.HIGH)
Red_Tanker_IL78:SetTakeoffHot()
Red_Tanker_IL78:AddMissionCapability({AUFTRAG.Type.TANKER},100)
Red_Tanker_IL78:SetMissionRange(300)
-- End of Air Assets Red


-- Define Airwings Blue
local Airwing_CVN73=AIRWING:New("USS George Washington", "USS George Washington")
local Airwing_Tarawa=AIRWING:New("LHA-1 Tarawa","LHA-1 Tarawa")
local Airwing_Incirlik=AIRWING:New("Warehouse Incirlik","Incirlik")

function Airwing_Incirlik:OnAfterFlightOnMission(From, Event, To, Flightgroup, Mission)
  local flightgroup = Flightgroup -- Ops.FlightGroup#FLIGHTGROUP
  local mission = Mission -- Ops.Auftrag#AUFTRAG
  if mission:GetType() == AUFTRAG.Type.AWACS then
    local EscortGroup = flightgroup:GetGroup()
    local auftrag = AUFTRAG:NewESCORT(EscortGroup,nil,25,nil)
    auftrag:SetMissionRange(200)
    auftrag:SetRequiredAssets(1,1)
    Airwing_Incirlik:AddMission(auftrag)
  end
  flightgroup:SetDefaultSpeed(300)
  flightgroup:SetDespawnAfterLanding()
  flightgroup:GetGroup():CommandEPLRS(true,5)
  --flightgroup:SetEngageDetectedOn(25,{"Air"},BlueBorderSet,RedBorderSet)
  flightgroup:GetGroup():OptionROTEvadeFire()
  function flightgroup:OnAfterHolding(From,Event,To)
    self:ClearToLand(5)
  end  
end

--function Airwing_CVN73:OnAfterFlightOnMission(From, Event, To, Flightgroup, Mission)
--  local flightgroup = Flightgroup -- Ops.FlightGroup#FLIGHTGROUP
--  local mission = Mission -- Ops.Auftrag#AUFTRAG
--  if mission:GetType() == AUFTRAG.Type.TANKER or mission:GetType() == AUFTRAG.Type.AWACS then
--    local EscortGroup = flightgroup:GetGroup()
--    local auftrag = AUFTRAG:NewESCORT(EscortGroup,nil,25,nil)
--    auftrag:SetMissionRange(200)
--    auftrag:SetRequiredAssets(1,1)
--    Airwing_CVN73:AddMission(auftrag)
--  end
--  flightgroup:SetDefaultSpeed(300)
--  flightgroup:SetDespawnAfterLanding()
--  flightgroup:GetGroup():CommandEPLRS(true,5)
--  --flightgroup:SetEngageDetectedOn(25,{"Air"},BlueBorderSet,RedBorderSet)
--  flightgroup:GetGroup():OptionROTEvadeFire()
--  function flightgroup:OnAfterHolding(From,Event,To)
--    self:ClearToLand(5)
--  end  
--end
-- End of Define Airwings Blue


-- Define Airwings Red
local Airwing_Damascus=AIRWING:New("Damascus", "Damascus")

function Airwing_Damascus:OnAfterFlightOnMission(From, Event, To, Flightgroup, Mission)
  local flightgroup = Flightgroup -- Ops.FlightGroup#FLIGHTGROUP
  local mission = Mission -- Ops.Auftrag#AUFTRAG
  if mission:GetType() == AUFTRAG.Type.TANKER or mission:GetType() == AUFTRAG.Type.AWACS then
    local EscortGroup = flightgroup:GetGroup()
    local auftrag = AUFTRAG:NewESCORT(EscortGroup,nil,25,nil)
    auftrag:SetMissionRange(200)
    auftrag:SetRequiredAssets(1,1)
    Airwing_Damascus:AddMission(auftrag)
  end
  flightgroup:SetDefaultSpeed(300)
  flightgroup:SetDespawnAfterLanding()
  flightgroup:GetGroup():CommandEPLRS(true,5)
  --flightgroup:SetEngageDetectedOn(25,{"Air"},BlueBorderSet,RedBorderSet)
  flightgroup:GetGroup():OptionROTEvadeFire()
  function flightgroup:OnAfterHolding(From,Event,To)
    self:ClearToLand(5)
  end  
end

-- End of Define Airwings Red



-- Define Payloads Blue
Airwing_CVN73:NewPayload(GROUP:FindByName("F18_Payload_SEAD"), -1, {AUFTRAG.Type.SEAD}, 100)
Airwing_CVN73:NewPayload(GROUP:FindByName("F18_Payload_CAP1"), -1, {AUFTRAG.Type.CAP, AUFTRAG.Type.ESCORT}, 80)
Airwing_CVN73:NewPayload(GROUP:FindByName("F18_Payload_BAI1"), -1, {AUFTRAG.Type.BAI}, 80)
Airwing_CVN73:NewPayload(GROUP:FindByName("F18_Payload_Recon"), -1, {AUFTRAG.Type.PATROLZONE, AUFTRAG.Type.RECON}, 100)
Airwing_CVN73:NewPayload(GROUP:FindByName("US_Payload_S3B"), -1, {AUFTRAG.Type.TANKER, AUFTRAG.Type.RECOVERYTANKER}, 100)

Airwing_Tarawa:NewPayload(GROUP:FindByName("AV8B_Payload_CAS"), -1, {AUFTRAG.Type.CAS, AUFTRAG.Type.BAI}, 100)

Airwing_Incirlik:NewPayload(GROUP:FindByName("US_Payload_KC135"), -1, {AUFTRAG.Type.TANKER}, 100)
Airwing_Incirlik:NewPayload(GROUP:FindByName("US_Payload_KC135MPRS"), -1, {AUFTRAG.Type.TANKER}, 100)
Airwing_Incirlik:NewPayload(GROUP:FindByName("US_F15C_Cap"), -1, {AUFTRAG.Type.CAP, AUFTRAG.Type.ALERT5, AUFTRAG.Type.ESCORT, AUFTRAG.Type.GCICAP, AUFTRAG.Type.INTERCEPT}, 100)
-- End of Payloads Blue

-- Define Payloads Red
Airwing_Damascus:NewPayload(GROUP:FindByName("Su34_Loadout_AntiShip"), -1, {AUFTRAG.Type.ANTISHIP}, 100)
Airwing_Damascus:NewPayload(GROUP:FindByName("Mig21_Loadout_CAP1"), -1, {AUFTRAG.Type.BAI, AUFTRAG.Type.INTERCEPT}, 100)
Airwing_Damascus:NewPayload(GROUP:FindByName("Mig29_Loadout_CAP1"), -1, {AUFTRAG.Type.CAP, AUFTRAG.Type.BAI, AUFTRAG.Type.PATROLZONE, AUFTRAG.Type.ESCORT}, 100)
Airwing_Damascus:NewPayload(GROUP:FindByName("Mig28_Loadout_CAP1"), -1, {AUFTRAG.Type.INTERCEPT}, 100)
Airwing_Damascus:NewPayload(GROUP:FindByName("Mig31_Loadout_CAP1"), -1, {AUFTRAG.Type.INTERCEPT, AUFTRAG.Type.RECON}, 100)
Airwing_Damascus:NewPayload(GROUP:FindByName("Red_Awacs_Payload"), -1, {AUFTRAG.Type.AWACS}, 100)
Airwing_Damascus:NewPayload(GROUP:FindByName("Red_Tanker_IL78"), -1, {AUFTRAG.Type.TANKER}, 100)

-- End of Payloads Red

-- Manage Airwings
Airwing_Tarawa:AddSquadron(harriers)
Airwing_CVN73:AddSquadron(f18Wildcats)
Airwing_CVN73:AddSquadron(e2Hawkers)
Airwing_CVN73:AddSquadron(tankerBoys)
Airwing_Incirlik:AddSquadron(KC135)
Airwing_Incirlik:AddSquadron(KC135MPRS)
Airwing_Incirlik:AddSquadron(US_F15C_Cap)
 
BlueChief:AddAirwing(Airwing_CVN73)
BlueChief:AddAirwing(Airwing_Tarawa)
BlueChief:AddAirwing(Airwing_Incirlik)

Airwing_Damascus:AddSquadron(Red_Mig29_CAP_Damascus)
Airwing_Damascus:AddSquadron(Red_Mig21_CAP_Damascus)
Airwing_Damascus:AddSquadron(Red_Mig31_CAP_Damascus)
Airwing_Damascus:AddSquadron(Red_Mig28_CAP_Damascus)
Airwing_Damascus:AddSquadron(Red_SU34_AntiShip_Damascus)
Airwing_Damascus:AddSquadron(Red_Awacs)
Airwing_Damascus:AddSquadron(Red_Tanker_IL78)

RedChief:AddAirwing(Airwing_Damascus)

-- Airwings managed
-- Everything done, start the game!
BlueChief:__Start(2)
RedChief:__Start(5)


local ChiefMenu=MENU_MISSION:New("CHIEF RED Control")

function ChiefSetPriorityPassive()
  RedChief:SetStrategy(CHIEF.Strategy.PASSIVE)
end

function ChiefSetPriorityDefensive()
  RedChief:SetStrategy(CHIEF.Strategy.DEFENSIVE)
end

function ChiefSetPriorityOffensive()
  RedChief:SetStrategy(CHIEF.Strategy.OFFENSIVE)
end

function ChiefSetPriorityAggressive()
  RedChief:SetStrategy(CHIEF.Strategy.AGGRESSIVE)
end

function ChiefSetPriorityTotalWar()
  RedChief:SetStrategy(CHIEF.Strategy.TOTALWAR)
end

local chiefMenu1 = MENU_MISSION_COMMAND:New("Set Passive Strategy", ChiefMenu, ChiefSetPriorityPassive)
local chiefMenu2 = MENU_MISSION_COMMAND:New("Set Defensive Strategy", ChiefMenu, ChiefSetPriorityDefensive)
local chiefMenu3 = MENU_MISSION_COMMAND:New("Set Offensive Strategy", ChiefMenu, ChiefSetPriorityOffensive)
local chiefMenu4 = MENU_MISSION_COMMAND:New("Set Aggressive Strategy", ChiefMenu, ChiefSetPriorityAggressive)
local chiefMenu5 = MENU_MISSION_COMMAND:New("Set Total War Strategy", ChiefMenu, ChiefSetPriorityTotalWar)

