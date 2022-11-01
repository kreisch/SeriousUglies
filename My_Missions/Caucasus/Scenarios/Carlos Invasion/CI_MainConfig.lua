

-- Initialize Scoring
Scoring = SCORING:New( "ScoringTest" )
Scoring:SetScaleDestroyScore( 100 )
Scoring:SetScaleDestroyPenalty( 400 )
Scoring:SetMessagesToAll()
Scoring:SetMessagesScore(true)
--Scoring:SetMessagesHit(true)
Scoring:SetMessagesDestroy(true)
Scoring:SwitchFratricide(false) -- has to be turned off, as the loading of troups counts as blue on blue (blue groups are destroyed)
Scoring:SwitchTreason(false) -- switching from blue to red is allowed. 

--CIconfig {
--    useTankersBlue = true,
--    useTankersRed = true,
--    useAWACsSRS = true
--}

-- Register all factories in the zones (todo: switch to work automatically when initializing a zone)

--registerFactory(factoryConfigs["CombatZone-1"])
registerFactory("RF_CZ01")
registerFactory("RF_CZ02")


Scoring:AddStaticScore( STATIC:FindByName( "Ru_Zone1_HQ" ), 100 )

-- #region OPTIONS
local useEnemyAir = true
-- #endregion

local function OnAfterCapturedCZ1()
  trigger.action.outText("On After Captured CombatZone-1", 30)
end

local function OnEnterAttackedDoCZ1()
  trigger.action.outText("On Enter Attack CombatZone-1", 30)
end

local function OnAfterAttackedDoCZ1()
  trigger.action.outText("On After Attack CombatZone-1", 30)
end

local function OnEnterGuardedDoCZ1()
  trigger.action.outText("On Enter Guarded CombatZone-1", 30)
end


local zoneConfigs = {
  ["CombatZone-1"] = { airwing = AWNalchik, Zone = nil, OpsZone = nil, 
                       OnAfterCapturedDo =  OnAfterCapturedCZ1,
                       OnEnterAttackedDo = OnEnterAttackedDoCZ1, 
                       OnAfterAttackedDo = OnAfterAttackedDoCZ1, 
                       OnEnterGuardedDo = OnEnterGuardedDoCZ1 }, -- easy
  ["CombatZone-2"] = {airwing = AWFARP_RF_CZ02_02, Zone = nil, OpsZone = nil}, -- easy
  ["CombatZone-3"] = {airwing = AWNalchik, Zone = nil, OpsZone = nil}, -- medium
  ["CombatZone-4"] = {airwing = AWNalchik, Zone = nil, OpsZone = nil}, -- medium
  ["CombatZone-5"] = {airwing = AWNalchik, Zone = nil, OpsZone = nil}, -- medium
}


-- Concept:
-- AI is using recce troops to gain INTEL (Moose)
-- All placed units of a ZONE will be read into a GROUPSET (Moose)
-- All TARGETS acquired by INTEL will result in an AUFTRAG to kill them
-- Respawn of destroyed RED Units will be handled by SKYFIRE-FRAMEWORK-TM
-- #region define Airwings for RED
--[[
local airwingErcan = AIRWING:New("Warehouse_Ercan", "Arwing Ercan")
airwingErcan:Start()
local Ercan1st = SQUADRON:New("RU_Su25_Template", 8, "Ercan 1st")
Ercan1st:AddMissionCapability({AUFTRAG.Type.SEAD, AUFTRAG.Type.BAI, AUFTRAG.Type.CAS})
Ercan1st:SetGrouping(2)
Ercan1st:SetSkill(AI.Skill.EXCELLENT)
airwingErcan:AddSquadron(Ercan1st)
airwingErcan:NewPayload(GROUP:FindByName("SU25_Template_SEAD"), 20, {AUFTRAG.Type.SEAD, AUFTRAG.Type.BAI, AUFTRAG.Type.CAS}, 80)
airwingErcan:SetTakeoffAir()

local airwingGecitkale = AIRWING:New("Warehouse_Gecitkale", "Arwing Gecitkale")
airwingGecitkale:Start()
local Gecitkale1st = SQUADRON:New("RU_Mi28_Template", 8, "Gecitkale 1st")
Gecitkale1st:AddMissionCapability({AUFTRAG.Type.CAS})
Gecitkale1st:SetGrouping(2)
Gecitkale1st:SetSkill(AI.Skill.EXCELLENT)
airwingGecitkale:AddSquadron(Gecitkale1st)
airwingGecitkale:NewPayload(GROUP:FindByName("Mi28_Template_CAS"), 20, {AUFTRAG.Type.CAS}, 80)
airwingGecitkale:SetTakeoffAir()
-- #endregion
]]


