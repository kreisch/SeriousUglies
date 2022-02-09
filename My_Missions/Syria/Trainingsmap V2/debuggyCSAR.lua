local debugGroupSet=SET_GROUP:New():FilterCoalitions("blue"):FilterCategoryGround():FilterStart() 
trigger.action.outText("debugy." .. debugGroupSet:CountAlive() , 30)

-- debugGroupSet:ForEachGroup( -- WORKAROUND No1. geht
--   --- @param Wrapper.Group#GROUP MooseGroup
--   function( MooseGroup ) 
--     local droppedGroup = MooseGroup
--     --trigger.action.outText("Trigger active for " .. droppedGroup:GetName(), 30)
--     droppedGroup:HandleEvent(EVENTS.Dead)
--     function droppedGroup:OnEventDead( EventData)
--             local _unit = EventData.IniUnit
--             local _name = _unit:GetName()
--             trigger.action.outText("Unit died.." .. _name, 30)
--         if string.match(_name, "CASEVAC") then
--             my_csar:SpawnCASEVAC(droppedGroup:GetPointVec2(),2) -- läuft absolut Amok....Warum?
--         end
--     end
--   end 
-- )

debugGroupSet:ForEachGroup( 
  --- @param Wrapper.Group#GROUP MooseGroup
  function( MooseGroup ) 
    local droppedGroup = MooseGroup
    --trigger.action.outText("Trigger active for " .. droppedGroup:GetName(), 30)
    droppedGroup:HandleEvent(EVENTS.Dead)
    function droppedGroup:OnEventDead( EventData)
            local _unit = EventData.IniUnit
            local _name = _unit:GetName()
            local _group = _unit:GetGroup()
            --trigger.action.outText("Unit died.." .. _name .. " Part of group " .. _group:GetName(), 30)
            local _unitcountOfGroup = _group:CountAliveUnits()
            --trigger.action.outText("Groupsize of " .. _group:GetName().. " is " .. _unitcountOfGroup, 30)
        if (_unitcountOfGroup < 1 ) then

            trigger.action.outText("Spawning CSAR" .. "GroupName and size is " .. _group:GetName() .. " and " .. _unitcountOfGroup , 30)
            my_csar:SpawnCASEVAC(_unit:GetPointVec2(),2)
        end
    end
  end 
)



