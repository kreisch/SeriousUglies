-- Persistence skript, based on a mission by Surrexen
-- https://www.digitalcombatsimulator.com/en/files/?CREATED_BY=Surrexen&set_filter=Y

-- Usage: 
-- Load this script and set parameter at the end of file accordingly, or call this method 
-- from the outside, then comment the call at the bottom

-- First parameter is the path to a writable directory
-- Second parameter is the targeted name for the persistence file
-- Third parameter is the name of the group unit used as polygone zone

-- A new directory is created in the target directory with the name "Persistence".
-- The persistence file is written into this directory

-- StartUglyPersistence("C:\\Users\\Phil\\Saved Games\\DCS.openbeta", "UglyUnitData.lua")


----------------------------------------------------------
-- Default values for the script
----------------------------------------------------------
-- Seconds between each table write
SaveScheduleUnits = 10

-- Print some more text during script execution
ShowDebugText = true

-- When a unit with this name is found, it is placed instead of the dead removed units
-- so the area does not look that empty
-- UnitExchangeTemplateName = "__Substitute_Soft"
-- ExchangeOldUnit = true

-- The amount of seconds each message is visible
MessageDefaultShowTime = 10
----------------------------------------------------------

-- Global default variable needed later. Don't set any values here!
PathToUserData = ""
UnitsFileName = ""
UnitsFilePath = ""
StaticsFilePath = ""
DeadUnitsList = SET_UNIT:New()

function UglyMessageToAll(_theNeatMessage)
  trigger.action.outText(_theNeatMessage, MessageDefaultShowTime)
end

function UglyPrintDebugText(_theNeatMessage)
  if ShowDebugText then
    trigger.action.outText(_theNeatMessage, MessageDefaultShowTime)
  end
end

function uglyCheckPersistence()
  if io and lfs then
    UglyPrintDebugText("lfs and io available")

    if lfs.attributes(PathToUserData) then
      UglyPrintDebugText(PathToUserData.." ok")
      PersistencePath = PathToUserData.."\\Persistence"

      if lfs.attributes(PersistencePath) then
        UglyPrintDebugText(PersistencePath.." ok")
      else
        lfs.mkdir(PersistencePath)
      end

      UnitsFilePath = PersistencePath.."\\"..UnitsFileName
      StaticsFilePath = PersistencePath.."\\"..StaticsFileName

      UglyPrintDebugText("Path to Userdata available, ready to load: "..UnitsFilePath)
      UglyPrintDebugText("Path to Userdata available, ready to load: "..StaticsFilePath)
      return true
    else
      UglyPrintDebugText("Path to Userdata not available: "..PathToUserData)
      UglyPrintDebugText("Path to Userdata not available: "..StaticsFilePath)
      return false
    end
  else
    UglyPrintDebugText("lfs and io not available -> MissionScripting.lua has to be modified to enable persistence!", 3)
    return false
  end
end

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

--////SAVE UNITS FUNCTION
function SEF_SaveUglyUnitDeadList(timeloop, time)
  UglyPrintDebugText("Unit progress will be saved...")
  IntermentMissionStr = IntegratedserializeWithCycles("UglyUnitDeadList", UglyUnitDeadList)
  writemission(IntermentMissionStr, UnitsFilePath)
--  UglyPrintDebugText("SEF_SaveUglyUnitDeadListNoArgs!"..IntermentMissionStr)
  UglyPrintDebugText("Unit progress has been saved!")
  return time + SaveScheduleUnits
end

function SEF_SaveUglyUnitDeadListNoArgs()
  IntermentMissionStr = IntegratedserializeWithCycles("UglyUnitDeadList", UglyUnitDeadList)
  UglyPrintDebugText("SEF_SaveUglyUnitDeadListNoArgs!"..IntermentMissionStr)
  writemission(IntermentMissionStr, UnitsFilePath)
end

--////SAVE STATICS FUNCTION
function SEF_SaveUglyStaticDeadList(timeloop, time)
  UglyPrintDebugText("Static progress will be saved...")
  IntermentMissionStrStatic = IntegratedserializeWithCycles("UglyStaticDeadList", UglyStaticDeadList)
  writemission(IntermentMissionStrStatic, StaticsFilePath)
  UglyPrintDebugText("Static progress has been saved!")
  return time + SaveScheduleUnits
end

function SEF_SaveUglyStaticDeadListNoArgs()
	IntermentMissionStrStatic = IntegratedserializeWithCycles("UglyStaticDeadList", UglyStaticDeadList)
	writemission(IntermentMissionStrStatic, StaticsFilePath)	
