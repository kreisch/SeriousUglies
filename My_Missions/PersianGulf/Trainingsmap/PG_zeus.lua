--------------------------------------------------------
-- Welcome
-- This is the ZEUS-Script, based on the TTI version, adapted for the usage by Serious Uglies.

---------


env.info('Zeus: Loading')
SupportHandler = EVENTHANDLER:New()

-- function spv(groupName, coord)
	-- group = SPAWN:New(groupName)
-- --	:InitRepeatOnLanding()
	-- group:SpawnFromVec2(coord:GetVec2())
-- end

--RED

----- Define the possible unit names.
----- You need for each defined SPAWN an example Group in the mission.
--A2A ZEUS RED
f5_red = SPAWN:New("f5_red")
-- f4_red = SPAWN:New("f4_red")
-- f14_red = SPAWN:New("f14_red")
-- f16_red = SPAWN:New("f16_red")
-- f15_red = SPAWN:New("f15_red")
-- m2000_red = SPAWN:New("m2000_red")
-- su30_red = SPAWN:New("su30_red")
-- su33_red = SPAWN:New("su33_red")
-- su27_red = SPAWN:New("su27_red")
-- mig21_red = SPAWN:New("mig21_red")
-- mig29_red = SPAWN:New("mig29_red")
-- drone_red = SPAWN:New("drone_red")
-- mig23_red = SPAWN:New("mig23_red")
-- --A2A Helo ZEUS RED
-- ah1w_red = SPAWN:New("ah1w_red")
-- ah64a_red = SPAWN:New("ah64a_red")
-- ah64d_red = SPAWN:New("ah64d_red")
-- ah1w_red = SPAWN:New("ah1w_red")
-- sa342mistral_red = SPAWN:New("sa342mistral_red")
-- mi24v_red = SPAWN:New("mi24v_red")
-- oh58d_red = SPAWN:New("oh58d_red")
-- --A2G ZEUS RED
-- abrams_red = SPAWN:New("abrams_red")
-- t80_red = SPAWN:New("t80_red")
-- bmp_red = SPAWN:New("bmp_red")
-- truck_red = SPAWN:New("truck_red")
-- armor_group_red = SPAWN:New("armor_group_red")
-- infantry_group_red = SPAWN:New("infantry_group_red")
-- --SHIP RED SPECIFIC
-- if env.mission.theatre ~= "Nevada" then
-- tanker_ship_red = SPAWN:New("tanker_ship_red")
-- type052b_ship_red = SPAWN:New("type052b_ship_red")
-- type052c_ship_red = SPAWN:New("type052c_ship_red")
-- type054a_ship_red = SPAWN:New("type054a_ship_red")
-- grisha_ship_red = SPAWN:New("grisha_ship_red")
-- moskva_ship_red = SPAWN:New("moskva_ship_red")
-- neus_ship_red = SPAWN:New("neus_ship_red")
-- ssk_ship_red = SPAWN:New("ssk_ship_red")
-- end
-- --A2G ZEUS RED SPECIFIC
-- s10_red = SPAWN:New("s10_red")
-- s11_red = SPAWN:New("s11_red")
-- s3_red = SPAWN:New("s3_red")
-- s2_red = SPAWN:New("s2_red")
-- s6_red = SPAWN:New("s6_red")
-- ural_red = SPAWN:New("ural_red")
-- shilka_red = SPAWN:New("shilka_red")
-- strella_red = SPAWN:New("strella_red")
-- osa_red = SPAWN:New("osa_red")
-- tunguska_red = SPAWN:New("tunguska_red")
-- tor_red = SPAWN:New("tor_red")
-- buk_red = SPAWN:New("buk_red")
-- igla_manpads_red = SPAWN:New("igla_manpads_red")
-- mig31_red = SPAWN:New("mig31_red")
-- t90_red = SPAWN:New("t90_red")
-- tu142_red = SPAWN:New("tu142_red")
-- tu160_red = SPAWN:New("tu160_red")
-- tu22m3_red = SPAWN:New("tu22m3_red")
-- tu95ms_red = SPAWN:New("tu95ms_red")

