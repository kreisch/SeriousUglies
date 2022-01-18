local debug = false
local ZoneTable = { ZONE:New( "Spawn-1" ), ZONE:New( "Spawn-2" ), ZONE:New( "Spawn-3" ), ZONE:New( "Spawn-4" ), ZONE:New( "Spawn-5" ), ZONE:New( "Spawn-6" ) }

local Templates = { "Ground-1", "Ground-2", "Ground-3"}




function SpawnGroupsOfTemplatesInListOfZones(NumberOfGroups)
JTACs = {}
JTACcounter = 0

local spawns = {}
local i = 1

for k = 1, NumberOfGroups, 1 do
  local tempGrpAlias = "Taftanaz-" .. i
  spawns[i] = SPAWN:NewWithAlias("Randomizer",tempGrpAlias)
  :InitRandomizeZones( ZoneTable )
  :InitRandomizeTemplate(Templates)
  :Spawn()
  local position = spawns[i]:GetPositionVec3()
  --spawnJTAC(position)
  i = i + 1
     
    if debug then  
      trigger.action.outText("hello " .. #spawns, 5)
    end
end
  
end


function spawnJTAC(coord)
if JTACcounter < 10 then
  JTACcounter = JTACcounter + 1
  local tempGrpJtac = "TaftanazJtac-" .. JTACcounter
  JTACs[JTACcounter] = SPAWN:NewWithAlias("Predator",tempGrpJtac)
  Predator_Spawn = JTACs[JTACcounter]:SpawnFromVec3(coord)
  
  
  local OrbitTask=Predator_Spawn:TaskOrbitCircle(2000,160)
  Predator_Spawn:SetTask(OrbitTask,1)
    
  Predator_NAME = Predator_Spawn:GetName()
  ctld.JTACAutoLase(Predator_NAME, 1680 + JTACcounter, true, "all")
  trigger.action.outText ( "JTAC:  ".. Predator_NAME .." on station lasing " .. 1680 + JTACcounter.. ". \nNOTE: If you wish to delete Zeus-spawned JTACS use the map marker command -delete jtac", 60)
  env.info("JTAC:  ".. Predator_NAME .."  spawned!")
  end
end
  

local MenuCoalitionBlueA2G = MENU_COALITION:New( coalition.side.BLUE, "Mission Setup A2G" )
local MenuCoalitionBlueA2GMissionTaftanaz = MENU_COALITION:New( coalition.side.BLUE, "Mission: CAS Taftanaz", MenuCoalitionBlueA2G)
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "CAS Taftanaz: Start", MenuCoalitionBlueA2GMissionTaftanaz, SpawnGroupsOfTemplatesInListOfZones, 5 )