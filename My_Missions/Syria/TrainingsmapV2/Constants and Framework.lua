Trainbridge_id = 11
UrbanHell_id = 1
UrbanHell_FARP_id = 2

STTS_ENABLED = true
CSAR_SPAWNED_PILOTS_LIMIT = 5
CSAR_MARKS_ON_PILOTS = true
CSAR_ZONE_HOMS        = 2
CSAR_ZONE_RAYAK       = 1
CSAR_ZONE_ROSHPINA    = 3

-- STTS.TextToSpeech("Hello DCS WORLD","251","AM","1.0","SRS",2) -- Dran denken STTS zu benutzen, sobald es sich anbietet.
--local DismountsGroupSet=SET_GROUP:New():FilterPrefixes("Dismount"):FilterOnce()

---- Function used to call dismounts.
-- Function used to call ARTY-Script by Moose for BLUE-Arty Units (Mortar, Paladin, MLRS)
-- Totally robbed from https://forums.eagle.ru/topic/258313-xcas-syria/ Thank you very much! All credits go to EasyEB
function AddAdditionalScriptsToGroups(MyGroup)
        local GroupName = MyGroup:GetName()
        local names = {}
        local units = Group.getByName(GroupName):getUnits()
        for i = 1, #units do
          local typeName = Unit.getTypeName(units[i])
          local unitName = Unit.getName(units[i])
          if string.match(typeName, "BMP") or string.match(typeName, "BTR") or string.match(typeName, "Cobra") or string.match(typeName, "ZIL-135") 
          or string.match(typeName, "Kamaz 43101")then
            AddDismounts(unitName, "RifleINS")
          elseif string.match(typeName, "Bradley") then
            AddDismounts(unitName, "Rifle")
          elseif string.match(typeName, "M1126 Stryker ICV") then
            AddDismounts(unitName, "Rifle")
          elseif string.match(typeName, "Ural") or string.match(typeName, "Grad-URAL") then
            AddDismounts(unitName, "TeamINS")
          else
          end
        end
        -- Check if it is arty and blue side, then add the arty-script
end

function SpawnGroupsOfTemplatesInListOfZones(NumberOfGroups, ZoneTable,Templates, Prefix, radius)
    if radius == nil then
    radius = 5
    end
local spawns = {}
  for k = 1, NumberOfGroups, 1 do
    local tempGrpAlias = Prefix .. k
    spawns[k] = SPAWN:NewWithAlias("Randomizer",tempGrpAlias)
    :InitRandomizeZones( ZoneTable )
    :InitRandomizePosition(true,radius)
    :InitRandomizeTemplate(Templates)
    :Spawn()
    AddAdditionalScriptsToGroups(spawns[k])
  end
  
  return spawns
end

-- Spawn a JTAC
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

function zoneSetToList (zoneSet)
  _zoneList = {}
  _zoneSet = zoneSet
  local k = 1
  _zoneSet:ForEachZone(
  function (zoneElement)
    _zoneList[k] = zoneElement
    k = k + 1
  end
  )
  return _zoneList
end



function SpawnManpadWhenDamaged()

end
