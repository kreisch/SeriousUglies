-- Ziele
-- Helipad_Kiryat_Shmona-19
-- Helipad_Kiryat_Shmona-27

-- Blaue Infanterie droppen bei den Helipads 19-27
-- Blaue Infanterie r�ckt auf MT01_MZ1 Zonen vor
-- Blaue M�rser m�ssen Moose bekannt gemacht werden
-- Rote Infanterie spawnt in den Movezonen
-- Blaue M�rser er�ffnen Feuer auf diese Positionen, sobald rote Infanterie aufgekl�rt wird.
local MT01MissionActive = false
local armygroup = {}

--THIS IS A CUSTOM FUNCTION TO CREATE A MISSION FOR ALL DETECTIONS OF THE RIGHT TYPE
local function ATO(contact)
  --trigger.action.outText("CIA: I found a " .. contact.attribute .. " called " ..  contact.groupname, 30)
  if (contact.attribute == "Ground_APC") or (contact.attribute == "Ground_Artillery") or (contact.attribute =="Ground_Truck") or (contact.attribute =="Ground_Tank") 
  or (contact.attribute =="Ground_Infantry") then
          local target=GROUP:FindByName(contact.groupname)
          if (target) then
            contactMarker = MARKER:New(target:GetCoordinate(), "TIC! We need aircover ASAP!"):ReadOnly():ToAll()
            
            local auftrag=AUFTRAG:NewARTY(target, 5, 30)
            for k=1, #armygroup, 1 do
              armygroup[k]:AddMission(auftrag)
            end
          end
    end

end --endfunc

local function initMission()
    Zone_Helipad19  = ZONE:New("Helipad_Kiryat_Shmona-19")
    Zone_Helipad27  = ZONE:New("Helipad_Kiryat_Shmona-27")
    Zone_Helipad18  = ZONE:New("Helipad_Kiryat_Shmona-18")
    Zone_MT01       = ZONE:New("MT01Area")
    contactMarker = 0

    Marker_Helipad19  = nil
    Marker_Helipad27  = nil
    Marker_Helipad18  = nil
    Marker_FOB_Prince = nil

    MT01_Red_Inf_1_Spawn  = nil
    MT01_Red_Inf_2_Spawn  = nil
    MT01_Red_Inf_3_Spawn  = nil
    MT01_FOB_Prince_Spawn = nil
    MT01_JTac_Spawn       = nil

    MT01_Blue_Inf_1_Spawn = nil
    MT01_Blue_Inf_2_Spawn = nil

    --Define BlueReconSet
    BlueReconSet=SET_GROUP:New():FilterCoalitions("blue"):FilterCategoryGround():FilterZones({Zone_MT01}):FilterStart()      
    --Declare an INTEL based off that SET, for BLUE coalition
    IntelBlue = INTEL:New(BlueReconSet, coalition.side.BLUE) 
    --IntelBlue:SetClusterAnalysis(true,true)
    --IntelBlue:SetVerbosity(2)
    IntelBlue:AddAcceptZone(Zone_MT01) --give it an inclusive area  
          --- Function called when a NEW contact is detected by the specified Agents.
      function IntelBlue:OnAfterNewContact(From, Event, To, Contact)
        local contact=Contact --Ops.Intelligence#INTEL.Contact
        ATO(contact) --fire the function for the contact  
      end --end OnAfterNew
    IntelBlue:Start() --start it

    armygroup = {}
end

local function spawnEnemyForcesAtHelipad18 ()
  MT01_Red_Inf_1_Spawn = SPAWN
  :New( "MT01_Red_Inf-1" )
  :SpawnScheduled( 5, .5 )
  
  MT01_Red_Inf_2_Spawn = SPAWN
  :New( "MT01_Red_Inf-2" )
  :SpawnScheduled( 5, .5 )
  
  MT01_Red_Inf_3_Spawn = SPAWN
  :New( "MT01_Red_Inf-3" )
  :SpawnScheduled( 5, .5 )
  
  MT01_Blue_Inf_1_Spawn = SPAWN:New("MT01_Blue_Inf-1"):Spawn()
  MT01_Blue_Inf_2_Spawn = SPAWN:New("MT01_Blue_Inf-2"):Spawn()
  MT01_FARP_Pad19 = SPAWN:New("MT01_FARP_Pad19"):Spawn()

  local MT01_FARP_Mortar_Spawn = SPAWN:New("MT01_FARP_Mortar"):Spawn()
  armygroup[1] = ARMYGROUP:New(MT01_FARP_Mortar_Spawn)
  armygroup[1]:AddWeaponRange(0, UTILS.KiloMetersToNM(6))

  MT01_FOB_Prince_Spawn = SPAWN:New("MT01_FOB_Prince"):Spawn()
  MT01_JTac_Spawn       = SPAWN:New("MT01_JTac_Widow1-1"):Spawn()
