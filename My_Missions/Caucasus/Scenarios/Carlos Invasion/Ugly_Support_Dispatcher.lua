-- Goal
-- Request support via F10 MapMarker
-- If map markers are persisted and re-created at mission start via creation method, keep in mind to do this after
-- loading everything else like Ugly-Support-Dispatcher AND after initializing the airwings.

-- Example for request
-- "USD, Tanker Boom, Alt 24000, Speed 350, Heading 030, Leg 15"
-- "USD, Tanker Boom, Alt 24000, Speed 350, Heading 030, Start 1300, End 1400"

-- @field #Support Dispatcher Table
uglySupportDispatcher = {
    className = "Ugly Support Dispatcher",
    version ="0.1",
    id = "UglySupportDispatcher", --- Identifier. All output in DCS.log will start with this.

    keyphrase ="usd",
    keyphraseAltitude = "alt",
    keyphraseSpeed = "speed",
    keyphraseHeading = "heading",

    keyphraseTanker = "tanker",
    keyphraseBoom = "boom",
    keyphraseBasket ="basket",
    keyphraseTimeStart = "start",
    keyphraseTimeEnd = "end",
    keyphraseLeg     = "leg",

    tankerDefaultSpeed      = 400,
    tankerDefaultAlt        = 18000,
    tankerDefaultHeading    = 0,
    tankerDefaultType       = "boom",
    tankerDefaultLeg        = 15,

    debug = true,

    --- Der ganze Bumms hier drunter ist Objektspezifisch, muss also instanziiert werden...wie?
    airwing = AWIncirlik -- Hier muss der Airwing zugewiesen werden. Im Idealfall übergibt man eine 
    -- Ganze Liste an Airwings.
}

-- Version info.
env.info(uglySupportDispatcher.id..string.format("Loading version %s", uglySupportDispatcher.version))

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Event handler.
-------------------------------------------------------------------------------------------------------------------------------------------------------------

--- Event handler.
uglySupportDispatcher.eventHandler={}

--- Handle world events.
function uglySupportDispatcher.eventHandler:onEvent(Event)

  -- Only interested in S_EVENT_MARK_*
  if Event == nil or Event.idx == nil then
    return true
  end

  -- Debug output.
  if Event.id     == world.event.S_EVENT_MARK_ADDED then
    uglySupportDispatcher.info(uglySupportDispatcher.id.."S_EVENT_MARK_ADDED")
  elseif Event.id == world.event.S_EVENT_MARK_CHANGE then
    uglySupportDispatcher.info(uglySupportDispatcher.id.."S_EVENT_MARK_CHANGE")
  elseif Event.id == world.event.S_EVENT_MARK_REMOVED then
    uglySupportDispatcher.info(uglySupportDispatcher.id.."S_EVENT_MARK_REMOVED")    
  end
  uglySupportDispatcher.info(string.format("Event id        = %s", tostring(Event.id)))
  uglySupportDispatcher.info(string.format("Event time      = %s", tostring(Event.time)))
  uglySupportDispatcher.info(string.format("Event idx       = %s", tostring(Event.idx)))
  uglySupportDispatcher.info(string.format("Event coalition = %s", tostring(Event.coalition)))
  uglySupportDispatcher.info(string.format("Event group id  = %s", tostring(Event.groupID)))
  uglySupportDispatcher.info(string.format("Event pos X     = %s", tostring(Event.pos.x)))
  uglySupportDispatcher.info(string.format("Event pos Y     = %s", tostring(Event.pos.y)))
  uglySupportDispatcher.info(string.format("Event pos Z     = %s", tostring(Event.pos.z)))
  if Event.initiator~=nil then
    local _unitname=Event.initiator:getName()
    uglySupportDispatcher.info(string.format("Event ini unit  = %s", tostring(_unitname)))
  end
  uglySupportDispatcher.info(string.format("Event text      = \n%s", tostring(Event.text)))
  

  -- Call event function when a marker has changed, i.e. text was entered or changed.
  if Event.id==world.event.S_EVENT_MARK_CHANGE then
    uglySupportDispatcher._OnEventMarkChange(Event)
  end

end 

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Event handler functions.
------------------------------------------------------------------------------------------------------------------------------------------------------------- 

