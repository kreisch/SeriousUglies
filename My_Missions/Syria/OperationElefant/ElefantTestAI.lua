-- Concept:
-- AI is using recce troops to gain INTEL (Moose)
-- All placed units of a ZONE will be read into a GROUPSET (Moose)
-- All TARGETS acquired by INTEL will result in an AUFTRAG to kill them
-- Respawn of destroyed RED Units will be handled by SKYFIRE-FRAMEWORK-TM


--#region define Airwings for RED
local airwingErcan = AIRWING:New("Warehouse_Ercan", "Arwing Ercan")
airwingErcan:Start()
local Ercan1st  = SQUADRON:New("RU_Su25_Template", 8, "Ercan 1st")
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
--#endregion

--#region OPTIONS
local useEnemyAir = false
--#endregion

--#region Zones
--Zonen definieren:
local CombatZone1 = ZONE:New("CombatZone-1") -- easy
local CombatZone2 = ZONE:New("CombatZone-2") -- easy
local CombatZone3 = ZONE:New("CombatZone-3") -- medium
-- Opszonen definieren - warum? Jede Zone bekommt eigene Ops....weil darum.
local BlueOpsZoneOne = OPSZONE:New(CombatZone1,coalition.side.NEUTRAL)
BlueOpsZoneOne:SetDrawZone(true)
BlueOpsZoneOne:__Start(2)
local BlueOpsZoneTwo = OPSZONE:New(CombatZone2,coalition.side.NEUTRAL)
BlueOpsZoneOne:SetDrawZone(true)
BlueOpsZoneOne:__Start(2)
local BlueOpsZoneThree = OPSZONE:New(CombatZone3,coalition.side.NEUTRAL)
BlueOpsZoneOne:SetDrawZone(true)
BlueOpsZoneOne:__Start(2)
--#endregion


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
local SetCombatZones   = SET_ZONE:New():FilterPrefixes("CombatZone"):FilterOnce()
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
        local trgtGrp = GROUP:FindByName(contact.groupname)
        trigger.action.outText("KGB: I found a " .. contact.attribute .. " called " ..  contact.groupname, 30)
        if trgtGrp:IsCompletelyInZone(CombatZone1) then
          TargetTaskingCombatZone1(contact)
        elseif trgtGrp:IsCompletelyInZone(CombatZone2) then
          TargetTaskingCombatZone2(contact)
        end
  end

function TargetTaskingCombatZone1(contact)
  MESSAGE:New("TargetTaskingCombatZone1", 20, "Debug"):ToAll()
  local targetGroup = GROUP:FindByName(contact.groupname)

  if (contact.attribute == "Ground_APC") or (contact.attribute == "Ground_Artillery") 
  or (contact.attribute =="Ground_Truck") or (contact.attribute =="Ground_Tank") 
  or (contact.attribute =="Ground_IFV") then
    -- Spawn Groundattack
    MESSAGE:New("GroundTarget is found in Sector 1\n Starting Tankattack", 20, "Debug"):ToAll()
    local SetGroupsGround = SET_GROUP:New():FilterCoalitions("red"):FilterZones({CombatZone1}):FilterCategoryGround():FilterActive():FilterOnce() --Todo: Nur lebende enthalten? Laut Applevangelist ja; Active notwendig?
      local mission = AUFTRAG:NewARMORATTACK(GROUP:FindByName(contact.groupname),UTILS.KmphToKnots(20),"Vee")
      
      local groupForTasking = SetGroupsGround:GetRandom()
      MESSAGE:New("Attacking group is " .. groupForTasking:GetName(), 20, "Debug"):ToAll()

      groupForTasking = respawnAtLastWP(groupForTasking, 1, 1)

      local armygroup = ARMYGROUP:New(groupForTasking:GetName())
      armygroup:SetDefaultFormation(ENUMS.Formation.Vehicle.OnRoad)
      armygroup:AddWeaponRange(0,UTILS.KiloMetersToNM(2))
      armygroup:AddMission(mission)


  elseif (contact.attribute == "Ground_EWR") or (contact.attribute == "Ground_SAM") or (contact.attribute == "Ground_AAA")then -- Spawn SEAD
    if useEnemyAir then
      -- Regel: Man kann nun schauen, dass man SEAD aus bestimmten Arealen holt, sollten entsprechende Bedingungen da sein.
      local mission = AUFTRAG:NewSEAD(GROUP:FindByName(contact.groupname), 5000)
      -- local zone = ZONE_GROUP:New("SEAD Zone", targetGroup, 500)
      -- local mission = AUFTRAG:NewCAS(zone)
      airwingErcan:AddMission(mission)
    end
  elseif (contact.attribute == "Air_Fighter") or (contact.attribute == "Air_AttackHelo") or (contact.attribute == "Air_TransportHelo") then
      -- Figher anfordern beim nächsten Airfield
  end
end