end

local function MarkF10 ()
    Marker_Helipad19  = MARKER:New(Zone_Helipad19:GetCoordinate(), "MT01: Transport Infantry to the Dropzone!"):ReadOnly():ToAll()
    Marker_Helipad27  = MARKER:New(Zone_Helipad27:GetCoordinate(), "MT01: Transport Infantry to the Dropzone!"):ReadOnly():ToAll()
    Marker_Helipad18  = MARKER:New(Zone_Helipad18:GetCoordinate(), "MT01: Infantry will advance to secure this position, provide support!"):ReadOnly():ToAll()
    Marker_FOB_Prince = MARKER:New(MT01_FOB_Prince_Spawn:GetCoordinate(), "MT01: FOB Prince"):ReadOnly():ToAll()
end

local function MarkF10Remove ()
    Marker_Helipad19:Remove()
    Marker_Helipad27:Remove()
    Marker_Helipad18:Remove()
    Marker_FOB_Prince:Remove()
end

local function addCtldZones ()
    my_ctld:AddCTLDZone("Helipad_Kiryat_Shmona-19",CTLD.CargoZoneType.DROP,SMOKECOLOR.Red,true,true)
    my_ctld:AddCTLDZone("Helipad_Kiryat_Shmona-27",CTLD.CargoZoneType.DROP,SMOKECOLOR.Red,true,true)  
    
    my_ctld:AddCTLDZone("MT01_MZ1",CTLD.CargoZoneType.MOVE,SMOKECOLOR.White,true,true)
    my_ctld:AddCTLDZone("MT01_MZ1-1",CTLD.CargoZoneType.MOVE,SMOKECOLOR.White,true,true)
    my_ctld:AddCTLDZone("MT01_MZ1-2",CTLD.CargoZoneType.MOVE,SMOKECOLOR.White,true,true)
    my_ctld:AddCTLDZone("CTLD debug",CTLD.CargoZoneType.LOAD,SMOKECOLOR.Blue,true,true)

    my_ctld:AddCTLDZone("MT01_FOB_Prince",CTLD.CargoZoneType.LOAD,SMOKECOLOR.Blue,true,true)
end

local function removeCtldZones()
    my_ctld:DeactivateZone("Helipad_Kiryat_Shmona-19",CTLD.CargoZoneType.DROP)
    my_ctld:DeactivateZone("Helipad_Kiryat_Shmona-27",CTLD.CargoZoneType.DROP)
    my_ctld:DeactivateZone("MT01_MZ1",CTLD.CargoZoneType.MOVE)
    my_ctld:DeactivateZone("MT01_MZ1-1",CTLD.CargoZoneType.MOVE)
    my_ctld:DeactivateZone("MT01_MZ1-2",CTLD.CargoZoneType.MOVE)
    my_ctld:DeactivateZone("CTLD debug",CTLD.CargoZoneType.LOAD)
    my_ctld:DeactivateZone("CTLD MT01_FOB_Prince",CTLD.CargoZoneType.LOAD)
end

-- Create a scheduler to check every 30 seconds if enemies are still in the mission zone
-- Or just use a "Capture Zone" feature....
local function checkEnemyPresenceInMissionArea()
  CaptureZone           = ZONE:New( "MT01Area" )
  ZoneCaptureCoalition  = ZONE_CAPTURE_COALITION:New( CaptureZone, coalition.side.RED ) 

        --- @param Functional.Protect#ZONE_CAPTURE_COALITION self
      function ZoneCaptureCoalition:OnEnterCaptured()
        local Coalition = self:GetCoalition()
        self:E({Coalition = Coalition})
        if Coalition == coalition.side.BLUE then
          trigger.action.outText("The US forces secured the area! You may despawn the mission.", 30)
          trigger.action.outSound("Murica.ogg")
          ZoneCaptureCoalition:Stop()
        else
          trigger.action.outText("The insurgents have overwhelmed our forces, get back ASAP!", 30)
        end
        self:__Guard( 30 )
      end
  ZoneCaptureCoalition:__Guard( 1 )
  ZoneCaptureCoalition:Start( 30, 30 )

