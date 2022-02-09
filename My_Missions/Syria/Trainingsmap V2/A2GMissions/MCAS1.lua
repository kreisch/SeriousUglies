--
BASE:I("Blue CHIEF Starting")

_SETTINGS:SetPlayerMenuOff()
_SETTINGS:SetImperial()
_SETTINGS:SetEraModern()
_SETTINGS:SetA2A_LL_DMS()
_SETTINGS:SetA2G_MGRS()
_SETTINGS:SetLL_Accuracy(3)
_SETTINGS:SetMGRS_Accuracy(3)

local BlueStartTime = 1*60 -- Start nach 60 Sekunden
local BlueInterceptLimit = 3

---------------------------------------------------------------------------------
-- TODO: Housekeeping
---------------------------------------------------------------------------------

local BlueMissionQueue = {}
local _BlueMissionCounter = 0

function AddMissionToQueue(mission)
  _BlueMissionCounter = _BlueMissionCounter + 1
  BlueMissionQueue[_BlueMissionCounter] = mission
end

function BlueHouseKeeping()
  for _index,_auftrag in pairs(BlueMissionQueue) do
    local auftrag = _auftrag -- Ops.Auftrag#AUFTRAG
    if auftrag and auftrag:IsOver() then
      table.remove(BlueMissionQueue,_index)
      auftrag = nil
    end 
  end
end

local BlueHouseTimer = TIMER:New(BlueHouseKeeping)
BlueHouseTimer:Start(120,60)

local BlueBorder        = ZONE_POLYGON:New("Blue Border",GROUP:FindByName("MCAS1_Blue_Border"))
local RedBorder         = ZONE_POLYGON:New("Red Border",GROUP:FindByName("MCAS1_Conflict_Zone"))
local BlueConflictZone  = ZONE_POLYGON:New("Conflict Zone",GROUP:FindByName("Conflict Zone"))

local BlueBorderSet = SET_ZONE:New()
BlueBorderSet:AddZone(BlueBorder)

local RedBorderSet = SET_ZONE:New()
RedBorderSet:AddZone(RedBorder)

local ReconZone1 = ZONE:New("MCAS1_Recon-1")
local ReconZone2 = ZONE:New("MCAS1_Recon-2")
local ReconZone3 = ZONE:New("MCAS1_Recon-3")

local RefuelZolskya = ZONE:New("MCAS1_Refuel_Dallas")

local BlueOpsZoneOne = OPSZONE:New(ReconZone1,coalition.side.NEUTRAL)
BlueOpsZoneOne:SetDrawZone(false)
BlueOpsZoneOne:__Start(2)
local BlueOpsZoneTwo = OPSZONE:New(ReconZone2,coalition.side.RED)
BlueOpsZoneTwo:SetDrawZone(false)
BlueOpsZoneTwo:__Start(2)
local BlueOpsZoneThree = OPSZONE:New(ReconZone3,coalition.side.NEUTRAL)
BlueOpsZoneThree:SetDrawZone(false)
BlueOpsZoneThree:__Start(2)

---------------------------------------------------------------------------------
-- TODO: Brigade
---------------------------------------------------------------------------------
local Blue_Logi_Zone = ZONE:New("MCAS1_Refuel_Dallas")
local Blue_Spwn_Zone = ZONE:New("MCAS1_Refuel_Dallas")
local Blue_Brigade_One = BRIGADE:New("MCAS1_FOB_Dallas_HQ","I PzDv 1")
Blue_Brigade_One:AddRearmingZone(Blue_Logi_Zone)
Blue_Brigade_One:AddRefuellingZone(Blue_Logi_Zone)
Blue_Brigade_One:AddRetreatZone(Blue_Logi_Zone)
Blue_Brigade_One:SetSpawnZone(Blue_Spwn_Zone)
--Blue_Brigade_One:SetVerbosity(1)
Blue_Brigade_One:__Start(2)

