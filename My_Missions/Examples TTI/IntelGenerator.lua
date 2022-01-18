msnType = ""

---------- Split Utility
function _split(str, sep)
	local result = {}
	local regex = ("([^%s]+)"):format(sep)
	for each in str:gmatch(regex) do
		table.insert(result, each)
	end

	return result
end

function toStringGrid(mgrsString)
	local substitution  = string.sub(mgrsString, 10)
	local splitIt = _split(substitution, " ")
	local Northing = string.sub(splitIt[2], 1, 1)
	local Easting = string.sub(splitIt[3], 1, 1)
	substitution = string.gsub(substitution, " ", Northing..Easting.." ", 1)
	substitution = string.sub(substitution, 1,4)
	return substitution
end

function getZoneGrid(zoneName)
	zoneName_coord = zoneName:GetCoordinate()
	zoneName_coord_grid = toStringGrid(zoneName_coord:ToStringMGRS())
	return zoneName_coord_grid
end

function getZoneIntel(msnType, zoneName, msnNumber, wptNumber)
		if msnType == "MR" then
			msnTypeVar = abv_mrMissionTypeStr
			msnUnitCount = currentCountMR
		elseif msnType == "AG" then
			msnTypeVar = abv_agMissionTypeStr
			msnUnitCount = currentCountAG
		elseif msnType == "AGH" then
			msnTypeVar = abv_aghMissionTypeStr
			msnUnitCount = currentCountAGH
		elseif msnType == "INF" then
			msnTypeVar = abv_infasMissionTypeStr
			msnUnitCount = currentCountAGHIA
		elseif msnType == "AS" then
			msnTypeVar = abv_asMissionTypeStr
			msnUnitCount = currentCountAS
		end
		
		if msnType == "AS" then
			enemyStrType = "ENEMY VESSELS"
		else
			enemyStrType = "ENEMY UNITS"
		end
		
	zoneName_coord = zoneName:GetCoordinate()
	--zoneName_coord_grid = zoneName_coord:ToStringGRID() -- requires custom Utils in Moose Lua
	zoneName_coord_grid = getZoneGrid(zoneName) -- requires custom Utils in Moose Lua
	zoneName_wpt_number = wptNumber
	zoneName_msn_number = msnNumber
		if wptNumber == 0 then
			--zoneName_intel_str = "-INTEL-> GROUND UNITS at " .. zoneName_coord_grid.. ", [" .. msnTypeVar .. zoneName_msn_number .."]"
			zoneName_intel_str = "-INTEL-> [".. msnUnitCount .."] " .. enemyStrType.. " remain at " .. zoneName_coord_grid.. ", [" .. msnTypeVar .. zoneName_msn_number .."]"
		elseif wptNumber >= 1 then
			--zoneName_intel_str = "-INTEL-> GROUND UNITS at " .. zoneName_coord_grid.. ", [" .. msnTypeVar .. zoneName_msn_number .."] [WPT-".. zoneName_wpt_number .. "] [LSR ".. jtac_laser_code.."]"
			zoneName_intel_str = "-INTEL-> [".. msnUnitCount .."] " .. enemyStrType.. " remain at " .. zoneName_coord_grid.. ", [" .. msnTypeVar .. zoneName_msn_number .."] [WPT-".. zoneName_wpt_number .. "] [LSR ".. jtac_laser_code.."]"
		end
	zoneName_intel_str_full = zoneName_intel_str
	return
		zoneName_intel_str_full
end

function getZoneCoords(zoneName)
	zoneName_coord = zoneName:GetCoordinate()
	zoneName_coord_dms = zoneName_coord:ToStringLLDMS()
	zoneName_coord_dmm = zoneName_coord:ToStringLLDDM()
	zoneName_coord_mgrs = zoneName_coord:ToStringMGRS()
	zoneName_coord_alt = zoneName_coord:GetLandHeight()
	zoneName_coord_alt_str = " | ELEV: " .. math.floor(UTILS.MetersToFeet(zoneName_coord_alt)) .. " FT"
	zoneName_coord_str = zoneName_coord_dms .. zoneName_coord_alt_str .. "\n" .. zoneName_coord_dmm .. " | " .. zoneName_coord_mgrs
	zoneName_coord_str_full = zoneName_coord_str
	return 
		zoneName_coord_str_full
end