-- Goal
-- Request support via F10 MapMarker
-- If map markers are persisted and re-created at mission start via creation method, keep in mind to do this after
-- loading everything else like Ugly-Support-Dispatcher AND after initializing the airwings.

-- Example for request
-- "USD, Tanker Boom, Alt 24000, Speed 350, Heading 030, Leg 15"
-- "USD, Tanker Boom, Alt 24000, Speed 350, Heading 030, Start 1300, End 1400"

  local debug = true

  local keyphrase ="usd"
  local keyphraseAltitude = "alt"
  local keyphraseSpeed = "speed"
  local keyphraseHeading = "heading"

  local keyphraseTanker = "tanker"
  local keyphraseAWACS  = "awacs"
  local keyphraseCAS    = "cas"
  local keyphraseCAP    = "cap"
  
  local keyphraseBoom       = "boom"
  local keyphraseBasket     = "basket"
  local keyphraseBasketBig  = "heavybasket"
  local keyphraseLeg        = "leg"
  local keyphraseEscort     = "escort"
  local keyphraseTacan      = "tacan"
  local keyphraseRadio      = "radio"
  local keyphraseEndmission = "stopmission"
--  Time is not being used currently
--  local keyphraseTimeStart  = "start"
--  local keyphraseTimeEnd    = "end"

  local tankerDefaultSpeed      = 240
  local tankerDefaultAlt        = 18000
  local tankerDefaultHeading    = 0
  local tankerDefaultType       = "boom"
  local tankerDefaultLeg        = 15
  local tankerDefaultTacan      = 21
  local tankerDefaultRadio      = 121
  
  local defaultEscort           = 1
  
  local missionNames = {"Neptun" ,"Poseidon", "Nimrod", "Fedex", "Brewmaster"}
  local airwings = {
                      [AWNavyBoys] = {boom = false, basket = true, basketbig = false,
                          awacs = true,
                          hasCAS = false,
                          hasCAP = true,
                          hasSEAD = true, 
                      },
                      
                      [AWIncirlik] = {boom = true, basket = true, basketbig = false,
                          awacs = false,
                          hasCAS = false,
                          hasCAP = true,
                          hasSEAD = true, 
                      },
  }
  
  -----------------------------------------------------------------------------------------------------------------------------------------------------
  -- Do not change values below, black magic happens
  --
  -------------------------------------------------------------------------------------
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

  local className = "Ugly Support Dispatcher"
  local version ="0.2"
  local id = "USD" --- Identifier. All output in DCS.log will start with this.
  local activeTaskingsUSD = {}
  local missionCounter = 1

-- Version info.
env.info(id..string.format(" Loading version %s", version))


--- Debug output to dcs.log file.
local function info(text)
if debug then
  env.info(text)
end
end

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
-- Event handler.
-------------------------------------------------------------------------------------------------------------------------------------------------------------
local eventHandlerUSD={}



-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Analyse the mark text and extract keywords. 
-------------------------------------------------------------------------------------------------------------------------------------------------------------
local function _MarkTextAnalysis(text)
  local switch={} --- Option parameters extracted from the mark text, later on called options
  
  info(id..string.format("MarkTextAnalysis text:\n%s", text)) -- debug
  --if text:lower():find(keyphrase) then -- check if USD is affected

      local keywords=_split(text, ",")

      for _,keyphrase in pairs(keywords) do

        -- Split keyphrase by space. First one is the key and second, ... the parameter(s) until the next comma.
        local str=_split(keyphrase, " ")
        local key=str[1]
        local val=str[2]
        
        info(id..string.format("key:\n%s", key)) -- debug

        if key:lower():find(keyphraseTanker) then -- Here we know a tanker is requested
          if (val:lower():find("boom")) then
              switch.tankerType = val:lower()
              info(id..string.format(" Value tankerType = %s", switch.tankerType))
          elseif (val:lower():find("basket")) then
              switch.tankerType = val:lower()
              info(id..string.format(" Value tankerType = %s", switch.tankerType))
          else
              info(id.." Value tankerType is invalid! Use Boom or Basket!")
          end
        end

        if key:lower():find(keyphraseAltitude) then
          switch.altitude = tonumber(val)
          info(id..string.format(" Value alt = %s", switch.altitude))
        end

        if key:lower():find(keyphraseSpeed) then
          switch.speed = tonumber(val)
          info(id..string.format(" Value speed = %s", switch.speed))
        end

        if key:lower():find(keyphraseHeading) then
          switch.heading = tonumber(val)
          info(id..string.format(" Value heading = %s", switch.heading))
        end

