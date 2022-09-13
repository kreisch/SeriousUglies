CPS 		= 	ZONE:New("CPS")
CPS1		=	ZONE:New("CPS-1")
CPS2		=	ZONE:New("CPS-2")
CPS3		=	ZONE:New("CPS-3")
CPS4		=	ZONE:New("CPS-4")
CPS5		=	ZONE:New("CPS-5")
CPS6		=	ZONE:New("CPS-6")
CPS7		=	ZONE:New("CPS-7")
CPS8		=	ZONE:New("CPS-8")
CPS9		=	ZONE:New("CPS-9")
CPS10		=	ZONE:New("CPS-10")

CPS_bomb1	=	ZONE:New("CPS_bomb1")
CPS_bomb2	=	ZONE:New("CPS_bomb2")
CPS_bomb3	=	ZONE:New("CPS_bomb3")
CPS_HELO	=	ZONE:New("CPS_HELO")

if mission_era == "modern" then
	a2a_min_alt = 5000
	a2a_max_alt = 10000
	else
	a2a_min_alt = 1000
	a2a_max_alt = 4000
end
--[[
--ADJUST ENEMY A2A SETTINGS HERE

--READ THE MISSION SETTINGS --README FILE FOR MORE DETAILS

-- Simply add two dashes -- before the name of the unit you want to remove from the spawning pool.
-- You can alternatively REMOVE two dashes before a unit to add it to the spawning pool.

--EXAMPLE, to ensure the SA-10 doesn't spawn the line with "sam_s10" will look like this
 --"sam_s10"

-- DO NOT DO ANYTHING HERE EXCEPT ADD/REMOVE DASHES TO THE UNITS YOU WANT ADDED/REMOVED FROM THE SPAWNING POOL.

TemplateTable_EASY = { 
----USA
--"red_cap_f18",
--"red_cap_f4",
--"red_cap_f14a",
--"red_cap_f15",
--"red_cap_f16",
--"red_cap_f14b",
"red_cap_f5",

--trainer
"red_cap_l39",
"red_cap_c101",

--Multinational Modern
--"red_cap_su27",
--"red_cap_su30",
--"red_cap_su33",
--"red_cap_j11",
--"red_cap_jf17",
--"red_cap_mig25",
--"red_cap_mig29s",
--"red_cap_mig23",
--"red_cap_m2000",
--"red_cap_m20005",
--"red_cap_mig29a",
--"red_cap_mig31",
--"red_cap_mig21",

----Korean War
--"red_cap_mig15",
--"red_cap_mig19",
--"red_cap_f86",

----WW2
--"red_cap_spitfire",
--"red_cap_p51",
--"red_cap_p47",
--"red_cap_bf109",
--"red_cap_fw190",
--"red_cap_i16",
--"red_cap_mosquito",
}

TemplateTable_NORMAL = { 
----USA
--"red_cap_f18",
"red_cap_f4",
--"red_cap_f14a",
--"red_cap_f15",
--"red_cap_f16",
--"red_cap_f14b",
"red_cap_f5",

----trainer
"red_cap_l39",
"red_cap_c101",

----Multinational Modern
--"red_cap_su27",
--"red_cap_su30",
--"red_cap_su33",
--"red_cap_j11",
--"red_cap_jf17",
"red_cap_mig25",
--"red_cap_mig29s",
"red_cap_mig23",
--"red_cap_m2000",
"red_cap_m20005",
--"red_cap_mig29a",
"red_cap_mig31",
"red_cap_mig21",

----Korean War
--"red_cap_mig15",
--"red_cap_mig19",
--"red_cap_f86",

----WW2
--"red_cap_spitfire",
--"red_cap_p51",
--"red_cap_p47",
--"red_cap_bf109",
--"red_cap_fw190",
--"red_cap_i16",
--"red_cap_mosquito",
}

TemplateTable_HARD = { 
----USA
"red_cap_f18",
--"red_cap_f4",
"red_cap_f14a",
"red_cap_f15",
"red_cap_f16",
"red_cap_f14b",
--"red_cap_f5",

----trainer
--"red_cap_l39",
--"red_cap_c101",

----Multinational Modern
"red_cap_su27",
"red_cap_su30",
"red_cap_su33",
"red_cap_j11",
"red_cap_jf17",
--"red_cap_mig25",
"red_cap_mig29s",
"red_cap_mig23",
"red_cap_m2000",
--"red_cap_m20005",
"red_cap_mig29a",
--"red_cap_mig31",
--"red_cap_mig21",

----Korean War
--"red_cap_mig15",
--"red_cap_mig19",
--"red_cap_f86",

----WW2
--"red_cap_spitfire",
--"red_cap_p51",
--"red_cap_p47",
--"red_cap_bf109",
--"red_cap_fw190",
--"red_cap_i16",
--"red_cap_mosquito",
} 

TemplateTable_ALL = { 
----USA
"red_cap_f18",
"red_cap_f4",
"red_cap_f14a",
"red_cap_f15",
"red_cap_f16",
"red_cap_f14b",
"red_cap_f5",

----trainer
"red_cap_l39",
"red_cap_c101",

----Multinational Modern
"red_cap_su27",
"red_cap_su30",
"red_cap_su33",
"red_cap_j11",
"red_cap_jf17",
"red_cap_mig25",
"red_cap_mig29s",
"red_cap_mig23",
"red_cap_m2000",
"red_cap_m20005",
"red_cap_mig29a",
"red_cap_mig31",
"red_cap_mig21",

----Korean War
--"red_cap_mig15",
--"red_cap_mig19",
--"red_cap_f86",

----WW2
--"red_cap_spitfire",
--"red_cap_p51",
--"red_cap_p47",
--"red_cap_bf109",
--"red_cap_fw190",
--"red_cap_i16",
--"red_cap_mosquito",
} 


TemplateTable_Bombing_Escort = { 
----USA
"red_cap_f18",
"red_cap_f4",
"red_cap_f14a",
"red_cap_f15",
"red_cap_f16",
"red_cap_f14b",
"red_cap_f5",

----trainer
"red_cap_l39",
"red_cap_c101",

----Multinational Modern
"red_cap_su27",
"red_cap_su30",
"red_cap_su33",
"red_cap_j11",
"red_cap_jf17",
"red_cap_mig25",
"red_cap_mig29s",
"red_cap_mig23",
"red_cap_m2000",
"red_cap_m20005",
"red_cap_mig29a",
"red_cap_mig31",
"red_cap_mig21",

----Korean War
--"red_cap_mig15",
--"red_cap_mig19",
--"red_cap_f86",

----WW2
--"red_cap_spitfire",
--"red_cap_p51",
--"red_cap_p47",
--"red_cap_bf109",
--"red_cap_fw190",
--"red_cap_i16",
--"red_cap_mosquito",
} 

TemplateTable_Antiship_Escort = { 
----USA
"red_cap_f18",
"red_cap_f4",
"red_cap_f14a",
"red_cap_f15",
"red_cap_f16",
"red_cap_f14b",

----Multinational/trainer
"red_cap_f5",
"red_cap_l39",
"red_cap_c101",

----Multinational Modern
"red_cap_su27",
"red_cap_su30",
"red_cap_su33",
"red_cap_j11",
"red_cap_jf17",
"red_cap_mig25",
"red_cap_mig29s",
"red_cap_mig23",
"red_cap_m2000",
"red_cap_m20005",
"red_cap_mig29a",
"red_cap_mig31",
"red_cap_mig21",

----Korean War
--"red_cap_mig15",
--"red_cap_mig19",
--"red_cap_f86",

----WW2
--"red_cap_spitfire",
--"red_cap_p51",
--"red_cap_p47",
--"red_cap_bf109",
--"red_cap_fw190",
--"red_cap_i16",
--"red_cap_mosquito",
}
 
TemplateTable_Bombing = { 
"red_bombing_tu22m3",
"red_bombing_b1b",
"red_bombing_b52",
"red_bombing_tornado",
"red_bombing_h6j",
--"red_bombing_a20g",
--"red_bombing_mosquito",
} 

TemplateTable_Antiship = { 
"red_antiship_tu22m3",
"red_antiship_tu42",
"red_antiship_b52",
}


TemplateTable_Helo = { 
"red_helo_ah1w",
"red_helo_ah64a",
"red_helo_ah64d",
"red_helo_ch74d",
"red_helo_ch53e",
"red_helo_ka27",
"red_helo_ka50",
"red_helo_mi24v",
"red_helo_mi26",
"red_helo_mi28n",
"red_helo_mi8",
"red_helo_oh58d",
"red_helo_sa342m",
"red_helo_sa342l",
"red_helo_sa342mis",
"red_helo_sh60b",
"red_helo_uh1h",
"red_helo_uh60",
} 

end
]]

