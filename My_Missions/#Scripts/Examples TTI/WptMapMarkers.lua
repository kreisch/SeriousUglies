env.info("TTI: WAYPOINT MAPMARKERS initializing...")


--Mission type strings
agMissionTypeStr = "Air to Ground Hard Mission "
mrMissionTypeStr = "Air to Ground Easy Mission "
mraMissionTypeStr = "Air to Ground Easy-A Mission "
mrbMissionTypeStr = "Air to Ground Easy-B Mission "
agnMissionTypeStr = "Air to Ground Normal Mission "
agnaMissionTypeStr = "Air to Ground Normal-A Mission "
agnbMissionTypeStr = "Air to Ground Normal-B Mission "
aghMissionTypeStr = "Air to Ground Helo Mission "
infasMissionTypeStr = "Infantry Assault Mission "
asMissionTypeStr = "Anti-Ship Mission "
dsMissionTypeStr = "Deep Strike Mission "

-- abrv. Mission type strings
abv_agMissionTypeStr = "A2G Hard Mission "
abv_mrMissionTypeStr = "A2G Easy Mission "
abv_mraMissionTypeStr = "A2G Easy-A Mission "
abv_mrbMissionTypeStr = "A2G Easy-B Mission "
abv_agnMissionTypeStr = "A2G Normal Mission "
abv_agnaMissionTypeStr = "A2G Normal-A Mission "
abv_agnbMissionTypeStr = "A2G Normal-B Mission "
abv_aghMissionTypeStr = "A2G Helo Mission "
abv_infasMissionTypeStr = "Infantry Assault Mission "
abv_asMissionTypeStr = "Anti-Ship Mission "
abv_dsMissionTypeStr = "Deep Strike Mission "

--AG Map marker Text1
ag_id = {}
AGMM = {}
AGMM.Text1 = 	agMissionTypeStr .. "1 [WPT 11]"
AGMM.Text2 = 	agMissionTypeStr .. "2 [WPT 12]"
AGMM.Text3 = 	agMissionTypeStr .. "3 [WPT 13]"
AGMM.Text4 = 	agMissionTypeStr .. "4 [WPT 14]"
AGMM.Text5 = 	agMissionTypeStr .. "5 [WPT 15]"
AGMM.Text6 = 	agMissionTypeStr .. "6 [WPT 16]"
AGMM.Text7 = 	agMissionTypeStr .. "7 [WPT 17]"
AGMM.Text8 = 	agMissionTypeStr .. "8 [WPT 18]"
AGMM.Text9 = 	agMissionTypeStr .. "9 [WPT 19]"
AGMM.Text10 =	agMissionTypeStr .. "10 [WPT 20]"

--MR
mr_id = {}

MRMM = {}
MRMM.Text1 = 	mrMissionTypeStr .. "1 [WPT 1]"
MRMM.Text2 = 	mrMissionTypeStr .. "2 [WPT 2]"
MRMM.Text3 = 	mrMissionTypeStr .. "3 [WPT 3]"
MRMM.Text4 = 	mrMissionTypeStr .. "4 [WPT 4]"
MRMM.Text5 = 	mrMissionTypeStr .. "5 [WPT 5]"
MRMM.Text6 = 	mrMissionTypeStr .. "1 [WPT 6]"
MRMM.Text7 = 	mrMissionTypeStr .. "2 [WPT 7]"
MRMM.Text8 = 	mrMissionTypeStr .. "3 [WPT 8]"
MRMM.Text9 = 	mrMissionTypeStr .. "4 [WPT 9]"
MRMM.Text10 =	mrMissionTypeStr .. "5 [WPT 10]"

--ASS
as_id = {}

ASSMM = {}
ASSMM.Text1 = 	asMissionTypeStr .. "1"
ASSMM.Text2 = 	asMissionTypeStr .. "2"
ASSMM.Text3 = 	asMissionTypeStr .. "3"
ASSMM.Text4 = 	asMissionTypeStr .. "4"
ASSMM.Text5 = 	asMissionTypeStr .. "5"


--AGH
agh_id = {}

AGHMM = {}
AGHMM.Text1 = 	aghMissionTypeStr .. "1	[WPT-21]"
AGHMM.Text2 = 	aghMissionTypeStr .. "2	[WPT-22]"
AGHMM.Text3 = 	aghMissionTypeStr .. "3	[WPT-23]"
AGHMM.Text4 = 	aghMissionTypeStr .. "4	[WPT-24]"
AGHMM.Text5 = 	aghMissionTypeStr .. "5	[WPT-25]"