local Blue_Regiment_Arty = PLATOON:New("MCAS1_Blue Arty-1",20,"1 PzDv ArtRg I")
Blue_Regiment_Arty:AddWeaponRange(1,9)
Blue_Regiment_Arty:AddMissionCapability({AUFTRAG.Type.ARTY, AUFTRAG.Type.BARRAGE},90)

local Blue_Regiment_Ammo = PLATOON:New("MCAS1_Blue_Ammo-1",50,"1 PzDv LogRg I")
Blue_Regiment_Ammo:AddMissionCapability({AUFTRAG.Type.AMMOSUPPLY, AUFTRAG.Type.TROOPTRANSPORT, AUFTRAG.Type.OPSTRANSPORT},80)

local Blue_Regiment_Fuel = PLATOON:New("MCAS1_Blue_Fuel-1",50,"1 PzDv LogRg II")
Blue_Regiment_Fuel:AddMissionCapability({AUFTRAG.Type.FUELSUPPLY},100)

local Blue_Regiment_APC = PLATOON:New("MCAS1_Blue_APC",50,"1 PzDv LogRg III")
Blue_Regiment_APC:AddMissionCapability({AUFTRAG.Type.TROOPTRANSPORT, AUFTRAG.Type.OPSTRANSPORT, AUFTRAG.Type.RECON},100)

local Blue_Regiment_Infantry = PLATOON:New("MCAS1_Blue_Inf",50,"1 PzDv PzGrdRg I")
Blue_Regiment_Infantry:AddMissionCapability({AUFTRAG.Type.ONGUARD},100)

Blue_Brigade_One:AddPlatoon(Blue_Regiment_Arty)
Blue_Brigade_One:AddPlatoon(Blue_Regiment_Fuel)
Blue_Brigade_One:AddPlatoon(Blue_Regiment_APC)
Blue_Brigade_One:AddPlatoon(Blue_Regiment_Infantry)

local BlueDetectionSetGroup = SET_GROUP:New():FilterCoalitions("blue"):FilterPrefixes({"Blue Awacs", "Blue Recon"}):FilterStart()
local BlueChief = CHIEF:New(coalition.side.BLUE,BlueDetectionSetGroup,"General McArthur III")


BlueChief:AddBrigade(Blue_Brigade_One)
BlueChief:AddBorderZone(BlueBorder)
BlueChief:AddRejectZone(RedBorder)
BlueChief:AddAcceptZone(BlueBorder)
BlueChief:AddAcceptZone(ReconZone1)
BlueChief:AddRejectZone(ReconZone3)
BlueChief:AddStrategicZone(ReconZone2,1,1)
BlueChief:SetStrategy(CHIEF.Strategy.OFFENSIVE)
BlueChief:AllowGroundTransport()
BlueChief:AddConflictZone(BlueConflictZone)
BlueChief:__Start(2)

local BlueInitalAuftrag = AUFTRAG:NewARMOREDGUARD(Blue_Logi_Zone:GetCoordinate())
BlueChief:AddMission(BlueInitalAuftrag)
AddMissionToQueue(BlueInitalAuftrag)

local BlueInitalAuftrag2 = AUFTRAG:NewONGUARD(ReconZonePL:GetCoordinate())
BlueInitalAuftrag2:SetRequiredTransport(ReconZonePL,1,1,ReconZonePL)
BlueChief:AddMission(BlueInitalAuftrag2)
AddMissionToQueue(BlueInitalAuftrag2)

local BlueInitalAuftrag3 = AUFTRAG:NewPATROLZONE(ReconZone1,20)
Blue_Brigade_One:AddMission(BlueInitalAuftrag3)
AddMissionToQueue(BlueInitalAuftrag3)

local BlueInitalAuftrag4 = AUFTRAG:NewFUELSUPPLY(Blue_Logi_Zone)
Blue_Brigade_One:AddMission(BlueInitalAuftrag4)
AddMissionToQueue(BlueInitalAuftrag4)

local BlueInitalAuftrag5 = AUFTRAG:NewAMMOSUPPLY(Blue_Logi_Zone)
Blue_Brigade_One:AddMission(BlueInitalAuftrag5)
AddMissionToQueue(BlueInitalAuftrag5)