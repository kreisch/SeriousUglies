-- Concept:
-- AI is using recce troops to gain INTEL (Moose)
-- All placed units of a ZONE will be read into a GROUPSET (Moose)
-- All TARGETS acquired by INTEL will result in an AUFTRAG to kill them
-- Respawn of destroyed RED Units will be handled by SKYFIRE-FRAMEWORK-TM


-- Zonen definieren:
local CombatZone1 = ZONE:New("CombatZone-1")
local CombatZone2 = ZONE:New("CombatZone-2")
local CombatZone3 = ZONE:New("CombatZone-3")
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


-- Define the INTEL
-- Set up a detection group set. "FilterStart" to include respawns.
local Red_DetectionSetGroup = SET_GROUP:New()
Red_DetectionSetGroup:FilterPrefixes( { "RU_Recce","RU_EWR" } )
Red_DetectionSetGroup:FilterStart()

-- New INTEL Type
local RedIntel = INTEL:New(Red_DetectionSetGroup, "red", "KGB")
RedIntel:SetClusterAnalysis(true, true)
RedIntel:SetVerbosity(2)
RedIntel:__Start(2)
-- Restrict to Combat_Zones to avoid cluttering of contacts.
local SetCombatZones   = SET_ZONE:New():FilterPrefixes("CombatZone"):FilterOnce()
RedIntel:SetAcceptZones(SetCombatZones)

local SetRedCombatZone1 = SET_GROUP:New():FilterCoalitions("red"):FilterZones({CombatZone1}):FilterCategoryGround():FilterStart()
--local SetRedCombatZone1Alive = SetRedCombatZone1:GetAliveSet()





-- Events to create AUFTRAG
function RedIntel:OnAfterNewContact(From, Event, To, contact)
    local text = string.format("NEW contact %s detected by %s", contact.groupname, contact.recce or "unknown")
    MESSAGE:New(text, 15, "KGB"):ToAll()
    if (contact.attribute == "Ground_APC") or (contact.attribute == "Ground_Artillery") or (contact.attribute =="Ground_Truck") or (contact.attribute =="Ground_Tank") then
      trigger.action.outText("KGB: I found a " .. contact.attribute .. " called " ..  contact.groupname, 30)
        -- Missionszuweisung muss unterteilt werden:
        -- In welcher Zone wurde das Ziel gefunden?
        -- Welche Truppen sind in der Zone vorhanden? (UnitSet?)
        -- Zufällig den Truppen Ziel zuweisen
        -- Bei Luft-Zielen Flugzeuge, bei Radar/SAMs SEAD Flüge erstellen.... wie Hubschrauber auslösen?
        local mission = AUFTRAG:NewARMORATTACK(GROUP:FindByName(contact.groupname),UTILS.KmphToKnots(20),"Vee")
        local trgtGrp = GROUP:FindByName(contact.groupname)
        local groupForTasking = nil
        if trgtGrp:IsCompletelyInZone(CombatZone1) then
            groupForTasking = SetRedCombatZone1:GetRandom()
            MESSAGE:New("Ziel ist in CombatZone1 " .. contact.groupname,15,"Blue Chief"):ToAll()
            MESSAGE:New("Group für Tasking ist " .. groupForTasking:GetName(),15,"Blue Chief"):ToAll()
        else
              MESSAGE:New("Ziel nicht in CombatZone1 " .. contact.groupname,15,"Blue Chief"):ToAll()
        end

        local armygroup = ARMYGROUP:New(groupForTasking:GetName())
        armygroup:SetDefaultFormation(ENUMS.Formation.Vehicle.OnRoad)
        armygroup:AddWeaponRange(0,UTILS.KiloMetersToNM(2))
        armygroup:AddMission(mission)
        env.info("KGB: I found a " .. contact.attribute .. " called " ..  contact.groupname)
          
        
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

