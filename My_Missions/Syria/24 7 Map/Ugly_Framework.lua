----------------------------------------------------------------------------------------
-- UGLY PERSISTENCE FRAMEWORK
--
-- 2020 Edition
--
-- Currently no dependency to other frameworks (no MOOSE, MIST, CTLD...)
-- 
-- What it can handle:
--
-- Units/Statics
--  * Track death of units and statics. Store/Restore dead status. Replace dead units with statics
--  * Track units position on the battlefield. A filter can be used to exclude units. Per default all "S_" units are not stored
--
-- Marker
--  * Store/Restore user mission marker
--  * Place marker as RECCE points. Any Static with prefix "M_" creates a marker for the opposite coalition
--
-- CSAR
--  * Recreate crashed pilots from previous session
--
-- CTLD
--  * Recreate JTACs(Hummer) and FOBs
--  * Recreate Crates 
--


-- Declare the Framework
Ugly = {}

-- The global save interval
Ugly.saveInterval = 666

-- If true, print any debug text
Ugly.showDebugText = false

-- How long in seconds is the message displayed
Ugly.messageShowTime = 10

Ugly.AutoRecceMarker = "M_"

Ugly.PathToUserData = "C:\\temp" -- A directory "Persistence" is automatically added to the base directory
Ugly.MissionSuffix = "Syria247"

-- Framework defines END
-----------------------------------------------------------------------------------------

-->> FRAMEWORK IS STARTED AT THE END OF THE SCRIPT

-----------------------------------------------------------------------------------------
-- Framework data container

Ugly.currentPlayers = {}
Ugly.currentMarker = {}

Ugly.spawnmsg = {}
Ugly.spawnmsg.message = ""
Ugly.spawnmsg.eventHandler = {}

Ugly.UnitsFileName = "UglyUnitDeadList" .. Ugly.MissionSuffix .. ".lua"
Ugly.StaticsFileName = "UglyStaticsDeadList" .. Ugly.MissionSuffix .. ".lua"

Ugly.markerDataFile = "UglyMarker" .. Ugly.MissionSuffix .. ".lua" --edit this to represent your own (DCS cant write to different disks)
Ugly.unitsPosFile = "UglyUnitPositions" .. Ugly.MissionSuffix .. ".lua" --edit this to represent your own (DCS cant write to different disks)
Ugly.ctldDataFile = "UglyCTLD" .. Ugly.MissionSuffix .. ".lua" --edit this to represent your own (DCS cant write to different disks)

assert(ctld ~= nil, "\n\n** HEY MISSION-DESIGNER! **\nCTLD has not been loaded!\n\nMake sure it's running\n*before* starting the Ugly_Framework.lua!\n")
assert(csar ~= nil, "\n\n** HEY MISSION-DESIGNER! **\nCSAR has not been loaded!\n\nMake sure it's running\n*before* starting the Ugly_Framework.lua!\n")

-----------------------------------------------------------------------------------------
-- Check if file exists
-- imported from slmod.serializeWithCycles (Speed)

Ugly.IntegratedbasicSerialize = function (s)
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

Ugly.IntegratedserializeWithCycles = function (name, value, saved)
  local basicSerialize = function (o)
    if type(o) == "number" then
      return tostring(o)
    elseif type(o) == "boolean" then
      return tostring(o)
    else -- assume it is a string
      return Ugly.IntegratedbasicSerialize(o)
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
          table.insert(t_str, Ugly.IntegratedserializeWithCycles(fieldname, v, saved))
        end
      end
    end
    return table.concat(t_str)
  else
    return ""
  end
end

-----------------------------------------------------------------------------------------
-- Check if file exists

Ugly.file_exists = function (name) --check if the file already exists for writing
  if lfs.attributes(name) then
    return true
  else
    return false end 
end

-----------------------------------------------------------------------------------------
-- Open file and write data

Ugly.writemission = function (data, file)--Function for saving to file (commonly found)
  File = io.open(file, "w")
  File:write(data)
  File:close()
end

-----------------------------------------------------------------------------------------
-- Check if the _toCheckString starts with the _toFindString

