my_csar = CSAR:New(coalition.side.BLUE,"Downed Pilot", "CSAR")

-- options
my_csar.limitmaxdownedpilots    = true
my_csar.suppressmessages        = false -- Show default messages
my_csar.maxdownedpilots         = 15
my_csar.FARPRescueDistance      = 1000 -- you need to be this close to a FARP or Airport for the pilot to be rescued.
my_csar.autosmoke               = true -- automatically smoke a downed pilot\'s location when a heli is near.
my_csar.autosmokedistance       = 1000 -- distance for autosmoke
my_csar.coordtype               = 1 -- Use Lat/Long DDM (0), Lat/Long DMS (1), MGRS (2), Bullseye imperial (3) or Bullseye metric (4) for coordinates.
my_csar.invisiblecrew           = false -- downed pilot spawn is visible
my_csar.useprefix               = false -- allow all helicopter to be CSAR
my_csar.allowFARPRescue         = true -- allows pilots to be rescued by landing at a FARP or Airbase. Else MASH only!
my_csar.csarOncrash             = true -- (WIP) If set to true, will generate a downed pilot when a plane crashes as well.
my_csar.pilotRuntoExtractPoint  = true -- Downed pilot will run to the rescue helicopter up to self.extractDistance in meters. 
my_csar.extractDistance         = 500 -- Distance the downed pilot will start to run to the rescue helicopter.
my_csar.loadDistance            = 25 -- configure distance for pilots to get into helicopter in meters.
my_csar.mashprefix              = {"MASH"}
my_csar.csarUsePara             = true
my_csar.rescuehoverheight       = 30
my_csar.rescuehoverdistance     = 20
my_csar.messageTime             = 20

my_csar.useSRS = true -- Use FF\'s SRS integration
my_csar.SRSPath = STTS.DIRECTORY -- adjust your own path in your server(!)
my_csar.SRSchannel = 127.500 -- radio channel
my_csar.SRSModulation = radio.modulation.AM -- modulation

-- start the FSM
my_csar:__Start(5)




local casevac       = false
local spawnZoneList       = {}


function SpawnCSAR(configuration)
    casevac = configuration[2]
    if configuration[1] == CSAR_ZONE_RAYAK then
      spawnZoneList   = CsarRakayZonesList
      CsarRayakActive = true
    end
    if configuration[1] == CSAR_ZONE_HOMS then
      spawnZoneList   = CsarHomsZonesList
      CsarHomsActive  = true
    end
    if configuration[1] == CSAR_ZONE_ROSHPINA then
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
  --MessageToAll("my_csar:OnAfterPilotDown")
  MessageToAll("Mayday Mayday Mayday, Pilot down! Contact at: " .. tostring(frequency) .. "kHz, coordinates: " .. coordinates_text)
  if STTS_ENABLED then
    STTS.TextToSpeech("Mayday Mayday Mayday, Pilot down!","127.500","AM","1.0","SRS",2)
  end
  if (CSAR_MARKS_ON_PILOTS) then
     CsarMapMarker  = MARKER:New(spawnedgroup:GetCoordinate(), "Pilot downed! Beacon frequency: " .. tostring(frequency) .. "kHz, coordinates: " .. coordinates_text):ReadOnly():ToAll()
  end
  if casevac == true then
    local identifier = math.random(1,9999)
    local amountGroups = math.random(1,3)
    local unitname = spawnedgroup:GetUnit(1):GetName()
    MessageToAll("Die abgesprungene Einheit heisst: " .. unitname, 30)
    local zonePilotDown = ZONE_UNIT:New("Crashsite" .. identifier, UNIT:FindByName(unitname), 50)
    SpawnGroupsOfTemplatesInListOfZones(amountGroups, {zonePilotDown}, CsarCASEVACTemplates, "CasEvacRed_"..identifier,800, 300)
  end
end

function my_csar:OnAfterApproach(from, event, to, heliname, groupname)
  --MessageToAll("my_csar:OnAfterApproach")
--  MessageToAll("Approaching downed pilot. ".. heliname .. " request flare or smoke for assistance.")
  MESSAGE:New( "Approaching downed pilot - look out for smoke!"):ToGroup(UNIT:FindByName(heliname):GetGroup())  
end

function my_csar:OnAfterBoarded(from, event, to, heliname, groupname)
  --MessageToAll("my_csar:OnAfterBoarded")
  --MessageToAll(heliname .. " - Picked up downed pilot. Return to nearest MASH or Airfield immediately.")
  MESSAGE:New( "Picked up downed pilot. Return to nearest MASH or Airfield immediately!"):ToGroup(UNIT:FindByName(heliname):GetGroup())  
  CsarMapMarker:Remove()
  --CsarMapMarker = {}
end

--function my_csar:OnAfterReturning(from, event, to, heliname, groupname)
  --MessageToAll("my_csar:OnAfterReturning")
    -- Stop helo.
  --self:__Stop(2)
--end

function my_csar:OnAfterRescued(from, event, to, heliunit, heliname, pilotssaved)
  --MessageToAll("my_csar:OnAfterRescued")
  MessageToAll("Downed pilot succesfully delivered to more capable hands in MASH. Thank you!")
  --MESSAGE:New( "We will take care of the patient, you are good to go!"):ToGroup(UNIT:FindByName(heliname):GetGroup())  

  if STTS_ENABLED then
    STTS.TextToSpeech("We will take care of the patient, you are good to go!","127.500","AM","1.0","SRS",2)
  end
end

MessageToAll("Added CSAR Menu")

