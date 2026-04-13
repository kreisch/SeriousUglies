---todo Liste an Features:
--- Hercules : Airdrop Ammo?
--- Chief: Squadron vom Carrier (Tanker Zonen, 2 Stück).

----------------------------------------------------------------
-- Dynamic Conflict – COLD WAR GERMANY (GOSLAR)
----------------------------------------------------------------
env.info("CHIEFs: Loading")
-- === ZONES ===

local zoneCampBastion        = ZONE:New("ZoneChiefCampBastion"):DrawZone()
local opszoneCampBastion     = OPSZONE:New(ZONE:New("ZoneChiefCampBastion")):Start()

--- Das sind Conflict-Zones, die feindliche Präsenz prüfen
local zoneChiefQuadrantNR    = ZONE:New("ChiefQuadrantNR"):DrawZone()
local opszoneChiefQuadrantNR = OPSZONE:New(ZONE:New("ChiefQuadrantNR")):Start()
local zoneChiefQuadrantPR    = ZONE:New("ChiefQuadrantPR"):DrawZone()
local opszoneChiefQuadrantPR = OPSZONE:New(ZONE:New("ChiefQuadrantPR")):Start()
local zoneChiefQuadrantNQ    = ZONE:New("ChiefQuadrantNQ"):DrawZone()
local opszoneChiefQuadrantNQ = OPSZONE:New(ZONE:New("ChiefQuadrantNQ")):Start()
local zoneChiefQuadrantPQ    = ZONE:New("ChiefQuadrantPQ"):DrawZone()
local opszoneChiefQuadrantPQ = OPSZONE:New(ZONE:New("ChiefQuadrantPQ")):Start()

--- Hier kommen Strategic Zones, die vom Chief eingenommen werden sollen (mittels Transport-Helos bspw.)
local stratZoneBostAirfield = OPSZONE:New(ZONE:New("stratZoneBostAirfield"), coalition.side.RED)
stratZoneBostAirfield:SetCaptureThreatlevel(10)
stratZoneBostAirfield:SetCaptureTime(120)


----------------------------------------------------------------
-- BESTAND DEFINIEREN
----------------------------------------------------------------
---

--- AIRWINGS Blue

local sqReaperScouts = SQUADRON:New("Template_Reaper", 50, "Reaper Scouts")
sqReaperScouts:SetDespawnAfterLanding(true)
sqReaperScouts:SetGrouping(1)
sqReaperScouts:SetTakeoffHot()
sqReaperScouts:AddMissionCapability({AUFTRAG.Type.RECON, AUFTRAG.Type.PATROLZONE})

local sqBlackHawks = SQUADRON:New("Template_UH60", 50, "Black Hawks")
sqBlackHawks:SetGrouping(1)
sqBlackHawks:SetTakeoffHot()
sqBlackHawks:SetAttribute(GROUP.Attribute.AIR_TRANSPORTHELO)
sqBlackHawks:AddMissionCapability({AUFTRAG.Type.TROOPTRANSPORT, AUFTRAG.Type.OPSTRANSPORT, AUFTRAG.Type.CARGOTRANSPORT})

-- local sqChinooks = SQUADRON:New("Template_CH-47D", 50, "Chinooks")
-- sqChinooks:SetGrouping(1)
-- sqChinooks:SetTakeoffHot()
-- sqChinooks:AddMissionCapability({AUFTRAG.Type.TROOPTRANSPORT})


local awCampBastion = AIRWING:New("whCampBastion", "Airwing Bastioneers")
awCampBastion:AddSquadron(sqReaperScouts)
awCampBastion:AddSquadron(sqBlackHawks)
-- awCampBastion:AddSquadron(sqChinooks)

-- Add Payloads to Airwings, mandatory for each AUFTRAG.Type.
awCampBastion:NewPayload(GROUP:FindByName("Template_Reaper"), -1, {AUFTRAG.Type.RECON, AUFTRAG.Type.PATROLZONE, AUFTRAG.Type.PATROLRACETRACK, AUFTRAG.Type.ORBIT}, 100)
awCampBastion:NewPayload(GROUP:FindByName("Template_UH60"), -1, {AUFTRAG.Type.TROOPTRANSPORT, AUFTRAG.Type.OPSTRANSPORT, AUFTRAG.Type.CARGOTRANSPORT}, 100)
-- awCampBastion:NewPayload(GROUP:FindByName("Template_CH-47D"), -1, {AUFTRAG.Type.TROOPTRANSPORT}, 100)