AGHMM.Text6 = 	infasMissionTypeStr .. "6 [WPT-26]"
AGHMM.Text7 = 	infasMissionTypeStr .. "7 [WPT-27]"
AGHMM.Text8 = 	infasMissionTypeStr .. "8 [WPT-28]"
AGHMM.Text9 = 	infasMissionTypeStr .. "9 [WPT-29]"
AGHMM.Text10 =	infasMissionTypeStr .. "10 [WPT-30]"

--INFAS
infas_id = {}

INFASMM = {}
INFASMM.Text1 = 	infasMissionTypeStr .. "1"
INFASMM.Text2 = 	infasMissionTypeStr .. "2"
INFASMM.Text3 = 	infasMissionTypeStr .. "3"
INFASMM.Text4 = 	infasMissionTypeStr .. "4"
INFASMM.Text5 = 	infasMissionTypeStr .. "5"
INFASMM.Text6 = 	infasMissionTypeStr .. "6"
INFASMM.Text7 = 	infasMissionTypeStr .. "7"
INFASMM.Text8 = 	infasMissionTypeStr .. "8"
INFASMM.Text9 = 	infasMissionTypeStr .. "9"
INFASMM.Text10 =	infasMissionTypeStr .. "10"

--AG MAP MARKER TEXT
function create_ag_1_marker()
	ag_id[1] = UTILS.GetMarkID()
	trigger.action.markToAll(ag_id[1],AGMM.Text1 .. "\n\"" .. HardMissionName .. "\"",AG1_vec,true)
end

function create_ag_2_marker()
	ag_id[2] = UTILS.GetMarkID()
	trigger.action.markToAll(ag_id[2],AGMM.Text2 .. "\n\"" .. HardMissionName .. "\"",AG2_vec,true)
end

function create_ag_3_marker()
	ag_id[3] = UTILS.GetMarkID()
	trigger.action.markToAll(ag_id[3],AGMM.Text3 .. "\n\"" .. HardMissionName .. "\"",AG3_vec,true)
end

function create_ag_4_marker()
	ag_id[4] = UTILS.GetMarkID()
	trigger.action.markToAll(ag_id[4],AGMM.Text4 .. "\n\"" .. HardMissionName .. "\"",AG4_vec,true)
end

function create_ag_5_marker()
	ag_id[5] = UTILS.GetMarkID()
	trigger.action.markToAll(ag_id[5],AGMM.Text5 .. "\n\"" .. HardMissionName .. "\"",AG5_vec,true)
end

function create_ag_6_marker()
	ag_id[6] = UTILS.GetMarkID()
	trigger.action.markToAll(ag_id[6],AGMM.Text6 .. "\n\"" .. HardMissionName .. "\"",AG6_vec,true)
end

function create_ag_7_marker()
	ag_id[7] = UTILS.GetMarkID()
	trigger.action.markToAll(ag_id[7],AGMM.Text7 .. "\n\"" .. HardMissionName .. "\"",AG7_vec,true)
end

function create_ag_8_marker()
	ag_id[8] = UTILS.GetMarkID()
	trigger.action.markToAll(ag_id[8],AGMM.Text8 .. "\n\"" .. HardMissionName .. "\"",AG8_vec,true)
end

function create_ag_9_marker()
	ag_id[9] = UTILS.GetMarkID()
	trigger.action.markToAll(ag_id[9],AGMM.Text9 .. "\n\"" .. HardMissionName .. "\"",AG9_vec,true)
end

function create_ag_10_marker()
	ag_id[10] = UTILS.GetMarkID()
	trigger.action.markToAll(ag_id[10],AGMM.Text10 .. "\n\"" .. HardMissionName .. "\"",AG10_vec,true)
end