function randomizeAirZone()
	if mission_era == "modern" then
		switchAirZone = math.random (1,10)
	else
		switchAirZone = math.random (1,11)
	end
	
	if switchAirZone == 1 then
		currentAirZone = CPS1
	elseif switchAirZone ==2 then
		currentAirZone = CPS2
	elseif switchAirZone ==3 then
		currentAirZone = CPS3
	elseif switchAirZone ==4 then
		currentAirZone = CPS4
	elseif switchAirZone ==5 then
		currentAirZone = CPS5
	elseif switchAirZone ==6 then
		currentAirZone = CPS6
	elseif switchAirZone ==7 then
		currentAirZone = CPS7
	elseif switchAirZone ==8 then
		currentAirZone = CPS8
	elseif switchAirZone ==9 then
		currentAirZone = CPS9
	elseif switchAirZone ==10 then
		currentAirZone = CPS10
	elseif switchAirZone == 11 then
		currentAirZone = CPS_HELO
	end
end

A2A_Easy = SPAWN:New( "A2A_Spawn_Init_EASY" )
	:InitRandomizeTemplate( TemplateTable_EASY )
	:InitRandomizeRoute( 1, 1, 20000 ) 				

A2A_Norm = SPAWN:New( "A2A_Spawn_Init_NORM" )
	:InitRandomizeTemplate( TemplateTable_NORMAL )
	:InitRandomizeRoute( 1, 1, 20000 ) 

