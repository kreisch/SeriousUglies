-- Uses the Simple Group Saving by Pikey May 2019
-- Usage of this script should credit the following contributors:
-- Pikey, 
-- Speed & Grimes for their work on Serialising tables, included below,
-- FlightControl for MOOSE (Required)

-- Heavily modified by [ugly] Skyfire
 
 -----------------------------------
 --Configurable for user:
 SaveIntervall = Ugly.saveInterval --how many seconds between each check of all the statics.
 SaveMarkerIntervall = Ugly.saveInterval --how many seconds between storing of marker.
 
 local markerDataFile = "C:\\temp\\Persistence\\UglyMarkerSyria247.lua" --edit this to represent your own (DCS cant write to different disks)
 local unitsPosFile = "C:\\temp\\Persistence\\UglyUnitPositionsSyria247.lua" --edit this to represent your own (DCS cant write to different disks)
 
 -----------------------------------
 --Do not edit below here
 -----------------------------------
 
 assert(Ugly ~= nil, "\n\n** HEY MISSION-DESIGNER! **\n\Ugly_Framework has not been loaded!\n\nMake sure it's running\n*before* running SY_P_NewUnitsAndStaticsPos.lua!\n")
 
 -- local version = "1.1"
 local version = "1.2"  -- Added Marker
 
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

--SCRIPT START
env.info("UGLY: Units and Static position persistence " .. version)

function LoadOldGroups()
  if file_exists(unitsPosFile) then --Script has been run before, so we need to load the save
    env.info("UGLY: Existing database, loading from file.")
  --    AllGroups:ForEachGroup(function (grp)
  --      grp:Destroy()
  --    end)

    dofile(unitsPosFile)
    tempTable={}
    Spawn={}
  --RUN THROUGH THE KEYS IN THE TABLE (GROUPS)
    for k,v in pairs (SaveUnits) do
      units={}
  --RUN THROUGH THE UNITS IN EACH GROUP
      for i= 1, #(SaveUnits[k]["units"]) do 
        tempTable =
        { 
          ["type"]=SaveUnits[k]["units"][i]["type"],
          ["transportable"]= true, 
          --["unitId"]=9000,used to generate ID's here but no longer doing that since DCS seems to handle it
          ["skill"]="Average",
          ["y"]=SaveUnits[k]["units"][i]["y"] ,
          ["x"]=SaveUnits[k]["units"][i]["x"] ,
          ["name"]=SaveUnits[k]["units"][i]["name"],
          ["heading"]=SaveUnits[k]["units"][i]["heading"],
          ["playerCanDrive"]=true,  --hardcoded but easily changed.  
        }

--        trigger.action.outText("Restore Unit: "..SaveUnits[k]["units"][i]["name"]..", Heading: "..SaveUnits[k]["units"][i]["heading"], 10)
        env.info("UGLY: Restore Unit: "..SaveUnits[k]["units"][i]["name"]..", Heading: "..SaveUnits[k]["units"][i]["heading"])

        table.insert(units,tempTable)

        local DeleteUnit = UNIT:FindByName( SaveUnits[k]["units"][i]["name"] )
  
        if DeleteUnit ~= nil then
          DeleteUnit:Destroy()	
        end
      end --end unit for loop

      groupData = 
      {
        ["visible"] = true,
        ["tasks"] = {}, -- end of ["tasks"]
        ["uncontrollable"] = false,
        ["task"] = "Ground Nothing",
        ["hidden"] = false,
        ["units"] = units,
        ["y"] = SaveUnits[k]["y"],
        ["x"] = SaveUnits[k]["x"],
        ["name"] = SaveUnits[k]["name"],
        --["lateActivation"] = false,
        --["taskSelected"] = true,
        --["route"] = 
        --{ 
        --["spans"] = {},
        --["points"]= {}
        -- },-- end of ["spans"] 
        --["groupId"] = 9000 + _count,
        --["start_time"] = 0,
      } 

      coalition.addGroup(SaveUnits[k]["CountryID"], SaveUnits[k]["CategoryID"], groupData)
      groupData = {}
    end --end Group for loop
  else --Save File does not exist we start a fresh table, no spawns needed
    SaveUnits={}
  end
end

function RestoreMarkerData()
  if file_exists(markerDataFile) then --Script has been run before, so we load previous data
    env.info("UGLY: Existing database, loading marker from file.")

    dofile(markerDataFile)

    --  RUN THROUGH THE KEYS IN THE TABLE 
    for k,v in pairs(Marker) do
      local _markText = Marker[k]["text"]
      local _coalition = Marker[k]["coalition"]
      local _name = Marker[k]["name"]
      local _point = { x = Marker[k]["pos"]["x"], y = 0, z = Marker[k]["pos"]["z"]}
      trigger.action.markToCoalition( k, _markText, _point, _coalition, false, "" )
