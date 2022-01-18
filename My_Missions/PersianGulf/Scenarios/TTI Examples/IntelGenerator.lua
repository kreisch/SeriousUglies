msnType = ""
function getZoneIntel(msnType, zoneName, msnNumber, wptNumber)
		if msnType == "MR" then
			msnTypeVar = abv_mrMissionTypeStr
		elseif msnType == "AG" then
			msnTypeVar = abv_agMissionTypeStr
		elseif msnType == "AGH" then
			msnTypeVar = abv_aghMissionTypeStr
		elseif msnType == "INF" then
			msnTypeVar = abv_infasMissionTypeStr
		elseif msnType == "AS" then
			msnTypeVar = abv_asMissionTypeStr
		end
	zoneName_coord = zoneName:GetCoordinate()
	zoneName_coord_grid = zoneName_coord:ToStringGRID() -- requires custom Utils in Moose Lua
	zoneName_wpt_number = wptNumber
	zoneName_msn_number = msnNumber
		if wptNumber == 0 then
			zoneName_intel_str = "-INTEL-> GROUND UNITS at " .. zoneName_coord_grid.. ", [" .. msnTypeVar .. zoneName_msn_number .."]"
		elseif wptNumber >= 1 then
			zoneName_intel_str = "-INTEL-> GROUND UNITS at " .. zoneName_coord_grid.. ", [" .. msnTypeVar .. zoneName_msn_number .."] [WPT-".. zoneName_wpt_number .. "] [LSR ".. jtac_laser_code.."]"
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