function remove_ag_marker()
	if mission_markers_enable == true then
		if trigger.misc.getUserFlag('AG1-Inside') == 1 then
			trigger.action.removeMark(ag_id[1])
		end
		
		if trigger.misc.getUserFlag('AG2-Inside') == 1 then
			trigger.action.removeMark(ag_id[2])
		end
		
		if trigger.misc.getUserFlag('AG3-Inside') == 1 then
			trigger.action.removeMark(ag_id[3])
		end
		
		if trigger.misc.getUserFlag('AG4-Inside') == 1 then
			trigger.action.removeMark(ag_id[4])
		end
		
		if trigger.misc.getUserFlag('AG5-Inside') == 1 then
			trigger.action.removeMark(ag_id[5])
		end
	
		if trigger.misc.getUserFlag('AG6-Inside') == 1 then
			trigger.action.removeMark(ag_id[6])
		end
		
		if trigger.misc.getUserFlag('AG7-Inside') == 1 then
			trigger.action.removeMark(ag_id[7])
		end
		
		if trigger.misc.getUserFlag('AG8-Inside') == 1 then
			trigger.action.removeMark(ag_id[8])
		end
		
		if trigger.misc.getUserFlag('AG9-Inside') == 1 then
			trigger.action.removeMark(ag_id[9])
		end
		
		if trigger.misc.getUserFlag('AG10-Inside') == 1 then
			trigger.action.removeMark(ag_id[10])
		end
	end
end

--AGH MAP MARKER TEXT
function create_agh_1_marker()
	agh_id[1] = UTILS.GetMarkID()
	trigger.action.markToAll(agh_id[1],AGHMM.Text1 .. "\n\"" .. HeloMissionName .. "\"",AGH1_vec,true)
end

function create_agh_2_marker()
	agh_id[2] = UTILS.GetMarkID()
	trigger.action.markToAll(agh_id[2],AGHMM.Text2 .. "\n\"" .. HeloMissionName .. "\"",AGH2_vec,true)
end

function create_agh_3_marker()
	agh_id[3] = UTILS.GetMarkID()
trigger.action.markToAll(agh_id[3],AGHMM.Text3 .. "\n\"" .. HeloMissionName .. "\"",AGH3_vec,true)
end

function create_agh_4_marker()
	agh_id[4] = UTILS.GetMarkID()
	trigger.action.markToAll(agh_id[4],AGHMM.Text4 .. "\n\"" .. HeloMissionName .. "\"",AGH4_vec,true)
end

function create_agh_5_marker()
	agh_id[5] = UTILS.GetMarkID()
	trigger.action.markToAll(agh_id[5],AGHMM.Text5 .. "\n\"" .. HeloMissionName .. "\"",AGH5_vec,true)
end

-- function create_agh_6_marker()
	-- agh_id[6] = UTILS.GetMarkID()
	-- trigger.action.markToAll(agh_id[6],AGHMM.Text6,AGH6_vec,true)
-- end

-- function create_agh_7_marker()
	-- agh_id[7] = UTILS.GetMarkID()
	-- trigger.action.markToAll(agh_id[7],AGHMM.Text7,AGH7_vec,true)
-- end

-- function create_agh_8_marker()
	-- agh_id[8] = UTILS.GetMarkID()
	-- trigger.action.markToAll(agh_id[8],AGHMM.Text8,AGH8_vec,true)
-- end

-- function create_agh_9_marker()
	-- agh_id[9] = UTILS.GetMarkID()
	-- trigger.action.markToAll(agh_id[9],AGHMM.Text9,AGH9_vec,true)
-- end

-- function create_agh_10_marker()
	-- agh_id[10] = UTILS.GetMarkID()
	-- trigger.action.markToAll(agh_id[10],AGHMM.Text10,AGH10_vec,true)
-- end

function remove_agh_marker()
	if mission_markers_enable == true then
		if trigger.misc.getUserFlag('AGH1-Inside') == 1 then
			trigger.action.removeMark(agh_id[1])
		end
		
		if trigger.misc.getUserFlag('AGH2-Inside') == 1 then
			trigger.action.removeMark(agh_id[2])
		end
		
		if trigger.misc.getUserFlag('AGH3-Inside') == 1 then
			trigger.action.removeMark(agh_id[3])
		end
		
		if trigger.misc.getUserFlag('AGH4-Inside') == 1 then
			trigger.action.removeMark(agh_id[4])
		end
		
		if trigger.misc.getUserFlag('AGH5-Inside') == 1 then
			trigger.action.removeMark(agh_id[5])
		end
	

	end
end

--INFAS MAP MARKER TEXT
-- function create_infas_1_marker()
	-- infas_id[1] = UTILS.GetMarkID()
	-- trigger.action.markToAll(infas_id[1],INFASMM.Text1,INFAS1_vec,true)
-- end