end

function UglySubstituteAndKillUnit(SubstituteUnit)

--[[
	local deadObj = {
		["country"] = CountryName, 
		["type"]=DEADUNIT:GetTypeName(),
		["coalition"]=DEADUNIT:GetCoalitionName(),
		["category"]=DEADUNIT:GetCategory(),
		["y"]=DEADUNIT:GetPointVec2():GetY(),
		["x"]=DEADUNIT:GetPointVec2():GetX(),
		["name"]=DEADUNIT:GetName(),
		["heading"]=DEADUNIT:GetHeading(),
		["shape_name"]=DEADUNIT:GetTypeName(),
	}
]]--
--[[
		local staticObj = {
			["country"] = SubstituteUnit["country"], 
			["type"]=SubstituteUnit["country"], 
			["coalition"]=SubstituteUnit["country"], 
			["category"]=SubstituteUnit["country"], 
	--				["group"]=EventData.IniGroupName,
	--				["transportable"]=true,
	--				["unitID"]=SubstituteUnit:GetID(),
			["y"]=OldUnitVec2:GetY(),
			["x"]=OldUnitVec2:GetX(),
			["name"]=SubstituteUnit:GetName(),
	--				["name"]="Bamboozle",
			["playerCanDrive"]=false,
			["heading"]=SubstituteUnit:GetHeading(),
			["shape_name"]=SubstituteUnit:GetTypeName(),
			["dead"] = true,
		}
]]--

	if ( SubstituteUnit ~= nil ) then
        local DeadUnit = UNIT:FindByName(SubstituteUnit["name"])
        if ( DeadUnit ~= nil ) then
		  DeadUnit:Destroy()
		end

		SubstituteUnitInfoString = IntegratedserializeWithCycles("staticObj", staticObj)
		UglyPrintDebugText("Debug info staticObj "..SubstituteUnitInfoString)

		coalition.addStaticObject(SubstituteUnit["countryID"], SubstituteUnit)
		UglyPrintDebugText("Added new static!!! "..SubstituteUnit["countryID"])
	end
end

-------------------------------------------------------------------------------------------------------------------------------------
--//// MAIN persistence function

function StartUglyPersistence(_pathToUserData, _unitsFileName, _staticsFileName)
  UglyPrintDebugText("Trying to start Ugly Persistence!")

  PathToUserData = _pathToUserData
  UnitsFileName = _unitsFileName
  StaticsFileName = _staticsFileName

  local SEFDeletedUnitCount = 0
  local SEFDeletedStaticCount = 0

--  DeadUnitsList:FilterCoalitions("red"):FilterCategories("ground"):FilterActive(true):FilterStart()
  DeadUnitsList:HandleEvent(EVENTS.Dead)

  --////LOAD UNITS
  
  if uglyCheckPersistence() then
    if file_exists(UnitsFilePath) then
