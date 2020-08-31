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
    if starts_with(grp:GetUnit(i):GetName(), "Unpacked Hummer") then
      trigger.action.outText("Restoring JTAC status of: "..grp:GetName(), 10)

      local _code = table.remove(ctld.jtacGeneratedLaserCodes, 1)
      --put to the end
      table.insert(ctld.jtacGeneratedLaserCodes, _code)

      ctld.JTACAutoLase(grp:GetName(), _code)

    end
  end
end
)