-- Blue Chief
-- Platoon of Leopard 2 tanks capable of GROUNDATTACK and ONGUARD missions.
local platoonM1A1=PLATOON:New("Template_M1A1", 100, "Platoon Abrams Alpha")
platoonM1A1:AddMissionCapability({AUFTRAG.Type.GROUNDATTACK, AUFTRAG.Type.ONGUARD, AUFTRAG.Type.CAPTUREZONE}, 90)
platoonM1A1:SetGrouping(2)

local platoonM2A2=PLATOON:New("Template_M2A2", 100, "Platoon Bradley Alpha")
platoonM2A2:AddMissionCapability({AUFTRAG.Type.GROUNDATTACK, AUFTRAG.Type.ONGUARD, AUFTRAG.Type.CAPTUREZONE, AUFTRAG.Type.OPSTRANSPORT}, 90)
platoonM2A2:SetGrouping(3)
platoonM2A2:SetAttribute(GROUP.Attribute.GROUND_APC)

local platoonInfRifle=PLATOON:New("Template_BlueRifle", 100, "Platoon Inf Alpha")
platoonInfRifle:AddMissionCapability({AUFTRAG.Type.GROUNDATTACK, AUFTRAG.Type.ONGUARD, AUFTRAG.Type.CAPTUREZONE}, 90)
platoonInfRifle:SetGrouping(10)
platoonInfRifle:SetAttribute(GROUP.Attribute.GROUND_INFANTRY)

local BrigadeCampBastion=BRIGADE:New("whCampBastion", "Brigade Camp Bastion") --Ops.Brigade#BRIGADE
BrigadeCampBastion:SetSpawnZone(zoneCampBastion, 90000)
BrigadeCampBastion:AddPlatoon(platoonM1A1)
BrigadeCampBastion:AddPlatoon(platoonM2A2)
BrigadeCampBastion:AddPlatoon(platoonInfRifle)




----------------------------------------------------------------
-- CHIEFS
----------------------------------------------------------------
-- Define INTEL Sets
local RedSet = SET_GROUP:New():FilterCoalitions("red"):FilterStart()
local BlueSet = SET_GROUP:New():FilterCoalitions("blue"):FilterStart()

local BlueChief = CHIEF:New(coalition.side.BLUE, BlueSet)
local RedChief = CHIEF:New(coalition.side.RED, RedSet)

-- Assign Brigades to Chiefs
BlueChief:AddBrigade(BrigadeCampBastion)

-- Assign Airwings
BlueChief:AddAirwing(awCampBastion)

BlueChief:SetStrategy(CHIEF.Strategy.TOTALWAR)


-- Conflict Zones
-- BlueChief:AddConflictZone(zoneChiefQuadrantNR)
BlueChief:AddConflictZone(zoneChiefQuadrantPR)
BlueChief:AddConflictZone(zoneChiefQuadrantNQ)
BlueChief:AddConflictZone(zoneChiefQuadrantPQ)
BlueChief:AddBorderZone(zoneCampBastion)
-- BlueChief:AddStrategicZone(ZONE:New("stratZoneBostAirfield"))
-- BlueChief:AddStrategicZone(ZONE:New("stratZoneDwyerAirfield"))



-- Configure
BlueChief:SetTacticalOverviewOn()
-- RedChief:SetTacticalOverviewOn()

BlueChief:Start()

-- -- Creates a resource for the CIEF, we will use this when creating the strategic zone
-- local ResourceEmpty, ResourceGuardInfantry = BlueChief:CreateResource(AUFTRAG.Type.ONGUARD, 7, 14,nil,nil, GROUP.Attribute.GROUND_INFANTRY)
-- local ResourceOccupied, ResourceAttackInfantry = BlueChief:CreateResource(AUFTRAG.Type.ONGUARD, 7, 14,nil,nil,  GROUP.Attribute.GROUND_INFANTRY)

-- BlueChief:AddTransportToResource(ResourceGuardInfantry, 1, 1,
--     { GROUP.Attribute.AIR_TRANSPORTHELO, GROUP.Attribute.GROUND_APC })

-- BlueChief:AddTransportToResource(ResourceAttackInfantry, 1, 1,
--     { GROUP.Attribute.AIR_TRANSPORTHELO, GROUP.Attribute.GROUND_APC })

-- --- Strategic Zones
-- BlueChief:AddStrategicZone(stratZoneBostAirfield, coalition.side.RED, 50, 2, ResourceOccupied, ResourceEmpty)