function TargetTaskingCombatZone2(contact)
  MESSAGE:New("TargetTaskingCombatZone2", 20, "Debug"):ToAll()
  local targetGroup = GROUP:FindByName(contact.groupname)

  MESSAGE:New("GroundTarget is found in Sector 2\n Type: " .. contact.attribute, 20, "Debug"):ToAll()

  if (contact.attribute == "Ground_APC") or (contact.attribute == "Ground_Artillery") 
  or (contact.attribute =="Ground_Truck") or (contact.attribute =="Ground_Tank") 
  or (contact.attribute =="Ground_IFV") or true then
    local SetGroupsGround = SET_GROUP:New():FilterCoalitions("red"):FilterZones({CombatZone2}):FilterCategoryGround():FilterActive():FilterOnce() --Todo: Nur lebende enthalten? Laut Applevangelist ja; Active notwendig?
    local n = math.random(1,4)
    if SetGroupsGround:Count() == 0 then
      n = 4
    end
    if n<=3 then
          -- Spawn Groundattack

      MESSAGE:New("GroundTarget is found in Sector 2\n Starting Tankattack", 20, "Debug"):ToAll()
      local mission = AUFTRAG:NewARMORATTACK(GROUP:FindByName(contact.groupname),UTILS.KmphToKnots(20),"Vee")
      local groupForTasking = SetGroupsGround:GetRandom()
      local armygroup = ARMYGROUP:New(groupForTasking:GetName())
      armygroup:SetDefaultFormation(ENUMS.Formation.Vehicle.OnRoad)
      armygroup:AddWeaponRange(0,UTILS.KiloMetersToNM(2))
      armygroup:AddMission(mission)
    else
        -- Start choppers
        if useEnemyAir then
          MESSAGE:New("GroundTarget is found in Sector 2\n Starting Helo Attack", 20, "Debug"):ToAll()
          local zone = ZONE_GROUP:New("CAS Zone", targetGroup, 500)
          local mission = AUFTRAG:NewCAS(zone)
          airwingGecitkale:AddMission(mission)
        end
    end
  elseif (contact.attribute == "Ground_EWR") or (contact.attribute == "Ground_SAM") or (contact.attribute == "Ground_AAA")then -- Spawn SEAD
    if useEnemyAir then
      local mission = AUFTRAG:NewSEAD(GROUP:FindByName(contact.groupname), 5000)
    end
    airwingErcan:AddMission(mission)
    elseif (contact.attribute == "Air_Fighter") or (contact.attribute == "Air_AttackHelo") or (contact.attribute == "Air_TransportHelo") then
      -- Figher anfordern beim nächsten Airfield
  end
end



---Zone Capturing:
function BlueOpsZoneOne:onafterCaptured(From,Event,To,Coalition)
    BASE:I("Blue Zone One Captured")
    if Coalition == coalition.side.BLUE then
      local m = MESSAGE:New("We captured CombatZone-1! Well done! ",15,"Blue Chief"):ToAll()
    else
      local m = MESSAGE:New("We lost CombatZone-1! Capture it back! ",15,"Blue Chief"):ToAll()
    end
  end

  function BlueOpsZoneOne:onenterAttacked(From,Event,To)
    local m = MESSAGE:New("CombatZone1 onenterAttacked! ",15,"Blue Chief"):ToAll()
    BASE:I("CombatZone1 onenterAttacked!")
  end

  function BlueOpsZoneOne:onafterAttacked(From,Event,To,AttackerCoalition)
    local m = MESSAGE:New("CombatZone1 afterAttacked! ",15,"Blue Chief"):ToAll()
    BASE:I("CombatZone1 afterAttacked")
  end

  function BlueOpsZoneOne:onenterGuarded(From,Event,To)
    local m = MESSAGE:New("CombatZone1 Guarded ",15,"Blue Chief"):ToAll()
    BASE:I("CombatZone1 Guarded")
  end


--local TankSpawn = SPAWN:New("Red_Killer-1"):InitLimit( 10, 99 ):SpawnScheduled(30,0.1):SpawnScheduleStart()


--   --RED ZONES SETUP
-- for i=1,#RedZones do
--     local fun2 = nil
--     ZoneCaptureCoalitionRed[i]=ZONE_CAPTURE_COALITION:New(RedZones[i],coalition.side.RED)
--     ZoneCaptureCoalitionRed[i]:Start(i,#RedZones*2)
--     fun2 = ZoneCaptureCoalitionRed[i]
--     --fun.MarkOn=false
    
--     function fun2:onenterEmpty(From, Event, To)
--       local ZoneObj=fun2:GetZone()
--       ATO(ZoneObj, "redzones", "red", "Empty") --Original blue zone empty - blue commander defensive reaction
--     --  ATO(ZoneObj, "redzones", "red", "Empty") --original blue zone empty - red commander offensive reaction
--     end
--   --SNIPPED SHORT!

-- -- Events to create AUFTRAG
--   function RedIntel:OnAfterNewCluster(From, Event, To, Cluster)
--     local text = string.format("NEW cluster #%d of size %d", Cluster.index, Cluster.size)
--     MESSAGE:New(text,15,"KGB"):ToAll()
--   end