-- --BLUE

-- --A2A ZEUS blue
   KC135_Blue = SPAWN:New("KCSpawnTest")
-- f5_blue = SPAWN:New("f5_blue")
-- f4_blue = SPAWN:New("f4_blue")
-- f14_blue = SPAWN:New("f14_blue")
-- f16_blue = SPAWN:New("f16_blue")
-- f15_blue = SPAWN:New("f15_blue")
-- m2000_blue = SPAWN:New("m2000_blue")
-- su27_blue = SPAWN:New("su27_blue")
-- mig21_blue = SPAWN:New("mig21_blue")
-- mig29_blue = SPAWN:New("mig29_blue")
-- drone_blue = SPAWN:New("drone_blue")
-- mig23_blue = SPAWN:New("mig23_blue")
-- --A2A Helo add BLUE
-- ah1w_blue = SPAWN:New("ah1w_blue")
-- ah64a_blue = SPAWN:New("ah64a_blue")
-- ah64d_blue = SPAWN:New("ah64d_blue")
-- ah1w_blue = SPAWN:New("ah1w_blue")
-- sa342mistral_blue = SPAWN:New("sa342mistral_blue")
-- mi24v_blue = SPAWN:New("mi24v_blue")
-- oh58d_blue = SPAWN:New("oh58d_blue")
-- --A2G ZEUS blue
-- abrams_blue = SPAWN:New("abrams_blue")
-- t80_blue = SPAWN:New("t80_blue")
-- bmp_blue = SPAWN:New("bmp_blue")
-- truck_blue = SPAWN:New("truck_blue")
-- armor_group_blue = SPAWN:New("armor_group_blue")
-- infantry_group_blue = SPAWN:New("infantry_group_blue")

-- -- ADD NEW JTAC SPAWN DYNAMIC WITH LASE
-- --jtac = SPAWN:New("jtac")
-- hmv = SPAWN:New("hmv")
-- JTAC_MQ_ZEUS = SPAWN:New("JTAC-MQ-ZEUS")

-- --A2G ZEUS BLUE SPECIFIC
-- hawk_blue = SPAWN:New("hawk_blue")
-- patriot_blue = SPAWN:New("patriot_blue")
-- avenger_blue = SPAWN:New("avenger_blue")
-- linebacker_blue = SPAWN:New("linebacker_blue")
-- stinger_manpads_blue = SPAWN:New("stinger_manpads_blue")
-- chaparral_blue = SPAWN:New("chaparral_blue")
-- vulcan_blue = SPAWN:New("vulcan_blue")
-- b1b_blue = SPAWN:New("b1b_blue")
-- b52_blue = SPAWN:New("b52_blue")
-- f11a_blue = SPAWN:New("f11a_blue")
--SHIP Blue SPECIFIC
-- if env.mission.theatre ~= "Nevada" then
-- tanker_ship_blue = SPAWN:New("tanker_ship_blue")
-- type052b_ship_blue = SPAWN:New("type052b_ship_blue")
-- type052c_ship_blue = SPAWN:New("type052c_ship_blue")
-- type054a_ship_blue = SPAWN:New("type054a_ship_blue")
-- oliver_ship_blue = SPAWN:New("oliver_ship_blue")
-- ticonderoga_ship_blue = SPAWN:New("ticonderoga_ship_blue")
-- end
-- function handleSpawnRequest(text, coord)

    -- local unitList = {
-- --red      
		-- "f5_red",
        -- "f4_red",
        -- "f14_red",
        -- "f16_red",
		-- "f15_red",
		-- "m2000_red",
        -- "su30_red",
        -- "su33_red",
        -- "su27_red",
        -- "mig21_red",
        -- "mig29_red",
        -- "drone_red",
		
		-- "abrams_red",
        -- "t80_red",
        -- "bmp_red",
        -- "truck_red",
        
		-- "armor_group_red",
        -- "infantry_group_red",
		
		
-- --blue

		-- "f5_blue",
        -- "f4_blue",
        -- "f14_blue",
        -- "f16_blue",
		-- "f15_blue",
		-- "m2000_blue",
        -- "su27_blue",
        -- "mig21_blue",
        -- "mig29_blue",
        -- "drone_blue",
		
        -- "abrams_blue",
        -- "t80_blue",
        -- "bmp_blue",
        -- "truck_blue",
		
		-- "armor_group_blue",
        -- "infantry_group_blue",

-- --logistics
        -- "jtac",
    -- }
    
    -- for i_unit = 1, 35 do
        -- if text:find(unitList[i_unit]) then
		-- spv(unitList[i_unit], coord)
		-- trigger.action.outText( "" .. unitList[i_unit] .. " on your MAP MARKER succesfully CREATED.", 10)
        -- trigger.action.outSound( "BD_00007 single beep.ogg")
		-- end
	-- end
    