---- Blue Chief
-- Send First Mission for Helmand Zones
local missionPatrol=AUFTRAG:NewPATROLZONE(zoneChiefQuadrantPR, 200)
BlueChief:AddMission(missionPatrol)
local missionPatrol=AUFTRAG:NewPATROLZONE(zoneChiefQuadrantNR, 200)
BlueChief:AddMission(missionPatrol)
local missionPatrol=AUFTRAG:NewPATROLZONE(zoneChiefQuadrantNQ, 200)
BlueChief:AddMission(missionPatrol)
local missionPatrol=AUFTRAG:NewPATROLZONE(zoneChiefQuadrantPQ, 200)
BlueChief:AddMission(missionPatrol)

local missionCapture=AUFTRAG:NewCAPTUREZONE(stratZoneBostAirfield, 2, nil, nil, nil, 600)
BlueChief:AddMission(missionCapture)


-- function opszoneChiefQuadrantPR:OnAfterCaptured(From, Event, To, Coalition)
--     local coalition = Coalition
--         local text="Quadrant PR was captured by " .. coalition
--         MESSAGE:New(text, 30):ToAll()
--         env.info(text)
--     if (coalition == 1) then -- RED captured the zone
--         local missionCapture=AUFTRAG:NewPATROLZONE(zoneChiefQuadrantPR)
--         missionCapture:AddConditionSuccess(function() return opszoneChiefQuadrantPR:IsBlue() end)
--         BlueChief:AddMission(missionCapture)
--     else -- BLUE Captured the zone
--         local missionCapture=AUFTRAG:NewPATROLZONE(zoneChiefQuadrantPR)
--         missionCapture:AddConditionSuccess(function() return opszoneChiefQuadrantPR:IsRed() end)
--         RedChief:AddMission(missionCapture)
--     end
-- end

-- function opsZoneGoslarOst:OnAfterCaptured(From, Event, To, Coalition)
--     local coalition = Coalition
--         local text="Zone Goslar Ost was captured by " .. coalition
--         MESSAGE:New(text, 30):ToAll()
--         env.info(text)
--     if (coalition == 1) then -- RED captured the zone
--         local missionCapture=AUFTRAG:NewPATROLZONE(opsZoneGoslarNord)
--         missionCapture:AddConditionSuccess(function() return opsZoneGoslarOst:IsBlue() end)
--         BlueChief:AddMission(missionCapture)
--     else -- BLUE Captured the zone
--         local missionCapture=AUFTRAG:NewPATROLZONE(opsZoneGoslarNord)
--         missionCapture:AddConditionSuccess(function() return opsZoneGoslarOst:IsRed() end)
--         RedChief:AddMission(missionCapture) 
--     end
-- end

-- function opsZoneGoslarZentrum:OnAfterCaptured(From, Event, To, Coalition)
--     local coalition = Coalition
--         local text="Zone Goslar Zentrum was captured by " .. coalition
--         MESSAGE:New(text, 30):ToAll()
--         env.info(text)
--     if (coalition == 1) then -- RED captured the zone
--         local missionCapture=AUFTRAG:NewPATROLZONE(opsZoneGoslarNord)
--         missionCapture:AddConditionSuccess(function() return opsZoneGoslarZentrum:IsBlue() end)
--         BlueChief:AddMission(missionCapture)
--     else -- BLUE Captured the zone
--         local missionCapture=AUFTRAG:NewPATROLZONE(opsZoneGoslarNord)
--         missionCapture:AddConditionSuccess(function() return opsZoneGoslarZentrum:IsRed() end)
--         RedChief:AddMission(missionCapture)
--     end
-- end



-- function BrigadeBlueGoslarDefend:OnAfterAssetSpawned(From, Event, To, group, asset, request)
--         local text="Brigade Goslar spawned  " .. group.GroupName
--         MESSAGE:New(text, 30):ToAll()
--         env.info(text)

--         local coord = group:GetCoordinate()
--         local marker = MARKER:New(coord, "Tracked Group: ".. group.GroupName .. "\nProvide CAS!")
--         marker:ToAll()

--         -- Scheduler to mark Position every 30 seconds
--         local TestScheduler = SCHEDULER:New( nil, 
--             function()
--                     if not group:IsAlive() then
--                         marker:Remove()
--                         return
--                     end
--                 coord = group:GetCoordinate()
--                 marker:UpdateCoordinate(coord)
--             end, {}, 10, 30
--             )
-- end


env.info("CHIEFs: Loaded")