--      trigger.action.markToCoalition( UTILS.GetMarkID(), _markText, _point, _coalition, false, "" )
    end
  end
end

--////SAVE UNITS FUNCTION
function UGLY_SaveUglyMarkerList(timeloop, time)
--  env.info("UGLY: FOBs will be saved...")
  local markerMissionStr   = IntegratedserializeWithCycles("Marker", Ugly.currentMarker) --save the Table as a serialised type with key FOBs

  writemission(markerMissionStr, markerDataFile)--write the file from the above to markerDataFile
--  env.info("UGLY: FOBs have been saved! "..newMissionStr)
--  env.info("UGLY: FOBs have been saved!")
  return time + SaveMarkerIntervall
end


local function starts_with(str, start)
  return str:sub(1, #start) == start
end

-- Load old groups
LoadOldGroups()

-- Load and create old Marker
RestoreMarkerData()

--THE SAVING SCHEDULE
timer.scheduleFunction(UGLY_SaveUglyMarkerList, {}, timer.getTime() + SaveMarkerIntervall)

AllGroups = SET_GROUP:New():FilterCategories("ground"):FilterActive(true):FilterStart()
--AllGroups:HandleEvent(EVENTS.Birth) -- Player and AI Aircraft as statics

--THE SAVING SCHEDULE
SCHEDULER:New( nil, function()

  RelevantGroups = SET_GROUP:New()

  AllGroups:ForEachGroupAlive(function (grp)
    local DCSgroup = Group.getByName(grp:GetName() )
    if starts_with(grp:GetName(), "S_") then
--      env.info("UGLY: Skipping Unit: "..grp:GetName())
--      trigger.action.outText("Skipping Unit: "..grp:GetName(), 10)
    else
      RelevantGroups:AddGroup(grp)
--      env.info("UGLY: Using Unit: "..grp:GetName())
--      trigger.action.outText("Using Unit: "..grp:GetName(), 10)
    end
  end)

  RelevantGroups:ForEachGroup(function (grp)
    local DCSgroup = Group.getByName(grp:GetName() )
  	local size = DCSgroup:getSize()

    _unittable={}

    for i = 1, size do
	  local tmpTable =
		{   
		  ["type"]=grp:GetUnit(i):GetTypeName(),
	      ["y"]=grp:GetUnit(i):GetVec2().y,
	      ["x"]=grp:GetUnit(i):GetVec2().x,
	      ["name"]=grp:GetUnit(i):GetName(),
	      ["heading"]=routines.utils.toRadian(grp:GetUnit(i):GetHeading()),
--	      ["transportable"]=true,
--	      ["unitID"]=grp:GetUnit(i):GetID(),
--	      ["skill"]="Average",
--	      ["playerCanDrive"]=true,
    }

--	  trigger.action.outText("Unit: "..grp:GetName()..", Heading: "..grp:GetUnit(i):GetHeading()..", Heading Rad: "..routines.utils.toRadian(grp:GetUnit(i):GetHeading()), 10)
	  table.insert(_unittable,tmpTable) --add units to a temporary table
    end

    SaveUnits[grp:GetName()] =
    {
      ["CountryID"]=grp:GetCountry(),
      ["CategoryID"]=grp:GetCategory(),
      ["units"]= _unittable,
      ["y"]=grp:GetVec2().y, 
      ["x"]=grp:GetVec2().x,
      ["name"]=grp:GetName(),
      ["CoalitionID"]=grp:GetCoalition(),
--      ["start_time"]=0,
--      ["SpawnCoalitionID"]=grp:GetCountry(),
--      ["tasks"]={}, --grp:GetTaskMission(), --wrong gives the whole thing
--      ["task"]="Ground Nothing",
--      ["route"]={}, -- grp:GetTaskRoute(),
--      ["groupId"]=grp:GetID(),
--      ["SpawnCategoryID"]=grp:GetCategory(),
--      ["SpawnCountryID"]=grp:GetCoalition(),
    }
  end)

  newMissionStr = IntegratedserializeWithCycles("SaveUnits",SaveUnits) --save the Table as a serialised type with key SaveUnits
  writemission(newMissionStr, unitsPosFile)--write the file from the above to SaveUnits.lua
  SaveUnits={}--clear the table for a new write.
--env.info("UGLY: Data saved.")
end, {}, 10, SaveIntervall)

--[[
function AllGroups:OnEventBirth( EventData )

  local DEADUNITNAME = EventData.IniDCSUnitName

  if (starts_with(DEADUNITNAME, "Deployed FOB") == true) then
    trigger.action.outText("Found new deployed FOB"..DEADUNITNAME, 10)
  end

end
]]--

