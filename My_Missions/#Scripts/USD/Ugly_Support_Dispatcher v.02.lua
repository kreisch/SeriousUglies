-- What's this?
-- The "Ugly Supply Dispatcher", short "USD", is a script to request supplies "on demand" via an F10 marker during runtime.
-- To do so, it relies completely on the usage of AIRWINGS provided by Moose.
-- Each Airwing participating in the USD must be declared within @table airwings including its possibilities.
-- As soon as a mapmarker is placed and "keyphrase" is used (default "usd") the script will start to read the given keyphrases and create a supply via
-- Moose:AUFGABE if possible.
-- The USD does not interfere with the units directly, it only creates TASK elements provided by Moose. 
--
-- Examples for request
-- "USD, Tanker Boom, Alt 24000, Speed 350, Heading 030, Leg 15"
-- "USD, Tanker Boom, Alt 24000, Speed 350, Heading 030, Start 1300, End 1400"
-----------------------------------------------------------------------------------
-- The USD script was created 2022 by kreisch and Skyfire
-- It depends on Moose being available.
-- Thanks to funkyfranky, since I reused some code of Moose ;)
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------
-- Goal
-- Request support via F10 MapMarker
-- If map markers are persisted and re-created at mission start via creation method, keep in mind to do this after
-- loading everything else like Ugly-Support-Dispatcher AND after initializing the airwings.

-----------------------------------------------------------------------------------
-- Default settings
-----------------------------------------------------------------------------------

local debug     = true
local autolase  = false

local keyphrase ="usd"
local keyphraseAltitude = "alt"
local keyphraseSpeed = "speed"
local keyphraseHeading = "heading"

local keyphraseTanker = "tanker"
local keyphraseAWACS  = "awacs"
local keyphraseCAS    = "cas"
local keyphraseCAP    = "cap"
local keyphraseAFAC   = "afac"

local keyphraseBoom           = "boom"
local keyphraseBasket         = "basket"
local keyphraseBasketBig      = "heavybasket"
local keyphraseLeg            = "leg"
local keyphraseEscort         = "escort"
local keyphraseTacan          = "tacan"
local keyphraseRadio          = "radio"
local keyphraseEndmission     = "stopmission"
local keyphraseChangemission  = "changemission"
local keyphraseLaserCode      = "lasercode"
--  Time is not being used currently
--  local keyphraseTimeStart  = "start"
--  local keyphraseTimeEnd    = "end"

local tankerDefaultSpeed      = 240
local tankerDefaultAlt        = 18000
local tankerDefaultHeading    = 0
local tankerDefaultType       = keyphraseBoom
local tankerDefaultLeg        = 15
local tankerDefaultTacan      = 21
local tankerDefaultRadio      = 121

local afacDefaultRadio        = 254

local afacDefaultSpeed        = 250
local afacDefaultAlt          = 18000  -- wiki says: Operational altitude: 25,000 ft (7.5 km)

local defaultEscort           = 1

local missionNames = {"Neptun" ,"Poseidon", "Nimrod", "Fedex", "Brewmaster"}

--- Known shortcomings:
-- Currently the task ORBIT is a subtask of Tanker, which means a tanker WILL respond to an afac task.
-- Therefore use a single Airwing for AFACs only.
local airwings = {
                    [AWNavyBoys] = {boom = false, basket = true, basketbig = false,
                        awacs = true,
                        hasCAS = false,
                        hasCAP = true,
                        hasSEAD = true, 
                    },
                    
                    [AWIncirlik] = {boom = true, basket = false, basketbig = false,
                        awacs = false,
                        cas = false,
                        cap = true,
                        sead = true,
                        afac = false, 
                    },
                    
                    [AwAfacs] = {boom = false, basket = false, basketbig = false,
                        awacs = false,
                        cas = false,
                        cap = false,
                        sead = false,
                        afac = true, 
                      },
}
  
-----------------------------------------------------------------------------------------------------------------------------------------------------
-- Do not change values below, black magic happens
-------------------------------------------------------------------------------------

local className = "Ugly Support Dispatcher"
local version ="0.2"
local id = "USD" --- Identifier. All output in DCS.log will start with this.
local activeTaskingsUSD = {}
local missionCounter = 1
local eventHandlerUSD={}

