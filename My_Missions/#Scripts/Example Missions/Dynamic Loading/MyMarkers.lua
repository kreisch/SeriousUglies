env.info("Loading Marker Framework version 0.1")
--make HQ an event handler
local HQ=EVENTHANDLER:New()


function HQ:OnEventMarkAdded(Event)
  env.info("Marker Handler Event added fires")
end

function HQ:OnEventMarkChange(Event)
  env.info("Marker Handler Event changed fires")
  
  local text = ""
  local Eventtext = Event.text or ""
  local vec3={y=Event.pos.y, x=Event.pos.x, z=Event.pos.z}
  local vec2={x=Event.pos.x, z=Event.pos.z}
  local _coord=COORDINATE:NewFromVec3(vec3)
  local coordtext = _coord:ToStringLLDDM()  
  local text = text .. string.format(" at position %s", coordtext)
  self:I(text)
  
  local zoneFireMission = ZONE_RADIUS:New("FireMission", vec2,10)
  zoneFireMission:Scan( Unit.Category.GROUND_UNIT )
  
  local SetUnit = zoneFireMission:GetScannedSetUnit()

  SetUnit:I(SetUnit:Count())
  
  
end

function HQ:OnEventMarkRemoved(Event)
  env.info("Marker Handler Event removed fires")
end



  
-- subscribe handler "HQ" to event mark point changed
HQ:HandleEvent(EVENTS.MarkChange)
HQ:HandleEvent(EVENTS.MarkRemoved)