-- end

function handleSpawnRequest(text, coord)


    local zeusSpawn = nil
	--RED
    if text:find("f5_red") then
        zeusSpawn = f5_red
     elseif text:find("tanker") then
         zeusSpawn = KC135_Blue
--     elseif text:find("f14_red") then
--         zeusSpawn = f14_red
--     elseif text:find("f16_red") then
--         zeusSpawn = f16_red
--     elseif text:find("f15_red") then
--         zeusSpawn = f15_red
--     elseif text:find("m2000_red") then
--         zeusSpawn = m2000_red
--     elseif text:find("su30_red") then
--         zeusSpawn = su30_red
--     elseif text:find("mig21_red") then
--         zeusSpawn = mig21_red
--     elseif text:find("mig29_red") then
--         zeusSpawn = mig29_red
--     elseif text:find("drone_red") then
--         zeusSpawn = drone_red
--     elseif text:find("mig23_red") then
--         zeusSpawn = mig23_red
--     elseif text:find("abrams_red") then
--         zeusSpawn = abrams_red
--     elseif text:find("t80_red") then
--         zeusSpawn = t80_red
--     elseif text:find("bmp_red") then
--         zeusSpawn = bmp_red
--     elseif text:find("truck_red") then
--         zeusSpawn = truck_red
--     elseif text:find("armor_group_red") then
--         zeusSpawn = armor_group_red
--     elseif text:find("infantry_group_red") then
--         zeusSpawn = infantry_group_red
-- 	--RED HELO add
--     elseif text:find("sa342mistral_red") then
--         zeusSpawn = sa342mistral_red
--     elseif text:find("ah64a_red") then
--         zeusSpawn = ah64a_red
--     elseif text:find("ah1w_red") then
--         zeusSpawn = ah1w_red
--     elseif text:find("ah64d_red") then
--         zeusSpawn = ah64d_red
--     elseif text:find("ah64a_red") then
--         zeusSpawn = ah64a_red
-- 	elseif text:find("mi24v_red") then
--         zeusSpawn = mi24v_red
-- 	elseif text:find("oh58d_red") then
--         zeusSpawn = oh58d_red
-- 	--RED SPECelseifIC
--     elseif text:find("s10_red") then
--         zeusSpawn = s10_red
--     elseif text:find("s11_red") then
--         zeusSpawn = s11_red
--     elseif text:find("s3_red") then
--         zeusSpawn = s3_red
--     elseif text:find("s2_red") then
--         zeusSpawn = s2_red
--     elseif text:find("s6_red") then
--         zeusSpawn = s6_red
--     elseif text:find("ural_red") then
--         zeusSpawn = ural_red
--     elseif text:find("shilka_red") then
--         zeusSpawn = shilka_red
--     elseif text:find("strella_red") then
--         zeusSpawn = strella_red
--     elseif text:find("osa_red") then
--         zeusSpawn = osa_red
--     elseif text:find("tunguska_red") then
--         zeusSpawn = tunguska_red
--     elseif text:find("tor_red") then
--         zeusSpawn = tor_red
--     elseif text:find("buk_red") then
--         zeusSpawn = buk_red
--     elseif text:find("igla_manpads_red") then
--         zeusSpawn = igla_manpads_red
--     elseif text:find("mig31_red") then
--         zeusSpawn = mig31_red
--     elseif text:find("su33_red") then
--         zeusSpawn = su33_red
--     elseif text:find("su27_red") then
--         zeusSpawn = su27_red
--     elseif text:find("t90_red") then
--         zeusSpawn = t90_red
--     elseif text:find("tanker_ship_red") then
--         zeusSpawn = tanker_ship_red
--     elseif text:find("type052b_ship_red") then
--         zeusSpawn = type052b_ship_red
--     elseif text:find("type052c_ship_red") then
--         zeusSpawn = type052c_ship_red
--     elseif text:find("type054a_ship_red") then
--         zeusSpawn = type054a_ship_red
--     elseif text:find("grisha_ship_red") then
--         zeusSpawn = grisha_ship_red
--     elseif text:find("moskva_ship_red") then
--         zeusSpawn = moskva_ship_red
--     elseif text:find("neus_ship_red") then
--         zeusSpawn = neus_ship_red
--     elseif text:find("ssk_ship_red") then
--         zeusSpawn = ssk_ship_red
--     elseif text:find("tu142_red") then
--         zeusSpawn = tu142_red
--     elseif text:find("tu160_red") then
--         zeusSpawn = tu160_red
--     elseif text:find("tu22m3_red") then
--         zeusSpawn = tu22m3_red
--     elseif text:find("tu95ms_red") then
--         zeusSpawn = tu95ms_red
	
