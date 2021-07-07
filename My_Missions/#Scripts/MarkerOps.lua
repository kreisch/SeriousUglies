--- **Ops** - Marker Ops.
--
-- **Main Features:**
--
--    * Spawn an Awacs or Tanker.
--    * Let them fly to a F10 position on the map.
--    * Or RTB.
--    * Keyword "tanker" or "awacs" in marker comment to move.
--    * Keywords "tanker rtb" or "awacs rtb" to RTB the planes.
--    * Use a tag to run > 1 class of same type.
--
-- ===
--
-- ### Author: **Applevangelist**
-- @module Ops.MarkerOps
-- @image Wrapper_Marker.png
-- 


--- MARKEROPS class.
-- @type MARKEROPS
-- @field #string ClassName Name of the class.
-- @field #number TankerTacan TACAN channel (X) to be used.
-- @field #number Radio Radio Channel (AM) to be used.
-- @field #string Template Template name to be used.
-- @field #number Alt Altitude in ft MSL.
-- @field #number Speed Desired speed in knots - will be IAS height adjusted.
-- @field #string AirbaseName Name of the Homebase for RTB.
-- @field Core.Point#COORDINATE InitialHold Coordinate to go to after spawn.
-- @field Ops.FlightGroup#FLIGHTGROUP TankerID FlightGroup object of the tanker.
-- @field Ops.FlightGroup#FLIGHTGROUP AwacsID FlightGroup object of the AWACS.
-- @field #number Heading Heading for the racetrack orbit in degrees.
-- @field #number Leg Leg of the racetrack orbit in NM.
-- @field #number TankerType Type of tanker, 1=basket, 0=probe. Hint - if your tanker isn't starting change this.
-- @field #string Type Type of #MARKEROPS to run, either "Tanker" or "AWACS"
-- @field #string Tag Tag for this #MARKEROPS to address > 1 running classes of the same type. Default is the template name.
-- @field #boolean TagOnly If set to true, ignore generic "Tanker" and "Awacs" tags for position changes and use Tag only. Useful if running multiple classes in parallel.
-- @field #boolean verbose Enable debug output.
-- @extends Core.Base#BASE

--------------------------------------------------------------------------
-- MARKEROPS Class Definition.
--------------------------------------------------------------------------

---
--
-- @field #MARKEROPS
MARKEROPS = {
  ClassName = "MarkerOps", 
  TankerTacan = 0, -- #number
  Radio = 0, -- #number
  Template = "", -- #string
  Alt = 0, -- #number in feet
  Speed = 0, -- #number knots IAS height adjusted
  AirbaseName = "", -- #string
  InitialHold = nil, -- Core.Point#COORDINATE
  TankerID = nil, -- Ops.FlightGroup#FLIGHTGROUP
  AwacsID = nil, -- Ops.FlightGroup#FLIGHTGROUP
  Heading = 90, -- #number
  Leg = 20, -- #number
  TankerType = 1, -- #number
  Type = "", -- #string
  verbose = false, -- #boolean
  Tag = "", -- #string
  TagOnly = false, -- #boolean
  version = "0.0.2", -- #string
}