--      Time is not being used currently
--
--        if key:lower():find(keyphraseTimeStart) then
--          switch.timeStart = tonumber(val)
--          info(id..string.format(" Value timeStart = %s", switch.timeStart))
--        end
--
--        if key:lower():find(keyphraseTimeEnd) then
--          switch.timeEnd = tonumber(val)
--          info(id..string.format(" Value timeEnd = %s", switch.timeEnd))
--        end

        if key:lower():find(keyphraseLeg) then
          switch.leg = tonumber(val)
          info(id..string.format(" Value leg = %s", switch.leg))
        end
        
        if key:lower():find(keyphraseTacan) then
          switch.tacan = tonumber(val)
          info(id..string.format(" Value tacan = %s", switch.tacan))
        end
        
        if key:lower():find(keyphraseRadio) then
          switch.radio = tonumber(val)
          info(id..string.format(" Value radio = %s", switch.radio))
        end
        
        if key:lower():find(keyphraseAWACS) then
        switch.awacs = true
        info(id..string.format(" Value awacs = %s", tostring(switch.awacs)))
        end
        
        if key:lower():find(keyphraseEndmission) then
        switch.delete = val:lower()
        info(id..string.format(" Value delete = %s", tostring(switch.delete)))
        end

        
      end

  return switch
end

