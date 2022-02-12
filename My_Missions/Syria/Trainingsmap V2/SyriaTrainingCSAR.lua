my_csar = CSAR:New(coalition.side.BLUE,"Downed Pilot", "CSAR")

-- options
my_csar.limitmaxdownedpilots = true
my_csar.suppressmessages = true
my_csar.maxdownedpilots = 10
my_csar.FARPRescueDistance = 1000 -- you need to be this close to a FARP or Airport for the pilot to be rescued.
my_csar.autosmoke = true -- automatically smoke a downed pilot\'s location when a heli is near.
my_csar.autosmokedistance = 1000 -- distance for autosmoke
my_csar.coordtype = 1 -- Use Lat/Long DDM (0), Lat/Long DMS (1), MGRS (2), Bullseye imperial (3) or Bullseye metric (4) for coordinates.
my_csar.invisiblecrew           = false -- downed pilot spawn is visible
my_csar.useprefix               = false -- allow all helicopter to be CSAR
my_csar.allowFARPRescue         = true -- allows pilots to be rescued by landing at a FARP or Airbase. Else MASH only!
my_csar.csarOncrash             = true -- (WIP) If set to true, will generate a downed pilot when a plane crashes as well.
my_csar.pilotRuntoExtractPoint  = true -- Downed pilot will run to the rescue helicopter up to self.extractDistance in meters. 
my_csar.extractDistance         = 500 -- Distance the downed pilot will start to run to the rescue helicopter.
my_csar.loadDistance            = 75 -- configure distance for pilots to get into helicopter in meters.
my_csar.mashprefix = {"MASH"}

-- start the FSM
my_csar:__Start(5)



--Get the zones
local CsarRayakZonesSet   = SET_ZONE:New():FilterPrefixes("CSAR_Rayak"):FilterOnce()
local CsarRakayZonesList  = zoneSetToList(CsarRayakZonesSet)
local CsarHomsZonesSet    = SET_ZONE:New():FilterPrefixes("CSAR_Homs"):FilterOnce()
local CsarHomsZonesList   = zoneSetToList(CsarHomsZonesSet)
local CsarRoshPinaZonesSet    = SET_ZONE:New():FilterPrefixes("CSAR_RoshPina"):FilterOnce()
local CsarRoshPinaZonesList   = zoneSetToList(CsarRoshPinaZonesSet)
local CsarMapMarker = {}

-- Variablen um Aktivitaet der Zonen zu triggern - Automatisches erneutes spawnen in aktiven Bereichen, wenn Pilot gerettet wurde
CsarRayakActive = false
CsarHomsActive  = false
CsarRoshPinaActive = false

local spawnZoneList       = {}

--my_csar:SpawnCSARAtZone( "CSTest", coalition.side.BLUE, "Unlucky Ugly", true )


function SpawnCSAR(ZoneIdentifier)
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
--  MessageToAll("Pilot downed! Beacon frequency: " .. tostring(frequency) .. "kHz, coordinates: " .. coordinates_text)
  if STTS_ENABLED then
    STTS.TextToSpeech("Mayday Mayday Mayday, Pilot down!","127.500","AM","1.0","SRS",2)
  end
  if (CSAR_MARKS_ON_PILOTS) then
     CsarMapMarker  = MARKER:New(spawnedgroup:GetCoordinate(), "Pilot downed! Beacon frequency: " .. tostring(frequency) .. "kHz, coordinates: " .. coordinates_text):ReadOnly():ToAll()
  end
end

--function my_csar:OnAfterApproach(from, event, to, heliname, groupname)
  --MessageToAll("Approaching downed pilot.".. heliname .. " request flare or smoke for assistance.")
--end

function my_csar:OnAfterBoarded(from, event, to, heliname, groupname)
  --MessageToAll("my_csar:OnAfterBoarded")
  CsarMapMarker:Remove()
  --CsarMapMarker = {}
end

--function my_csar:OnAfterReturning(from, event, to, heliname, groupname)
  --MessageToAll("my_csar:OnAfterReturning")
    -- Stop helo.
--  self:__Stop(2)
--end

function my_csar:OnAfterRescued(from, event, to, heliunit, heliname, pilotssaved)
  --MessageToAll("my_csar:OnAfterRescued")
  --  MessageToAll("Downed pilot succesfully delivered to more capable hands in MASH. Thank you " .. heliname .."!")
    if STTS_ENABLED then
      STTS.TextToSpeech("We will take care of the patient, you are good to go!","127.500","AM","1.0","SRS",2)
    end
end


--MessageToAll("Adding CSAR Menu")

-- Define CSAR
local MenuCoalitionBlueCSAR             = MENU_COALITION:New( coalition.side.BLUE, "Mission Setup CSAR" )
local MenuCoalitionBlueCSARRayak        = MENU_COALITION:New( coalition.side.BLUE, "Region: Rayak", MenuCoalitionBlueCSAR)
local MenuCoalitionBlueCSARHoms         = MENU_COALITION:New( coalition.side.BLUE, "Region: Homs", MenuCoalitionBlueCSAR)
local MenuCoalitionBlueCSARRoshPina     = MENU_COALITION:New( coalition.side.BLUE, "Region: Rosh Pina", MenuCoalitionBlueCSAR)
local MenuCoalitionBlueCSARMarker       = MENU_COALITION:New( coalition.side.BLUE, "Help: Region Markers", MenuCoalitionBlueCSAR)
local MenuCoalitionBlueMarkHeliports    = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Mark Heli Ports", MenuCoalitionBlueCSARMarker, MarkHeliPorts)
local MenuCoalitionBlueRemoveMarkHeliports    = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Remove Mark Heli Ports", MenuCoalitionBlueCSARMarker, RemoveHeliPortMarks)
local MenuCoalitionBlueMarkHeliports    = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Mark MASH", MenuCoalitionBlueCSARMarker, MarkMASH)
local MenuCoalitionBlueRemoveMash       = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Remove MASH Marks", MenuCoalitionBlueCSARMarker, RemoveMASHMarks)

local MenuCoalitionBlueCSARRayakStart   = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Start CSAR", MenuCoalitionBlueCSARRayak, SpawnCSAR, CSAR_ZONE_RAYAK)
--local MenuCoalitionBlueCSARRayakEnd     = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "End CSAR", MenuCoalitionBlueCSARRayak, EndCSAR, CSAR_ZONE_RAYAK)
local MenuCoalitionBlueCSARHomsStart    = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Start CSAR", MenuCoalitionBlueCSARHoms, SpawnCSAR, CSAR_ZONE_HOMS)
--local MenuCoalitionBlueCSARHomsEnd      = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "End CSAR", MenuCoalitionBlueCSARRayak, EndCSAR, CSAR_ZONE_HOMS)
local MenuCoalitionBlueCSARRPStart      = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Start CSAR", MenuCoalitionBlueCSARRoshPina, SpawnCSAR, CSAR_ZONE_ROSHPINA)
--local MenuCoalitionBlueCSARRPEnd        = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "End CSAR", MenuCoalitionBlueCSARRoshPina, EndCSAR, CSAR_ZONE_ROSHPINA)

MessageToAll("Added CSAR Menu")
