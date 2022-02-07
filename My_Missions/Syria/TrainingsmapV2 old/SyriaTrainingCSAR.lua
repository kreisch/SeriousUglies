my_csar = CSAR:New(coalition.side.BLUE,"Downed Pilot", "CSAR")

-- options
my_csar.immortalcrew            = true -- downed pilot spawn is immortal
my_csar.invisiblecrew           = false -- downed pilot spawn is visible
my_csar.useprefix               = false -- allow all helicopter to be CSAR
my_csar.allowFARPRescue         = true -- allows pilots to be rescued by landing at a FARP or Airbase. Else MASH only!
my_csar.csarOncrash             = true -- (WIP) If set to true, will generate a downed pilot when a plane crashes as well.
my_csar.pilotRuntoExtractPoint  = true -- Downed pilot will run to the rescue helicopter up to self.extractDistance in meters. 
my_csar.extractDistance         = 500 -- Distance the downed pilot will start to run to the rescue helicopter.
my_csar.loadDistance            = 75 -- configure distance for pilots to get into helicopter in meters.
-- start the FSM
my_csar:__Start(5)


--Get the zones
local CsarRayakZonesSet   = SET_ZONE:New():FilterPrefixes("CSAR_Rayak"):FilterOnce()
local CsarRakayZonesList  = zoneSetToList(CsarRayakZonesSet)
local CsarHomsZonesSet    = SET_ZONE:New():FilterPrefixes("CSAR_Homs"):FilterOnce()
local CsarHomsZonesList   = zoneSetToList(CsarHomsZonesSet)
local CsarRoshPinaZonesSet    = SET_ZONE:New():FilterPrefixes("CSAR_RoshPina"):FilterOnce()
local CsarRoshPinaZonesList   = zoneSetToList(CsarRoshPinaZonesSet)

-- Variablen um Aktivität der Zonen zu triggern - Automatisches erneutes spawnen in aktiven Bereichen, wenn Pilot gerettet wurde
CsarRayakActive = false
CsarHomsActive  = false
CsarRoshPinaActive = false

local spawnedPilots       = 0
local spawnZoneList       = {}


