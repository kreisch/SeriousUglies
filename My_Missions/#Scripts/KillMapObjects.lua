Handler1 = {}
Handler2 = {}
Handler3 = {}

local target1 = false
local target2 = false

function Handler1:onEvent(event)
trigger.action.outText("Handler1 checking", 10)
if event.id == world.event.S_EVENT_DEAD and event.IniUnitName == 433455194 then
--trigger.action.setUserFlag('1', true) 
trigger.action.outText("Object1 is down, good job!" .. event.IniUnitName, 10)
target1 = true
end
end
world.addEventHandler(Handler1)

function Handler2:onEvent(event)
trigger.action.outText("Handler2 checking", 10)
if event.id == world.event.S_EVENT_DEAD and event.IniUnitName == 183669845 then
--trigger.action.setUserFlag('1', true) 
trigger.action.outText("Object2 is down, good job!" .. event.IniUnitName, 10)
target2 = true
end
end
world.addEventHandler(Handler2)

function Handler3:onEvent(event)
trigger.action.outText("Handler3 checking", 10)
if event.id == world.event.S_EVENT_DEAD then
if (event.IniUnitName == nil) then
    trigger.action.outText("Something died", 10)
else
  trigger.action.outText("Something died".. event.IniUnitName, 10)
end
end
end
world.addEventHandler(Handler3)

  
    local checkdeads = SCHEDULER:New( nil, 
  function()
  
     if target1 and target2 then
      trigger.action.outText("----------MISSION COMPLETE------------", 10)
     else
      trigger.action.outText("Checking the deads....", 10)
     end 
     
  end, {}, 1, 10
  )