end


-- Starts the Mission with the ID MT01
local function startMissionMT01 ()
  if MT01MissionActive == false then
    initMission()
    spawnEnemyForcesAtHelipad18()
    MarkF10()
    addCtldZones()
    checkEnemyPresenceInMissionArea()   
    function my_ctld:OnAfterTroopsDeployed(From, Event, To, Group, Unit, Troops) -- Troops := Ausgeladene Gruppe
      if (Unit:IsInZone(Zone_MT01)) then
              local name = Troops:GetName()
              local droppedGroup = GROUP:FindByName(name)
              local lastKnownPosition = droppedGroup:GetPointVec2()          
              isGroupDead = SCHEDULER:New( nil,
                function()
                  if droppedGroup:IsAlive() then
                  lastKnownPosition = droppedGroup:GetPointVec2()
                  --MESSAGE:New("Is alive " .. droppedGroup:GetName(), 5):ToCoalition(coalition.side.BLUE)
                  else   
                    MESSAGE:New("Is dead", 25):ToCoalition(coalition.side.BLUE)
                    isGroupDead:Stop()  
                    my_csar:SpawnCASEVAC(lastKnownPosition,2) -- läuft absolut Amok....Warum?
                  end
              end, {}, 15, 30 )  
              -- droppedGroup:HandleEvent(EVENTS.Dead)
              -- function droppedGroup:OnEventDead( EventData)
              --     self:E("Group died.." .. EventData.iniGroupName)
              --     local lastKnownPosition = droppedGroup:GetPointVec2()
              --     my_csar:SpawnCASEVAC(lastKnownPosition,2) -- läuft absolut Amok....Warum?
              -- end
               if string.find(name,"Template_CTLD_Blue_Mortar") then
                    local counter = #armygroup
                    armygroup[counter + 1] = droppedGroup -- Packt die Mortars in eine Liste, sodass sie vom Arty_Script genutzt werden
                end             
        end
    end
    MT01MissionActive = true
    trigger.action.outText("Mission MT01 started.", 15)
    trigger.action.outSound("Murica.ogg")
  end
end


-- debugGroupSet:ForEachGroup( -- WORKAROUND No1. geht
--   --- @param Wrapper.Group#GROUP MooseGroup
--   function( MooseGroup ) 
--     local droppedGroup = MooseGroup
--     --trigger.action.outText("Trigger active for " .. droppedGroup:GetName(), 30)
--     droppedGroup:HandleEvent(EVENTS.Dead)
--     function droppedGroup:OnEventDead( EventData)
--             local _unit = EventData.IniUnit
--             local _name = _unit:GetName()
--             trigger.action.outText("Unit died.." .. _name, 30)
--         if string.match(_name, "CASEVAC") then
--             my_csar:SpawnCASEVAC(droppedGroup:GetPointVec2(),2) -- läuft absolut Amok....Warum?
--         end
--     end
--   end 
-- )

local function removeAllUnits()
  MT01_Red_Inf_1_Spawn:SpawnScheduleStop()
  MT01_Red_Inf_2_Spawn:SpawnScheduleStop()
  MT01_Red_Inf_3_Spawn:SpawnScheduleStop()
  MT01_FOB_Prince_Spawn:Destroy()
  local UnitSetMT01 = SET_GROUP:New():FilterCategoryGround():FilterZones({Zone_MT01}):FilterOnce()
  if UnitSetMT01:Count() > 0 then
    UnitSetMT01:ForEachGroup( 
      function( MooseGroup ) 
          local _g = MooseGroup --Wrapper.GROUP object    
          _g:Destroy()
        end 
      )
   end
end

local function stopMissionMT01 ()
    removeAllUnits()
    removeCtldZones()
    MarkF10Remove()
    ZoneCaptureCoalition:Stop()
    IntelBlue:__Stop(5)
    MT01MissionActive = false
    trigger.action.outText("Mission MT01 stopped.", 15)
end

local MenuCoalitionBlueTransportMT01        = MENU_COALITION:New( coalition.side.BLUE, "MT01: YB64", MenuCoalitionBlueTransport)
local MenuCoalitionBlueTransportMT01Start   = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Start MT01", MenuCoalitionBlueTransportMT01, startMissionMT01)
local MenuCoalitionBlueTransportMT01End     = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "End MT01", MenuCoalitionBlueTransportMT01, stopMissionMT01)