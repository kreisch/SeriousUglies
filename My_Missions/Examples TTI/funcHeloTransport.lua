enable_ai_transport_ops = true

--These two will fly towards active a2g infantry missions by default if they're enabled.
Transport_1_enable = true --default true
Transport_2_enable = false --default true

--These two are zeus enabled if true
Transport_3_enable = true --zeus --default true
Transport_4_enable = false --zeus --default true

--Infantry Declarations
Troops = SPAWN:New( "Infantry" )  
Troops2 = SPAWN:New("Infantry2")

--Template names in ME 
Transport_Helo_1_name = "Transport_Helo_1"
Transport_Helo_2_name = "Transport_Helo_2"
Transport_Helo_3_name = "Transport_Helo_Zeus"
Transport_Helo_4_name = "Transport_Helo_Zeus_2"

--Tranport Start Zones
pickzone1 = ZONE:New( "pickzone1" ) 

--Mission type strings
agMissionType = "Air to Ground Hard Mission"
mrMissionType = "Air to Ground Easy Mission"
mraMissionType = "Air to Ground Easy-A Mission"
mrbMissionType = "Air to Ground Easy-B Mission"
agnMissionType = "Air to Ground Normal Mission"
agnaMissionType = "Air to Ground Normal-A Mission"
agnbMissionType = "Air to Ground Normal-B Mission"
aghMissionType = "Air to Ground Helo Mission"
infasMissionType = "Infantry Assault Mission"
asMissionType = "Anti-Ship Mission"
dsMissionType = "Deep Strike Mission"
specOpsMission =  "Special Operations Mission"

--Spawn Objects
Transport_1 = SPAWN:New(Transport_Helo_1_name)
Transport_2 = SPAWN:New(Transport_Helo_2_name)
Transport_3 = SPAWN:New(Transport_Helo_3_name)
Transport_4 = SPAWN:New(Transport_Helo_4_name)

Transport_1_alive = false
Transport_2_alive = false

--Zeus units below
Transport_3_alive = false
Transport_4_alive = false


--Landing Zone Outer and Inner Radius for the various mission zone types.
--Easy msn
Outer_Zone_Radius_MR = lz_outer_radius 
Inner_Zone_Radius_MR = lz_inner_radius 
 
Outer_Zone_Radius_AG = lz_outer_radius 
Inner_Zone_Radius_AG = lz_inner_radius  
 
--Deep strike
Outer_Zone_Radius_DS = lz_outer_radius 
Inner_Zone_Radius_DS = lz_inner_radius

--A2G Norm
Outer_Zone_Radius_AGN = lz_outer_radius
Inner_Zone_Radius_AGN = lz_inner_radius

--A2G helo
Outer_Zone_Radius_AGH = lz_outer_radius
Inner_Zone_Radius_AGH = lz_inner_radius

--Infantry assault
Outer_Zone_Radius_IA = lz_outer_radius --most zone radius is 3718.58 for infantry assault Don't go any higher than this
Inner_Zone_Radius_IA = lz_inner_radius

--Turns smoke on for helo landing zones if true. Delay sets time before smoke is deployed to a landing zone. Remember, smoke burns out after 5 minutes.
SmokeOn = true
SmokeDelay = 60 
smokeString =""

--Time spent on the ground before helicopters take off. Used for calculating ETA. It's actually 200 seconds from a cold start to lift off, going to add about 35 seconds of getting to cruise speed
HeloColdTime = 35 --default 235 for cold start helos
HeloColdTime_Zeus = 0

--Zeus Spawn distance from coordinate
OuterSpawnRadius = zeus_lz_outer_radius
InnerSpawnRadius = zeus_lz_innter_radius

--RTB MSG
show_rtb_msg = false

--Array Declarations

Lz_1_id ={}
Lz_2_id ={}
Lz_3_id ={}
Lz_4_id ={}

Transport_1_Group = {}
Transport_2_Group = {}
Transport_3_Group = {} --Zeus
Transport_4_Group = {} --Zeus 2