A2A_Hard = SPAWN:New( "A2A_Spawn_Init_HARD" )
	:InitRandomizeTemplate( TemplateTable_HARD )
	:InitRandomizeRoute( 1, 1, 20000 ) 		

A2A_ALL = SPAWN:New( "A2A_Spawn_Init_ALL" )
	:InitRandomizeTemplate( TemplateTable_ALL )
	:InitRandomizeRoute( 1, 1, 20000 ) 
	
A2A_WW2 = SPAWN:New( "A2A_Spawn_Init_WW2" )
	:InitRandomizeTemplate( TemplateTable_ALL )
	:InitRandomizeRoute( 1, 1, 20000 ) 
--helo add
A2A_Helo = SPAWN:New( "A2A_Spawn_Init_HELO" )
	:InitRandomizeTemplate( TemplateTable_Helo )
	:InitRandomizeRoute( 1, 1, 20000 ) 
--bombing add
A2A_BOMBING = SPAWN:New( "A2A_Spawn_Init_Bombing" )
	:InitRandomizeTemplate( TemplateTable_Bombing )
	:InitRandomizeRoute( 1, 1, 20000 )
	
A2A_BOMBING_ESCORT = SPAWN:New( "A2A_Spawn_Init_Bombing_Escort" )
	:InitRandomizeTemplate( TemplateTable_Bombing_Escort )
	--:InitRandomizeRoute( 1, 1, 20000 )
	
A2A_ANTISHIP_ESCORT = SPAWN:New( "A2A_Spawn_Init_ANTISHIP_Escort" )
	:InitRandomizeTemplate( TemplateTable_Antiship_Escort )
	--:InitRandomizeRoute( 1, 1, 20000 ) 
	
A2A_ANTISHIP = SPAWN:New( "A2A_Spawn_Init_ANTISHIP" )
	:InitRandomizeTemplate( TemplateTable_Antiship )
	:InitRandomizeRoute( 1, 1, 20000 ) 
	
	
if mission_era == "ww2" and ww2_asset_pack_enable == true then
table.insert(TemplateTable_EASY, "red_cap_b17g")
table.insert(TemplateTable_EASY, "red_cap_ju88a4")