--- Instantiate a new MARKEROPS Object
-- @param #MARKEROPS self
-- @param #string Type Type of this #MARKEROPS, e.g. "Tanker" or "AWACS".
-- @param #string Template Mission editor template group name.
-- @param #number Tacan (Tanker) Number or Tacan channel.
-- @param #number Radio Number of AM Radio channel to use.
-- @param #number Altitude ASL altitude.
-- @param #number Speed Airspeed in knots. Will be IAS height adjusted.
-- @param #string AirbaseName Name of the home airbase.
-- @param #string ZoneName Name of the initial holding zone.
-- @param #number Heading Number - Heading of the flight, e.g. 0 = North.
-- @param #number Leg Leg of the flight in NM.
-- @param #number TankerType Refuel system, i.e. 1 = Basket, 0 = Probe.
-- @return #MARKEROPS self
function MARKEROPS:New(Type,Template,Tacan,Radio,Altitude,Speed,AirbaseName,ZoneName,Heading,Leg,TankerType)
  -- Inherit BASE
  local self=BASE:Inherit(self, BASE:New()) -- #MARKEROPS
  
  -- Set some string id for output to DCS.log file.
  self.lid=string.format("MARKEROPS %s | ", tostring(self.version))
  
  self.Type = Type
  if Type == "Tanker" then
    self.TankerTacan = Tacan or 44
    self.Template = Template or "Tanker"
    self.TankerType = TankerType or 1 -- Basket, change to 0 for Probe
    self.CallSign = CALLSIGN.Tanker.Texaco
    self.TankerID = nil
  elseif Type == "AWACS" then
    self.Template = Template or "Awacs"
    self.CallSign = CALLSIGN.AWACS.Wizard
    self.AwacsID = nil
  else
    self:E(self.lid.."Unknown OPS Type - Choose Tanker or AWACS")
    return nil
  end
  
  local zonename = ZoneName or "Initial Hold"
  self.InitialHold = ZONE:New(zonename):GetCoordinate() -- Initial Holding Point
  self.AirbaseName = AirbaseName or "Truman" -- UNIT Name
  self.Alt = Altitude or 18000 -- in feet
  self.Speed = Speed or 200 -- knots IAS height adjusted
  self.Radio = Radio or 243
  self.Heading = Heading or 90
  self.Leg = Leg or 15
  self.Tag = Template or "Whatever"
  --world.addEventHandler(self)
  self:HandleEvent(EVENTS.MarkAdded, self.OnEventMark)
  self:HandleEvent(EVENTS.MarkChange, self.OnEventMark)
  --elf:HandleEvent(EVENTS.MarkRemoved)
  self:I(self.lid..string.format("started for %s",self.Template))
  if Type == "Tanker" then
    self:_CallATanker()
  elseif Type == "AWACS" then
    self:_CallAnAwacs()
  end
  return self
end

--- (internal) Match keywords
-- @param #MARKEROPS self
-- @return #boolean
function MARKEROPS:_TagAndMatch(Eventtext, Tag)
  local matches = false
  local type = self.Type -- #string
  local TagOnly = self.TagOnly --#boolean
  if TagOnly then
    if string.find(string.lower(Eventtext),Tag) then
      matches = true --event text contains tag
    end
  else
    if (string.find(string.lower(Eventtext),string.lower(type)) or string.find(string.lower(Eventtext),Tag)) then
      matches = true --event text contains type or tag
    end
  end
  return matches
end

