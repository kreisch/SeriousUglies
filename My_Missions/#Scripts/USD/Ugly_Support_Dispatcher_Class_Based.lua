-- Goal
-- Request support via F10 MapMarker
-- If map markers are persisted and re-created at mission start via creation method, keep in mind to do this after
-- loading everything else like Ugly-Support-Dispatcher AND after initializing the airwings.

-- Example for request
-- "USD, Tanker Boom, Alt 24000, Speed 350, Heading 030, Leg 15"
-- "USD, Tanker Boom, Alt 24000, Speed 350, Heading 030, Start 1300, End 1400"

--- Umstellen:
-- Wenn eine Instanz des USDs erstellt wird, muss ein Airwing angegeben werden, sowie der Typ des Supports (Tanker, Awacs, CAS,...)
-- Die spezifische USD-Instanz hört dann entsprechend auf die Keywords für diesen Support-Type, oder nicht.
-- Vorteil: Man muss zur Laufzeit des USDs nicht differenzieren, ob der Airwing Tanker enthält oder nicht, das ist Aufgabe des Missions-Erstellers.
-- 
-- 
-- --- USD class.
-- @type USD
-- @field #string className Name of the class.
-- @field #string version Version of the class.
-- @field #airwing Airwing the support will be required of.
-- @field #boolean hasTanker Tankers are available in the airwing.
-- @field #boolean hasCAS CAS is available in the airwing.
-- @field #boolean hasHeloCombat CombatHelos are available in the airwing.
-- @field #boolean hasHeloTransport TransportHelos are available in the airwing.
-- @field #boolean hasSEAD Sead is available in the airwing.
-- 
-- @field #USD
USD = {
  className     = "Ugly Support Dispatcher",
  version       = "0.1",
  id            = "USD", --- Identifier. All output in DCS.log will start with this.
  debug         = true,
  eventHandler  = {}, --- Event handler.

  keyphrase             ="usd",  -- Global keyword for USD instance to react
  
  keyphraseAltitude     = "alt",
  keyphraseSpeed        = "speed",
  keyphraseHeading      = "heading",
  keyphraseBoom         = "boom",
  keyphraseBasket       = "basket",
  keyphraseTimeStart    = "start",
  keyphraseTimeEnd      = "end",
  keyphraseLeg          = "leg",
  keyphraseTanker       = "tanker",
  
  tankerDefaultSpeed      = 400,
  tankerDefaultAlt        = 18000,
  tankerDefaultHeading    = 0,
  tankerDefaultType       = "boom",
  tankerDefaultLeg        = 15,

  -- Everything below is specific for instance
  airwing           = nil,
  hasTanker         = false,
  hasCAS            = false,
  hasHeloCombat     = false,
  hasHeloTransport  = false,
  hasSEAD           = false,
}

function USD:New(airwing, hasTanker, hasCAS, hasHeloCombat, hasHeloTransport, hasSEAD)
  -- Version info.
  env.info(self.id..string.format("Loading version %s", self.version))
  
  
  self.airwing          = airwing
  self.hasTanker        = hasTanker or false
  self.hasCAS           = hasCAS or false
  self.hasHeloCombat    = hasHeloCombat or false
  self.hasHeloTransport = hasHeloTransport or false
  self.hasSEAD          = hasSEAD or false
  
  self:info("Constructor done. Airwing is " .. self.airwing.airbasename .. "Tankers are ".. tostring(hasTanker))
  
  
-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Event handler.
-------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Handle world events.
function self.eventHandler:onEvent(Event)

-- Only interested in S_EVENT_MARK_*
if Event == nil or Event.idx == nil then
  return true
end

-- Debug output.
if Event.id     == world.event.S_EVENT_MARK_ADDED then
  USD:info(USD.id.."S_EVENT_MARK_ADDED")
elseif Event.id == world.event.S_EVENT_MARK_CHANGE then
  USD:info(USD.id.."S_EVENT_MARK_CHANGE")
elseif Event.id == world.event.S_EVENT_MARK_REMOVED then
  USD:info(USD.id.."S_EVENT_MARK_REMOVED")    
end
USD:info(string.format("Event id        = %s", tostring(Event.id)))
USD:info(string.format("Event time      = %s", tostring(Event.time)))
USD:info(string.format("Event idx       = %s", tostring(Event.idx)))
USD:info(string.format("Event coalition = %s", tostring(Event.coalition)))
USD:info(string.format("Event group id  = %s", tostring(Event.groupID)))
USD:info(string.format("Event pos X     = %s", tostring(Event.pos.x)))
USD:info(string.format("Event pos Y     = %s", tostring(Event.pos.y)))
USD:info(string.format("Event pos Z     = %s", tostring(Event.pos.z)))
if Event.initiator~=nil then
  local _unitname=Event.initiator:getName()
  USD:info(string.format("Event ini unit  = %s", tostring(_unitname)))
end
USD:info(string.format("Event text      = \n%s", tostring(Event.text)))


-- Call event function when a marker has changed, i.e. text was entered or changed.
if Event.id==world.event.S_EVENT_MARK_CHANGE then
  USD:_OnEventMarkChange(Event)
end

end 

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Event handler functions.
------------------------------------------------------------------------------------------------------------------------------------------------------------- 

function USD:_OnEventMarkChange(Event)
  -- If the event contains "Tanker Keyphrase", so player requests a tanker (Boom or basket decided later)
  if Event.text~=nil and Event.text:lower():find(USD.keyphrase) then
      env.info(USD.id..string.format("OnEvent Change Mark fired.")) -- debug
      env.info(string.format("Event id        = %s", tostring(Event.id)))
      env.info(string.format("Event text        = %s", tostring(Event.text)))