function uglySupportDispatcher._OnEventMarkChange(Event)
    -- If the event contains "Tanker Keyphrase", so player requests a tanker (Boom or basket decided later)
    if Event.text~=nil and Event.text:lower():find(uglySupportDispatcher.keyphrase) then
        uglySupportDispatcher.info(uglySupportDispatcher.id..string.format("USD Tag found.")) -- debug

        -- First step, get position
        vec3    =   {x=Event.pos.x, y=Event.pos.y, z=Event.pos.z}

        -- Analyse the mark point text and extract the keywords to define the task related stuff
        local _options=uglySupportDispatcher._MarkTextAnalysis(Event.text)

        --#region Tanker
        if _options.tankerType then -- If a tankerType is set, check which tanker we want to spawn
            --AUFTRAG:NewTANKER(Coordinate, Altitude, Speed, Heading, Leg, RefuelSystem)
            local _coordinate = COORDINATE:New(Event.pos.x, Event.pos.y, Event.pos.z)
            local _altitude = uglySupportDispatcher.tankerDefaultAlt
            local _speed = uglySupportDispatcher.tankerDefaultSpeed
            local _heading = uglySupportDispatcher.tankerDefaultHeading
            local _leg = uglySupportDispatcher.tankerDefaultLeg
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
            if _options.tankerType:find("boom") then
                _type = 0
            elseif _options.tankerType:find("basket") then
                _type = 1
            end
            uglySupportDispatcher.info(uglySupportDispatcher.id..string.format(" Creating tanker task with type:\n%s", _options.tankerType)) -- debug
   
            local missionTanker = AUFTRAG:NewTANKER(_coordinate, _altitude, _speed, _heading, _leg, _type)
            
            if missionTanker then
                -- Remove Mark to avoid creating multiple missions
                uglySupportDispatcher.info(uglySupportDispatcher.id..string.format(" Deleting marker with EventID:\n%s", Event.idx)) -- debug
                trigger.action.removeMark(Event.idx)
                
                -- Create new marker here with all the information about the AUFTRAG. ID?
                -- TODO
                local markOfTasking = MARKER:New(_coordinate, "Tanker tasking started."):ToAll() -- Diesen Marker muss man nun mit dem Auftrag mappen.
            end
            missionTanker:SetTACAN(41, "ARC")
            missionTanker:SetRadio(141)
            missionTanker:SetRepeat(99)
            missionTanker:SetRequiredEscorts(1, 2)
            uglySupportDispatcher.airwing:AddMission(missionTanker)

            
        end
        --#endregion
    end
end


-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Analyse the mark text and extract keywords.
------------------------------------------------------------------------------------------------------------------------------------------------------------- 

--- Extract keywords from mark text.
function uglySupportDispatcher._MarkTextAnalysis(text)
    local switch={} -- Option parameters extracted from the mark text.
    
    uglySupportDispatcher.info(uglySupportDispatcher.id..string.format("MarkTextAnalysis text:\n%s", text)) -- debug
    --if text:lower():find(uglySupportDispatcher.keyphrase) then -- check if USD is affected

        local keywords=uglySupportDispatcher._split(text, ",")

        for _,keyphrase in pairs(keywords) do

          -- Split keyphrase by space. First one is the key and second, ... the parameter(s) until the next comma.
          local str=uglySupportDispatcher._split(keyphrase, " ")
          local key=str[1]
          local val=str[2]
          
          uglySupportDispatcher.info(uglySupportDispatcher.id..string.format("key:\n%s", key)) -- debug

          if key:lower():find(uglySupportDispatcher.keyphraseTanker) then
            if (val:lower():find("boom")) then
                switch.tankerType = val:lower()
                uglySupportDispatcher.info(uglySupportDispatcher.id..string.format(" Value tankerType = %s", switch.tankerType))
            elseif (val:lower():find("basket")) then
                switch.tankerType = val:lower()
                uglySupportDispatcher.info(uglySupportDispatcher.id..string.format(" Value tankerType = %s", switch.tankerType))
            else
                uglySupportDispatcher.info(uglySupportDispatcher.id.." Value tankerType is invalid! Use Boom or Basket!")
            end
          end

          if key:lower():find(uglySupportDispatcher.keyphraseAltitude) then
            switch.altitude = tonumber(val)
            uglySupportDispatcher.info(uglySupportDispatcher.id..string.format(" Value alt = %s", switch.altitude))
          end

          if key:lower():find(uglySupportDispatcher.keyphraseSpeed) then
            switch.speed = tonumber(val)
            uglySupportDispatcher.info(uglySupportDispatcher.id..string.format(" Value speed = %s", switch.speed))
          end

          if key:lower():find(uglySupportDispatcher.keyphraseHeading) then
            switch.heading = tonumber(val)
            uglySupportDispatcher.info(uglySupportDispatcher.id..string.format(" Value heading = %s", switch.heading))
          end

          if key:lower():find(uglySupportDispatcher.keyphraseTimeStart) then
            switch.timeStart = tonumber(val)
            uglySupportDispatcher.info(uglySupportDispatcher.id..string.format(" Value timeStart = %s", switch.timeStart))
          end

          if key:lower():find(uglySupportDispatcher.keyphraseTimeEnd) then
            switch.timeEnd = tonumber(val)
            uglySupportDispatcher.info(uglySupportDispatcher.id..string.format(" Value timeEnd = %s", switch.timeEnd))
          end

          if key:lower():find(uglySupportDispatcher.keyphraseLeg) then
            switch.leg = tonumber(val)
            uglySupportDispatcher.info(uglySupportDispatcher.id..string.format(" Value leg = %s", switch.leg))
          end

          
        end

    return switch
end

--- Debug output to dcs.log file.
function uglySupportDispatcher.info(text)
  if uglySupportDispatcher.debug then
    env.info(text)
  end
end

--- Split string. C.f. http://stackoverflow.com/questions/1426954/split-string-in-lua
function uglySupportDispatcher._split(str, sep)
  local result = {}
  local regex = ("([^%s]+)"):format(sep)
  for each in str:gmatch(regex) do
    table.insert(result, each)
  end
  return result
end

world.addEventHandler(uglySupportDispatcher.eventHandler)