-- function create_infas_2_marker()
	-- infas_id[2] = UTILS.GetMarkID()
	-- trigger.action.markToAll(infas_id[2],INFASMM.Text2,INFAS2_vec,true)
-- end

-- function create_infas_3_marker()
	-- infas_id[3] = UTILS.GetMarkID()
-- trigger.action.markToAll(infas_id[3],INFASMM.Text3,INFAS3_vec,true)
-- end

-- function create_infas_4_marker()
	-- infas_id[4] = UTILS.GetMarkID()
	-- trigger.action.markToAll(infas_id[4],INFASMM.Text4,INFAS4_vec,true)
-- end

-- function create_infas_5_marker()
	-- infas_id[5] = UTILS.GetMarkID()
	-- trigger.action.markToAll(infas_id[5],INFASMM.Text5,INFAS5_vec,true)
-- end

function create_infas_6_marker()
	infas_id[6] = UTILS.GetMarkID()
	trigger.action.markToAll(infas_id[6],AGHMM.Text6 .. "\n\"" .. InfMissionName .. "\"",AGH6_vec,true)
end

function create_infas_7_marker()
	infas_id[7] = UTILS.GetMarkID()
	trigger.action.markToAll(infas_id[7],AGHMM.Text7 .. "\n\"" .. InfMissionName .. "\"",AGH7_vec,true)
end

function create_infas_8_marker()
	infas_id[8] = UTILS.GetMarkID()
	trigger.action.markToAll(infas_id[8],AGHMM.Text8 .. "\n\"" .. InfMissionName .. "\"",AGH8_vec,true)
end

function create_infas_9_marker()
	infas_id[9] = UTILS.GetMarkID()
	trigger.action.markToAll(infas_id[9],AGHMM.Text9 .. "\n\"" .. InfMissionName .. "\"",AGH9_vec,true)
end

function create_infas_10_marker()
	infas_id[10] = UTILS.GetMarkID()
	trigger.action.markToAll(infas_id[10],AGHMM.Text10 .. "\n\"" .. InfMissionName .. "\"",AGH10_vec,true)
end

function remove_infas_marker()
	if mission_markers_enable == true then
		if trigger.misc.getUserFlag('AGH6-Inside') == 1 then
			trigger.action.removeMark(agh_id[6])
		end
		
		if trigger.misc.getUserFlag('AGH7-Inside') == 1 then
			trigger.action.removeMark(agh_id[7])
		end
		
		if trigger.misc.getUserFlag('AGH8-Inside') == 1 then
			trigger.action.removeMark(agh_id[8])
		end
		
		if trigger.misc.getUserFlag('AGH9-Inside') == 1 then
			trigger.action.removeMark(agh_id[9])
		end
		
		if trigger.misc.getUserFlag('AGH10-Inside') == 1 then
			trigger.action.removeMark(agh_id[10])
		end
	end
end

--ASS MAP MARKER TEXT
function create_as_1_marker()
	as_id[1] = UTILS.GetMarkID()
	trigger.action.markToAll(as_id[1],ASSMM.Text1 .. "\n\"" .. ShipMissionName .. "\"",ASS1_vec,true)
end

function create_as_2_marker()
	as_id[2] = UTILS.GetMarkID()
	trigger.action.markToAll(as_id[2],ASSMM.Text2 .. "\n\"" .. ShipMissionName .. "\"",ASS2_vec,true)
end

function create_as_3_marker()
	as_id[3] = UTILS.GetMarkID()
trigger.action.markToAll(as_id[3],ASSMM.Text3 .. "\n\"" .. ShipMissionName .. "\"",ASS3_vec,true)
end

function create_as_4_marker()
	as_id[4] = UTILS.GetMarkID()
	trigger.action.markToAll(as_id[4],ASSMM.Text4 .. "\n\"" .. ShipMissionName .. "\"",ASS4_vec,true)
end

function create_as_5_marker()
	as_id[5] = UTILS.GetMarkID()
	trigger.action.markToAll(as_id[5],ASSMM.Text5 .. "\n\"" .. ShipMissionName .. "\"",ASS5_vec,true)
end

