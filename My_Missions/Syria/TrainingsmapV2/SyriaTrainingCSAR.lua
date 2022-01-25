my_csar = CSAR:New(coalition.side.BLUE,"Downed Pilot", "CSAR")

-- options
my_csar.immortalcrew = true -- downed pilot spawn is immortal
my_csar.invisiblecrew = false -- downed pilot spawn is visible
my_csar.useprefix = false -- allow all helicopter to be CSAR

-- start the FSM
my_csar:__Start(5)
--Get the zones
local CsarRayakZonesSet  = SET_ZONE:New():FilterPrefixes("CSAR_Rayak"):FilterOnce()
local CsarRakayZonesList = zoneSetToList(CsarRayakZonesSet)
local spawnedPilots = 0
local spawnZoneList = {}
-- Testbed
-- Create a test downed pilot "Unlucky Ugly" in #ZONE "CSAR_Test_1" at a random point for the blue coalition
--my_csar:SpawnCSARAtZone( "CSAR_Zone_1", coalition.side.BLUE, "Unlucky Ugly", true )

function SpawnCSAR(ZoneIdentifier)
  if (spawnedPilots < CSAR_SPAWNED_PILOTS_LIMIT) then
    if ZoneIdentifier == 1 then
      spawnZoneList = CsarRakayZonesList
    end
      local i = math.random(1, #spawnZoneList)
        my_csar:SpawnCSARAtZone( spawnZoneList[i]:GetName(), coalition.side.BLUE, "Unlucky Ugly", true )
        if (CSAR_MARKS_ON_PILOTS) then
          trigger.action.markToAll(CSAR_START_ID, "CSAR" , spawnZoneList[i]:GetVec3() , true, "CSAR")
          CSAR_START_ID = CSAR_START_ID + 1
        end
        spawnZoneList = {}
       else
       MessageToAll("Too many CSARs already spawned, go rescue them! Limit is " ..CSAR_SPAWNED_PILOTS_LIMIT)
       
      end
end

function my_csar:OnAfterPilotDown(from, event, to, spawnedgroup, frequency, groupname, coordinates_text)
  MessageToAll("Pilot downed! Beacon frequency: " .. tostring(frequency) .. "kHz, coordinates: " .. coordinates_text)
  spawnedPilots = spawnedPilots + 1
end

function my_csar:OnAfterApproach(from, event, to, heliname, groupname)
  MessageToAll("Approaching downed pilot. Request flare or smoke for assistance.")
end

function my_csar:OnAfterReturning(from, event, to, heliname, groupname)
  MessageToAll("Picked up downed pilot - return to next base immediately.")
  spawnedPilots = spawnedPilots - 1
end

function my_csar:OnAfterRescued(from, event, to, heliunit, heliname, pilotssaved)
  MessageToAll("Downed pilot succesfully delivered to more capable hands in MASH. Thank you!")
end