Infantry_Team_Names = { 
"Alpha",
"Bravo",
"Charlie",
"Delta",
"Echo",
"Foxtrot",
"Golf",
"Hotel",
"India",
"Juliet",
"Kilo",
"Lima",
"Mike",
"November",
"Oscar",
"Papa",
"Quebec",
"Romeo",
"Sierra",
"Tango",
"Uniform",
"Victor",
"Whiskey",
"X-Ray",
"Yankee",
"Zulu",
}

mission_selection = ""

function helo_transport(mission_selection)
	if  enable_ai_transport_ops == true and mission_era == "modern" then
		
		if (mission_selection == "mr") then
			
			for i=1, #arrayZoneMR, 1 do
				if arrayZoneMR[i][4] == true then
				
					currentMrMissionZone = ZONE:New(arrayZoneMR[i][1])
					currentMrMissionZone_name = arrayZoneMR[i][1]
				
				end
			end
			
			transport_handler(currentMrMissionZone, currentMrMissionZone_name, mrMissionType , Inner_Zone_Radius_MR, Outer_Zone_Radius_MR )
			
		elseif (mission_selection == "ag") then
			
			for i=1, #arrayZoneAG, 1 do
				if arrayZoneAG[i][4] == true then
				
					currentAgMissionZone = ZONE:New(arrayZoneAG[i][1])
					currentAgMissionZone_name = arrayZoneAG[i][1]
				
				end
			end
			
		transport_handler(currentAgMissionZone, currentAgMissionZone_name, agMissionType , Inner_Zone_Radius_AG, Outer_Zone_Radius_AG )
		
		elseif (mission_selection == "ds") then
			
			for i=1, #arrayZoneDS, 1 do
				if arrayZoneDS[i][4] == true then
				
					currentDsMissionZone = ZONE:New(arrayZoneDS[i][1])
					currentDsMissionZone_name = arrayZoneDS[i][1]
				
				end
			end
			
			transport_handler(currentDsMissionZone, currentDsMissionZone_name, dsMissionType , Inner_Zone_Radius_DS, Outer_Zone_Radius_DS )
		
		elseif (mission_selection == "agn") then
			
			for i=1, #arrayZoneAGN, 1 do
				if arrayZoneAGN[i][4] == true then
				
					currentAGNMissionZone = ZONE:New(arrayZoneAGN[i][1])
					currentAGNMissionZone_name = arrayZoneAGN[i][1]
				
				end
			end
			
			transport_handler(currentAGNMissionZone, currentAGNMissionZone_name, agnMissionType, Inner_Zone_Radius_AGN, Outer_Zone_Radius_AGN )
		
		elseif (mission_selection == "agh") then
			
			for i=1, #arrayZoneAGH, 1 do
				if arrayZoneAGH[i][4] == true then
				
					currentAGHMissionZone = ZONE:New(arrayZoneAGH[i][1])
					currentAGHMissionZone_name = arrayZoneAGH[i][1]
				
				end
			end

			transport_handler(currentAGHMissionZone, currentAGHMissionZone_name, agMissionType, Inner_Zone_Radius_AGH, Outer_Zone_Radius_AGH )

		elseif (mission_selection == "ia") then

			for i=1, #arrayZoneINFAS, 1 do
				if arrayZoneINFAS[i][4] == true then
					
					currentInfMissionZone = ZONE:New(arrayZoneINFAS[i][1])
					currentInfMissionZone_name = arrayZoneINFAS[i][1]
					
				end
			end
			transport_handler(currentInfMissionZone,  currentInfMissionZone_name, infasMissionType, Inner_Zone_Radius_IA, Outer_Zone_Radius_IA, InsertionName  )
										
		end
	
	
	else
		env.info('Helo Transport Operations was called but it is disabled in the options. Re-Enable it')
	end
end --End helo_transport()