local function initZone(_name)
  env.info("initZone - " .. _name)
  local theZone = ZONE:New(_name)
  zoneConfigs[_name]["Zone"] = theZone

  local theOpsZone = OPSZONE:New(theZone, coalition.side.NEUTRAL)
  theOpsZone:SetDrawZone(true)
  theOpsZone:__Start(2)

  zoneConfigs[_name]["OpsZone"] = theOpsZone
  zoneConfigs[_name]["OpsZone"]:SetObjectCategories({Object.Category.UNIT}) -- Ensure, that no leftover statics will count as part of eg. red coalition 

  DoPatrolsInZone(theZone)

  -- wenn diese Methoden drin sind, werden die Zonen nicht richtig gezeichnet.
  function theOpsZone:OnAfterCaptured(From, Event, To, Coalition)
    if Coalition == coalition.side.BLUE then
      local m = MESSAGE:New("We captured " .. theOpsZone:GetName() .. "! Well done! ", 15, "Blue Chief"):ToAll()
    else
      local m = MESSAGE:New("We lost " .. theOpsZone:GetName() .. "! Capture it back! ", 15, "Blue Chief"):ToAll()
    end

    if zoneConfigs[_name]["OnAfterCapturedDo"] then
      zoneConfigs[_name]["OnAfterCapturedDo"]()
    end

  end

  function theOpsZone:OnEnterAttacked(From, Event, To)
    local m = MESSAGE:New(theOpsZone:GetName() .. " OnEnterAttacked! ", 15, "Blue Chief"):ToAll()

    if zoneConfigs[_name]["OnEnterAttackedDo"] then
      zoneConfigs[_name]["OnEnterAttackedDo"]()
    end

  end

  function theOpsZone:OnAfterAttacked(From, Event, To, AttackerCoalition)
    local m = MESSAGE:New(theOpsZone:GetName() .. " OnAfterAttacked! ", 15, "Blue Chief"):ToAll()

    if zoneConfigs[_name]["OnAfterAttackedDo"] then
      zoneConfigs[_name]["OnAfterAttackedDo"]()
    end

  end

  function theOpsZone:OnEnterGuarded(From, Event, To)
    local m = MESSAGE:New(theOpsZone:GetName() .. " Guarded ", 15, "Blue Chief"):ToAll()

    if zoneConfigs[_name]["OnEnterGuardedDo"] then
      zoneConfigs[_name]["OnEnterGuardedDo"]()
    end

  end
end


local function doActionForZone(_inZone, _contact)
  MESSAGE:New("TargetTaskingCombatZone " .. _inZone:GetName(), 20, "Debug"):ToAll()
  MESSAGE:New("TargetTaskingCombatZone Type " .. _inZone.ClassName, 20, "Debug"):ToAll()
  local targetGroup = GROUP:FindByName(_contact.groupname)

  if (_contact.attribute == "Ground_APC") or (_contact.attribute == "Ground_Artillery") or
    (_contact.attribute == "Ground_Truck") or (_contact.attribute == "Ground_Tank") or
    (_contact.attribute == "Ground_IFV") then
    -- Spawn Groundattack
    MESSAGE:New("GroundTarget is found in " .. _inZone:GetName() .. "\n Starting Tankattack", 20, "Debug"):ToAll()
    env.info("GroundTarget is found in " .. _inZone:GetName() .. "\n Starting Tankattack")

    local actionZone = zoneConfigs[_inZone:GetName()]["Zone"]

    local SetGroupsGround = SET_GROUP:New():FilterCoalitions("red"):FilterZones({_inZone}):FilterPrefixes("QRF")
      :FilterCategoryGround():FilterActive():FilterOnce() -- Todo: Nur lebende enthalten? Laut Applevangelist ja; Active notwendig?

    MESSAGE:New("We have " .. SetGroupsGround:Count() .. " groups available as QRF."):ToAll()
    local groupForTasking = SetGroupsGround:GetRandom()

    if groupForTasking ~= nil then
      --    MESSAGE:New("Attacking group is: " .. groupForTasking:GetName(), 20, "Debug"):ToAll()
      env.info("Attacking group is: " .. groupForTasking:GetName() .. ", available are " .. SetGroupsGround:Count())
      groupForTasking = respawnAtCurrentPosition(groupForTasking)
      --    MESSAGE:New("Attacking group changed to: " .. groupForTasking:GetName(), 20, "Debug"):ToAll()
      env.info("Attacking group changed to: " .. groupForTasking:GetName())

      local mission = AUFTRAG:NewARMORATTACK(GROUP:FindByName(_contact.groupname), UTILS.KmphToKnots(20), "Vee")
      local armygroup = ARMYGROUP:New(groupForTasking:GetName())
      armygroup:SetDefaultFormation(ENUMS.Formation.Vehicle.OnRoad)
      armygroup:AddWeaponRange(0, UTILS.KiloMetersToNM(2))
      armygroup:AddMission(mission)
    elseif (true) then -- Hier abfragen ob CAS aktiviert werden soll fuer rot.
      local mission = AUFTRAG:NewBAI(targetGroup, nil)
      mission:SetRepeatOnFailure(6)
      zoneConfigs[_inZone:GetName()]["airwing"]:AddMission(mission)
      MESSAGE:New("Added mission to airwing"):ToAll()
      env.info("GroundTarget is found in " .. _inZone:GetName() .. "\n Starting CAS-ATTACK")
    end

  elseif (_contact.attribute == "Ground_EWR") or (_contact.attribute == "Ground_SAM") or
    (_contact.attribute == "Ground_AAA") then -- Spawn SEAD
    if useEnemyAir and zoneConfigs[_inZone:GetName()]["airwing"] ~= nil then
      -- Regel: Man kann nun schauen, dass man SEAD aus bestimmten Arealen holt, sollten entsprechende Bedingungen da sein.
      local mission = AUFTRAG:NewSEAD(GROUP:FindByName(_contact.groupname), 5000)
      mission:SetRepeatOnFailure(6)
      -- local zone = ZONE_GROUP:New("SEAD Zone", targetGroup, 500)
      -- local mission = AUFTRAG:NewCAS(zone)
      zoneConfigs[_inZone:GetName()]["airwing"]:AddMission(mission)
      MESSAGE:New("Added mission to airwing"):ToAll()

    end
  elseif (_contact.attribute == "Air_Fighter") or (_contact.attribute == "Air_AttackHelo") or
    (_contact.attribute == "Air_TransportHelo") then
    -- Figher anfordern beim nächsten Airfield

  end
