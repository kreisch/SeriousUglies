

local ExportPosIntervall = 5
local exportRedUnits = true
local unitsPosFile = "C:\\Users\\Phil\\Google Drive (uglyskyfire@gmail.com)\\Missions\\UglyWeb\\SyriaLive247\\mapdata\\Syria247.json" --edit this to represent your own (DCS cant write to different disks)
local markerPosFile = "C:\\Users\\Phil\\Google Drive (uglyskyfire@gmail.com)\\Missions\\UglyWeb\\SyriaLive247\\mapdata\\Syria247Marker.json" --edit this to represent your own (DCS cant write to different disks)


local require = require
local loadfile = loadfile

	
--local JSON = loadfile("Scripts\\JSON.lua")()

--if JSON ~= nil then
--	env.info("UGLY: JSON available...")
--else
--	env.info("UGLY: JSON NOT available!")
--end


-- open file and structure
local fileString = ""

function writemission(data, file)--Function for saving to file (commonly found)
  File = io.open(file, "w")
  
  if File ~= nil then
	  File:write(data)
	  File:close()
  end
end

function startsWith(_toCheckString, _toFindString)
  return _toCheckString:sub(1, #_toFindString) == _toFindString
end

function writeDataset(_desc, _icon, _lon, _lat)

	local descString = _desc:gsub("%\n", "<br>")

	local newMarkerStr = "\t\t{\n"
	newMarkerStr = newMarkerStr.."\t\t\"d\": \""..descString.."\",\n"
	newMarkerStr = newMarkerStr.."\t\t\"i\": \"".._icon.."\",\n"
	newMarkerStr = newMarkerStr.."\t\t\"x\": ".._lon..",\n"
	newMarkerStr = newMarkerStr.."\t\t\"y\": ".._lat.."\n"
	newMarkerStr = newMarkerStr.."\t\t}" 
	return newMarkerStr
end

function getCoordFromGroup(_grp)
	local _x = 0 
	local _y = 0 
	local _z = 0 

	for i = 1, #_grp:GetUnits() do
		_x = _x + _grp:GetUnit(i):GetCoordinate().x
		_y = _y + _grp:GetUnit(i):GetCoordinate().y
		_z = _z + _grp:GetUnit(i):GetCoordinate().z
	end

	if #_grp:GetUnits() ~= 0 then
		_x = _x / #_grp:GetUnits()
		_y = _y / #_grp:GetUnits()
		_z = _z / #_grp:GetUnits()
	end

	local newCoord = COORDINATE:New(_x, _y, _z)
	return newCoord
end

function writeMarkerToJson()
	if Ugly.JSON then
		env.info("UGLY: Store Marker JSON!")

    local jsonMarkerStr = "{\n\t\"features\": [\n"
    local markerCount = 0

    for k,v in pairs(Ugly.userMarker) do
			markerCount = markerCount + 1
			local _userMarker = Ugly.userMarker[k]
			
			local newCoord = COORDINATE:New(Ugly.userMarker[k].pos.x, Ugly.userMarker[k].pos.y, Ugly.userMarker[k].pos.z)
			local lat, lon = coord.LOtoLL(newCoord)

			local initiatorName = "Unknown"
		  local debugStr = Ugly.IntegratedserializeWithCycles("Ugly.userMarker[k].initiator", Ugly.userMarker[k].initiator)
			env.info("UGLY: Ugly.userMarker[k].initiator = " .. debugStr)


			if Ugly.userMarker[k].playerName ~= nil then
				initiatorName = Ugly.userMarker[k].playerName
			end

			env.info("UGLY: initiatorName = " .. initiatorName)

			jsonMarkerStr = jsonMarkerStr .. writeDataset("Reccon by: " .. initiatorName .. "<br>" .. Ugly.userMarker[k].text, "markerreccon", lon, lat)
			jsonMarkerStr = jsonMarkerStr .. ",\n"
    end

		for k,v in pairs(Ugly.autoMarker) do
			markerCount = markerCount + 1
			local _autoMarker = Ugly.autoMarker[k]
			
			local newCoord = COORDINATE:New(Ugly.autoMarker[k].pos.x, Ugly.autoMarker[k].pos.y, Ugly.autoMarker[k].pos.z)
			local lat, lon = coord.LOtoLL(newCoord)
			jsonMarkerStr = jsonMarkerStr .. writeDataset(Ugly.autoMarker[k].text, "markertactical", lon, lat)

			jsonMarkerStr = jsonMarkerStr .. ",\n"
    end

   	-- remove last comma
    if markerCount > 0 then
      jsonMarkerStr = jsonMarkerStr:sub(1, -3)
    end

    jsonMarkerStr = jsonMarkerStr.."\n"

    -- Close the file
    jsonMarkerStr = jsonMarkerStr.."\t]\n}"

    Ugly.writemission(jsonMarkerStr, markerPosFile)   --write the file from the above to markerPosFile
		env.info("jsonMarkerStr!\n" .. jsonMarkerStr)
  end
end

function writeObjectsToJson()
	--SCRIPT START
	env.info("Store current groups to JSON!")

	-- HEADER
	fileString = "{\n\t\"features\": [\n"

	------------------------------------------------------------
	-- first write blue guys. all!
	local ExportGroups = SET_GROUP:New():FilterCoalitions( "blue" ):FilterActive(true):FilterStart()

	ExportGroups:ForEachGroupAlive(function (grp)
		local iconName = "blue"

		if Ugly.startsWith(grp:GetName(), "Downed Pilot") then
		  iconName = "markerdownedpilot"
		elseif grp:GetCategory() == 0 then
		  iconName = iconName.."airfixed"
		elseif grp:GetCategory() == 1 then
		  iconName = iconName.."airrotary"
		elseif grp:GetCategory() == 2 then
		  iconName = iconName.."ground"
		elseif grp:GetCategory() == 3 then
		  iconName = iconName.."water"
		else
		  iconName = iconName.."ground"
		end

		local checkMore = true
		for i = 1, #grp:GetUnits() do
--			env.info("grp:GetUnit(i):GetTypeName() " .. grp:GetUnit(i):GetTypeName() )
			if grp:GetUnit(i):GetTypeName() == "Soldier M4" and checkMore == true then
				local lat, lon = coord.LOtoLL(getCoordFromGroup(grp))
				fileString = fileString..writeDataset("Unit of " .. #grp:GetUnits() .. " Soldier M4" , iconName, lon, lat)
				fileString = fileString..",\n"
				checkMore = false
			end
		end

		if checkMore ~= false then
			-- If group starts with "S_" treat as one entity
			if startsWith(grp:GetName(), "S_") then
				-- collect as one entity
				local grpDesc = ""
				if #grp:GetUnits() > 1 then
					grpDesc = "Group of Units:<br>"
				else
					grpDesc = "Single Unit:<br>"
				end

				for i = 1, #grp:GetUnits() do
					grpDesc = grpDesc .. grp:GetUnit(i):GetDesc().displayName
					if i < #grp:GetUnits() then
						grpDesc = grpDesc .. ", "
					end
				end

				-- Maybe calculate the center point from all units.
				local lat, lon = coord.LOtoLL(getCoordFromGroup(grp))
				fileString = fileString..writeDataset(grpDesc, iconName, lon, lat)
				fileString = fileString..",\n"
			else
				for i = 1, #grp:GetUnits() do
					local lat, lon = coord.LOtoLL(grp:GetUnit(i):GetCoordinate())
					fileString = fileString..writeDataset("Single Unit:<br>" .. grp:GetUnit(i):GetDesc().displayName, iconName, lon, lat)
					fileString = fileString..",\n"
				end
			end
		end
	end
	)

	---------------------------------
	-- Now the red ones

	if exportRedUnits then
		ExportGroups = SET_GROUP:New():FilterCoalitions( "red" ):FilterActive(true):FilterStart()

		ExportGroups:ForEachGroupAlive(function (grp)
			if startsWith(grp:GetName(), "S_") ~= true then

				local iconName = "red"

				if grp:GetCategory() == 0 then
					iconName = iconName.."airfixed"
				elseif grp:GetCategory() == 1 then
					iconName = iconName.."airrotary"
				elseif grp:GetCategory() == 2 then
					iconName = iconName.."ground"
				elseif grp:GetCategory() == 3 then
					iconName = iconName.."water"
				else
					iconName = iconName.."ground"
				end

				-- Collect everything. No single units
				local grpDesc = ""
				if #grp:GetUnits() > 1 then
					grpDesc = "Group of Units:<br>"
				else
					grpDesc = "Single Unit:<br>"
				end

				for i = 1, #grp:GetUnits() do
					grpDesc = grpDesc .. grp:GetUnit(i):GetDesc().displayName
					if i < #grp:GetUnits() then
						grpDesc = grpDesc .. ", "
					end
				end

				-- Maybe calculate the center point from all units.
				local lat, lon = coord.LOtoLL(getCoordFromGroup(grp))
				fileString = fileString..writeDataset(grpDesc, iconName, lon, lat)
				fileString = fileString..",\n"
			end
		end
		)
	end

	---------------------------------
	-- Now the neutral ones
	ExportGroups = SET_GROUP:New():FilterCoalitions( "neutral" ):FilterActive(true):FilterStart()

	ExportGroups:ForEachGroupAlive(function (grp)
		if startsWith(grp:GetName(), "S_") ~= true then

			local iconName = "neutral"

			if grp:GetCategory() == 0 then
				iconName = iconName.."airfixed"
			elseif grp:GetCategory() == 1 then
				iconName = iconName.."airrotary"
			elseif grp:GetCategory() == 2 then
				iconName = iconName.."ground"
			elseif grp:GetCategory() == 3 then
				iconName = iconName.."water"
			else
				iconName = iconName.."ground"
			end

			-- Collect everything. No single units
			local grpDesc = ""
			if #grp:GetUnits() > 1 then
				grpDesc = "Group of Units:<br>"
			else
				grpDesc = "Single Unit:<br>"
			end

			for i = 1, #grp:GetUnits() do
				grpDesc = grpDesc .. grp:GetUnit(i):GetDesc().displayName
				if i < #grp:GetUnits() then
					grpDesc = grpDesc .. ", "
				end
			end

			-- Maybe calculate the center point from all units.
			local lat, lon = coord.LOtoLL(getCoordFromGroup(grp))
			fileString = fileString..writeDataset(grpDesc, iconName, lon, lat)
			fileString = fileString..",\n"
		end
	end
	)


	-- remove last comma
	fileString = fileString:sub(1, -3)
	fileString = fileString.."\n"

	-- Close the file
	fileString = fileString.."\t]\n}"

  Ugly.writemission(fileString, unitsPosFile)

end -- writeObjectsToJson

--THE SAVING SCHEDULE
SCHEDULER:New( nil, function()
	writeObjectsToJson()
	writeMarkerToJson();
	
end, {}, 2, ExportPosIntervall)

--timer.scheduleFunction(writeCurrentPositions, {}, timer.getTime() + ExportPosIntervall)