table.insert(TemplateTable_NORMAL, "red_cap_b17g")
table.insert(TemplateTable_NORMAL, "red_cap_ju88a4")

table.insert(TemplateTable_HARD, "red_cap_b17g")
table.insert(TemplateTable_HARD, "red_cap_ju88a4")

table.insert(TemplateTable_ALL, "red_cap_b17g")
table.insert(TemplateTable_ALL, "red_cap_ju88a4")

table.insert(TemplateTable_Bombing, "red_bombing_ju88a4")
table.insert(TemplateTable_Bombing, "red_bombing_b17g")
end

if mission_era == "korean_war" and ww2_asset_pack_enable == true then
table.insert(TemplateTable_EASY, "red_cap_b17g")
table.insert(TemplateTable_EASY, "red_cap_ju88a4")

table.insert(TemplateTable_NORMAL, "red_cap_b17g")
table.insert(TemplateTable_NORMAL, "red_cap_ju88a4")

table.insert(TemplateTable_HARD, "red_cap_b17g")
table.insert(TemplateTable_HARD, "red_cap_ju88a4")

table.insert(TemplateTable_ALL, "red_cap_b17g")
table.insert(TemplateTable_ALL, "red_cap_ju88a4")

table.insert(TemplateTable_Bombing, "red_bombing_ju88a4")
table.insert(TemplateTable_Bombing, "red_bombing_b17g")
end
	
function a2a_easy_start()  --1 per group
	randomizeAirZone()
	if mission_era == "modern" then
	A2A_Easy_Spawn = A2A_Easy:SpawnInZone( currentAirZone, true, a2a_min_alt, a2a_max_alt )
	else
	A2A_Easy_Spawn = A2A_WW2:SpawnInZone( currentAirZone, true, a2a_min_alt, a2a_max_alt )
	end
end

function a2a_norm_start()  --2 per group
	randomizeAirZone()
		if mission_era == "modern" then
	A2A_Norm_Spawn = A2A_Norm:SpawnInZone( currentAirZone, true, a2a_min_alt, a2a_max_alt )
	else
	A2A_Norm_Spawn = A2A_WW2:SpawnInZone( currentAirZone, true, a2a_min_alt, a2a_max_alt )
	end
end

function a2a_hard_start() --2 per group
	randomizeAirZone()
	if mission_era == "modern" then
	A2A_Hard_Spawn = A2A_Hard:SpawnInZone( currentAirZone, true, a2a_min_alt, a2a_max_alt )
	else
	A2A_Hard_Spawn = A2A_WW2:SpawnInZone( currentAirZone, true, a2a_min_alt, a2a_max_alt )
	end
end

function a2a_all_start() --2 per group
	randomizeAirZone()
	if mission_era == "modern" then
	A2A_All_Spawn = A2A_ALL:SpawnInZone( currentAirZone, true, a2a_min_alt, a2a_max_alt )
	else
	A2A_All_Spawn = A2A_WW2:SpawnInZone( currentAirZone, true, a2a_min_alt, a2a_max_alt )
	end
end

function a2a_helo_start() --2 per group
	A2A_Helo_Spawn = A2A_Helo:SpawnInZone( CPS_HELO, true, 2100, 2200 )
end

-- X - direction in parallel to object heading
-- Y - altitude/elevation/height above ground
-- Z - direction perpenidcular to object heading.

 -- So -1000,200,500 should be 1000m behind, 200m above, and 500m to one side. 