--- Debug output to dcs.log file.
local function info(text)
  if debug then
    env.info(id..text)
  end
end

-- Version info.
info(string.format(" Loading version %s", version))

--- Split string. C.f. http://stackoverflow.com/questions/1426954/split-string-in-lua
local function _split(str, sep)
  local result = {}
  local regex = ("([^%s]+)"):format(sep)
  for each in str:gmatch(regex) do
    table.insert(result, each)
  end
  return result
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Analyse the mark text and extract keywords. 
-------------------------------------------------------------------------------------------------------------------------------------------------------------
local function _MarkTextAnalysis(text)
  local switch={} --- Option parameters extracted from the mark text, later on called options
  
  info(string.format("MarkTextAnalysis text:\n%s", text)) -- debug
  --if text:lower():find(keyphrase) then -- check if USD is affected

      local keywords=_split(text, ",")

      for _,keyphrase in pairs(keywords) do

        -- Split keyphrase by space. First one is the key and second, ... the parameter(s) until the next comma.
        local str=_split(keyphrase, " ")
        local key=str[1]
        local val=str[2]
        
        info(string.format("key:\n%s", key)) -- debug

        if key:lower():find(keyphraseTanker) then -- Here we know a tanker is requested
          if (val:lower():find(keyphraseBoom)) or (val:lower():find(keyphraseBasket)) then
              switch.tankerType = val:lower()
              info(string.format(" Value tankerType = %s", switch.tankerType))
          else
              info(" Value tankerType is invalid! Use Boom or Basket!")
          end
        end

        if key:lower():find(keyphraseAltitude) then
          switch.altitude = tonumber(val)
          info(string.format(" Value alt = %s", switch.altitude))
        end

        if key:lower():find(keyphraseSpeed) then
          switch.speed = tonumber(val)
          info(string.format(" Value speed = %s", switch.speed))
        end

        if key:lower():find(keyphraseHeading) then
          switch.heading = tonumber(val)
          info(string.format(" Value heading = %s", switch.heading))
        end

--      Time is not being used currently
--
--        if key:lower():find(keyphraseTimeStart) then
--          switch.timeStart = tonumber(val)
--          info(string.format(" Value timeStart = %s", switch.timeStart))
--        end
--
--        if key:lower():find(keyphraseTimeEnd) then
--          switch.timeEnd = tonumber(val)
--          info(string.format(" Value timeEnd = %s", switch.timeEnd))
--        end

        if key:lower():find(keyphraseLeg) then
          switch.leg = tonumber(val)
          info(string.format(" Value leg = %s", switch.leg))
        end
        
        if key:lower():find(keyphraseTacan) then
          switch.tacan = tonumber(val)
          info(string.format(" Value tacan = %s", switch.tacan))
        end
        
        if key:lower():find(keyphraseRadio) then
          switch.radio = tonumber(val)
          info(string.format(" Value radio = %s", switch.radio))
        end
        
        if key:lower():find(keyphraseAWACS) then
          switch.awacs = true
          info(string.format(" Value awacs = %s", tostring(switch.awacs)))
        end
        
        if key:lower():find(keyphraseAFAC) then
          switch.afac = true
          info(string.format(" Value afac = %s", tostring(switch.afac)))
        end
        
        if key:lower():find(keyphraseEndmission) then
          switch.delete = val:lower()
          info(string.format(" Value delete = %s", tostring(switch.delete)))
        end

        if key:lower():find(keyphraseChangemission) then
          switch.missionToChange = val:lower()
          info(string.format(" Value missionToChange = %s", tostring(switch.missionToChange)))
        end
        
        if key:lower():find(keyphraseLaserCode) then
          switch.lasercode = val:lower()
          info(string.format(" Value lasercode = %s", tostring(switch.lasercode)))
        end
        
      end

  return switch
end