-----------------------------------------------------------------------------------
-- Get random mission name of @table missionNames.
-- This identifier is used later on to Cancel running missions.
-----------------------------------------------------------------------------------
local function _createMissionName()
  local _missionName =""
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
  local positionOfMapMarker = {x = Event.pos.x, y = Event.pos.y, z = Event.pos.z }    -- The position of the MapMarker used to create the Event of SupportRequest
  local closest=nil
  local distmin=nil
        -- Bestimme Distanz zum Marker
        -- Siehe bspw function COORDINATE:GetClosestAirbase(Category, Coalition) in Moose


    for _,_airwing in pairs(_capableAirwings) do
    local airwing = _airwing -- Wrapper.Airwing
      if airwing then
        local airbaseName = airwing:GetAirbaseName()
        local airwingPosition = airwing:GetCoordinate()
        if airbaseName  and airwingPosition then
          info("Checking airwing ".. airwing:GetAirbaseName() .. " at Position " .. airwingPosition.x )
          
          local dist = airwingPosition:Get2DDistance(positionOfMapMarker)
          
            if closest == nil then
              distmin=dist
              closest=airwing
            else
              if dist<distmin then
                distmin=dist
                closest=airwing
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
          info(airwing:GetAirbaseName() .. " Suche nach Airwing fuer " .._requestedSupportType .. " und habe gefunden ".. tostring(valueSupportAvailable))
          if valueSupportAvailable then
            table.insert(capableAirwings, airwing) -- Here add the airwing to the list.
          end
      end
      info("I have found the Airwings#: " .. #capableAirwings)
      local closestAirwing = selectNearestAirwing(capableAirwings, Event)
      
  return closestAirwing
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Error method, if invalid requests are entered.
-- HINT: This does not check the values, only the keys.
-------------------------------------------------------------------------------------------------------------------------------------------------------------
local function errorMarkerNoValidSupportRequested(Event)
     info(id..string.format(" Deleting marker with EventID:\n%s", Event.idx)) -- debug
     trigger.action.removeMark(Event.idx)
     local _coordinate = COORDINATE:New(Event.pos.x, Event.pos.y, Event.pos.z) -- Coordinate of F10Marker
     MARKER:New(_coordinate, "No valid support type was requested. Please check."):ToAll()
end

local function _createTextForMarkerTanker(options)
  local stringForMarker =""
  local _options = options
  
  stringForMarker = string.format("Tanker Details are\nTacan:%s\nRadio:%s", options.tacan, options.radio)
  
  return stringForMarker
end

local function _CreateTankerMission(_options, Event, _selectedAirwing)
            local _coordinate = COORDINATE:New(Event.pos.x, Event.pos.y, Event.pos.z) -- Coordinate of F10Marker
            local _altitude = tankerDefaultAlt    -- Default values for a tanker, used when nothing specified in marker
            local _speed = tankerDefaultSpeed
            local _heading = tankerDefaultHeading
            local _leg = tankerDefaultLeg
            local _tacan = tankerDefaultTacan
            local _radio = tankerDefaultRadio
            local _type = -1
  
            if _options.altitude then
                _altitude = _options.altitude
            end
            if _options.speed then
                _speed = _options.speed
            end
            if _options.heading then
                _heading = _options.heading
            end
            if _options.leg then
                _leg = _options.leg
            end
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
              if _options.tankerType:find("boom") then
                  _type = 0
              elseif _options.tankerType:find("basket") then
                  _type = 1
              end
            end
            info(id..string.format(" Creating tanker task with type:\n%s", _type)) -- debug
   
            local missionTanker = AUFTRAG:NewTANKER(_coordinate, _altitude, _speed, _heading, _leg, _type)
            local markOfTasking = nil
            local nameOfMission = _createMissionName()
            
            if missionTanker then
                -- Remove Mark to avoid creating multiple missions
                info(id..string.format(" Deleting marker with EventID:\n%s", Event.idx)) -- debug
                trigger.action.removeMark(Event.idx)
                
                local stringForMarker = _createTextForMarkerTanker(_options)
                markOfTasking = MARKER:New(_coordinate, "Tanker tasking started.\n" .. "Mission:".. nameOfMission .."\n" .. stringForMarker):ReadOnly():ToAll() -- Diesen Marker muss man nun mit dem Auftrag mappen.
            end
            missionTanker:SetTACAN(_tacan, "REF")
            missionTanker:SetRadio(_radio)
            missionTanker:SetRepeat(99)
            missionTanker:SetRequiredEscorts(1, 1, AUFTRAG.Type.ESCORT, {"AIR"}, 60)
--            activeTaskingsUSD[nameOfMission]["mission"] = missionTanker  -- Here the AUFTRAG is grouped to the mission name.
--            activeTaskingsUSD[nameOfMission]["marker"] = markOfTasking   -- Here the MARKER is grouped to the mission name.
            local missionData = {mission = missionTanker, marker = markOfTasking}
            activeTaskingsUSD[nameOfMission:lower()] = missionData
            _selectedAirwing:AddMission(missionTanker)
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Creates an AUFTRAG:NewAWACS() with moose depending on the map marker information.
-------------------------------------------------------------------------------------------------------------------------------------------------------------
local function _CreateAwacsMission(options, Event)
  local _options = options

end
-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Checks which Support is requested by an F10 MapMarker and returns the value as string.
-------------------------------------------------------------------------------------------------------------------------------------------------------------
local function _determineSupportType(options, Event)
  info("Determining the requested support by F10 Mapmarker " .. tostring(options.awacs))
  local _supportType = nil
  local _options = options
      -- Analyse the mark point text and extract the keywords to define the task related stuff
      if _options.tankerType then     -- if ~nil, a Tanker is requested
         _supportType = _options.tankerType
      elseif _options.awacs then          -- if ~nil, AWACS is requested
         _supportType = keyphraseAWACS
      elseif _options.cas then        -- if ~nil, CAS is requested
        _supportType = keyphraseCAS
      elseif _options.cap then        -- if ~nil, CAP is requested
        _supportType = keyphraseCAP
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
    trigger.action.removeMark(Event.idx)
  else
    info(_missionName .. " is not included in the active mission list.")
    trigger.action.removeMark(Event.idx)
     local _coordinate = COORDINATE:New(Event.pos.x, Event.pos.y, Event.pos.z) -- Coordinate of F10Marker
     MARKER:New(_coordinate, _missionName .. " is not included in the active mission list."):ToAll()
  end

end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Event handler functions.
------------------------------------------------------------------------------------------------------------------------------------------------------------- 
local function _OnEventMarkChange(Event)
  -- If the event contains "Tanker Keyphrase", so player requests a tanker (Boom or basket decided later)
  if Event.text~=nil and Event.text:lower():find(keyphrase) then
      info(id..string.format("USD Tag found.")) -- debug
      local _options=_MarkTextAnalysis(Event.text)      -- Extracts the options from the marker Text
      
      if _options.delete then -- A mission shall be ended
        _endMission(_options, Event)
      
      else  -- No mission to be ended, so check which support is requested.
          local _requestedSupportType = _determineSupportType(_options, Event)  -- Returns the support Type
          -- We know which type of support is requested, now find an airwing capable of.
          if (_requestedSupportType) then
            local _selectedAirwing = provideAirwingsCapableToSupport(_requestedSupportType, Event)
  
            if (_selectedAirwing ~=nil) then -- If we have found an airwing, we can check which mission to create depending on support type.
              if _options.tankerType then
                _CreateTankerMission(_options, Event, _selectedAirwing) -- if ~= nil, create a mission. 
              elseif _options.awacs then
                _CreateAwacsMission(_options, Event)
              elseif _options.cap then
              
              end
          end
        end
      end -- End Support Request
      --#endregion
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
    --info(id.."S_EVENT_MARK_ADDED")
  elseif Event.id == world.event.S_EVENT_MARK_CHANGE then
    --info(id.."S_EVENT_MARK_CHANGE")
  elseif Event.id == world.event.S_EVENT_MARK_REMOVED then
    --info(id.."S_EVENT_MARK_REMOVED")    
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