function remove_as_marker()
	if mission_markers_enable == true then
		if trigger.misc.getUserFlag('ASS1-Inside') == 1 then
			trigger.action.removeMark(as_id[1])
		end
		
		if trigger.misc.getUserFlag('ASS2-Inside') == 1 then
			trigger.action.removeMark(as_id[2])
		end
		
		if trigger.misc.getUserFlag('ASS3-Inside') == 1 then
			trigger.action.removeMark(as_id[3])
		end
		
		if trigger.misc.getUserFlag('ASS4-Inside') == 1 then
			trigger.action.removeMark(as_id[4])
		end
		
		if trigger.misc.getUserFlag('ASS5-Inside') == 1 then
			trigger.action.removeMark(as_id[5])
		end
	end
end

function create_mr_1_marker()
	mr_id[1] = UTILS.GetMarkID()
	trigger.action.markToAll(mr_id[1],MRMM.Text1 .. "\n\"" .. EasyMissionName .. "\"",MR1_vec,true)
end

function create_mr_2_marker()
	mr_id[2] = UTILS.GetMarkID()
	trigger.action.markToAll(mr_id[2],MRMM.Text2 .. "\n\"" .. EasyMissionName .. "\"",MR2_vec,true)
end

function create_mr_3_marker()
	mr_id[3] = UTILS.GetMarkID()
	trigger.action.markToAll(mr_id[3],MRMM.Text3 .. "\n\"" .. EasyMissionName .. "\"",MR3_vec,true)
end

function create_mr_4_marker()
	mr_id[4] = UTILS.GetMarkID()
	trigger.action.markToAll(mr_id[4],MRMM.Text4 .. "\n\"" .. EasyMissionName .. "\"",MR4_vec,true)
end

function create_mr_5_marker()
	mr_id[5] = UTILS.GetMarkID()
	trigger.action.markToAll(mr_id[5],MRMM.Text5 .. "\n\"" .. EasyMissionName .. "\"",MR5_vec,true)
end

function create_mr_6_marker()
	mr_id[6] = UTILS.GetMarkID()
	trigger.action.markToAll(mr_id[6],MRMM.Text6 .. "\n\"" .. EasyMissionName .. "\"",MR6_vec,true)
end

function create_mr_7_marker()
	mr_id[7] = UTILS.GetMarkID()
	trigger.action.markToAll(mr_id[7],MRMM.Text7 .. "\n\"" .. EasyMissionName .. "\"",MR7_vec,true)
end

function create_mr_8_marker()
	mr_id[8] = UTILS.GetMarkID()
	trigger.action.markToAll(mr_id[8],MRMM.Text8 .. "\n\"" .. EasyMissionName .. "\"",MR8_vec,true)
end

function create_mr_9_marker()
	mr_id[9] = UTILS.GetMarkID()
	trigger.action.markToAll(mr_id[9],MRMM.Text9 .. "\n\"" .. EasyMissionName .. "\"",MR9_vec,true)
end

function create_mr_10_marker()
	mr_id[10] = UTILS.GetMarkID()
	trigger.action.markToAll(mr_id[10],MRMM.Text10 .. "\n\"" .. EasyMissionName .. "\"",MR10_vec,true)
end

function remove_mr_marker()
	if mission_markers_enable == true then
		if trigger.misc.getUserFlag('MR1-Inside') == 1 then
			trigger.action.removeMark(mr_id[1])
		end
		
		if trigger.misc.getUserFlag('MR2-Inside') == 1 then
			trigger.action.removeMark(mr_id[2])
		end
		
		if trigger.misc.getUserFlag('MR3-Inside') == 1 then
			trigger.action.removeMark(mr_id[3])
		end
		
		if trigger.misc.getUserFlag('MR4-Inside') == 1 then
			trigger.action.removeMark(mr_id[4])
		end
		
		if trigger.misc.getUserFlag('MR5-Inside') == 1 then
			trigger.action.removeMark(mr_id[5])
		end
		
		if trigger.misc.getUserFlag('MR6-Inside') == 1 then
			trigger.action.removeMark(mr_id[6])
		end
		
		if trigger.misc.getUserFlag('MR7-Inside') == 1 then
			trigger.action.removeMark(mr_id[7])
		end
		
		if trigger.misc.getUserFlag('MR8-Inside') == 1 then
			trigger.action.removeMark(mr_id[8])
		end
		
		if trigger.misc.getUserFlag('MR9-Inside') == 1 then
			trigger.action.removeMark(mr_id[9])
		end
		
		if trigger.misc.getUserFlag('MR10-Inside') == 1 then
			trigger.action.removeMark(mr_id[10])
		end
	end
	env.info('removing mr marker')
end



env.info("TTI: WAYPOINT MAPMARKERS initialized!")