function SpawnCSAR(ZoneIdentifier)
  if (spawnedPilots < CSAR_SPAWNED_PILOTS_LIMIT) then
    if ZoneIdentifier == CSAR_ZONE_RAYAK then
      spawnZoneList   = CsarRakayZonesList
      CsarRayakActive = true
    end
    if ZoneIdentifier == CSAR_ZONE_HOMS then
      spawnZoneList   = CsarHomsZonesList
      CsarHomsActive  = true
    end
    if ZoneIdentifier == CSAR_ZONE_ROSHPINA then
      spawnZoneList = CsarRoshPinaZonesList
      CsarRoshPinaActive = true
    end
      local i = math.random(1, #spawnZoneList)
        my_csar:SpawnCSARAtZone( spawnZoneList[i]:GetName(), coalition.side.BLUE, "Unlucky Ugly", true )
--        if (CSAR_MARKS_ON_PILOTS) then
--          local CsarMapMarker  = MARKER:New(spawnZoneList[i]:GetCoordinate(), "CSAR requested"):ToAll()
--        end
        spawnZoneList = {}
    else
       MessageToAll("Too many CSARs already spawned, go rescue them! Limit is " ..CSAR_SPAWNED_PILOTS_LIMIT)
       
    end
end

function EndCsar(area)
    if (area == CSAR_ZONE_RAYAK) then
        CsarRayakActive = false
    end
    
    if (area == CSAR_ZONE_HOMS) then
        CsarHomsActive = false
    end

end

function my_csar:OnAfterPilotDown(from, event, to, spawnedgroup, frequency, groupname, coordinates_text)
  MessageToAll("Pilot downed! Beacon frequency: " .. tostring(frequency) .. "kHz, coordinates: " .. coordinates_text)
  spawnedPilots = spawnedPilots + 1
  if STTS_ENABLED then
    STTS.TextToSpeech("Mayday Mayday Mayday, Pilot down!","127.500","AM","1.0","SRS",2)
  end
  if (CSAR_MARKS_ON_PILOTS) then
     local CsarMapMarker  = MARKER:New(spawnedgroup:GetCoordinate(), "Pilot downed! Beacon frequency: " .. tostring(frequency) .. "kHz, coordinates: " .. coordinates_text):ToAll()
  end
end

function my_csar:OnAfterApproach(from, event, to, heliname, groupname)
  MessageToAll("Approaching downed pilot.".. heliname .. " request flare or smoke for assistance.")
end

function my_csar:OnAfterReturning(from, event, to, heliname, groupname)
  MessageToAll(heliname .. " picked up downed pilot - return to next base immediately.")
  spawnedPilots = spawnedPilots - 1
end

function my_csar:OnAfterRescued(from, event, to, heliunit, heliname, pilotssaved)
  MessageToAll("Downed pilot succesfully delivered to more capable hands in MASH. Thank you " .. heliname .."!")
    if STTS_ENABLED then
      STTS.TextToSpeech("We will take care of the patient, you are good to go!","127.500","AM","1.0","SRS",2)
    end
end

--
--function csar.spawnGroup(_deadUnit)
-- 
--    local _id = mist.getNextGroupId()
-- 
--    local _groupName = "Downed Pilot #" .. _id
-- 
--    local _side = _deadUnit:getCoalition()
-- 
--    local _pos = _deadUnit:getPoint()
-- 
--    local _group = {
--        ["visible"] = false,
--        ["groupId"] = _id,
--        ["hidden"] = false,
--        ["units"] = {},
--        ["name"] = _groupName,
--        ["task"] = {},
--    }
-- 
--    if _side == 2 then
--        _group.units[1] = csar.createUnit(_pos.x + 50, _pos.z + 50, 120, "Soldier M4")
--    else
--        _group.units[1] = csar.createUnit(_pos.x + 50, _pos.z + 50, 120, "Infantry AK")
--    end
-- 
--    _group.category = Group.Category.GROUND;
--    _group.country = _deadUnit:getCountry();
-- 
--    local _spawnedGroup = Group.getByName(mist.dynAdd(_group).name)
-- 
--    -- generate some random infantry around our downed pilot
--    local howManyFoes = math.random(4)
--    for i=0, howManyFoes, 1 do
--        local randomX = math.random(-1500, 1500)
--        local randomY = math.random(-1500, 1500)
--        local randomHeading = math.random(360)
--        local groupId = mist.getNextGroupId()
--        local groupName = "Infantry #" .. groupId
-- 
--        local _landType = land.getSurfaceType({ x = _pos.x + randomX, y = _pos.z + randomY})
--        if _landType == 1 or _landType == 4 or _landType == 5 then -- 2,3 = water, shallow water, 1,4,5 == land, road, runway
--            if _side == 2 then
--                local infantryGroup = {
--                    ["visible"] = false,
--                    ["groupId"] = groupId,
--                    ["hidden"] = false,
--                    ["units"] = {},
--                    ["name"] = groupName,
--                    ["task"] = {},
--                }
--                infantryGroup.category = Group.Category.GROUND;
--                infantryGroup.country = country.id.RUSSIA;
--                infantryGroup.units[1] = csar.createUnitEnemy(_pos.x + randomX, _pos.z + randomY, randomHeading, "Infantry AK")
--                mist.dynAdd(infantryGroup)
--            else
--                local infantryGroup = {
--                    ["visible"] = false,
--                    ["groupId"] = groupId,
--                    ["hidden"] = false,
--                    ["units"] = {},
--                    ["name"] = groupName,
--                    ["task"] = {},
--                }
--                infantryGroup.category = Group.Category.GROUND;
--                infantryGroup.country = country.id.USA;
--                infantryGroup.units[1] = csar.createUnitEnemy(_pos.x + randomX, _pos.z + randomY, randomHeading, "Soldier M4")
--                mist.dynAdd(infantryGroup)
--            end
--        end
--    end
-- 
--    -- Turn off AI
--    trigger.action.setGroupAIOff(_spawnedGroup)
-- 
--    return _spawnedGroup
--end