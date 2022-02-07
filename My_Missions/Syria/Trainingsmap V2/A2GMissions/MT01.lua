-- Ziele
-- Helipad_Kiryat_Shmona-19
-- Helipad_Kiryat_Shmona-27

-- Blaue Infanterie droppen bei den Helipads 19-27
-- Blaue Infanterie r�ckt auf MT01_MZ1 Zonen vor
-- Blaue M�rser m�ssen Moose bekannt gemacht werden
-- Rote Infanterie spawnt in den Movezonen
-- Blaue M�rser er�ffnen Feuer auf diese Positionen, sobald rote Infanterie aufgekl�rt wird.

local Zone_Helipad19  = ZONE:New("Helipad_Kiryat_Shmona-19")
local Zone_Helipad27  = ZONE:New("Helipad_Kiryat_Shmona-27")
local Zone_Helipad18  = ZONE:New("Helipad_Kiryat_Shmona-18")
local Zone_MT01       = ZONE:New("MT01Area")
local contactMarker = 0

local Marker_Helipad19 = nil
local Marker_Helipad27 = nil
local Marker_Helipad18 = nil

local MT01_Red_Inf_1_Spawn = nil
local MT01_Red_Inf_2_Spawn = nil
local MT01_Red_Inf_3_Spawn = nil

local MT01_Blue_Inf_1_Spawn = nil
local MT01_Blue_Inf_2_Spawn = nil

        -- Define BlueReconSet
        local BlueReconSet=SET_GROUP:New():FilterCoalitions("blue"):FilterCategoryGround():FilterZones({Zone_MT01}):FilterStart()      
         --Declare an INTEL based off that SET, for BLUE coalition
        local IntelBlue = INTEL:New(BlueReconSet, coalition.side.BLUE) 
        --IntelBlue:SetClusterAnalysis(true,true)
        IntelBlue:SetVerbosity(2)
        IntelBlue:AddAcceptZone(Zone_MT01) --give it an inclusive area  
        IntelBlue:Start() --start it

local armygroup = {}
armygroup[1] = ARMYGROUP:New("MT01_FARP_Mortar")
armygroup[1]:AddWeaponRange(0, UTILS.KiloMetersToNM(6))

function spawnEnemyForcesAtHelipad18 ()
  MT01_Red_Inf_1_Spawn = SPAWN
  :New( "MT01_Red_Inf-1" )
  :InitLimit( 15, 5 )
  :SpawnScheduled( 5, .5 )
  
    MT01_Red_Inf_2_Spawn = SPAWN
  :New( "MT01_Red_Inf-2" )
  :InitLimit( 15, 5 )
  :SpawnScheduled( 5, .5 )
  
    MT01_Red_Inf_3_Spawn = SPAWN
  :New( "MT01_Red_Inf-3" )
  :InitLimit( 15, 5 )
  :SpawnScheduled( 5, .5 )
  
  MT01_Blue_Inf_1_Spawn = SPAWN:New("MT01_Blue_Inf-1"):Spawn()
  MT01_Blue_Inf_2_Spawn = SPAWN:New("MT01_Blue_Inf-2"):Spawn()
  local MT01_FARP_Pad19 = SPAWN:New("MT01_FARP_Pad19"):Spawn()
  
end

function MarkF10 ()
    Marker_Helipad19  = MARKER:New(Zone_Helipad19:GetCoordinate(), "MT01: Transport Infantry to the Dropzone!"):ReadOnly():ToAll()
    Marker_Helipad27  = MARKER:New(Zone_Helipad27:GetCoordinate(), "MT01: Transport Infantry to the Dropzone!"):ReadOnly():ToAll()
    Marker_Helipad18  = MARKER:New(Zone_Helipad18:GetCoordinate(), "MT01: Infantry will advance to secure this position, provide support!"):ReadOnly():ToAll()
end

function MarkF10Remove ()
    Marker_Helipad19:Remove()
    Marker_Helipad27:Remove()
    Marker_Helipad18:Remove()
end