function transport_handler(LandingZone, Mission_Target_Name, msn_string_name, InnerZoneRadius, OuterZoneRadius)	
	
	if (Transport_1_enable == true) then
		local NewGroupNumber = #Transport_1_Group+1
		Transport_1_Group[NewGroupNumber] = Transport_1:OnSpawnGroup(
			function( SpawnGroup )
				local vec2_LandingZone = LandingZone:GetPointVec2() -- Returns vec2 center position of zone
				local vec3_LandingZone = LandingZone:GetPointVec3() -- Returns vec3 center position of zone
				
				--Landing Zone and Map marker objects
				local random_landing_zone_radius_vec2 = vec2_LandingZone:GetRandomVec2InRadius(OuterZoneRadius, InnerZoneRadius) --Generate the random landing point as vec2
				local random_landing_zone_radius_ptrV3 = POINT_VEC3:NewFromVec2(random_landing_zone_radius_vec2) --Convert the vec2 to a vec3 using POINT_VEC3 class. Pretty nice that it's automatic
				local random_lz_mm_calc = random_landing_zone_radius_ptrV3:GetVec3() -- Get the actual vec3 to pass to the map marker
				
				--local lz_coord = COORDINATE:NewFromVec3(random_lz_mm_calc)
				--local random_lz_mm_calc_2 = POINT_VEC2:NewFromVec3(random_landing_zone_radius_vec2)
				--local random_lz_mm_calc_3 = random_lz_mm_calc_2:GetVec3()
		
				local startCoord = COORDINATE:NewFromCoordinate(SpawnGroup:GetCoordinate())
				local distance = UTILS.MetersToNM(tostring(startCoord:Get2DDistance(random_landing_zone_radius_ptrV3))) --distance in miles
				local dist_string = string.format("Transit distance: %d ", distance)
				
				local speed = 100  --mph- average helo speed enroute to landing zones, approximately 100 knots with some error.
				local ETA = (distance / speed) * 60 --returns time to arrival in minutes.
				local currentTime = timer.getAbsTime() --seconds
				local modifiedTime = ((((ETA*60) + timer.getAbsTime()) - currentTime + HeloColdTime ) / 60)  --this is the time in minutes
				local startSmokeTime = ((((ETA*60) + timer.getAbsTime()) - currentTime + HeloColdTime ) - SmokeDelay) --Smoke within x minutes of landing so the smoke is visible. -Time in seconds 
				
				lzInsertionName = tostring(Infantry_Team_Names[math.random(1,26)]) .. " " ..tostring(math.random(1,9)).."-"..tostring(math.random(1,9))

				Lz_1_id[NewGroupNumber] = UTILS.GetMarkID()
				trigger.action.markToAll(Lz_1_id[NewGroupNumber], "Task Force: " .. lzInsertionName .. "\n" .. dist_string .. "nm\n" .. string.format("ETA: %d minutes\n", modifiedTime) .. Transport_1_Group[NewGroupNumber]:GetName(), random_lz_mm_calc, true) -- it's gonna calculate different per line
--				trigger.action.markToAll(Lz_3_id[NewGroupNumber_3], lzInsertionName_3 .. "\n" .. dist_string .. "nm\n" .. string.format("ETA: %d minutes\n", modifiedTime) .. Transport_3_Group[NewGroupNumber_3]:GetName(), vec3_point, false) -- it's gonna calculate different per line
				
				trigger.action.outText( "<< Command has sent ".. lzInsertionName ..  " on an insertion mission! >>\n<< Target: [" .. msn_string_name ..  "] >>\n<< Eliminate hostile forces and EXTRACT our troops back to homeplate. >> ", 20)
				trigger.action.outSound("TTI Soundfiles/Ui beep.ogg" )
				
				if (SmokeOn == true) then
					--trigger.action.outText("<< Smoketime is " .. startSmokeTime, 30)
					if startSmokeTime <= 0 then
						startSmokeTime = 5 --start it right away if the mission is too close or a negative value is generated
					end
					timer.scheduleFunction(function() 
						local Smoke = COORDINATE:NewFromVec2(random_landing_zone_radius_vec2)
						Smoke:SmokeBlue()
						trigger.action.outText("<< ".. lzInsertionName  .. "'s landing zone marked by blue smoke. >>\n<< Secure the LZ. >> " , 15 )
					end, nil, timer.getTime() + string.format("%d", startSmokeTime))
				end
				local TaskLand=SpawnGroup:TaskLandAtVec2(random_landing_zone_radius_vec2, 20)
				
				Transport_1_alive = true
				SpawnGroup:SetTask(TaskLand, 1):OptionROEWeaponFree()
				SpawnGroup:SetCommand(tti_config_SetInvisible)
				SpawnGroup:SetCommand(tti_config_SetImmortal)
			end)
		--:Spawn()
		:SpawnInZone( pickzone1, true, 400, 1000 )

		local CurrentGroup = Transport_1_Group[NewGroupNumber]
	
		--Landing Event
		function CurrentGroup:OnEventLand(EventData)
			if (SmokeOn == true) then
					smokeString = " on blue smoke! >>"
			else
				smokeString = "! >>"
			end
			trigger.action.outText("<< " .. lzInsertionName  .. " on " .. Transport_1_Group[NewGroupNumber]:GetName() .. 
				" has reached the landing zone >>" ..
				"\n<< Allied forces deployed danger close" .. smokeString .. 
				"\n<< Use extreme caution! >> ", 20)
			infantry_handler(Transport_1_Group[NewGroupNumber], currentInfMissionZone)
			-- Destroy helo after x seconds to avoid a second RTB landing event
			timer.scheduleFunction(function()
				if show_rtb_msg == true then
					trigger.action.outText( "<< " .. Transport_1_Group[NewGroupNumber]:GetName() .. " is RTB! >>", 15)
				end
				Transport_1_Group[NewGroupNumber]:Destroy()
				trigger.action.removeMark(Lz_1_id[NewGroupNumber])
			end, nil, timer.getTime() + 120  )  --Please keep this at 2 mins
		
		end

		--Crash Event						
		function CurrentGroup:OnEventCrash(EventData)
				Transport_1_alive = false
				trigger.action.removeMark(Lz_1_id[NewGroupNumber])
				trigger.action.outText( "<< ALERT: An insertion transport was shot down! >>", 15)
				trigger.action.outSound("TTI Soundfiles/walkietalkieon.ogg" )
		end

		--Pilot dies event
		function CurrentGroup:OnEventPilotDead(EventData)
			Transport_1_alive = false
			trigger.action.removeMark(Lz_1_id[NewGroupNumber])
		end

		--Subscribe to events to monitor helicopter situation
		Transport_1_Group[NewGroupNumber]:HandleEvent(EVENTS.Land)
		Transport_1_Group[NewGroupNumber]:HandleEvent(EVENTS.PilotDead)
		Transport_1_Group[NewGroupNumber]:HandleEvent(EVENTS.Crash)

	else
		env.info("Transport 1 unable to spawn. Check to see if one is already spawned or is disabled in the options.")
	end
	
	if (Transport_2_enable == true) then
		local NewGroupNumber_2 = #Transport_2_Group+1
		Transport_2_Group[NewGroupNumber_2] = Transport_2:OnSpawnGroup(
			function( SpawnGroup )
				local vec2_LandingZone = LandingZone:GetPointVec2() -- Returns vec2 center position of zone
				local vec3_LandingZone = LandingZone:GetPointVec3() -- Returns vec3 center position of zone
				
				--Landing Zone and Map marker objects
				local random_landing_zone_radius_vec2 = vec2_LandingZone:GetRandomVec2InRadius(OuterZoneRadius, InnerZoneRadius) --Generate the random landing point as vec2
				local random_landing_zone_radius_ptrV3 = POINT_VEC3:NewFromVec2(random_landing_zone_radius_vec2) --Convert the vec2, to a vec3 using POINT_VEC3 class. Pretty nice that it's automatic
				local random_lz_mm_calc = random_landing_zone_radius_ptrV3:GetVec3() -- Get the actual vec3 to pass to the map marker
				
				local startCoord = COORDINATE:NewFromCoordinate(SpawnGroup:GetCoordinate())
				local distance = UTILS.MetersToNM(tostring(startCoord:Get2DDistance(random_landing_zone_radius_ptrV3))) --distance in miles
				local dist_string = string.format("Transit distance: %d ", distance)
				
				local speed = 100  --mph- average helo speed enroute to landing zones, approximately 100 knots with some error.
				local ETA = (distance / speed) * 60 --returns time to arrival in minutes.
				local currentTime = timer.getAbsTime() --seconds
				local modifiedTime = ((((ETA*60) + timer.getAbsTime()) - currentTime + HeloColdTime) / 60)  --this is the time in minutes
				local startSmokeTime = ((((ETA*60) + timer.getAbsTime()) - currentTime + HeloColdTime) - SmokeDelay) --Smoke within x minutes of landing so the smoke is visible. -seconds

				lzInsertionName_2 = tostring(Infantry_Team_Names[math.random(1,26)]) .. " " ..tostring(math.random(1,9)).."-"..tostring(math.random(1,9)) 
				Lz_2_id[NewGroupNumber_2] = UTILS.GetMarkID()
				trigger.action.markToAll(Lz_2_id[NewGroupNumber_2], "Task Force: " .. lzInsertionName_2 .. "\n" .. dist_string .. "nm\n" .. string.format("ETA: %d minutes\n", modifiedTime) .. Transport_2_Group[NewGroupNumber_2]:GetName(), random_lz_mm_calc, true) -- it's gonna calculate different per line
--				trigger.action.markToAll(Lz_3_id[NewGroupNumber_3], lzInsertionName_3 .. "\n" .. dist_string .. "nm\n" .. string.format("ETA: %d minutes\n", modifiedTime) .. Transport_3_Group[NewGroupNumber_3]:GetName(), vec3_point, false) -- it's gonna calculate different per line

				trigger.action.outText( "<< Command has sent ".. lzInsertionName_2 ..  " on an insertion mission! >>\n<< Target: [" .. msn_string_name ..  "] >>\n<< Eliminate hostile forces and EXTRACT our troops back to homeplate. >> ", 20)
				trigger.action.outSound("TTI Soundfiles/Ui beep.ogg" )
				
				if (SmokeOn == true) then
					--trigger.action.outText("<< Smoketime2 is " .. startSmokeTime, 30)
					if startSmokeTime <= 0 then
						startSmokeTime = 5 --start it right away if the mission is too close
					end
					timer.scheduleFunction(function() 
						local Smoke = COORDINATE:NewFromVec2(random_landing_zone_radius_vec2)
						Smoke:SmokeGreen()
						trigger.action.outText("<< ".. lzInsertionName_2  .. "'s landing zone marked by green smoke. >>\n<< Secure the LZ. >> " , 15 )
						
					end, nil, timer.getTime() + string.format("%d", startSmokeTime))
				end
				local TaskLand=SpawnGroup:TaskLandAtVec2(random_landing_zone_radius_vec2, 20)
				Transport_2_alive = true
				SpawnGroup:SetTask(TaskLand, 1):OptionROEWeaponFree()
				SpawnGroup:SetCommand(tti_config_SetInvisible)
				SpawnGroup:SetCommand(tti_config_SetImmortal)
			end)
		--:Spawn()
		:SpawnInZone( pickzone1, true, 400, 1000 )

		local CurrentGroup_2 = Transport_2_Group[NewGroupNumber_2]
	
		--Landing Event
		function CurrentGroup_2:OnEventLand(EventData)
			if (SmokeOn == true) then
				smokeString = " on green smoke! >>"
			else
				smokeString = "! >>"
			end
			trigger.action.outText("<< ".. lzInsertionName_2  .. " on " .. Transport_2_Group[NewGroupNumber_2]:GetName() .. 
				" has reached the landing zone >>" .. 
				"\n<< Allied forces deployed danger close" .. smokeString ..
				"\n<< Use extreme caution! >> ", 20)
			infantry_handler(Transport_2_Group[NewGroupNumber_2], currentInfMissionZone)
			
			timer.scheduleFunction(function() -- Destroy helo after x seconds to avoid a second RTB landing event
			if show_rtb_msg == true then
				trigger.action.outText( "<< " .. Transport_2_Group[NewGroupNumber_2]:GetName() .. " is RTB! >>", 15)
				end
				Transport_2_Group[NewGroupNumber_2]:Destroy()
				trigger.action.removeMark(Lz_2_id[NewGroupNumber_2])
			end, nil, timer.getTime() + 120  )  --Please keep this at 2 mins
		
		end
		--Crash Event						
		function CurrentGroup_2:OnEventCrash(EventData)
				Transport_2_alive = false
				trigger.action.removeMark(Lz_2_id[NewGroupNumber_2])
				trigger.action.outText( "<< ALERT: An insertion transport was shot down! >>", 15)
				trigger.action.outSound("TTI Soundfiles/walkietalkieon.ogg" )
		end
		--Pilot dies event
		function CurrentGroup_2:OnEventPilotDead(EventData)
			Transport_2_alive = false
			trigger.action.removeMark(Lz_2_id[NewGroupNumber_2])
		end

		--Subscribe to events to monitor helicopter situation
		Transport_2_Group[NewGroupNumber_2]:HandleEvent(EVENTS.Land)
		Transport_2_Group[NewGroupNumber_2]:HandleEvent(EVENTS.PilotDead)
		Transport_2_Group[NewGroupNumber_2]:HandleEvent(EVENTS.Crash)

	else
		env.info("Transport 2 unable to spawn. Check to see if one is already spawned or is disabled in the options.")
	end