--    if false then
      UglyPrintDebugText("Loading: "..UnitsFilePath)

      dofile(UnitsFilePath)

      UglyPrintDebugText("Unit Table Length Is "..#UglyUnitDeadList)

      for i = 1, #UglyUnitDeadList do
        UglyPrintDebugText("Unit Interment Element "..i.." Is "..UglyUnitDeadList[i]["name"])

        local DeadUnit = UNIT:FindByName(UglyUnitDeadList[i]["name"])
        if ( DeadUnit ~= nil ) then
		  UglySubstituteAndKillUnit(UglyUnitDeadList[i])
          SEFDeletedUnitCount = SEFDeletedUnitCount + 1
        else
          UglyPrintDebugText("Unit Element "..i.." Is "..UglyUnitDeadList[i]["name"].." And Was Not Found")
        end
      end
    else
      UglyPrintDebugText("Creating data for: "..UnitsFilePath)

      UglyUnitDeadList = {}
    end

    UglyMessageToAll("Persistent World Functions Have Removed "..SEFDeletedUnitCount.." Units")

    --////LOAD STATICS
    if file_exists(StaticsFilePath) then
      UglyPrintDebugText("Loading: "..StaticsFilePath)

	  dofile(StaticsFilePath)
		
      UglyPrintDebugText("Static Table Length Is "..#UglyStaticDeadList)
	
	  for i = 1, #UglyStaticDeadList do
		local DeadStatic = STATIC:FindByName(UglyStaticDeadList[i]["name"])
		if ( DeadStatic ~= nil ) then
		    UglySubstituteAndKillUnit(UglyStaticDeadList[i])
			SEFDeletedStaticCount = SEFDeletedStaticCount + 1
		else
			trigger.action.outText("Static Interment Element "..i.." Is "..UglyStaticDeadList[i].." And Was Not Found", 15)
		end				
	  end	
    else
      UglyPrintDebugText("Creating data for: "..StaticsFileName)

	  UglyStaticDeadList = {}
	  StaticIntermentTableLength = 0	
    end

    UglyMessageToAll("Persistent World Functions Have Removed "..SEFDeletedStaticCount.." Statics")


---------------------------------------------------------------------------------------------------------------------------------------------------

--SCHEDULE
    timer.scheduleFunction(SEF_SaveUglyUnitDeadList, 53, timer.getTime() + SaveScheduleUnits)
    timer.scheduleFunction(SEF_SaveUglyStaticDeadList, 53, timer.getTime() + SaveScheduleUnits)
    UglyMessageToAll("Ugly Persistence is active. Unit list will be stored every "..SaveScheduleUnits.." seconds.")

    ---------------------------------------------------------------------------------------------------------------------------------------------------
  end
end

function DeadUnitsList:OnEventDead(EventData)

  local DEADUNIT = EventData.IniUnit
  local DEADUNITNAME = EventData.IniDCSUnitName
  local DEADUNITCOALITION = EventData.IniCoalition
  local DEADUNITOBJECTCATEGORY = EventData.IniObjectCategory  -- 1 UNIT / 2 WEAPON / 3 STATIC / 4 BASE / 5 SCENERY / 6 CARGO
  local DEADUNITCATEGORY = EventData.IniCategory        -- 0 AIRPLANE / 1 HELICOPTER / 2 GROUND_UNIT / 3 SHIP / 4 STRUCTURE

  --Debug Zone
  UglyPrintDebugText("Dead Unit Name: "..DEADUNITNAME)
  UglyPrintDebugText("Dead Unit Coalition: "..DEADUNITCOALITION)
  UglyPrintDebugText("Dead Unit Category: "..DEADUNITCATEGORY)
  UglyPrintDebugText("Dead Unit Object Category: "..DEADUNITOBJECTCATEGORY)


	local CountryID = DEADUNIT:GetCountry()
	local CountryName = _DATABASE.COUNTRY_NAME[CountryID]

	local deadObj = {
		["country"] = CountryName, 
		["countryID"] = CountryID, 
		["type"]=DEADUNIT:GetTypeName(),
		["coalition"]=DEADUNIT:GetCoalitionName(),
		["category"]=DEADUNIT:GetCategory(),
		["y"]=DEADUNIT:GetPointVec2():GetY(),
		["x"]=DEADUNIT:GetPointVec2():GetX(),
		["name"]=DEADUNIT:GetName(),
		["heading"]=DEADUNIT:GetHeading(),
		["shape_name"]=DEADUNIT:GetTypeName(),
		["dead"] = true,
	}

	if ( DEADUNITOBJECTCATEGORY == 1 ) then -- UNIT
	  if ( DEADUNITCATEGORY == 2 or DEADUNITCATEGORY == 3 ) then -- GROUND_UNIT or SHIP
		UglyPrintDebugText("PERSISTED! Dead Unit ["..DEADUNITNAME.."]")
		table.insert(UglyUnitDeadList, deadObj)
	  end
	elseif ( DEADUNITOBJECTCATEGORY == 3 ) then -- STATIC
	  UglyPrintDebugText("PERSISTED! Dead Static ["..DEADUNITNAME.."]")
      table.insert(UglyStaticDeadList, deadObj)
	else
	end		
  
  
  local DEADDCSUNIT = EventData.IniDCSUnit
  DEADDCSUNIT:destroy()

end

---------------------------------------------------------------------------------------------------------------------------------------------------
--//// Do persistence

--PathToUserData = "C:\\Users\\Phil\\Saved Games\\DCS.openbeta"  --Skyfire local
--PathToUserData = "C:\\Users\\uglys\\Saved Games\\DCS.server"   --Skyfire server
--PathToUserData = "C:\\Users\\Administrator\\Saved Games\\DCS.openbeta_server"  --Chris Server
--UnitsFileName = "UglyUnitData.lua"

UglyMessageToAll("MessageToAll: Trying to start Ugly Persistence!")
StartUglyPersistence("C:\\temp", "UglyUnitData.lua", "UglyStaticsData.lua")
UglyMessageToAll("MessageToAll: Ugly Persistence started!")