end



-- Define the INTEL
-- Set up a detection group set. "FilterStart" to include respawns.
local Red_DetectionSetGroup = SET_GROUP:New():FilterCoalitions("red"):FilterActive():FilterStart()
-- Red_DetectionSetGroup:FilterPrefixes( { "RU_Recce","RU_EWR" } )
-- Red_DetectionSetGroup:FilterStart()

-- New INTEL Type
local RedIntel = INTEL:New(Red_DetectionSetGroup, "red", "KGB")
RedIntel:SetClusterAnalysis(true, true)
RedIntel:SetVerbosity(2)
RedIntel:__Start(2)
-- Restrict to Combat_Zones to avoid cluttering of contacts.
local SetCombatZones = SET_ZONE:New():FilterPrefixes("CombatZone"):FilterOnce()
RedIntel:SetAcceptZones(SetCombatZones)

-- Events to create AUFTRAG
-- Sobald eine Recce-Gruppe ein Ziel gesichtet hat, wird eine Mission erstellt.
-- possible contact.attribute:
-- Air_AttackHelo
-- Air_Fighter
-- Ground_Infantry
-- Ground_AAA
-- Ground_SAM
-- Air_TransportHelo
-- Ground_OtherGround
function RedIntel:OnAfterNewContact(From, Event, To, contact)
  local trgtGrp = contact.group
  trigger.action.outText("KGB: I found a " .. contact.attribute .. " called " .. contact.groupname, 30)

  -- Find zone where contact happened and react
  local cpos = contact.position or contact.group:GetCoordinate() 
  local inZone = SetCombatZones:IsCoordinateInZone(cpos)

  if inZone ~= nil then
    doActionForZone(inZone, contact)  
  end
end

local Red_DetectionSetGroupAWACS = SET_GROUP:New():FilterCoalitions("red"):FilterActive():FilterPrefixes( { "RU_Recce","RU_EWR" } ):FilterStart()
local RedIntelAwacs = INTEL:New(Red_DetectionSetGroupAWACS, "red", "KGB AWACS")
RedIntelAwacs:SetClusterAnalysis(true, true)
RedIntelAwacs:SetVerbosity(2)
RedIntelAwacs:__Start(2)
local SetCombatZonesAWACS = SET_ZONE:New():FilterPrefixes("FEZ"):FilterOnce()
RedIntelAwacs:SetAcceptZones(SetCombatZonesAWACS)

function RedIntelAwacs:OnAfterNewContact(From, Event, To, contact)
  local trgtGrp = contact.group
  trigger.action.outText("KGB AWACS: I found a " .. contact.attribute .. " called " .. contact.groupname, 30)
  local targetGroup = GROUP:FindByName(_contact.groupname)
  local mIntercept = AUFTRAG:NewINTERCEPT(targetGroup)
  AWMozdok:AddMission(mIntercept)
end

-- Initialize combat zones from config
for zoneItName, zoneItConfig in pairs( zoneConfigs ) do
  initZone(zoneItName)
end

-- Make all red units ALARMSTATE RED

local SetGroups = SET_GROUP:New():FilterCoalitions("red"):FilterCategoryGround():FilterOnce()

SetGroups:ForEachGroup(function(groupMakeAngry)
    env.info("Setting Group to RED: " .. groupMakeAngry:GetName())
    groupMakeAngry:OptionAlarmStateRed()
  end
)
