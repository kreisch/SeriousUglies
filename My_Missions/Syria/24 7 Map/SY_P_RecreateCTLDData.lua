-- Just check the complete list of objects once and all persisted CTLD objects back to the CTLD List

local function starts_with(str, start)
  return str:sub(1, #start) == start
end


----------------------------------------------------------------------------------
--SCRIPT START
trigger.action.outText("Restoring CTLD objects!", 10)
local RestoreGroups = SET_GROUP:New():FilterActive(true):FilterStart()

RestoreGroups:ForEachGroupAlive(function (grp)
  for i = 1, #grp:GetUnits() do

	-- Check for CTLD JTAC
    if starts_with(grp:GetUnit(i):GetName(), "Unpacked Hummer") then
      local _code = table.remove(ctld.jtacGeneratedLaserCodes, 1)
      --put to the end
      table.insert(ctld.jtacGeneratedLaserCodes, _code)

      ctld.JTACAutoLase(grp:GetName(), _code)
      trigger.action.outText("Restoring JTAC status of: "..grp:GetName()..", with laser code: ".._code, 10)

	  -- Check for CSAR Guy
	  elseif starts_with(grp:GetName(), "Downed Pilot") then

      local _downedGroup = grp:GetDCSObject()
      local _downedUnit = grp:GetDCSUnit(i)

      trigger.action.setGroupAIOff(_downedGroup)
      local _freq = csar.generateADFFrequency()

      csar.addBeaconToGroup(_downedGroup:getName(), _freq)

      -- Generate DESCRIPTION text
      local _text = "Pilot of " .. _downedUnit:getName() .. " - " .. _downedUnit:getTypeName()

      csar.woundedGroups[_downedGroup:getName()] = { side = _downedGroup:getCoalition(), originalUnit = _downedUnit:getName(), frequency = _freq, desc = _text, player = nil }

      csar.initSARForPilot(_downedGroup, _freq)
      csar.addSpecialParametersToGroup(_downedGroup)
      trigger.action.outText("Restoring downed pilot: "..grp:GetName(), 10)
    end
  end
end
)