function addCtldZones ()
    my_ctld:AddCTLDZone("Helipad_Kiryat_Shmona-19",CTLD.CargoZoneType.DROP,SMOKECOLOR.Red,true,true)
    my_ctld:AddCTLDZone("Helipad_Kiryat_Shmona-27",CTLD.CargoZoneType.DROP,SMOKECOLOR.Red,true,true)  
    
    my_ctld:AddCTLDZone("MT01_MZ1",CTLD.CargoZoneType.MOVE,SMOKECOLOR.White,true,true)
    my_ctld:AddCTLDZone("MT01_MZ1-1",CTLD.CargoZoneType.MOVE,SMOKECOLOR.White,true,true)
    my_ctld:AddCTLDZone("MT01_MZ1-2",CTLD.CargoZoneType.MOVE,SMOKECOLOR.White,true,true)
    my_ctld:AddCTLDZone("CTLD debug",CTLD.CargoZoneType.LOAD,SMOKECOLOR.Blue,true,true)
end

function removeCtldZones()
    my_ctld:DeactivateZone("Helipad_Kiryat_Shmona-19",CTLD.CargoZoneType.DROP)
    my_ctld:DeactivateZone("Helipad_Kiryat_Shmona-27",CTLD.CargoZoneType.DROP)
    my_ctld:DeactivateZone("MT01_MZ1",CTLD.CargoZoneType.MOVE)
    my_ctld:DeactivateZone("MT01_MZ1-1",CTLD.CargoZoneType.MOVE)
    my_ctld:DeactivateZone("MT01_MZ1-2",CTLD.CargoZoneType.MOVE)
    my_ctld:DeactivateZone("CTLD debug",CTLD.CargoZoneType.LOAD)
end


--THIS IS A CUSTOM FUNCTION TO CREATE A MISSION FOR ALL DETECTIONS OF THE RIGHT TYPE
function ATO(contact)
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

--- Function called when a NEW contact is detected by the specified Agents.
function IntelBlue:OnAfterNewContact(From, Event, To, Contact)
  local contact=Contact --Ops.Intelligence#INTEL.Contact
  ATO(contact) --fire the function for the contact  
end --end OnAfterNew



-- Starts the Mission with the ID MT01
function startMissionMT01 ()
    MT01MissionActive = true
    MarkF10()
    spawnEnemyForcesAtHelipad18()
    addCtldZones()   
    function my_ctld:OnAfterTroopsDeployed(From, Event, To, Group, Unit, Troops) -- Troops := Ausgeladene Gruppe
      if (Unit:IsInZone(Zone_MT01)) then
              local name = Troops:GetName()
              local droppedGroup = GROUP:FindByName(name)
              local lastKnownPosition = droppedGroup:GetPointVec2()          
              isGroupDead = SCHEDULER:New( nil,
                function()
                  if droppedGroup:IsAlive() then
                  lastKnownPosition = droppedGroup:GetPointVec2()
                  MESSAGE:New("Is alive " .. droppedGroup:GetName(), 5):ToCoalition(coalition.side.BLUE)
                  else   
                    MESSAGE:New("Is dead", 25):ToCoalition(coalition.side.BLUE)
                    my_csar:SpawnCASEVAC(lastKnownPosition,2)
                    isGroupDead:Stop()   
                  end
              end, {}, 15, 30 )  
              
               if string.find(name,"Template_CTLD_Blue_Mortar") then
                  -- Add the group to a Mortar Script...?
                    
                    local counter = #armygroup
                    armygroup[counter + 1] = droppedGroup
                end             
        end
    end
end




function stopMissionMT01 ()
    local UnitSetMT01 = SET_GROUP:New():FilterCategoryGround():FilterZones(Zone_MT01):FilterOnce()  
    if UnitSetMT01:Count() > 0 then
      UnitSetMT01:ForEachGroup( 
        function( MooseGroup ) 
            local _g = MooseGroup --Wrapper.GROUP object    
            _g:Destroy()
          end 
        )
     end
    MarkF10Remove()
end

local MenuCoalitionBlueTransportMT01        = MENU_COALITION:New( coalition.side.BLUE, "MT01: YB64", MenuCoalitionBlueTransport)
local MenuCoalitionBlueTransportMT01Start   = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Start MT01", MenuCoalitionBlueTransportMT01, startMissionMT01)
local MenuCoalitionBlueTransportMT01End     = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "End MT01", MenuCoalitionBlueTransportMT01, stopMissionMT01)