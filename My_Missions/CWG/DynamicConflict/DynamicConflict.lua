----------------------------------------------------------------
-- Dynamic Conflict – COLD WAR GERMANY (GOSLAR)
----------------------------------------------------------------

-- === ZONE ===
-- local zoneBlankenburgNord   = ZONE:New("BlankenburgNord"):DrawZone()
-- local zoneBlankenburgSued   = ZONE:New("BlankenburgSued"):DrawZone()
-- local zoneBlankenburgOst    = ZONE:New("BlankenburgOst"):DrawZone()

-- local zoneRadarGDR01        = ZONE:New("RadarGDR01"):DrawZone()
-- local zoneRadarGDR05        = ZONE:New("RadarGDR05"):DrawZone()
-- local zoneQuedlinburgSAM    = ZONE:New("QuedlinburgSAM"):DrawZone()
-- local zoneWernigerode       = ZONE:New("Wernigerode"):DrawZone()

local zoneGoslarNord        = ZONE:New("GoslarNord"):DrawZone()
local opsZoneGoslarNord     = OPSZONE:New(zoneGoslarNord)
local zoneGoslarOst         = ZONE:New("GoslarOst"):DrawZone()
local opsZoneGoslarOst      = OPSZONE:New(zoneGoslarOst)
local zoneGoslarZentrum     = ZONE:New("GoslarZentrum"):DrawZone()
local opsZoneGoslarZentrum  = OPSZONE:New(zoneGoslarZentrum)

local zoneGoslarLandingStripSpawn   = ZONE:New("GoslarLandingStripSpawn"):DrawZone()
local zoneGoslarEastSpawn   = ZONE:New("GoslarEastSpawn"):DrawZone()

----------------------------------------------------------------
-- BESTAND DEFINIEREN
----------------------------------------------------------------

-- Blue Chief
-- Platoon of Leopard 2 tanks capable of GROUNDATTACK and ONGUARD missions.
local platoonBlueGoslarAttack1=PLATOON:New("Template_Leopard_1A3", 100, "Platoon Leopard Alpha")
platoonBlueGoslarAttack1:AddMissionCapability({AUFTRAG.Type.GROUNDATTACK, AUFTRAG.Type.ONGUARD, AUFTRAG.Type.CAPTUREZONE}, 90)
platoonBlueGoslarAttack1:SetGrouping(5)

local platoonBlueGoslarAttack2=PLATOON:New("Template_IFV_Marder", 100, "Platoon Marder Alpha")
platoonBlueGoslarAttack2:AddMissionCapability({AUFTRAG.Type.GROUNDATTACK, AUFTRAG.Type.ONGUARD, AUFTRAG.Type.CAPTUREZONE}, 90)
platoonBlueGoslarAttack2:SetGrouping(5)

local BrigadeBlueGoslarDefend=BRIGADE:New("WarehouseGoslarLandingStrip", "Brigade BlueGoslarDefend") --Ops.Brigade#BRIGADE
BrigadeBlueGoslarDefend:SetSpawnZone(zoneGoslarLandingStripSpawn, 90000)
BrigadeBlueGoslarDefend:AddPlatoon(platoonBlueGoslarAttack1)
BrigadeBlueGoslarDefend:AddPlatoon(platoonBlueGoslarAttack2)


-- Red Chief
local platoonRedGoslarAttack1=PLATOON:New("Template_BTR60", 100, "Platoon BTR Alpha")
platoonRedGoslarAttack1:AddMissionCapability({AUFTRAG.Type.GROUNDATTACK, AUFTRAG.Type.ONGUARD, AUFTRAG.Type.CAPTUREZONE}, 90)
platoonRedGoslarAttack1:SetGrouping(5)

local platoonRedGoslarAttack2=PLATOON:New("Template_T62", 100, "Platoon T62 Alpha")
platoonRedGoslarAttack2:AddMissionCapability({AUFTRAG.Type.GROUNDATTACK, AUFTRAG.Type.ONGUARD, AUFTRAG.Type.CAPTUREZONE}, 90)
platoonRedGoslarAttack2:SetGrouping(5)

local BrigadeRedGoslarAttack=BRIGADE:New("WarehouseGoslarEast", "Brigade RedGoslarAttack") --Ops.Brigade#BRIGADE
BrigadeRedGoslarAttack:SetSpawnZone(zoneGoslarEastSpawn, 90000)
BrigadeRedGoslarAttack:AddPlatoon(platoonRedGoslarAttack1)
BrigadeRedGoslarAttack:AddPlatoon(platoonRedGoslarAttack2)

----------------------------------------------------------------
-- CHIEFS
----------------------------------------------------------------
-- Define INTEL Sets
local RedSet = SET_GROUP:New():FilterCoalitions("red"):FilterStart()
local BlueSet = SET_GROUP:New():FilterCoalitions("blue"):FilterStart()

local RedChief = CHIEF:New(coalition.side.RED, RedSet)
local BlueChief = CHIEF:New(coalition.side.BLUE, BlueSet)

-- Assign Brigades to Chiefs

BlueChief:AddBrigade(BrigadeBlueGoslarDefend)
BlueChief:SetStrategy(CHIEF.Strategy.OFFENSIVE)
RedChief:AddBrigade(BrigadeRedGoslarAttack)
RedChief:SetStrategy(CHIEF.Strategy.OFFENSIVE)

-- Zielzone
RedChief:AddStrategicZone(opsZoneGoslarNord, 1)
RedChief:AddStrategicZone(opsZoneGoslarOst, 1)
RedChief:AddStrategicZone(opsZoneGoslarZentrum, 1)