Ugly.startsWith = function (_toCheckString, _toFindString)
  return _toCheckString:sub(1, #_toFindString) == _toFindString
end

-----------------------------------------------------------------------------------------
-- Print the neat message to all on screen

Ugly.messageToAll = function (_theNeatMessage, _forceShow)
  if Ugly.showDebugText or (_forceShow ~= nil and _forceShow == true) then
    trigger.action.outText("UGLY: ".._theNeatMessage, Ugly.messageShowTime)
  end
end

-----------------------------------------------------------------------------------------
-- Helper for automatic marker creation


--- Returns the enemy team ID as INT - Neutral is not included.
-- @param #_coalition the coalition you want to receive the enemy of
-- @author kreisch
Ugly.getEnemyCoalition = function (_coalition)
  local _enemy = 0
    if (_coalition == 1) then
      _enemy = 2
    elseif (_coalition == 2) then
     _enemy = 1
    end
  if (_enemy == nil) then
    env.error("UGLY: Warning, coalition is neutral! Setting mark to both sides.")
  end
  return _enemy
end

--- Creates a MapMarker on the location of a given static, visible for the enemy team
-- @param #_staticName STRING The name of the static
-- @param #_removeable BOOL True if the mark cannot be removed; false if the mark can be removed by users
-- @param #_markertext STRING the text to be displayed.
-- kreisch
Ugly.setMarkerForStatic = function (_static, _fixedMarkpoint, _markertext)
  
  local _staticName = _static:GetName()
  local _coalition  = _static:GetCoalition()
  local _coordinate = _static:GetCoordinate()
  local _coordinateText = _coordinate:ToStringLLDDM()
  
  if (_fixedMarkpoint == nil) then
      _fixedMarkpoint = true
  end
  
  if (_markertext == nil) then
    _markertext = ""
  end

  local  _finalText = "Target: " .. _staticName .. "\n".. _markertext .. "Coordinates:\n" .. _coordinateText
  
  env.info("UGLY: SetMarkerForStatic " .. _staticName .. " with text " .. _markertext .. " for target of coalition " .. _coalition)

  local _coalitionEnemy = Ugly.getEnemyCoalition(_coalition)
  
  if (_coalitionEnemy == 0) then
    _coordinate:MarkToAll(_finalText,_fixedMarkpoint)
  else
    _coordinate:MarkToCoalition(_finalText, _coalitionEnemy, _fixedMarkpoint)
  end
end

Ugly.AddMarkerToStatics = function (_Prefix)
  local AllStatics = SET_STATIC:New():FilterPrefixes(_Prefix):FilterStart()

  --    Ugly.AllGroups:ForEachGroup(function (grp)
  --      grp:Destroy()
  --    end)
  AllStatics:ForEachStatic (function (theStatic)
    trigger.action.outText("Ugly.AddMarkerToStatics for: "..theStatic:GetName(), 10)
    Ugly.setMarkerForStatic(theStatic, true)
  end)

end


-----------------------------------------------------------------------------------------
-- Check if persistence is pers se available

Ugly.persistenceAvailable = false

Ugly.UnitsFilePath = ""
Ugly.StaticsFilePath = ""

Ugly.checkPersistence = function()
  if io and lfs then
    Ugly.messageToAll("lfs and io available")

    if lfs.attributes(Ugly.PathToUserData) then
      Ugly.messageToAll(Ugly.PathToUserData.." ok")
      Ugly.PersistencePath = Ugly.PathToUserData.."\\Persistence"

      if lfs.attributes(Ugly.PersistencePath) then
        Ugly.messageToAll(Ugly.PersistencePath.." ok")
      else
        lfs.mkdir(Ugly.PersistencePath)
      end

      Ugly.UnitsFilePath = Ugly.PersistencePath.."\\"..Ugly.UnitsFileName
      Ugly.StaticsFilePath = Ugly.PersistencePath.."\\"..Ugly.StaticsFileName

      Ugly.messageToAll("Path to Userdata available, ready to load: "..Ugly.UnitsFilePath)
      Ugly.messageToAll("Path to Userdata available, ready to load: "..Ugly.StaticsFilePath)
      Ugly.persistenceAvailable = true
    else
      Ugly.messageToAll("Path to Userdata not available: "..Ugly.PathToUserData)
      Ugly.messageToAll("Path to Userdata not available: "..Ugly.StaticsFilePath)
      Ugly.persistenceAvailable = false
    end
  else
    Ugly.messageToAll("lfs and io not available -> MissionScripting.lua has to be modified to enable persistence!", 3)
	  Ugly.persistenceAvailable = false
  end

  return Ugly.persistenceAvailable
end

-----------------------------------------------------------------------------------------
-- Save Methods

--////SAVE UNITS FUNCTION
function Ugly.SaveUglyUnitDeadLists(timeloop, time)

  Ugly.messageToAll("Unit progress will be saved...")
  local completeDeadList = Ugly.IntegratedserializeWithCycles("Ugly.unitDeadList", Ugly.unitDeadList)
  Ugly.writemission(completeDeadList, Ugly.UnitsFilePath)
  Ugly.messageToAll("Unit progress has been saved!")

  Ugly.messageToAll("Static progress will be saved...")
  completeDeadList = Ugly.IntegratedserializeWithCycles("Ugly.staticDeadList", Ugly.staticDeadList)
  Ugly.writemission(completeDeadList, Ugly.StaticsFilePath)
  Ugly.messageToAll("Static progress has been saved!")

  return time + Ugly.saveInterval
end

-----------------------------------------------------------------------------------------
-- Substitue Unit with dead Static of same kind

Ugly.substituteAndKillUnit = function(_substituteUnit)
	if ( _substituteUnit ~= nil ) then
		local DeadUnit = UNIT:FindByName(_substituteUnit["name"])
		if ( DeadUnit ~= nil ) then
		  DeadUnit:Destroy()
		end

    -- Copy data to new table, else the table will contain unwanted internal data like unitID...
    local newDeadStatic = {
      ["country"] = _substituteUnit["country"], 
      ["countryID"] = _substituteUnit["countryID"], 
      ["type"]=_substituteUnit["type"],
      ["coalition"]=_substituteUnit["coalition"],
      ["category"]=_substituteUnit["category"],
      ["y"]=_substituteUnit["y"],
      ["x"]=_substituteUnit["x"],
      ["name"]=_substituteUnit["name"],
      ["heading"]=_substituteUnit["heading"],
      ["shape_name"]=_substituteUnit["shape_name"],
      ["dead"] = _substituteUnit["dead"],
    }
  
		coalition.addStaticObject(_substituteUnit["countryID"], newDeadStatic)
		Ugly.messageToAll("Added new static!!! ".._substituteUnit["countryID"])
	end
end

-----------------------------------------------------------------------------------------
-- Substitue Static with dead Static of same kind

Ugly.substituteAndKillStatic = function (_substituteStatic)
	if ( _substituteStatic ~= nil ) then
		local DeadStatic = STATIC:FindByName(_substituteStatic["name"], false)
		if ( DeadStatic ~= nil ) then
		  DeadStatic:Destroy()
		end

    -- Copy data to new table, else the table will contain unwanted internal data like unitID...
    local newDeadStatic = {
      ["country"] = _substituteStatic["country"], 
      ["countryID"] = _substituteStatic["countryID"], 
      ["type"]=_substituteStatic["type"],
      ["coalition"]=_substituteStatic["coalition"],
      ["category"]=_substituteStatic["category"],
      ["y"]=_substituteStatic["y"],
      ["x"]=_substituteStatic["x"],
      ["name"]=_substituteStatic["name"],
      ["heading"]=_substituteStatic["heading"],
      ["shape_name"]=_substituteStatic["shape_name"],
      ["dead"] = _substituteStatic["dead"],
    }

		coalition.addStaticObject(_substituteStatic["countryID"], newDeadStatic)
		Ugly.messageToAll("Added new static!!! ".._substituteStatic["countryID"])
	end
end

-----------------------------------------------------------------------------------------
-- Remember the Markers!

Ugly.storeMarker = function (_markerEvent)

  local newMarker = {
    idx = _markerEvent.idx,
    time = _markerEvent.time,
    initiator = _markerEvent.initiator,
    coalition = _markerEvent.coalition,
    text = _markerEvent.text,
    pos = {x = _markerEvent.pos.x, y = _markerEvent.pos.y, z = _markerEvent.pos.z}
   }

   Ugly.currentMarker[_markerEvent.idx] = newMarker
end

Ugly.removeMarker = function (_markerEvent)
  Ugly.currentMarker[_markerEvent.idx] = nil
end

Ugly.RestoreMarkerData = function ()
  if Ugly.file_exists(Ugly.markerDataFile) then --Script has been run before, so we load previous data
    env.info("UGLY: Existing database, loading marker from file.")

    dofile(Ugly.markerDataFile)

    --  RUN THROUGH THE KEYS IN THE TABLE 
    for k,v in pairs(Ugly.currentMarker) do
      local _markText = Ugly.currentMarker[k]["text"]
      local _coalition = Ugly.currentMarker[k]["coalition"]
      local _name = Ugly.currentMarker[k]["name"]
      local _point = { x = Ugly.currentMarker[k]["pos"]["x"], y = 0, z = Ugly.currentMarker[k]["pos"]["z"]}
--      trigger.action.markToCoalition( UTILS.GetMarkID(), _markText, _point, _coalition, false, "" )
      trigger.action.markToCoalition( k, _markText, _point, _coalition, false, "" )
    end
  end
end

--////SAVE UNITS FUNCTION
Ugly.SaveUglyMarkerList = function(timeloop, time)
--  env.info("UGLY: Marker will be saved...")
  local markerMissionStr   = Ugly.IntegratedserializeWithCycles("Ugly.currentMarker", Ugly.currentMarker) --save the Table as a serialised type with key FOBs

  Ugly.writemission(markerMissionStr, Ugly.markerDataFile)--write the file from the above to Ugly.markerDataFile
--  env.info("UGLY: Marker have been saved! "..newMissionStr)
--  env.info("UGLY: Marker have been saved!")
  return time + Ugly.saveInterval
end

Ugly.StartMarkerRecorder = function()
  -- First, load previous marker data
  Ugly.markerDataFile = Ugly.PersistencePath.."\\"..Ugly.markerDataFile
  Ugly.RestoreMarkerData()
  
  Ugly.trackEvents() -- Needed for marker

  -- Now init schedule constant saving of current marker data
  Ugly.messageToAll("Ugly.markerDataFile: "..Ugly.markerDataFile)
  timer.scheduleFunction(Ugly.SaveUglyMarkerList, {}, timer.getTime() + Ugly.saveInterval)
end


-----------------------------------------------------------------------------------------
-- EventHandler

function Ugly.spawnmsg.eventHandler:onEvent(_event)
  local status, err = pcall(function(_event)

    if _event == nil then
      return false

    elseif _event.id == world.event.S_EVENT_MARK_ADDED or _event.id == world.event.S_EVENT_MARK_CHANGE then --new marker added
      env.info("UGLY: Handled S_EVENT_MARK_ADDED: " .. _event.id)

      Ugly.storeMarker(_event)

      return true
    elseif _event.id == world.event.S_EVENT_MARK_REMOVED then --new marker removed
      env.info("UGLY: Handled S_EVENT_MARK_REMOVED: " .. _event.id)

      Ugly.removeMarker(_event)

      return true
    end

    if _event.initiator == nil then
        return false

    elseif _event.id == world.event.S_EVENT_PLAYER_ENTER_UNIT or _event.id == world.event.S_EVENT_TOOK_CONTROL then --player entered unit
      env.info("UGLY: Handled S_EVENT_PLAYER_ENTER_UNIT and S_EVENT_TOOK_CONTROL: " .. _event.id)

      if  _event.initiator:getPlayerName() then

        Ugly.currentPlayers[_event.initiator:getPlayerName()] = _event.initiator:getTypeName()

      end

      return true
    elseif _event.id == world.event.S_EVENT_PLAYER_LEAVE_UNIT then --player leave unit
      env.info("UGLY: Handled S_EVENT_PLAYER_LEAVE_UNIT: " .. _event.id)

      if  _event.initiator:getPlayerName() then

        Ugly.currentPlayers[_event.initiator:getPlayerName()] = nil

      end
      return true
    else
--      env.info("UGLY: Unhandled Event: " .. _event.id)
    end
  end, _event)

  if (not status) then
      env.error(string.format("Error while handling event %s", err),false)
  end

end


Ugly.trackEvents = function ()
  world.addEventHandler(Ugly.spawnmsg.eventHandler)
end

-----------------------------------------------------------------------------------------
-- Handle Groups Position

Ugly.SaveUnits = {}
Ugly.AllGroups = {}

Ugly.RestoreObjectPositions = function()
  if Ugly.file_exists(Ugly.unitsPosFile) then --Script has been run before, so we need to load the save
    env.info("UGLY: Existing database, loading from file.")
  --    Ugly.AllGroups:ForEachGroup(function (grp)
  --      grp:Destroy()
  --    end)

    dofile(Ugly.unitsPosFile)
    local tempTable={}

     --RUN THROUGH THE KEYS IN THE TABLE (GROUPS)
    for k,v in pairs (Ugly.SaveUnits) do
      units={}
      --RUN THROUGH THE UNITS IN EACH GROUP
      for i= 1, #(Ugly.SaveUnits[k]["units"]) do 
        tempTable =
        { 
          ["type"]=Ugly.SaveUnits[k]["units"][i]["type"],
          ["transportable"]= true, 
          --["unitId"]=9000,used to generate ID's here but no longer doing that since DCS seems to handle it
          ["skill"]="Average",
          ["y"]=Ugly.SaveUnits[k]["units"][i]["y"] ,
          ["x"]=Ugly.SaveUnits[k]["units"][i]["x"] ,
          ["name"]=Ugly.SaveUnits[k]["units"][i]["name"],
          ["heading"]=Ugly.SaveUnits[k]["units"][i]["heading"],
          ["playerCanDrive"]=true,  --hardcoded but easily changed.  
        }

--        trigger.action.outText("Restore Unit: "..Ugly.SaveUnits[k]["units"][i]["name"]..", Heading: "..Ugly.SaveUnits[k]["units"][i]["heading"], 10)
        env.info("UGLY: Restore Unit: "..Ugly.SaveUnits[k]["units"][i]["name"]..", Heading: "..Ugly.SaveUnits[k]["units"][i]["heading"])

        table.insert(units,tempTable)

        local DeleteUnit = UNIT:FindByName( Ugly.SaveUnits[k]["units"][i]["name"] )
  
        if DeleteUnit ~= nil then
          DeleteUnit:Destroy()	
        end
      end --end unit for loop

      local groupData = 
      {
        ["visible"] = true,
        ["tasks"] = {}, -- end of ["tasks"]
        ["uncontrollable"] = false,
        ["task"] = "Ground Nothing",
        ["hidden"] = false,
        ["units"] = units,
        ["y"] = Ugly.SaveUnits[k]["y"],
        ["x"] = Ugly.SaveUnits[k]["x"],
        ["name"] = Ugly.SaveUnits[k]["name"],
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

      coalition.addGroup(Ugly.SaveUnits[k]["CountryID"], Ugly.SaveUnits[k]["CategoryID"], groupData)
      groupData = {}
    end --end Group for loop
  else --Save File does not exist we start a fresh table, no spawns needed
    Ugly.SaveUnits={}
  end
end

Ugly.DoSaveObjectPositions = function(timeloop, time)
  local RelevantGroups = SET_GROUP:New()

  Ugly.AllGroups:ForEachGroupAlive(function (grp)
    local DCSgroup = Group.getByName(grp:GetName() )
    if Ugly.startsWith(grp:GetName(), "S_") then
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

    local _unittable={}

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

    Ugly.SaveUnits[grp:GetName()] =
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

  newMissionStr = Ugly.IntegratedserializeWithCycles("Ugly.SaveUnits",Ugly.SaveUnits) --save the Table as a serialised type with key Ugly.SaveUnits
  Ugly.writemission(newMissionStr, Ugly.unitsPosFile)--write the file from the above to Ugly.SaveUnits.lua
  Ugly.SaveUnits={}--clear the table for a new write.
  env.info("UGLY: Unit positions saved.")

  return time + Ugly.saveInterval
end


Ugly.StartObjectPositionRecorder = function ()
  Ugly.unitsPosFile = Ugly.PersistencePath.."\\"..Ugly.unitsPosFile

  Ugly.RestoreObjectPositions()

  Ugly.AllGroups = SET_GROUP:New():FilterCategories("ground"):FilterActive(true):FilterStart()
  --Ugly.AllGroups:HandleEvent(EVENTS.Birth) -- Player and AI Aircraft as statics

  timer.scheduleFunction(Ugly.DoSaveObjectPositions, {}, timer.getTime() + Ugly.saveInterval)
end



-- Framework END
-----------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------
--//// MAIN persistence function

-- Just for event handling. Should be done differently
Ugly.DeadUnitsList = SET_UNIT:New()

Ugly.StartDeathRecorder = function()

  local DeletedUnitCount = 0
  local DeletedStaticCount = 0

  --////LOAD UNITS
  
  if Ugly.checkPersistence() then
    if Ugly.file_exists(Ugly.UnitsFilePath) then
--    if false then
      Ugly.messageToAll("Loading: "..Ugly.UnitsFilePath)

      dofile(Ugly.UnitsFilePath)

      Ugly.messageToAll("Unit Table Length Is "..#Ugly.unitDeadList)

      for i = 1, #Ugly.unitDeadList do
        Ugly.messageToAll("Dead Unit Element "..i.." Is "..Ugly.unitDeadList[i]["name"])

        Ugly.substituteAndKillUnit(Ugly.unitDeadList[i])
        DeletedUnitCount = DeletedUnitCount + 1
      end
    else
      Ugly.messageToAll("Creating data for: "..Ugly.UnitsFilePath)
      Ugly.unitDeadList = {}
    end

    Ugly.messageToAll("Persistent World Functions Have Removed "..DeletedUnitCount.." Units")

    --////LOAD STATICS
    if Ugly.file_exists(Ugly.StaticsFilePath) then
      Ugly.messageToAll("Loading: "..Ugly.StaticsFilePath)
	    env.info( "Loading: "..Ugly.StaticsFilePath )

  	  dofile(Ugly.StaticsFilePath)
		
      Ugly.messageToAll("Static Table Length Is "..#Ugly.staticDeadList)
	    env.info( "Static Table Length Is "..#Ugly.staticDeadList )
	  
  	  for i = 1, #Ugly.staticDeadList do
        Ugly.substituteAndKillStatic(Ugly.staticDeadList[i])
        DeletedStaticCount = DeletedStaticCount + 1
      end	
    else
      Ugly.messageToAll("Creating data for: "..Ugly.StaticsFileName)
  	  Ugly.staticDeadList = {}
    end

    Ugly.messageToAll("Persistent World Functions Have Removed "..DeletedStaticCount.." Statics")

--SCHEDULE
    timer.scheduleFunction(Ugly.SaveUglyUnitDeadLists, {}, timer.getTime() + Ugly.saveInterval)

    --  Ugly.DeadUnitsList:FilterCoalitions("red"):FilterCategories("ground"):FilterActive(true):FilterStart()
    Ugly.DeadUnitsList:HandleEvent(EVENTS.Dead)
    Ugly.DeadUnitsList:HandleEvent(EVENTS.Crash) -- Player and AI Aircraft as statics

    Ugly.messageToAll("Ugly Persistence is active. Unit list will be stored every "..Ugly.saveInterval.." seconds.")
    ---------------------------------------------------------------------------------------------------------------------------------------------------
  else
    Ugly.messageToAll("Ugly Persistence not available!")
  end
end


---------------------------------------------------------------------------------------------------------------------------------------------------
-- Event Handling - Handle OnEventDead for Units and Statics and OnEventCrash for player

Ugly.dumpToTable = function (_theTable, DEADUNIT)
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
    ["heading"]=routines.utils.toRadian(DEADUNIT:GetHeading()),
    ["shape_name"]=DEADUNIT:GetTypeName(),
    ["dead"] = true,
  }

  table.insert(_theTable, deadObj)
end

function Ugly.DeadUnitsList:OnEventDead(EventData)
  local DEADUNIT = EventData.IniUnit
  local DEADUNITNAME = EventData.IniDCSUnitName
  local DEADUNITCOALITION = EventData.IniCoalition
  local DEADUNITOBJECTCATEGORY = EventData.IniObjectCategory  -- 1 UNIT / 2 WEAPON / 3 STATIC / 4 BASE / 5 SCENERY / 6 CARGO
  local DEADUNITCATEGORY = EventData.IniCategory        -- 0 AIRPLANE / 1 HELICOPTER / 2 GROUND_UNIT / 3 SHIP / 4 STRUCTURE

--  Ugly.messageToAll("Ugly.DeadUnitsList:OnEventDead "..DEADUNITNAME)

    --Debug Zone
--    Ugly.messageToAll("Dead Unit Name: "..DEADUNITNAME)
--    Ugly.messageToAll("Dead Unit Coalition: "..DEADUNITCOALITION)
--    Ugly.messageToAll("Dead Unit Category: "..DEADUNITCATEGORY)
--    Ugly.messageToAll("Dead Unit Object Category: "..DEADUNITOBJECTCATEGORY)

  if DEADUNIT ~= nil then
   if ( DEADUNITOBJECTCATEGORY == 1 ) then -- UNIT
     if ( DEADUNITCATEGORY == 2 or DEADUNITCATEGORY == 3 ) then -- GROUND_UNIT or SHIP
      Ugly.messageToAll("PERSISTED! Dead Unit ["..DEADUNITNAME.."]")
       Ugly.dumpToTable(Ugly.unitDeadList, DEADUNIT)
     end
    elseif ( DEADUNITOBJECTCATEGORY == 3 ) then -- STATIC
      Ugly.messageToAll("PERSISTED! Dead Static ["..DEADUNITNAME.."]")
      Ugly.dumpToTable(Ugly.staticDeadList, DEADUNIT)
    end		
  end

  local DEADDCSUNIT = EventData.IniDCSUnit
  DEADDCSUNIT:destroy()
end

function Ugly.DeadUnitsList:OnEventCrash(EventData)
  local DEADUNIT = EventData.IniUnit
  local DEADUNITNAME = EventData.IniDCSUnitName
  local DEADUNITCOALITION = EventData.IniCoalition
  local DEADUNITOBJECTCATEGORY = EventData.IniObjectCategory  -- 1 UNIT / 2 WEAPON / 3 STATIC / 4 BASE / 5 SCENERY / 6 CARGO
  local DEADUNITCATEGORY = EventData.IniCategory        -- 0 AIRPLANE / 1 HELICOPTER / 2 GROUND_UNIT / 3 SHIP / 4 STRUCTURE

--  Ugly.messageToAll("Ugly.DeadUnitsList:OnEventCrash "..DEADUNITNAME)

    --Debug Zone
  Ugly.messageToAll("Dead Unit Name: "..DEADUNITNAME)
  Ugly.messageToAll("Dead Unit Coalition: "..DEADUNITCOALITION)
  Ugly.messageToAll("Dead Unit Category: "..DEADUNITCATEGORY)
  Ugly.messageToAll("Dead Unit Object Category: "..DEADUNITOBJECTCATEGORY)

  if DEADUNIT ~= nil then
    if ( DEADUNITOBJECTCATEGORY == 1 ) then -- UNIT
      if ( DEADUNITCATEGORY == 0 or DEADUNITCATEGORY == 1 ) then -- Aircraft or Helicopter
        Ugly.messageToAll("PERSISTED! Dead Static ["..DEADUNITNAME.."]")
        Ugly.dumpToTable(Ugly.staticDeadList, DEADUNIT)
	  end
	end
  end		
end

---------------------------------------------------------------------------------------------------------------------------------------------------
-- Recreation of CTLD/CSAR Data: FOBs, Crates, JTACs, Crashed Pilots

Ugly.Rebuild_CTLD_CSAR_Data = function ()
  if Ugly.file_exists(Ugly.ctldDataFile) then --Script has been run before, so we load previous data
    env.info("UGLY: Recreating CTLD and CSAR data.")

    dofile(Ugly.ctldDataFile)

    if #FOBs == 0 then
      env.info("UGLY: No FOBs stored yet.")
    end

    --  RUN THROUGH THE KEYS IN THE TABLE 
    for i = 1, #FOBs do
      local _country = FOBs[i]["country"]
      local _coalition = FOBs[i]["coalition"]
      local _name = FOBs[i]["name"]
      local _point = { x = FOBs[i]["x"], y = 0, z = FOBs[i]["z"]}

      ctld.createNewFOB(_country, _coalition, _point, _name)
    end

    if #Crates == 0 then
      env.info("UGLY: No Crates stored yet.")
    end

    --  RUN THROUGH THE KEYS IN THE TABLE 
    for k,v in pairs (Crates) do
      local _name = k
      local _country = Crates[k]["country"]
      local _side = Crates[k]["side"]
      local _weight = Crates[k]["weight"]
      local _point = { x = Crates[k]["x"], y = 0, z = Crates[k]["z"]}

      local unitId = ctld.getNextUnitId();
      env.info("UGLY: Creating Crate with unitID: " .. unitId)

      ctld.spawnCrateStatic(_country, unitId, _point, _name, _weight, _side)
    end
  else
    env.info("UGLY: No FOBs stored yet.")
  end

  -- Just check the complete list of objects once and all persisted CTLD objects back to the CTLD List
  trigger.action.outText("Restoring CTLD objects!", 10)
  local RestoreGroups = SET_GROUP:New():FilterActive(true):FilterStart()

  RestoreGroups:ForEachGroupAlive(function (grp)
    for i = 1, #grp:GetUnits() do

    -------------------------------------------
    -- Check for CTLD JTAC
      if Ugly.startsWith(grp:GetUnit(i):GetName(), "Unpacked Hummer") then
        local _code = table.remove(ctld.jtacGeneratedLaserCodes, 1)
        --put to the end
        table.insert(ctld.jtacGeneratedLaserCodes, _code)

        ctld.JTACAutoLase(grp:GetName(), _code)
        trigger.action.outText("Restoring JTAC status of: "..grp:GetName()..", with laser code: ".._code, 10)

      -------------------------------------------
      -- Check for CSAR Guy
      elseif Ugly.startsWith(grp:GetName(), "Downed Pilot") then

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
      elseif Ugly.startsWith(grp:GetName(), "Deployed FOB") then
        local _standin = grp:GetDCSObject()
        local _standinUnit = grp:GetDCSUnit(i)

        ctld.createNewFOB(_standinUnit:getCountry(), _standin:getCoalition(), _standinUnit:getPoint(), _standinUnit:getName())
        grp:Destroy()
      end
    end
  end
  )

end

--////SAVE UNITS FUNCTION
Ugly.SaveUglyFOBList = function(timeloop, time)
--  env.info("UGLY: FOBs will be saved...")
  local fobMissionStr   = Ugly.IntegratedserializeWithCycles("FOBs", ctld.uglyFOBList) --save the Table as a serialised type with key FOBs
  local crateMissionStr = Ugly.IntegratedserializeWithCycles("Crates", ctld.uglyCrateList) --save the Table as a serialised type with key FOBs

  Ugly.writemission(fobMissionStr..crateMissionStr, Ugly.ctldDataFile)--write the file from the above to Ugly.ctldDataFile
--  env.info("UGLY: FOBs have been saved! "..newMissionStr)
--  env.info("UGLY: FOBs have been saved!")
  return time + Ugly.saveInterval
end

Ugly.StartCTLDCSARRecorder = function()
  Ugly.ctldDataFile = Ugly.PersistencePath.."\\"..Ugly.ctldDataFile
  -- Load and create old FOBs
  Ugly.Rebuild_CTLD_CSAR_Data()

  --THE SAVING SCHEDULE
  timer.scheduleFunction(Ugly.SaveUglyFOBList, {}, timer.getTime() + Ugly.saveInterval)
end

-----------------------------------------------------------------------------------------
--//// Start Framework

Ugly.messageToAll("Trying to start Ugly Persistence!")
Ugly.StartDeathRecorder()
Ugly.AddMarkerToStatics(Ugly.AutoRecceMarker)
Ugly.StartMarkerRecorder()
Ugly.StartObjectPositionRecorder()
Ugly.StartCTLDCSARRecorder();


-----------------------------------------------------------------------------------------
-- Testing