--      USD:info(string.format("Event time      = %s", tostring(Event.time)))
--      USD:info(string.format("Event idx       = %s", tostring(Event.idx)))
--      USD:info(string.format("Event coalition = %s", tostring(Event.coalition)))
--      USD:info(string.format("Event group id  = %s", tostring(Event.groupID)))
--      USD:info(string.format("Event pos X     = %s", tostring(Event.pos.x)))
--      USD:info(string.format("Event pos Y     = %s", tostring(Event.pos.y)))
--      USD:info(string.format("Event pos Z     = %s", tostring(Event.pos.z)))

      -- First step, get position
      vec3    =   {x=Event.pos.x, y=Event.pos.y, z=Event.pos.z}

      -- Analyse the mark point text and extract the keywords to define the task related stuff
      local _options=USD:_MarkTextAnalysis(Event.text)

      --#region Tanker
      if _options.tankerType then -- If a tankerType is set, check which tanker we want to spawn
          --AUFTRAG:NewTANKER(Coordinate, Altitude, Speed, Heading, Leg, RefuelSystem)
          local _coordinate = COORDINATE:New(Event.pos.x, Event.pos.y, Event.pos.z)
          local _altitude = USD.tankerDefaultAlt
          local _speed = USD.tankerDefaultSpeed
          local _heading = USD.tankerDefaultHeading
          local _leg = USD.tankerDefaultLeg
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
          if self.hasTanker then
          USD:info(self.id..string.format(" Creating tanker task with type:\n%s", _options.tankerType)) -- debug
            local missionTanker = AUFTRAG:NewTANKER(_coordinate, _altitude, _speed, _heading, _leg, _type)
            
            if missionTanker then
                -- Remove Mark to avoid creating multiple missions
                USD:info(self.id..string.format(" Deleting marker with EventID:\n%s", Event.idx)) -- debug
                trigger.action.removeMark(Event.idx)
                
                -- Create new marker here with all the information about the AUFTRAG. ID?
                -- TODO
                local markOfTasking = MARKER:New(_coordinate, "Tanker tasking started. Dispatched from " .. self.airwing.airbasename):ToAll() -- Diesen Marker muss man nun mit dem Auftrag mappen.
            end
            missionTanker:SetTACAN(41, "ARC")
            missionTanker:SetRadio(141)
            missionTanker:SetRepeat(99)
            missionTanker:SetRequiredEscorts(1, 2)
            self.airwing:AddMission(missionTanker)
          end 

          
      end
      --#endregion
  end
end

  
  
  world.addEventHandler(self.eventHandler)
  return self
end



-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Analyse the mark text and extract keywords.
------------------------------------------------------------------------------------------------------------------------------------------------------------- 

--- Extract keywords from mark text.
function USD:_MarkTextAnalysis(text)
  local switch={} -- Option parameters extracted from the mark text.
  env.info("text is " .. text)
  USD:info(USD.id..string.format("MarkTextAnalysis text:\n%s", text)) -- debug
  --if text:lower():find(USD.keyphrase) then -- check if USD is affected

      local keywords=self:_split(text, ",")

      for _,keyphrase in pairs(keywords) do

        -- Split keyphrase by space. First one is the key and second, ... the parameter(s) until the next comma.
        local str=self:_split(keyphrase, " ")
        local key=str[1]
        local val=str[2]
        
        self:info(self.id..string.format("key:\n%s", key)) -- debug

        if key:lower():find(USD.keyphraseTanker) then
          if (val:lower():find("boom")) then
              switch.tankerType = val:lower()
              self:info(self.id..string.format(" Value tankerType = %s", switch.tankerType))
          elseif (val:lower():find("basket")) then
              switch.tankerType = val:lower()
              self:info(self.id..string.format(" Value tankerType = %s", switch.tankerType))
          else
              self:info(self.id.." Value tankerType is invalid! Use Boom or Basket!")
          end
        end

        if key:lower():find(self.keyphraseAltitude) then
          switch.altitude = tonumber(val)
          USD:info(USD.id..string.format(" Value alt = %s", switch.altitude))
        end

        if key:lower():find(self.keyphraseSpeed) then
          switch.speed = tonumber(val)
          USD:info(USD.id..string.format(" Value speed = %s", switch.speed))
        end

        if key:lower():find(self.keyphraseHeading) then
          switch.heading = tonumber(val)
          USD:info(USD.id..string.format(" Value heading = %s", switch.heading))
        end

        if key:lower():find(self.keyphraseTimeStart) then
          switch.timeStart = tonumber(val)
          USD:info(USD.id..string.format(" Value timeStart = %s", switch.timeStart))
        end

        if key:lower():find(self.keyphraseTimeEnd) then
          switch.timeEnd = tonumber(val)
          USD:info(USD.id..string.format(" Value timeEnd = %s", switch.timeEnd))
        end

        if key:lower():find(self.keyphraseLeg) then
          switch.leg = tonumber(val)
          USD:info(USD.id..string.format(" Value leg = %s", switch.leg))
        end

        
      end

  return switch
end

--- Debug output to dcs.log file.
function USD:info(text)
if self.debug then
  env.info(text)
end
end

--- Split string. C.f. http://stackoverflow.com/questions/1426954/split-string-in-lua
function USD:_split(str, sep)
local result = {}
local regex = ("([^%s]+)"):format(sep)
for each in str:gmatch(regex) do
  table.insert(result, each)
end
return result
end

local testUSD = USD:New(AWIncirlik,true,false,false,false,false)

env.info("USD was loaded")