-- 	--BLUE		
-- 	elseif text:find("f5_blue") then
--         zeusSpawn = f5_blue
--     elseif text:find("f4_blue") then
--         zeusSpawn = f4_blue
--     elseif text:find("f14_blue") then
--         zeusSpawn = f14_blue
--     elseif text:find("f16_blue") then
--         zeusSpawn = f16_blue
--     elseif text:find("f15_blue") then
--         zeusSpawn = f15_blue
--     elseif text:find("m2000_blue") then
--         zeusSpawn = m2000_blue
--     elseif text:find("su27_blue") then
--         zeusSpawn = su27_blue
--     elseif text:find("mig21_blue") then
--         zeusSpawn = mig21_blue
--     elseif text:find("mig29_blue") then
--         zeusSpawn = mig29_blue
--     elseif text:find("drone_blue") then
--         zeusSpawn = drone_blue
--     elseif text:find("mig23_blue") then
--         zeusSpawn = mig23_blue
-- 	--BLUE HELO add
--     elseif text:find("sa342mistral_blue") then
--         zeusSpawn = sa342mistral_blue
--     elseif text:find("ah64a_blue") then
--         zeusSpawn = ah64a_blue
--     elseif text:find("ah1w_blue") then
--         zeusSpawn = ah1w_blue
--     elseif text:find("ah64d_blue") then
--         zeusSpawn = ah64d_blue
--     elseif text:find("ah64a_blue") then
--         zeusSpawn = ah64a_blue
-- 	elseif text:find("mi24v_blue") then
--         zeusSpawn = mi24v_blue
-- 	elseif text:find("oh58d_blue") then
--         zeusSpawn = oh58d_blue
--     elseif text:find("abrams_blue") then
--         zeusSpawn = abrams_blue
--     elseif text:find("t80_blue") then
--         zeusSpawn = t80_blue
--     elseif text:find("bmp_blue") then
--         zeusSpawn = bmp_blue
--     elseif text:find("truck_blue") then
--         zeusSpawn = truck_blue
--     elseif text:find("armor_group_blue") then
--         zeusSpawn = armor_group_blue
--     elseif text:find("infantry_group_blue") then
--         zeusSpawn = infantry_group_blue		
    