--bombing add
function a2a_bombing_start()
	
	if enable_airbase_bombers == true then
	for i=1, ground_bomber_amount do
	A2A_BOMBING_1 = A2A_BOMBING:SpawnInZone( CPS, true, 8000, 8000 )
	A2A_BOMBING_1_VEC = A2A_BOMBING_1:GetPointVec3()
	A2A_BOMBING_1_ESCORT_VEC = A2A_BOMBING_1_VEC:AddX( 1000 ):AddY(200):AddZ( 400 ):GetVec3()
	end
	end
	
	
	if enable_carrier_bombers == true and env.mission.theatre ~= "Nevada" then
	for i=1, ship_bomber_amount do
	A2A_ANTISHIP_1 = A2A_ANTISHIP:SpawnInZone( CPS, true, 8000, 8000 )
	A2A_ANTISHIP_1_VEC = A2A_ANTISHIP_1:GetPointVec3()
	A2A_ANTISHIP_1_ESCORT_VEC = A2A_ANTISHIP_1_VEC:AddX( 1000 ):AddY(200):AddZ( 400 ):GetVec3()
	end
	end
	
	
	if enable_airbase_bombers == true and enable_bomber_escorts == true then
	env.info("A2A_Bombing_Escort: " .. UTILS.OneLineSerialize(A2A_BOMBING_ESCORT))
	A2A_BOMBING_ESCORT_1 = A2A_BOMBING_ESCORT:SpawnFromVec3(A2A_BOMBING_1_ESCORT_VEC)
	A2A_BOMBING_ESCORT_1_PV3 = POINT_VEC3:New(-1000, 200, 500)
	A2A_BOMBING_ESCORT_1_TASK = A2A_BOMBING_ESCORT_1:TaskFollow(A2A_BOMBING_1, A2A_BOMBING_ESCORT_1_PV3:GetVec3())
	A2A_BOMBING_ESCORT_1:SetTask(A2A_BOMBING_ESCORT_1_TASK, 1)
	end
	
	
	if enable_carrier_bombers == true and enable_bomber_escorts == true and env.mission.theatre ~= "Nevada" then
	A2A_ANTISHIP_ESCORT_1 = A2A_ANTISHIP_ESCORT:SpawnFromVec3(A2A_ANTISHIP_1_ESCORT_VEC)
	A2A_ANTISHIP_ESCORT_1_PV3 = POINT_VEC3:New(-1000, 200, 500)
	A2A_ANTISHIP_ESCORT_1_TASK = A2A_ANTISHIP_ESCORT_1:TaskFollow(A2A_ANTISHIP_1, A2A_ANTISHIP_ESCORT_1_PV3:GetVec3())
	A2A_ANTISHIP_ESCORT_1:SetTask(A2A_ANTISHIP_ESCORT_1_TASK, 1)
	end

end


function sp(groupName)
	group = SPAWN:New(groupName)
	group:Spawn()
end

--bombing add
if a2a_autospawn_enable == true then
trigger.action.outText("A2A CAP auto-spawn is ENABLED to spawn every few minutes.\nThese settings are configurable in the MISSION SETTINGS VIA THE TRIGGER LIST. - Check tutorial text file for details.", 10)
end

if a2a_autospawn_enable == false then
trigger.action.outText("A2A CAP auto-spawn is DISABLED \nThese settings are configurable in the MISSION SETTINGS VIA THE TRIGGER LIST. - Check tutorial text file for details.", 10)
end

if a2a_intercept_autospawn_enable == true then
trigger.action.outText("Enemy Bombers auto-spawn is ENABLED to spawn every few minutes.\nThese settings are configurable in the MISSION SETTINGS VIA THE TRIGGER LIST. - Check tutorial text file for details.", 10)
end

if a2a_intercept_autospawn_enable == false then
trigger.action.outText("Enemy Bombers auto-spawn is DISABLED. to spawn every few minutes.\nThese settings are configurable in the MISSION SETTINGS VIA THE TRIGGER LIST. - Check tutorial text file for details.", 10)
end
--helo add
if a2a_helo_autospawn_enable == true then
trigger.action.outText("A2A Helo auto-spawn is ENABLED to spawn every few minutes.\nThese settings are configurable in the MISSION SETTINGS VIA THE TRIGGER LIST. - Check tutorial text file for details.", 10)
end

if a2a_helo_autospawn_enable == false then
trigger.action.outText("A2A Helo auto-spawn is DISABLED\nThese settings are configurable in the MISSION SETTINGS VIA THE TRIGGER LIST. - Check tutorial text file for details.", 10)
end

if allow_air_mission_stacking == true then
trigger.action.outText("Forced A2A Missions \"stacking\" is ENABLED.", 10)
else
trigger.action.outText("Forced A2A Missions \"stacking\" is DISABLED.", 10)
end

trigger.action.outText("AIR LUA File Loaded...", 10)
env.info('Deadly AIR scripting complete')