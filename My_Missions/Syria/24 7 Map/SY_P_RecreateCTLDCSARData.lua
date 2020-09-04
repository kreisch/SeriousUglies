 -----------------------------------
 --Configurable for user:
 SaveFOBIntervall = 6 --how many seconds between each check of all the statics.
 
 local ctldDataFile = "C:\\temp\\Persistence\\UglyCTLDSyria247.lua" --edit this to represent your own (DCS cant write to different disks)
 
 -----------------------------------
 --Do not edit below here
 -----------------------------------
 local version = "1.0"
 
 function IntegratedbasicSerialize(s)
    if s == nil then
      return "\"\""
    else
      if ((type(s) == 'number') or (type(s) == 'boolean') or (type(s) == 'function') or (type(s) == 'table') or (type(s) == 'userdata') ) then
        return tostring(s)
      elseif type(s) == 'string' then
        return string.format('%q', s)
      end
    end
  end
  
-- imported slmod.serializeWithCycles (Speed)
  function IntegratedserializeWithCycles(name, value, saved)
    local basicSerialize = function (o)
      if type(o) == "number" then
        return tostring(o)
      elseif type(o) == "boolean" then
        return tostring(o)
      else -- assume it is a string
        return IntegratedbasicSerialize(o)
      end
    end

    local t_str = {}
    saved = saved or {}       -- initial value
    if ((type(value) == 'string') or (type(value) == 'number') or (type(value) == 'table') or (type(value) == 'boolean')) then
      table.insert(t_str, name .. " = ")
      if type(value) == "number" or type(value) == "string" or type(value) == "boolean" then
        table.insert(t_str, basicSerialize(value) ..  "\n")
      else

        if saved[value] then    -- value already saved?
          table.insert(t_str, saved[value] .. "\n")
        else
          saved[value] = name   -- save name for next time
          table.insert(t_str, "{}\n")
          for k,v in pairs(value) do      -- save its fields
            local fieldname = string.format("%s[%s]", name, basicSerialize(k))
            table.insert(t_str, IntegratedserializeWithCycles(fieldname, v, saved))
          end
        end
      end
      return table.concat(t_str)
    else
      return ""
    end
  end

function file_exists(name) --check if the file already exists for writing
    if lfs.attributes(name) then
    return true
    else
    return false end 
end

function writemission(data, file)--Function for saving to file (commonly found)
  File = io.open(file, "w")
  File:write(data)
  File:close()
end


--[[

function recreateFOB(_country, _coalition, _point, _name)
  env.info("UGLY: recreateFOB")

  local _fob = ctld.spawnFOB(_country, 0, _point, _name)

  --make it able to deploy crates
  table.insert(ctld.logisticUnits, _fob:getName())

  ctld.beaconCount = ctld.beaconCount + 1

  local _radioBeaconName = "FOB Beacon #" .. ctld.beaconCount

  local _radioBeaconDetails = ctld.createRadioBeacon(_point, _coalition, _country, _radioBeaconName, nil, true)

  ctld.fobBeacons[_name] = { vhf = _radioBeaconDetails.vhf, uhf = _radioBeaconDetails.uhf, fm = _radioBeaconDetails.fm }

  if ctld.troopPickupAtFOB == true then
      table.insert(ctld.builtFOBS, _fob:getName())
  end
end
]]--

function RestoreOldData()
  if file_exists(ctldDataFile) then --Script has been run before, so we load previous data
    env.info("UGLY: Existing database, loading from file.")

    dofile(ctldDataFile)

    --  RUN THROUGH THE KEYS IN THE TABLE 
    for i = 1, #SaveCTLD do
      local _country = SaveCTLD[i]["country"]
      local _coalition = SaveCTLD[i]["coalition"]
      local _name = SaveCTLD[i]["name"]
      local _point = { x = SaveCTLD[i]["x"], y = 0, z = SaveCTLD[i]["z"]}

      ctld.createNewFOB(_country, _coalition, _point, _name)
    end
  end
end

local function starts_with(str, start)
  return str:sub(1, #start) == start
end

--////SAVE UNITS FUNCTION
function UGLY_SaveUglyFOBList(timeloop, time)
  env.info("UGLY: FOBs will be saved...")
  local newMissionStr = IntegratedserializeWithCycles("SaveCTLD", ctld.uglyFOBList) --save the Table as a serialised type with key SaveCTLD
  writemission(newMissionStr, ctldDataFile)--write the file from the above to ctldDataFile
  env.info("UGLY: FOBs have been saved!"..newMissionStr)
  return time + SaveFOBIntervall
end

function UUGLY_SaveUglyFOBListNoArgs()
  local newMissionStr = IntegratedserializeWithCycles("SaveCTLD",SaveCTLD)
  env.info("UGLY: UUGLY_SaveUglyFOBListNoArgs!"..newMissionStr)
  writemission(newMissionStr, UnitsFilePath)
end

--SCRIPT START
env.info("UGLY: Store and Recreate CTLD and CSAR data - version: " .. version)

-- Load and create old FOBs
RestoreOldData()

--THE SAVING SCHEDULE
timer.scheduleFunction(UGLY_SaveUglyFOBList, {}, timer.getTime() + SaveFOBIntervall)

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

  -------------------------------------------
	-- Check for CTLD JTAC
    if starts_with(grp:GetUnit(i):GetName(), "Unpacked Hummer") then
      local _code = table.remove(ctld.jtacGeneratedLaserCodes, 1)
      --put to the end
      table.insert(ctld.jtacGeneratedLaserCodes, _code)

      ctld.JTACAutoLase(grp:GetName(), _code)
      trigger.action.outText("Restoring JTAC status of: "..grp:GetName()..", with laser code: ".._code, 10)

    -------------------------------------------
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
    -------------------------------------------
	  -- For Testing - Create FOB from unit
--    elseif starts_with(grp:GetName(), "Deployed FOB") then
--      local _standin = grp:GetDCSObject()
--      local _standinUnit = grp:GetDCSUnit(i)

--      ctld.createNewFOB(_standinUnit:getCountry(), _standin:getCoalition(), _standinUnit:getPoint(), _standinUnit:getName())
--      grp:Destroy()
    end
  end
end
)

