-- --BLUE SPECelseifIC	
--     elseif text:find("hawk_blue") then
--         zeusSpawn = hawk_blue
--     elseif text:find("patriot_blue") then
--         zeusSpawn = patriot_blue
--     elseif text:find("avenger_blue") then
--         zeusSpawn = avenger_blue
--     elseif text:find("linebacker_blue") then
--         zeusSpawn = linebacker_blue
--     elseif text:find("stinger_manpads_blue") then
--         zeusSpawn = stinger_manpads_blue
--     elseif text:find("chaparral_blue") then
--         zeusSpawn = chaparral_blue
--     elseif text:find("vulcan_blue") then
--         zeusSpawn = vulcan_blue
--     elseif text:find("tanker_ship_blue") then
--         zeusSpawn = tanker_ship_blue
--     elseif text:find("type052b_ship_blue") then
--         zeusSpawn = type052b_ship_blue
--     elseif text:find("type052c_ship_blue") then
--         zeusSpawn = type052c_ship_blue
--     elseif text:find("type054a_ship_blue") then
--         zeusSpawn = type054a_ship_blue
--     elseif text:find("oliver_ship_blue") then
--         zeusSpawn = oliver_ship_blue
--     elseif text:find("ticonderoga_ship_blue") then
--         zeusSpawn = ticonderoga_ship_blue
--     -- elseif text:find("jtac") then
--         -- zeusSpawn = jtac
--     elseif text:find("b1b_blue") then
--         zeusSpawn = b1b_blue
--     elseif text:find("b52_blue") then
--         zeusSpawn = b52_blue
--     elseif text:find("f11a_blue") then
--         zeusSpawn = f11a_blue
		
-- 	elseif text:find("jtac") then
-- 	JTAC_ZEUS = JTAC_MQ_ZEUS:SpawnFromVec3(coord)
-- 	JTAC_ZEUS_NAME = JTAC_ZEUS:GetName()
-- 	JTACAutoLase(JTAC_ZEUS_NAME, 1685, true, "all")
-- 	trigger.action.outText ( "JTAC:  ".. JTAC_ZEUS_NAME .." on station lasing 1685. \nNOTE: If you wish to delete Zeus-spawned JTACS use the map marker command -delete jtac", 60)
-- 	env.info("JTAC:  ".. JTAC_ZEUS_NAME .."  spawned!")
	
		
	end




	spawnAltitude = 4000
    -- for i_unit = 1, 9 do
   --    if text:find(unitList[i_unit]) then
	--	zeusSpawn:SpawnFromCoordinate(coord)
	--	trigger.action.outText( "" .. text .. " @ " .. coord .. " succesfully CREATED.", 10)
		-- spv(unitList[i_unit], coord)

	--zeusSpawn:SpawnFromCoordinate(coord)
	-- Here the unit spawns.
	zeusSpawn:SpawnFromVec3(coord)
	-- Here we want Todo something to manipulate the waypoints and create a Racetrack IF the string contained 'tanker'
	if text:lower():find("tanker") then 
	   --We know it is a tanker, manipulate it!
	   trigger.action.outText("Zeus: You spawned a tanker", 10)
	else
	   trigger.action.outText("Zeus: You spawned another unit", 10)
	end
	
	
		--trigger.action.outText( "" .. unitList[i_unit] .. " on MAP MARKER succesfully CREATED.", 10)
		env.info( "" .. text .. " on MAP MARKER succesfully CREATED.")
		trigger.action.outText( "" .. text .. " on MAP MARKER succesfully CREATED.", 10)
--		trigger.action.outText( "" .. text .. " @ " .. coord .. " succesfully CREATED.", 10)
        -- trigger.action.outSound( "BD_00007 single beep.ogg")
		end

function handleDebugRequest(text, coord)

end