end --End transport_handler()

function infantry_handler( HeloGroup,  CombatZone )
	--CombatZone is an inoperable parameter when used with TTI regular spawning
	env.info("name: " .. HeloGroup:GetName() .. "<----")
		Troops_Group = Troops:OnSpawnGroup(
			function( SpawnGroup )
				local TaskEngage = SpawnGroup:TaskRouteToVec2(currentInfMissionZone:GetVec2())
				table.insert(ctld.droppedTroopsBLUE, SpawnGroup:GetName())
			end)
		:SpawnFromUnit(HeloGroup)
		trigger.action.outSound("TTI Soundfiles/were moving were moving.ogg" )
	env.info('Infantry_handler: Spawning Troops')
		
end

function zeus_infantry_handler( HeloGroup )
		Troops_Group2 = Troops2:SpawnFromUnit(HeloGroup)
		env.info('Zeus_Infantry_handler: Group Spawning')
	
end

function zeus_transport_handler(vec3_point)
	
	if (Transport_3_enable == true) then
		RandomSpawnCoord = POINT_VEC2:NewFromVec3(vec3_point)
		RandomSpawnPoint = RandomSpawnCoord:GetRandomVec2InRadius(OuterSpawnRadius, InnerSpawnRadius)
		RandomSpawnPoint_Off_Coord = POINT_VEC2:NewFromVec2(RandomSpawnPoint)
		

		local NewGroupNumber_3 = #Transport_3_Group+1
		
		Transport_3_Group[NewGroupNumber_3] = Transport_3:OnSpawnGroup(
			function( SpawnGroup )
				local vec2_LandingZone = POINT_VEC2:NewFromVec3(vec3_point)
				local LandingSpot = vec2_LandingZone:GetVec2() 
				
				local startCoord = COORDINATE:NewFromCoordinate(SpawnGroup:GetCoordinate())
				local distance = UTILS.MetersToNM(tostring(startCoord:Get2DDistance(vec3_point))) --distance in miles
				local dist_string = string.format("Transit distance: %d ", distance)
				
				local speed = 100  --mph- average helo speed enroute to landing zones, approximately 100 knots with some error.
				local ETA = (distance / speed) * 60 --returns time to arrival in minutes.
				local currentTime = timer.getAbsTime() --seconds
				local modifiedTime = ((((ETA*60) + timer.getAbsTime()) - currentTime + HeloColdTime_Zeus) / 60)  --this is the time in minutes
				local startSmokeTime = ((((ETA*60) + timer.getAbsTime()) - currentTime + HeloColdTime_Zeus) - SmokeDelay) --Smoke within x minutes of landing so the smoke is visible. -seconds

				lzInsertionName_3 = tostring(Infantry_Team_Names[math.random(1,26)]) .. " " ..tostring(math.random(1,9)).."-"..tostring(math.random(1,9)) 
				
				Lz_3_id[NewGroupNumber_3] = UTILS.GetMarkID()
				trigger.action.markToAll(Lz_3_id[NewGroupNumber_3], "Task Force: " .. lzInsertionName_3 .. "\n" .. dist_string .. "nm\n" .. string.format("ETA: %d minutes\n", modifiedTime) .. Transport_3_Group[NewGroupNumber_3]:GetName(), vec3_point, true) -- it's gonna calculate different per line
				trigger.action.outText("<< ".. lzInsertionName_3  .. " on the way. >>\n<< " .. dist_string .. "nm >>", 15 )

				if (SmokeOn == true) then
					if startSmokeTime <= 0 then
						startSmokeTime = 5 --start it right away if the mission is too close
					end
					timer.scheduleFunction(function() 
						local Smoke = COORDINATE:NewFromVec2(LandingSpot)
						Smoke:SmokeWhite()
						trigger.action.outText("<< ".. lzInsertionName_3  .. "'s landing zone marked by white smoke. >>\n<< Secure the LZ! >>", 15 )
						
					end, nil, timer.getTime() + string.format("%d", startSmokeTime))
				end
				local TaskLand=SpawnGroup:TaskLandAtVec2(LandingSpot, 20)
				Transport_3_alive = true
				SpawnGroup:SetTask(TaskLand, 1):OptionROEWeaponFree()
				SpawnGroup:SetCommand(tti_config_SetInvisible)
				SpawnGroup:SetCommand(tti_config_SetImmortal)
			end)
		:SpawnFromVec2(RandomSpawnPoint)

		local CurrentGroup_3 = Transport_3_Group[NewGroupNumber_3]
	
		--Landing Event
		function CurrentGroup_3:OnEventLand(EventData)
			if (SmokeOn == true) then
				smokeString = " on white smoke! >>"
			else
				smokeString = "! >>"
			end
			trigger.action.outText("<< ".. lzInsertionName_3  .. " on " .. Transport_3_Group[NewGroupNumber_3]:GetName().. 
				" has reached the landing zone >>" .. 
				"\n<< Troops deployed danger close" .. smokeString, 25)
				--"\n<< Use extreme caution! >>", 25)
			zeus_infantry_handler(Transport_3_Group[NewGroupNumber_3])
			
			timer.scheduleFunction(function() -- Destroy helo after x seconds to avoid a second RTB landing event
			if show_rtb_msg == true then
				trigger.action.outText( "<< " .. Transport_3_Group[NewGroupNumber_3]:GetName() .. " is RTB! >>", 10)
				end
				Transport_3_Group[NewGroupNumber_3]:Destroy()
				trigger.action.removeMark(Lz_3_id[NewGroupNumber_3])
			end, nil, timer.getTime() + 120  )  --Please keep this at 2 mins
		
		end

		--Crash Event						
		function CurrentGroup_3:OnEventCrash(EventData)
				Transport_3_alive = false
				trigger.action.removeMark(Lz_3_id[NewGroupNumber_3])
				trigger.action.outText( "<< ALERT: An insertion transport was shot down! >>", 10)
				trigger.action.outSound("TTI Soundfiles/walkietalkieon.ogg" )
		end

		--Pilot dies event
		function CurrentGroup_3:OnEventPilotDead(EventData)
			Transport_3_alive = false
			trigger.action.removeMark(Lz_3_id[NewGroupNumber_3])
		end

		--Subscribe to events to monitor helicopter situation
		Transport_3_Group[NewGroupNumber_3]:HandleEvent(EVENTS.Land)
		Transport_3_Group[NewGroupNumber_3]:HandleEvent(EVENTS.PilotDead)
		Transport_3_Group[NewGroupNumber_3]:HandleEvent(EVENTS.Crash)

	else
		env.info("Transport 3 (Zeus Transport) is disabled. Enable it in the script.")
	end

	if (Transport_4_enable == true) then
		local offset_x = math.random(-50,50)
		local offset_y = math.random (50,50)
		local spawnOffset = RandomSpawnPoint_Off_Coord:AddX(offset_x):AddY(offset_y):GetVec2()	
		
		local NewGroupNumber_4 = #Transport_4_Group+1
		Transport_4_Group[NewGroupNumber_4] = Transport_4:OnSpawnGroup(
			function( SpawnGroup )
				local vec2_LandingZone = POINT_VEC2:NewFromVec3(vec3_point)
			
				local vec_lz_offset = vec2_LandingZone:AddX(offset_x):AddY(offset_y):GetVec2() --So the other zeus craft doesn't land in the same exact spot.
									
				lzInsertionName_4 = tostring(Infantry_Team_Names[math.random(1,26)]) .. " " ..tostring(math.random(1,9)).."-"..tostring(math.random(1,9)) 
				
				local TaskLand=SpawnGroup:TaskLandAtVec2(vec_lz_offset, 20)
				Transport_4_alive = true
				SpawnGroup:SetTask(TaskLand, 1):OptionROEWeaponFree()
				SpawnGroup:SetCommand(tti_config_SetInvisible)
				SpawnGroup:SetCommand(tti_config_SetImmortal)
			end)
		:SpawnFromVec2(spawnOffset)

		local CurrentGroup_4 = Transport_4_Group[NewGroupNumber_4]
	
		--Landing Event
		function CurrentGroup_4:OnEventLand(EventData)
			if (SmokeOn == true) then
				smokeString = " on orange smoke! >>"
			else
				smokeString = "! >>"
			end
			trigger.action.outText("<< ".. lzInsertionName_4  .. " on " .. Transport_4_Group[NewGroupNumber_4]:GetName() .. 
				" has reached the landing zone >> " ..
				"\n<< Troops deployed danger close" .. smokeString, 25)
				--"\n<< Use extreme caution! >>", 25)
			
			zeus_infantry_handler(Transport_4_Group[NewGroupNumber_4])
			
			timer.scheduleFunction(function() -- Destroy helo after x seconds to avoid a second RTB landing event
			if show_rtb_msg == true then
				trigger.action.outText( "<< " .. Transport_4_Group[NewGroupNumber_4]:GetName() .. " is RTB! >>", 10)
				end
				Transport_4_Group[NewGroupNumber_4]:Destroy()
			end, nil, timer.getTime() + 120  )  --Please keep this at 2 mins
		
		end

		--Crash Event						
		function CurrentGroup_4:OnEventCrash(EventData)
				Transport_4_alive = false
				trigger.action.outText( "<< ALERT: An insertion transport was shot down! >>", 10)
				trigger.action.outSound("TTI Soundfiles/walkietalkieon.ogg" )
		end

		--Pilot dies event
		function CurrentGroup_4:OnEventPilotDead(EventData)
			Transport_4_alive = false
		end

		--Subscribe to events to monitor helicopter situation
		Transport_4_Group[NewGroupNumber_4]:HandleEvent(EVENTS.Land)
		Transport_4_Group[NewGroupNumber_4]:HandleEvent(EVENTS.PilotDead)
		Transport_4_Group[NewGroupNumber_4]:HandleEvent(EVENTS.Crash)

	else
		env.info("Transport 4 (Zeus Transport #2) is disabled. Enable it in the script.")
	end

end --End zeus_transport_handler()
 
env.info('TTI: Combat Troop Insertion - [ENABLED] - The boys are ready to go!')
	