-----------------------------------------------------------------------------------
-- Get random mission name of @table missionNames.
-- This identifier is used later on to Cancel running missions.
-----------------------------------------------------------------------------------
local function _createMissionName()
  local _missionName = ""
  _missionName = missionNames[math.random(#missionNames)] .. missionCounter
  missionCounter = missionCounter + 1
  
  return _missionName
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Iterates over all known Airwings and returns the one closest to the mapmarker used to request the support
-------------------------------------------------------------------------------------------------------------------------------------------------------------
local function selectNearestAirwing(capableAirwings, Event) -- Selects the airfield closes to the EventMarker which can provide the requested Support
  info("Select Nearest Airwings Capable to support.")

  local _capableAirwings = capableAirwings
  local positionOfMapMarker = {
    x = Event.pos.x,
    y = Event.pos.y,
    z = Event.pos.z
  } -- The position of the MapMarker used to create the Event of SupportRequest
  local closest = nil
  local distmin = nil

  -- Bestimme Distanz zum Marker
  -- Siehe bspw function COORDINATE:GetClosestAirbase(Category, Coalition) in Moose
  for _, _airwing in pairs(_capableAirwings) do
    local airwing = _airwing -- Wrapper.Airwing
    if airwing then
      local airbaseName = airwing:GetAirbaseName()
      local airwingPosition = airwing:GetCoordinate()
      if airbaseName and airwingPosition then
        info("Checking airwing " .. airwing:GetAirbaseName() .. " at Position (" .. airwingPosition.x .. ", " .. airwingPosition.y .. ", " .. airwingPosition.z .. ")")

        local dist = airwingPosition:Get2DDistance(positionOfMapMarker)

        if closest == nil then
          distmin = dist
          closest = airwing
        else
          if dist < distmin then
            distmin = dist
            closest = airwing
          end
        end
        info("Distance is " .. dist)
      end
    end
  end
  if closest then
    info("The closes airwing is " .. closest:GetAirbaseName())
  end
  return closest
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Iterates over all known AIRWING and returns a table of AIRWING which includes the ones that can provide the requested support.
-- Afterwards the closest AIRWING will be selected.
-- E.g. if 4 Airwings are defined but only 2 of them can provide a boom tanker, only those 2 will be returned here.
-------------------------------------------------------------------------------------------------------------------------------------------------------------
local function provideAirwingsCapableToSupport(support, Event) -- Returns all Airwings capable of the requested Support
  info("Provide Airwings Capable to Support the type: " .. support)
  local capableAirwings = {}
  local _requestedSupportType = support

  -- Über die Liste iterieren. Wenn Airwing bei einem Support-Tag "TRUE" hat, zur Liste "capableAirwings" hinzufügen.
  for airwing in pairs(airwings) do
    local valueSupportAvailable = airwings[airwing][_requestedSupportType]
    info(airwing:GetAirbaseName() .. " Looking for Airwing for " .. _requestedSupportType .. " and have found: " .. tostring(valueSupportAvailable))
    if valueSupportAvailable then
      table.insert(capableAirwings, airwing) -- Here add the airwing to the list.
    end
  end
  info("Number of Airwings found: " .. #capableAirwings)
  local closestAirwing = selectNearestAirwing(capableAirwings, Event)

  return closestAirwing
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Error method, if invalid requests are entered.
-- HINT: This does not check the values, only the keys.
-------------------------------------------------------------------------------------------------------------------------------------------------------------
local function errorMarkerNoValidSupportRequested(Event)
  info(string.format(" Deleting marker with EventID:\n%s", Event.idx)) -- debug
  trigger.action.removeMark(Event.idx)
  local _coordinate = COORDINATE:New(Event.pos.x, Event.pos.y, Event.pos.z) -- Coordinate of F10Marker
  MARKER:New(_coordinate, "No valid support type was requested. Please check."):ToAll()
end

local function _LineViaOffset(coordinate, bearing, range)
  local _coordinate = coordinate
  info("Drawing line on F10 map...")
  -- COORDINATE:LineToAll(Endpoint,Coalition,Color,Alpha,LineType,ReadOnly,Text)
  local _line = nil
  -- Wie bekomme ich die Coordinate, wenn ich Richtung und Distanz habe?
  --_line = _coordinate:LineToAll(Endpoint,Coalition,Color,Alpha,LineType,ReadOnly,Text)
  return _line
end

local function _createTextForMarkerTanker(options)
  local stringForMarker =""
  local _options = options
  
  stringForMarker = string.format("Tanker Details are\nTacan:%s\nRadio:%s", options.tacan, options.radio)
  
  return stringForMarker
end

local function _createTextForMarkerAFAC(options)
  local stringForMarker =""
  local _options = options
  
  stringForMarker = string.format("AFAC Details are\nRadio:%s", options.radio)
  
  return stringForMarker
end



local function _updateMapMarkerForMission(flightgroup, generatedMissionName)
  local _flightgroup          = flightgroup
  local _generatedMissionName = generatedMissionName
  
  local _missiontype  = activeTaskingsUSD[_generatedMissionName]["missiontype"]
  local _lasercode    = _flightgroup:GetLaserCode()
  local _radio        = _flightgroup:GetRadio()
  local _tacan        = _flightgroup:GetTACAN()
  
  local _text = string.format("Mission Name: %s Mission Type %s\nRadio %s\nTacan %s\nLasercode %s", _generatedMissionName,_missiontype,_radio, _tacan, _lasercode)
  
  activeTaskingsUSD[_generatedMissionName]["marker"]:UpdateText(_text)

end


-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Creates an AUFTRAG for a tanker.
-------------------------------------------------------------------------------------------------------------------------------------------------------------
local function _CreateTankerMission(_options, Event, _selectedAirwing)
  local _coordinate = COORDINATE:New(Event.pos.x, Event.pos.y, Event.pos.z) -- Coordinate of F10Marker
  local _altitude = _options.altitude or tankerDefaultAlt
  local _speed    = _options.speed or tankerDefaultSpeed
  local _heading  = _options.heading or tankerDefaultHeading
  local _leg      = _options.leg or tankerDefaultLeg
  local _tacan    = tankerDefaultTacan
  local _radio    = tankerDefaultRadio
  local _type     = -1

  if _options.tacan then
    _tacan = _options.tacan
  else
    _options.tacan = tankerDefaultTacan     
  end

  if _options.radio then
    _radio = _options.radio
  else
    _options.radio = tankerDefaultRadio
  end

  if _options.tankerType then
    if _options.tankerType:find(keyphraseBoom) then
      _type = 0
    elseif _options.tankerType:find(keyphraseBasket) then
      _type = 1
    end
  end

  info(string.format(" Creating tanker task with type:\n%s", _type)) -- debug

  local missionTanker = AUFTRAG:NewTANKER(_coordinate, _altitude, _speed, _heading, _leg, _type)
  local lineOfTasking = _LineViaOffset(_coordinate, _heading, _leg)
  local markOfTasking = nil
  local nameOfMission = _createMissionName()

  if missionTanker then
    -- Remove Mark to avoid creating multiple missions
    info(string.format(" Deleting marker with EventID:\n%s", Event.idx)) -- debug
    trigger.action.removeMark(Event.idx)

    local stringForMarker = _createTextForMarkerTanker(_options)
    markOfTasking = MARKER:New(_coordinate, "Tanker tasking started.\n" .. "Mission:" .. nameOfMission .. "\n" .. stringForMarker):ReadOnly():ToAll() -- Diesen Marker muss man nun mit dem Auftrag mappen.
  end

  missionTanker:SetTACAN(_tacan, "REF")
  missionTanker:SetRadio(_radio)
  missionTanker:SetRepeat(99)
  missionTanker:SetRequiredEscorts(1, 1, AUFTRAG.Type.ESCORT, {"AIR"}, 60)
  --            activeTaskingsUSD[nameOfMission]["mission"] = missionTanker  -- Here the AUFTRAG is grouped to the mission name.
  --            activeTaskingsUSD[nameOfMission]["marker"] = markOfTasking   -- Here the MARKER is grouped to the mission name.

  local missionData = {
    mission = missionTanker,
    marker = markOfTasking,
    line = lineOfTasking,
    group = nil,
    missiontype = "tanker",
    scheduler = nil
  }
  activeTaskingsUSD[nameOfMission:lower()] = missionData
  _selectedAirwing:AddMission(missionTanker)
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Creates an AUFTRAG:NewAWACS() with moose depending on the map marker information.
-------------------------------------------------------------------------------------------------------------------------------------------------------------
local function _CreateAwacsMission(options, Event, _selectedAirwing)
  local _options = options
end

local function _CreateCAPMission(options, Event, _selectedAirwing)
  local _options = options
end

local function _CreateAfacMission(options, Event, _selectedAirwing)
  local _options = options
  local markOfTasking = nil
  local nameOfMission = _createMissionName()
  --- Vorgehen:
  -- 1. Orbit als Auftrag erstellen mittels Zone um den Mapmarker herum
  -- 2. Zone markieren auf F10 map
  -- 3. Marker mit Daten erstellen
  -- Problem: Erstmal an die Group kommen, die den Auftrag bekommt. AUFTRAG:GetOpsGroups() ?
  -- 4. AFAC Fähigkeiten verleihen, sobald Unit in Zone angekommen ist
  if not _options.radio then
    _options.radio = afacDefaultRadio
  end

  local _coordinate = COORDINATE:New(Event.pos.x, Event.pos.y, Event.pos.z) -- Coordinate of F10Marker
  local orbitTask = AUFTRAG:NewORBIT_CIRCLE(_coordinate, afacDefaultAlt, afacDefaultSpeed)
  
  local stringForMarker = _createTextForMarkerAFAC(_options)
  markOfTasking = MARKER:New(_coordinate, "AFAC tasking started.\n" .. "Mission:".. nameOfMission .."\n" .. stringForMarker):ReadOnly():ToAll()
  
  local missionData = {mission = orbitTask, marker = markOfTasking, group = nil, missiontype ="afac", scheduler = nil}
  activeTaskingsUSD[nameOfMission:lower()] = missionData
  _selectedAirwing:AddMission(orbitTask)
  trigger.action.removeMark(Event.idx) -- remove the old mark, since the task is created.
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Checks which Support is requested by an F10 MapMarker and returns the value as string.
-------------------------------------------------------------------------------------------------------------------------------------------------------------
local function _determineSupportType(options, Event)
  info("Determining the requested support by F10 Mapmarker ")
  local _supportType = nil
  local _options = options
  -- Analyse the mark point text and extract the keywords to define the task related stuff
  if _options.tankerType then -- if ~nil, a Tanker is requested
    _supportType = _options.tankerType
  elseif _options.awacs then -- if ~nil, AWACS is requested
    _supportType = keyphraseAWACS
  elseif _options.cas then -- if ~nil, CAS is requested
    _supportType = keyphraseCAS
  elseif _options.cap then -- if ~nil, CAP is requested
    _supportType = keyphraseCAP
  elseif _options.afac then -- if ~nil, CAP is requested
    _supportType = keyphraseAFAC
  else
    info("No valid support type is requested.")
    errorMarkerNoValidSupportRequested(Event)
  end
  return _supportType
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tries to end a mission, specified by mission name.
-------------------------------------------------------------------------------------------------------------------------------------------------------------
local function _endMission(options, Event)
  local _options = options
  local _missionName = _options.delete:lower()
  if (activeTaskingsUSD[_missionName]) then
    activeTaskingsUSD[_missionName]["mission"]:Cancel()
    activeTaskingsUSD[_missionName]["marker"]:Remove()
    if (activeTaskingsUSD[_missionName]["group"]) then
      activeTaskingsUSD[_missionName]["group"]:SetDetection(false)
      activeTaskingsUSD[_missionName]["group"]:LaserOff()
    end
    if (activeTaskingsUSD[_missionName]["scheduler"]) then
      activeTaskingsUSD[_missionName]["scheduler"]:Stop()
    end
    -- activeTaskingsUSD[_missionName]["line"]:Remove()
    trigger.action.removeMark(Event.idx)
  else
    info(_missionName .. " is not included in the active mission list.")
    trigger.action.removeMark(Event.idx)
    local _coordinate = COORDINATE:New(Event.pos.x, Event.pos.y, Event.pos.z) -- Coordinate of F10Marker
    MARKER:New(_coordinate, _missionName .. " is not included in the active mission list."):ToAll()
  end

end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tries to change the mission data (like lasercode or radio frequency, tacan,...), specified by mission name.
-------------------------------------------------------------------------------------------------------------------------------------------------------------
local function _changeMission (options, Event)
  local _options = options
  local _missionName = _options.missionToChange:lower()
  local _auftrag = activeTaskingsUSD[_missionName]["mission"]     -- The AUFTRAG
  local _auftragGroup = activeTaskingsUSD[_missionName]["group"]  -- The OpsGroup
  local _auftragName  = _auftrag:GetName()
  info("Changing mission " .. _missionName .. " AuftragName " .. _auftragName)
  info("The mission " .. _missionName .. " has assigned the group " .. _auftragGroup:GetName())
  
  if (_options.lasercode) then
      _auftragGroup:SetLaser(_options.lasercode, true, false, 30) -- (Code, CheckLOS, IROff, UpdateTime)
      info("Group " .. _auftragGroup:GetName() .. " changing Laser to " .. _options.lasercode)
  end
  if (_options.radio) then
      _auftragGroup:SwitchRadio(_options.radio)
      info("Group " .. _auftragGroup:GetName() .. " changing radio to " .. _options.radio)
  end
  if (_options.tacan) then
      _auftragGroup:SwitchTACAN(_options.tacan, "XXX", _auftragGroup:GetUnit(1), "Y")
      info("Group " .. _auftragGroup:GetName() .. " changing tacan to " .. _options.tacan)
  end
  --trigger.action.removeMark(Event.idx)
  _updateMapMarkerForMission(_auftragGroup,_missionName)
  
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Event handler functions.
------------------------------------------------------------------------------------------------------------------------------------------------------------- 
local function _OnEventMarkChange(Event)
  -- If the event contains "Tanker Keyphrase", so player requests a tanker (Boom or basket decided later)
  if Event.text ~= nil and Event.text:lower():find(keyphrase) then
    info(string.format("USD Tag found.")) -- debug
    local _options = _MarkTextAnalysis(Event.text) -- Extracts the options from the marker Text

    if _options.delete then -- A mission shall be ended
      _endMission(_options, Event)
    else
      if _options.missionToChange then
        _changeMission(_options, Event)
      else

        -- No mission to be ended, so check which support is requested.
        local _requestedSupportType = _determineSupportType(_options, Event) -- Returns the support Type
        -- We know which type of support is requested, now find an airwing capable of.
        if (_requestedSupportType) then
          local _selectedAirwing = provideAirwingsCapableToSupport(_requestedSupportType, Event)

          if (_selectedAirwing ~= nil) then -- If we have found an airwing, we can check which mission to create depending on support type.
            if _options.tankerType then
              _CreateTankerMission(_options, Event, _selectedAirwing) -- if ~= nil, create a mission. 
            elseif _options.awacs then
              _CreateAwacsMission(_options, Event, _selectedAirwing)
            elseif _options.cap then
              _CreateCAPMission(_options, Event, _selectedAirwing)
            elseif _options.afac then
              _CreateAfacMission(_options, Event, _selectedAirwing)
            end
          end
        end
      end -- End Support Request
    end
    -- #endregion
  end
end

--- Handle world events.
function eventHandlerUSD:onEvent(Event)

  -- Only interested in S_EVENT_MARK_*
  if Event == nil or Event.idx == nil then
    return true
  end
  
  -- Debug output.
  if Event.id     == world.event.S_EVENT_MARK_ADDED then
    --info("S_EVENT_MARK_ADDED")
  elseif Event.id == world.event.S_EVENT_MARK_CHANGE then
    --info("S_EVENT_MARK_CHANGE")
  elseif Event.id == world.event.S_EVENT_MARK_REMOVED then
    --info("S_EVENT_MARK_REMOVED")    
  end

  info(string.format("Event id        = %s", tostring(Event.id)))
  info(string.format("Event time      = %s", tostring(Event.time)))
  info(string.format("Event idx       = %s", tostring(Event.idx)))
  info(string.format("Event coalition = %s", tostring(Event.coalition)))
  info(string.format("Event group id  = %s", tostring(Event.groupID)))
  info(string.format("Event pos X     = %s", tostring(Event.pos.x)))
  info(string.format("Event pos Y     = %s", tostring(Event.pos.y)))
  info(string.format("Event pos Z     = %s", tostring(Event.pos.z)))

  if Event.initiator~=nil then
    local _unitname=Event.initiator:getName()
    info(string.format("Event ini unit  = %s", tostring(_unitname)))
  end
  info(string.format("Event text      = \n%s", tostring(Event.text)))
    
  -- Call event function when a marker has changed, i.e. text was entered or changed.
  if Event.id==world.event.S_EVENT_MARK_CHANGE then
    _OnEventMarkChange(Event)
  end

end

world.addEventHandler(eventHandlerUSD)

if (autolase) then
  info("Loading Autolase")
  local afacSet = SET_GROUP:New():FilterPrefixes("AFAC"):FilterCoalitions("blue"):FilterCategoryAirplane():FilterStart()
  local Pilotset = SET_CLIENT:New():FilterCoalitions("blue"):FilterActive(true):FilterStart()
  local autolaser = AUTOLASE:New(afacSet, coalition.side.BLUE, "AFAC", Pilotset)
  autolaser:SetNotifyPilots(true) -- defaults to true, also shown if debug == true
  autolaser:SetPilotMenu(true)
else
  -- info("Loading complex AFAC")
  --    local RecceSetGroup = SET_GROUP:New():FilterPrefixes( "AFAC" ):FilterStart()
  --    
  --    local HQ = GROUP:FindByName( "HQ" )
  --    
  --    local CC = COMMANDCENTER:New( HQ, "HQ" )
  --    
  --    -- Let the RecceSetGroup vehicles in the collection detect targets and group them in AREAS of 1000 meters.
  --    local RecceDetection = DETECTION_AREAS:New( RecceSetGroup, 1000 )
  --    
  --    -- Create a Attack Set, which contains the human player client slots and CA vehicles.
  --    local AttackSet = SET_CLIENT:New():FilterCoalitions("blue"):FilterActive(true):FilterStart()
  --    
  --    local RecceDesignation = DESIGNATE:New( CC, RecceDetection, AttackSet )
  --    
  --    -- This sets the threat level prioritization on
  --    RecceDesignation:SetThreatLevelPrioritization( true )
  --    
  --    -- Set the possible laser codes.
  --    RecceDesignation:GenerateLaserCodes()
  --    
  --    RecceDesignation:AddMenuLaserCode( 1113, "Lase with %d for Su-25T" )
  --    RecceDesignation:AddMenuLaserCode( 1680, "Lase with %d for A-10A" )
  --    
  --    -- Start the detection process in 5 seconds.
  --    RecceDesignation:__Detect( -5 )

end

function AwAfacs:OnAfterFlightOnMission(From, Event, To, Flightgroup, Mission)
  self:E({From, Event, To, Flightgroup, Mission})
  info("AW AFACS is launching a flight")

  local _flightgroup = Flightgroup -- Ops.FlightGroup#FLIGHTGROUP
  local _mission = Mission -- Ops.Auftrag#AUFTRAG
  local _flightgroupname = _flightgroup:GetName()
  local _generatedMissionName = nil

  for _missionName, secItConfig in pairs(activeTaskingsUSD) do
    if activeTaskingsUSD[_missionName]["mission"] == _mission then
      info("I have found the mission in the USD table " .. _mission:GetName())
      activeTaskingsUSD[_missionName]["group"] = _flightgroup
      info("Assigned flightgroup " .. _flightgroupname .. " to mission " .. _mission:GetName())
      _generatedMissionName = _missionName
      info("The generated mission name is " .. _generatedMissionName)
    else
      info("I did not find the mission in the USD table, compared to " ..
             activeTaskingsUSD[_missionName]["mission"]:GetName())
    end
  end

  if _mission:GetType() == AUFTRAG.Type.ORBIT then
    info("Configuring AFAC Group " .. _flightgroupname)
    _flightgroup:SetDetection(true)
    local _markerTarget = nil
    --- Function called when the LASER is switched on.
    function _flightgroup:OnAfterLaserOn(From, Event, To, Target)
      local text = string.format("Switching LASER On (code %d) at target %s", _flightgroup:GetLaserCode(),
        Target:GetName())
      MESSAGE:New(text, 60):ToAll()
      env.info(text)
    end

    --- Function called when the LASER is switched off.
    function _flightgroup:OnAfterLaserOff(From, Event, To)
      local text = string.format("Switching LASER Off")
      MESSAGE:New(text, 60):ToAll()
      env.info(text)
      if (_markerTarget) then
        _markerTarget:Remove()
      end
    end

    -- Info on LASER target and code.
    local function CheckThreats()
      -- Get the highst (detected) threat to the group.
      local threatunit, threatlevel = _flightgroup:GetHighestThreat()

      -- Set of detected units.
      local detectedset = _flightgroup:GetDetectedUnits()

      -- Cound number of alive detected units. 
      local ndetected = detectedset:CountAlive()

      -- Info on detected units.
      local text = string.format("Detected units (%d):", ndetected)
      if ndetected > 0 then
        for _, _unit in pairs(detectedset:GetSet()) do
          local unit = _unit -- Wrapper.Unit#UNIT
          text = text .. string.format("\n- %s [threat level=%d]", unit:GetName(), unit:GetThreatLevel())
        end
      else
        text = text .. " None"
      end

      -- We got a threat to the group.
      if threatunit then
        text = text .. string.format("\nHighest detected threat %s with threat level %d", threatunit:GetName(), threatlevel)

        -- Current laser target.
        local target = _flightgroup:GetLaserTarget()

        local newtarget = nil -- Wrapper.Unit#UNIT
        if target then
          local currentthreatlevel = target:GetThreatLevel()

          if threatlevel > currentthreatlevel then
            env.info("FF higher threat detected!")
            newtarget = threatunit
          end

        else
          env.info("FF no current target using this one")
          newtarget = threatunit
        end

        if newtarget then
          if _flightgroup:IsLasing() then
            _flightgroup:LaserOff()
          end
          env.info("FF New target " .. newtarget:GetName())
          _flightgroup:LaserOn(newtarget)
          _markerTarget = MARKER:New(newtarget:GetCoordinate(),
            newtarget:GetTypeName() .. " Coordinates\n" .. newtarget:GetCoordinate():ToStringLLDDM() .. "\n" ..
              newtarget:GetCoordinate():ToStringLLDMS() .. "\n" .. newtarget:GetCoordinate():ToStringMGRS()):ReadOnly()
            :ToAll()
        end

      end

      -- Get current laser target.
      local unit = _flightgroup:GetLaserTarget()
      if unit then
        text = text .. string.format("\nLasing target %s at code %d", unit:GetName(), _flightgroup:GetLaserCode())
      else
        text = text .. "\nNot lasing any target"
      end
      text = text .. string.format(" (ON=%s, LOS=%s)", tostring(_flightgroup:IsLasing()), tostring(_flightgroup.spot.LOS))

      -- Info message.
      MESSAGE:New(text, 25):ToAll()
      env.info(text)
    end

    -- Timer to check threats every 30 sec.
    local scheduler = TIMER:New(CheckThreats)
    activeTaskingsUSD[_generatedMissionName]["scheduler"] = scheduler
    activeTaskingsUSD[_generatedMissionName]["scheduler"]:Start(30, 30)
    _updateMapMarkerForMission(_flightgroup, _generatedMissionName)
  end
end

function AWIncirlik:OnAfterFlightOnMission(From, Event, To, Flightgroup, Mission)
  local _flightgroup = Flightgroup -- Ops.FlightGroup#FLIGHTGROUP
  local _mission = Mission -- Ops.Auftrag#AUFTRAG
  local _flightgroupname = _flightgroup:GetName()
  local _generatedMissionName = nil

  for _missionName, secItConfig in pairs(activeTaskingsUSD) do
    if activeTaskingsUSD[_missionName]["mission"] == _mission then
      info("I have found the mission in the USD table " .. _mission:GetName())
      activeTaskingsUSD[_missionName]["group"] = _flightgroup
      info("Assigned flightgroup " .. _flightgroupname .. " to mission " .. _mission:GetName())
      _generatedMissionName = _missionName
      info("The generated mission name is " .. _generatedMissionName)
    else
      info("I did not find the mission in the USD table, compared to " ..
             activeTaskingsUSD[_missionName]["mission"]:GetName())
    end
  end
  
  _updateMapMarkerForMission(_flightgroup, _generatedMissionName)

end