local destroyZoneCount = 0
function handleDestroyRequest(text, coord)
    local destroyZoneName = string.format("destroy %d", destroyZoneCount)
    local zoneRadiusToDestroy = ZONE_RADIUS:New(destroyZoneName, coord:GetVec2(), 1000)
    destroyZoneCount = destroyZoneCount + 1
	trigger.action.outText("UNIT(S) on your MAP MARKER succesfully DESTROYED.", 10)
    local function destroyUnit(unit)
        unit:Destroy()
        return true
    end

    zoneRadiusToDestroy:SearchZone( destroyUnit , Object.Category.UNIT)
end

function handleDeleteJtacRequest()
	Group.getByName(JTAC_ZEUS_NAME):destroy()
	trigger.action.outText("ZEUS JTAC:  ".. JTAC_ZEUS_NAME .." deleted", 60)
end

function handleNukeRequest(text, coord)
		local destroyZoneName = string.format("destroy %d", destroyZoneCount)
		local zoneRadiusToDestroy = ZONE_RADIUS:New(destroyZoneName, coord:GetVec2(), 8050)
		destroyZoneCount = destroyZoneCount + 1

		local function destroyUnit(unit)
			if unit:GetTypeName() ~= "RQ-1A Predator" then
				unit:Destroy()
				return true
			end
		end

		zoneRadiusToDestroy:SearchZone( destroyUnit , Object.Category.UNIT)
	end


function markRemoved(Event)
    if Event.text~=nil and Event.text:lower():find("-") then 
        local text = Event.text:lower()
     --   local vec3 = {y=Event.pos.y, x=Event.pos.z, z=Event.pos.x}
--        local vec3 = {x=Event.pos.z, z=Event.pos.x}
        local vec3 = {z=Event.pos.z, x=Event.pos.x}
        local coord = COORDINATE:NewFromVec3(vec3)
    --    local coord = COORDINATE:NewFromVec3(vec3)
    --  coord.y = coord:GetLandHeight()
     -- coord.y = coord:SetAltitude()


        if Event.text:lower():find("-create") then
            handleSpawnRequest(text, coord)
        elseif Event.text:lower():find("-debug") then
            handleDebugRequest(text, coord) 
        elseif Event.text:lower():find("-destroy") then
            handleDestroyRequest(text, coord)
        elseif Event.text:lower():find("-delete jtac") then
            handleDeleteJtacRequest()
		-- elseif Event.text:lower():find("-nuke") then
		-- NUKE is disabled
		-- 	handleNukeRequest(text, coord)
        end
    end
end

function SupportHandler:onEvent(Event)
    if Event.id == world.event.S_EVENT_MARK_ADDED then
        -- env.info(string.format("BTI: Support got event ADDED id %s idx %s coalition %s group %s text %s", Event.id, Event.idx, Event.coalition, Event.groupID, Event.text))
    elseif Event.id == world.event.S_EVENT_MARK_CHANGE then
        -- env.info(string.format("BTI: Support got event CHANGE id %s idx %s coalition %s group %s text %s", Event.id, Event.idx, Event.coalition, Event.groupID, Event.text))
    elseif Event.id == world.event.S_EVENT_MARK_REMOVED then
        -- env.info(string.format("BTI: Support got event REMOVED id %s idx %s coalition %s group %s text %s", Event.id, Event.idx, Event.coalition, Event.groupID, Event.text))
        markRemoved(Event)
    end
end

world.addEventHandler(SupportHandler)

env.info('Zeus: Loaded')
trigger.action.outText("Zeus: Loaded and ready.", 10)


----- Split string. C.f. http://stackoverflow.com/questions/1426954/split-string-in-lua
---- Thanks Franky! Google put me right to this topic :D - [ugly]kreisch
--function zeus._split(str, sep)
--  local result = {}
--  local regex = ("([^%s]+)"):format(sep)
--  for each in str:gmatch(regex) do
--    table.insert(result, each)
--  end
--  return result
--end