--- (internal) Action events details.
-- @param #MARKEROPS self
function MARKEROPS:_HandleEvent(Event)

  local text = ""
  local fortanker = false
  local forawacs = false
  local Eventtext = Event.text or ""
  --position
  local vec3={y=Event.pos.y, x=Event.pos.x, z=Event.pos.z}
  local _coord=COORDINATE:NewFromVec3(vec3)
  local coordtext = _coord:ToStringLLDDM()
  local Flight = nil
  -- handle awacs
  local Tag = string.lower(self.Tag)
  if self:_TagAndMatch(Eventtext, Tag) and self.Type == "AWACS" then
  
    text = string.format("Event Mark Added for Awacs: %s", Event.text or "(empty)")
    forawacs = true
    Flight = self.AwacsID 
    local text = text .. string.format(" at position %s", coordtext)
    local m = MESSAGE:New(text,10,"Info"):ToAllIf(self.verbose)
    self:I(self.lid..text)

  -- handle tanker  
  elseif self:_TagAndMatch(Eventtext, Tag) and self.Type == "Tanker" then
  
    text = string.format("Event Mark Added for Tanker: %s", Event.text or "(empty)")
    fortanker = true
    Flight = self.TankerID
    local text = text .. string.format(" at position %s", coordtext)
    local m = MESSAGE:New(text,10,"Info"):ToAllIf(self.verbose)
    self:I(self.lid..text)

  end
  
  if (fortanker or forawacs) and (Flight ~= nil) then
    -- Get FlightGroup and Mission

    local Mission = Flight:GetMissionCurrent() -- Ops.Auftrag#AUFTRAG
    local MissionType = Mission:GetType() -- #string
    local name = Flight:GetName()
    local text = string.format("Marker is for %s on mission type %s", name, MissionType)
    local m = MESSAGE:New(text,15,"Info"):ToAllIf(self.verbose)
    if Mission:IsNotOver() then
      Mission:Cancel()
    end
    -- check RTB
    if string.find(string.lower(Eventtext),"rtb") then
      local AFBName = self.AirbaseName
      local AFB = AIRBASE:FindByName(AFBName)
      Flight:RTB(AFB)
    else
      -- Get New Mission
      local NewMission = nil
      if forawacs then
        NewMission = AUFTRAG:NewAWACS(_coord,self.Alt,UTILS.KnotsToAltKIAS(self.Speed,self.Alt),self.Heading,self.Leg)
      else
        NewMission = AUFTRAG:NewTANKER(_coord,self.Alt,UTILS.KnotsToAltKIAS(self.Speed,self.Alt),self.Heading,self.Leg,self.TankerType)
      end
      -- Add
      Flight:AddMission(NewMission)
    end
  end
end

--- (internal) Handle events.
-- @param #MARKEROPS self
function MARKEROPS:OnEventMark(Event)

    if Event == nil or Event.idx == nil then
      self:E("Skipping onEvent. Event or Event.idx unknown.")
      return true
    end
    
    if Event.id==world.event.S_EVENT_MARK_ADDED then
      self:T({event="S_EVENT_MARK_ADDED", carrier=self.groupname, vec3=Event.pos})
      -- Handle event
      local Eventtext = tostring(Event.text)
      if Eventtext~=nil then
        self:_HandleEvent(Event)
      end
    elseif Event.id==world.event.S_EVENT_MARK_CHANGE then
      self:T({event="S_EVENT_MARK_CHANGE", carrier=self.groupname, vec3=Event.pos})
      -- Handle event.
      local Eventtext = tostring(Event.text)
      if Eventtext~=nil then
        self:_HandleEvent(Event)
      end    
    elseif Event.id==world.event.S_EVENT_MARK_REMOVED then
      self:T({event="S_EVENT_MARK_REMOVED", carrier=self.groupname, vec3=Event.pos})
      -- Hande event. No action yet.
    end
end

--- (internal) Call a new Tanker.
-- @param #MARKEROPS self
function MARKEROPS:_CallATanker()
  local template = self.Template
  local tanker = GROUP:FindByName(template)
  if tanker then
    if tanker:IsAlive() and tanker:IsActive() then
      -- nothing to do
      local m = MESSAGE:New("Tanker is already in the air",10,"Info"):ToAllIf(self.verbose)
    else
      -- need a new one
      local tankergroup = FLIGHTGROUP:New(self.Template)
      tankergroup:SetHomebase(AIRBASE:FindByName(self.AirbaseName))
      tankergroup:SetDefaultRadio(self.Radio,"AM",false)
      tankergroup:SetDespawnAfterLanding()
      --tankergroup:SetDefaultTACAN(self.TankerTacan,"TKR",UnitName,"X",false)
      tankergroup:SwitchTACAN(self.TankerTacan, "TKR", 1, "X")
      tankergroup:SetDefaultCallsign(self.CallSign,1)
      -- Mission
      local TankerAuftrag = AUFTRAG:NewTANKER(self.InitialHold,self.Alt,UTILS.KnotsToAltKIAS(self.Speed,self.Alt),self.Heading,self.Leg,self.TankerType)
      TankerAuftrag:SetMissionRange(500)
      tankergroup:AddMission(TankerAuftrag)
      self.TankerID = tankergroup
      self:I(self.lid.."Tanker group started")
    end
  end