BlueChief:AddStrategicZone(opsZoneGoslarNord, 1)
BlueChief:AddStrategicZone(opsZoneGoslarOst, 1)
BlueChief:AddStrategicZone(opsZoneGoslarZentrum, 1)

-- Configure
-- BlueChief:SetTacticalOverviewOn()
-- RedChief:SetTacticalOverviewOn()

RedChief:Start()
BlueChief:Start()

---- Blue Chief
-- Send First Mission for Goslar
local missionCapture=AUFTRAG:NewPATROLZONE(opsZoneGoslarNord)
missionCapture:AddConditionSuccess(function() return opsZoneGoslarNord:IsBlue() end)
BlueChief:AddMission(missionCapture)

-- Send Second Mission for Goslar
local missionCapture=AUFTRAG:NewPATROLZONE(opsZoneGoslarOst)
missionCapture:AddConditionSuccess(function() return opsZoneGoslarOst:IsBlue() end)
BlueChief:AddMission(missionCapture)

-- Send Third Mission for Goslar
local missionCapture=AUFTRAG:NewPATROLZONE(opsZoneGoslarZentrum)
missionCapture:AddConditionSuccess(function() return opsZoneGoslarZentrum:IsBlue() end)
BlueChief:AddMission(missionCapture)

---- Red Chief
-- Send First Mission for Goslar
local missionCapture=AUFTRAG:NewPATROLZONE(opsZoneGoslarNord)
missionCapture:AddConditionSuccess(function() return opsZoneGoslarNord:IsRed() end)
RedChief:AddMission(missionCapture)

-- Send Second Mission for Goslar
local missionCapture=AUFTRAG:NewPATROLZONE(opsZoneGoslarOst)
missionCapture:AddConditionSuccess(function() return opsZoneGoslarOst:IsRed() end)
BlueChief:AddMission(missionCapture)

-- Send Third Mission for Goslar
local missionCapture=AUFTRAG:NewPATROLZONE(opsZoneGoslarZentrum)
missionCapture:AddConditionSuccess(function() return opsZoneGoslarZentrum:IsRed() end)
BlueChief:AddMission(missionCapture)


function opsZoneGoslarNord:OnAfterCaptured(From, Event, To, Coalition)
    local coalition = Coalition
        local text="Zone Goslar Nord was captured by " .. coalition
        MESSAGE:New(text, 30):ToAll()
        env.info(text)
    if (coalition == 1) then -- RED captured the zone
        local missionCapture=AUFTRAG:NewPATROLZONE(opsZoneGoslarNord)
        missionCapture:AddConditionSuccess(function() return opsZoneGoslarNord:IsBlue() end)
        BlueChief:AddMission(missionCapture)
    else -- BLUE Captured the zone
        local missionCapture=AUFTRAG:NewPATROLZONE(opsZoneGoslarNord)
        missionCapture:AddConditionSuccess(function() return opsZoneGoslarNord:IsRed() end)
        RedChief:AddMission(missionCapture)
    end
end

function opsZoneGoslarOst:OnAfterCaptured(From, Event, To, Coalition)
    local coalition = Coalition
        local text="Zone Goslar Ost was captured by " .. coalition
        MESSAGE:New(text, 30):ToAll()
        env.info(text)
    if (coalition == 1) then -- RED captured the zone
        local missionCapture=AUFTRAG:NewPATROLZONE(opsZoneGoslarNord)
        missionCapture:AddConditionSuccess(function() return opsZoneGoslarOst:IsBlue() end)
        BlueChief:AddMission(missionCapture)
    else -- BLUE Captured the zone
        local missionCapture=AUFTRAG:NewPATROLZONE(opsZoneGoslarNord)
        missionCapture:AddConditionSuccess(function() return opsZoneGoslarOst:IsRed() end)
        RedChief:AddMission(missionCapture) 
    end
end

function opsZoneGoslarZentrum:OnAfterCaptured(From, Event, To, Coalition)
    local coalition = Coalition
        local text="Zone Goslar Zentrum was captured by " .. coalition
        MESSAGE:New(text, 30):ToAll()
        env.info(text)
    if (coalition == 1) then -- RED captured the zone
        local missionCapture=AUFTRAG:NewPATROLZONE(opsZoneGoslarNord)
        missionCapture:AddConditionSuccess(function() return opsZoneGoslarZentrum:IsBlue() end)
        BlueChief:AddMission(missionCapture)
    else -- BLUE Captured the zone
        local missionCapture=AUFTRAG:NewPATROLZONE(opsZoneGoslarNord)
        missionCapture:AddConditionSuccess(function() return opsZoneGoslarZentrum:IsRed() end)
        RedChief:AddMission(missionCapture)
    end
end



function BrigadeBlueGoslarDefend:OnAfterAssetSpawned(From, Event, To, group, asset, request)
        local text="Brigade Goslar spawned  " .. group.GroupName
        MESSAGE:New(text, 30):ToAll()
        env.info(text)

        local coord = group:GetCoordinate()
        local marker = MARKER:New(coord, "Tracked Group: ".. group.GroupName .. "\nProvide CAS!")
        marker:ToAll()

        -- Scheduler to mark Position every 30 seconds
        local TestScheduler = SCHEDULER:New( nil, 
            function()
                    if not group:IsAlive() then
                        marker:Remove()
                        return
                    end
                coord = group:GetCoordinate()
                marker:UpdateCoordinate(coord)
            end, {}, 10, 30
            )
end


