-- Goal
-- Request support via F10 MapMarker
-- If map markers are persisted and re-created at mission start via creation method, keep in mind to do this after
-- loading everything else like Ugly-Support-Dispatcher AND after initializing the airwings.

-- Example for request
-- "USD, Tanker Boom, Alt 24000, Speed 350, Heading 030, Leg 15"
-- "USD, Tanker Boom, Alt 24000, Speed 350, Heading 030, Start 1300, End 1400"



  local className = "Ugly Support Dispatcher"
  local version ="0.2"
  local id = "USD" --- Identifier. All output in DCS.log will start with this.

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
  local keyphraseBasketBig  = "basketbig"
  local keyphraseTimeStart  = "start"
  local keyphraseTimeEnd    = "end"
  local keyphraseLeg        = "leg"

  local tankerDefaultSpeed      = 400
  local tankerDefaultAlt        = 18000
  local tankerDefaultHeading    = 0
  local tankerDefaultType       = "boom"
  local tankerDefaultLeg        = 15

  local debug = true
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


-- Version info.
env.info(id..string.format("Loading version %s", version))


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

--- Event handler.
local eventHandlerUSD={}



-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Analyse the mark text and extract keywords.
------------------------------------------------------------------------------------------------------------------------------------------------------------- 

--- Extract keywords from mark text.
local function _MarkTextAnalysis(text)
  local switch={} -- Option parameters extracted from the mark text.
  
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

        if key:lower():find(keyphraseTimeStart) then
          switch.timeStart = tonumber(val)
          info(id..string.format(" Value timeStart = %s", switch.timeStart))
        end

        if key:lower():find(keyphraseTimeEnd) then
          switch.timeEnd = tonumber(val)
          info(id..string.format(" Value timeEnd = %s", switch.timeEnd))
        end

        if key:lower():find(keyphraseLeg) then
          switch.leg = tonumber(val)
          info(id..string.format(" Value leg = %s", switch.leg))
        end
        
        if key:lower():find(keyphraseAWACS) then
        switch.awacs = true
        info(id..string.format(" Value awacs = %s", tostring(switch.awacs)))
        end

        
      end

  return switch
end


local function selectNearestAirwing(capableAirwings, Event) -- Selects the airfield closes to the EventMarker which can provide the requested Support
  info("Select Nearest Airwings Capable to support.")
  local _capableAirwings = capableAirwings
  local airwing = nil
    for key in _capableAirwings do
        -- Bestimme Distanz zum Marker
    end
  return airwing
end


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

local function errorMarkerNoValidSupportRequested(Event)
     info(id..string.format(" Deleting marker with EventID:\n%s", Event.idx)) -- debug
     trigger.action.removeMark(Event.idx)
     local _coordinate = COORDINATE:New(Event.pos.x, Event.pos.y, Event.pos.z) -- Coordinate of F10Marker
     MARKER:New(_coordinate, "No valid support type was requested. Please check."):ToAll()
end

local function _CreateTankerMission(_options, Event)

            local _coordinate = COORDINATE:New(Event.pos.x, Event.pos.y, Event.pos.z) -- Coordinate of F10Marker
            local _altitude = tankerDefaultAlt    -- Default values for a tanker, used when nothing specified in marker
            local _speed = tankerDefaultSpeed
            local _heading = tankerDefaultHeading
            local _leg = tankerDefaultLeg
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
            if _options.tankerType then
              if _options.tankerType:find("boom") then
                  _type = 0
              elseif _options.tankerType:find("basket") then
                  _type = 1
              end
            end
            info(id..string.format(" Creating tanker task with type:\n%s", _type)) -- debug
   
            local missionTanker = AUFTRAG:NewTANKER(_coordinate, _altitude, _speed, _heading, _leg, _type)
            
            if missionTanker then
                -- Remove Mark to avoid creating multiple missions
                info(id..string.format(" Deleting marker with EventID:\n%s", Event.idx)) -- debug
                trigger.action.removeMark(Event.idx)
                

                local markOfTasking = MARKER:New(_coordinate, "Tanker tasking started."):ToAll() -- Diesen Marker muss man nun mit dem Auftrag mappen.
            end
            missionTanker:SetTACAN(41, "ARC")
            missionTanker:SetRadio(141)
            missionTanker:SetRepeat(99)
            missionTanker:SetRequiredEscorts(1, 2)
            airwing:AddMission(missionTanker)
end

-- Checks which Support is requested by an F10 MapMarker and returns the value as string.
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
-- Event handler functions.
------------------------------------------------------------------------------------------------------------------------------------------------------------- 

local function _OnEventMarkChange(Event)
  -- If the event contains "Tanker Keyphrase", so player requests a tanker (Boom or basket decided later)
  if Event.text~=nil and Event.text:lower():find(keyphrase) then
      info(id..string.format("USD Tag found.")) -- debug
      local _options=_MarkTextAnalysis(Event.text)
      
      local _requestedSupportType = _determineSupportType(_options, Event)
      
      
      -- We know which type of support is requested, now find an airwing capable of.
      local _selectedAirwing = provideAirwingsCapableToSupport(_requestedSupportType, Event)
      
      
      if (_selectedAirwing ~=nil) then -- If we have found an airwing, we can check which mission to create depending on support type.
        if _options.tankerType then
          _CreateTankerMission(_options, Event) -- if ~= nil, create a mission. 
         end 
      end
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
    info(id.."S_EVENT_MARK_ADDED")
  elseif Event.id == world.event.S_EVENT_MARK_CHANGE then
    info(id.."S_EVENT_MARK_CHANGE")
  elseif Event.id == world.event.S_EVENT_MARK_REMOVED then
    info(id.."S_EVENT_MARK_REMOVED")    
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