end

--- (internal) Call a new AWACS.
-- @param #MARKEROPS self
function MARKEROPS:_CallAnAwacs()
  local template = self.Template
  local awacs = GROUP:FindByName(template)
  if awacs then
    if awacs:IsAlive() and awacs:IsActive() then
      -- nothing to do
      local m = MESSAGE:New("Awacs is already in the air",10,"Info"):ToAllIf(self.verbose)
    else
      -- need a new one
      local awacsgroup = FLIGHTGROUP:New(self.Template)
      awacsgroup:SetHomebase(AIRBASE:FindByName(self.AirbaseName))
      awacsgroup:SetDefaultRadio(self.Radio,"AM",false)
      awacsgroup:SetDespawnAfterLanding()
      --awacsgroup:SetDefaultTACAN(TankerTacan,"TKR",UnitName,"X",false)
      awacsgroup:SetDefaultCallsign(self.CallSign,1)
      local AwacsAuftrag = AUFTRAG:NewAWACS(self.InitialHold,self.Alt,UTILS.KnotsToAltKIAS(self.Speed,self.Alt),self.Heading,self.Leg)
      AwacsAuftrag:SetMissionRange(500)
      awacsgroup:AddMission(AwacsAuftrag)
      self.AwacsID = awacsgroup
      self:I(self.lid.."AWACS group started")
    end
  end
end

--- Set a tag for this #MARKEROPS.
-- @param #MARKEROPS self
-- @param #string Tag Tag name.
-- @param #boolean TagOnly Use only tag to identify action.
-- @return #MARKEROPS self 
function MARKEROPS:SetTag(Tag, TagOnly)
  self.Tag = tostring(Tag)
  self.TagOnly = TagOnly or true 
  return self
end

--- Get status.
-- @param #MARKEROPS self
-- @return #string
function MARKEROPS:GetStatus()
  local state = "none"
  if self.Type == "AWACS" and self.AwacsID ~= nil then
    state = self.AwacsID:GetState() -- obtain FSM state
  elseif self.Type == "Tanker" and self.TankerID ~= nil then
   state = self.TankerID:GetState() -- obtain FSM state
  end
  return state
end

--------------------------------------------------------------------------
-- MARKEROPS Class Definition End
--------------------------------------------------------------------------

local opsi = MARKEROPS:New("Tanker",Template,Tacan,Radio,Altitude,Speed,AirbaseName,ZoneName,Heading,Leg,TankerType)

function menucalltanker()
  if not mytanker then
    mytanker = MARKEROPS:New("Tanker","Tanker",44,244,20000,200,"Truman","Tanker-Awacs",90,20)
    mytanker:SetTag("Spirit")
  else
    local status = mytanker:GetStatus()
    local m = MESSAGE:New(string.format("Tanker %s ops in status: %s", mytanker.Tag, status),10,"Info",true):ToAll()
  end
end

function menucallawacs()
  if not myawacs then
    myawacs = MARKEROPS:New("AWACS","Awacs",nil,271,25000,200,"Truman","Tanker-Awacs",0,50)
    myawacs:SetTag("Apple", true)
  else
   local status = myawacs:GetStatus()
   local m = MESSAGE:New(string.format("AWACS %s ops in status: %s", myawacs.Tag, status),10,"Info",true):ToAll()
  end
end

MenuTop = MENU_COALITION:New( coalition.side.BLUE,"Call Tanker or Awacs")
MenuTanker = MENU_COALITION_COMMAND:New(coalition.side.BLUE,"Start Tanker",MenuTop,menucalltanker)
MenuAwacs = MENU_COALITION_COMMAND:New(coalition.side.BLUE,"Start AWACS",MenuTop,menucallawacs):Refresh()