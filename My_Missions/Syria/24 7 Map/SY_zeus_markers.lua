env.info('ZEUS: Loading')
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
--f5_red = SPAWN:New("f5_red")
--f4_red = SPAWN:New("f4_red")
--f14_red = SPAWN:New("f14_red")
--f16_red = SPAWN:New("f16_red")
--f15_red = SPAWN:New("f15_red")
--m2000_red = SPAWN:New("m2000_red")
--su30_red = SPAWN:New("su30_red")
--su33_red = SPAWN:New("su33_red")
--su27_red = SPAWN:New("su27_red")
--mig21_red = SPAWN:New("mig21_red")
--mig29_red = SPAWN:New("mig29_red")
--drone_red = SPAWN:New("drone_red")
--mig23_red = SPAWN:New("mig23_red")
----A2A Helo ZEUS RED
--ah1w_red = SPAWN:New("ah1w_red")
--ah64a_red = SPAWN:New("ah64a_red")
--ah64d_red = SPAWN:New("ah64d_red")
--ah1w_red = SPAWN:New("ah1w_red")
--sa342mistral_red = SPAWN:New("sa342mistral_red")
--mi24v_red = SPAWN:New("mi24v_red")
--oh58d_red = SPAWN:New("oh58d_red")
----A2G ZEUS RED
--abrams_red = SPAWN:New("abrams_red")
--t80_red = SPAWN:New("t80_red")
--bmp_red = SPAWN:New("bmp_red")
--truck_red = SPAWN:New("truck_red")
--armor_group_red = SPAWN:New("armor_group_red")
--infantry_group_red = SPAWN:New("infantry_group_red")
----SHIP RED SPECIFIC
--if env.mission.theatre ~= "Nevada" then
--tanker_ship_red = SPAWN:New("tanker_ship_red")
--type052b_ship_red = SPAWN:New("type052b_ship_red")
--type052c_ship_red = SPAWN:New("type052c_ship_red")
--type054a_ship_red = SPAWN:New("type054a_ship_red")
--grisha_ship_red = SPAWN:New("grisha_ship_red")
--moskva_ship_red = SPAWN:New("moskva_ship_red")
--neus_ship_red = SPAWN:New("neus_ship_red")
--ssk_ship_red = SPAWN:New("ssk_ship_red")
--end
----A2G ZEUS RED SPECIFIC
--s10_red = SPAWN:New("s10_red")
--s11_red = SPAWN:New("s11_red")
--s3_red = SPAWN:New("s3_red")
--s2_red = SPAWN:New("s2_red")
--s6_red = SPAWN:New("s6_red")
--ural_red = SPAWN:New("ural_red")
--shilka_red = SPAWN:New("shilka_red")
--strella_red = SPAWN:New("strella_red")
--osa_red = SPAWN:New("osa_red")
--tunguska_red = SPAWN:New("tunguska_red")
--tor_red = SPAWN:New("tor_red")
--buk_red = SPAWN:New("buk_red")
--igla_manpads_red = SPAWN:New("igla_manpads_red")
--mig31_red = SPAWN:New("mig31_red")
--t90_red = SPAWN:New("t90_red")
--tu142_red = SPAWN:New("tu142_red")
--tu160_red = SPAWN:New("tu160_red")
--tu22m3_red = SPAWN:New("tu22m3_red")
--tu95ms_red = SPAWN:New("tu95ms_red")
--
----BLUE
--
----A2A ZEUS blue
--f5_blue = SPAWN:New("f5_blue")
--f4_blue = SPAWN:New("f4_blue")
--f14_blue = SPAWN:New("f14_blue")
--f16_blue = SPAWN:New("f16_blue")
--f15_blue = SPAWN:New("f15_blue")
--m2000_blue = SPAWN:New("m2000_blue")
--su27_blue = SPAWN:New("su27_blue")
--mig21_blue = SPAWN:New("mig21_blue")
--mig29_blue = SPAWN:New("mig29_blue")
--drone_blue = SPAWN:New("drone_blue")
--mig23_blue = SPAWN:New("mig23_blue")
----A2A Helo add BLUE
--ah1w_blue = SPAWN:New("ah1w_blue")
--ah64a_blue = SPAWN:New("ah64a_blue")
--ah64d_blue = SPAWN:New("ah64d_blue")
--ah1w_blue = SPAWN:New("ah1w_blue")
--sa342mistral_blue = SPAWN:New("sa342mistral_blue")
--mi24v_blue = SPAWN:New("mi24v_blue")
--oh58d_blue = SPAWN:New("oh58d_blue")
----A2G ZEUS blue
--abrams_blue = SPAWN:New("abrams_blue")
--t80_blue = SPAWN:New("t80_blue")
--bmp_blue = SPAWN:New("bmp_blue")
--truck_blue = SPAWN:New("truck_blue")
--armor_group_blue = SPAWN:New("armor_group_blue")
--infantry_group_blue = SPAWN:New("infantry_group_blue")
--
---- ADD NEW JTAC SPAWN DYNAMIC WITH LASE
----jtac = SPAWN:New("jtac")
--hmv = SPAWN:New("hmv")
--JTAC_MQ_ZEUS = SPAWN:New("JTAC-MQ-ZEUS")
--
----A2G ZEUS BLUE SPECIFIC
--hawk_blue = SPAWN:New("hawk_blue")
--patriot_blue = SPAWN:New("patriot_blue")
--avenger_blue = SPAWN:New("avenger_blue")
--linebacker_blue = SPAWN:New("linebacker_blue")
--stinger_manpads_blue = SPAWN:New("stinger_manpads_blue")
--chaparral_blue = SPAWN:New("chaparral_blue")
--vulcan_blue = SPAWN:New("vulcan_blue")
--b1b_blue = SPAWN:New("b1b_blue")
--b52_blue = SPAWN:New("b52_blue")
--f11a_blue = SPAWN:New("f11a_blue")
----SHIP Blue SPECIFIC
--if env.mission.theatre ~= "Nevada" then
--tanker_ship_blue = SPAWN:New("tanker_ship_blue")
--type052b_ship_blue = SPAWN:New("type052b_ship_blue")
--type052c_ship_blue = SPAWN:New("type052c_ship_blue")
--type054a_ship_blue = SPAWN:New("type054a_ship_blue")
--oliver_ship_blue = SPAWN:New("oliver_ship_blue")
--ticonderoga_ship_blue = SPAWN:New("ticonderoga_ship_blue")
--end


---- A2A RED
------- Jets
RU_Zeus_Mig19 = SPAWN:New("RU_Zeus_Mig19")
RU_Zeus_Mig21 = SPAWN:New("RU_Zeus_Mig21")
RU_Zeus_Mig23 = SPAWN:New("RU_Zeus_Mig23")
RU_Zeus_Mig25 = SPAWN:New("RU_Zeus_Mig25")
RU_Zeus_Su25T = SPAWN:New("RU_Zeus_Su25T")
------- Helo
RU_Zeus_Mi24 = SPAWN:New("RU_Zeus_Mi24")
RU_Zeus_Mi8 = SPAWN:New("RU_Zeus_Mi8")
RU_Zeus_Ka50 = SPAWN:New("RU_Zeus_Ka50")


---- GROUND RED
--
RU_ZEUS_SRMAAA      = SPAWN:New("RU_ZEUS_SRMAAA")
RU_ZEUS_MobileInf   = SPAWN:New("RU_ZEUS_MobileInf")
RU_ZEUS_InfSquad    = SPAWN:New("RU_ZEUS_InfSquad")
RU_ZEUS_UAZ         = SPAWN:New("RU_ZEUS_UAZ")
RU_ZEUS_T55         = SPAWN:New("RU_ZEUS_T55")
RU_ZEUS_T555Group   = SPAWN:New("RU_ZEUS_T555Group")
RU_ZEUS_Mortar      = SPAWN:New("RU_ZEUS_Mortar")
RU_ZEUS_Igla        = SPAWN:New("RU_ZEUS_Igla")
RU_ZEUS_S300        = SPAWN:New("S_RU_ZEUS_S300")
RU_ZEUS_SA2         = SPAWN:New("S_RU_ZEUS_SA2")
--
---- A2A BLUE
------- Jets
US_Zeus_F14         = SPAWN:New("US_Zeus_F14")
US_Zeus_F15C        = SPAWN:New("US_Zeus_F15C")
US_Zeus_F16C        = SPAWN:New("US_Zeus_F16C")
US_Zeus_F18C        = SPAWN:New("US_Zeus_F18C")
US_Zeus_JF17        = SPAWN:New("US_Zeus_JF17")
------- Helo
US_Zeus_AH64        = SPAWN:New("US_Zeus_AH64")
US_Zeus_ch47d       = SPAWN:New("US_Zeus_ch47d")
US_Zeus_ch53        = SPAWN:New("US_Zeus_ch53")
US_Zeus_uh60        = SPAWN:New("US_Zeus_uh60")
US_Zeus_uh1         = SPAWN:New("US_Zeus_uh1")
US_Zeus_uh1_slick   = SPAWN:New("US_Zeus_uh1_slick")
---- GROUND BLUE

US_ZEUS_SRMAAA          = SPAWN:New("US_ZEUS_SRMAAA")
US_ZEUS_AbramsCompany   = SPAWN:New("US_ZEUS_AbramsCompany")
US_ZEUS_Abrams5Group    = SPAWN:New("US_ZEUS_Abrams5Group")
US_ZEUS_Abrams          = SPAWN:New("US_ZEUS_Abrams")
US_ZEUS_HMMWV           = SPAWN:New("US_ZEUS_HMMWV")
US_ZEUS_HQGroup         = SPAWN:New("US_ZEUS_HQGroup")
US_ZEUS_MobileInf       = SPAWN:New("US_ZEUS_MobileInf")
US_ZEUS_InfSquad        = SPAWN:New("US_ZEUS_InfSquad")
US_ZEUS_Mortar          = SPAWN:New("US_ZEUS_Mortar")
US_ZEUS_Stinger         = SPAWN:New("US_ZEUS_Stinger")
US_ZEUS_Paladin5        = SPAWN:New("US_ZEUS_Paladin5")
US_ZEUS_Support         = SPAWN:New("US_ZEUS_Support")


function handleSpawnRequest(text, coord)


    zeusSpawn = nil
    local arty = nil
	-- RED
	env.info(text)
    if text:find("mig19_red") then
        zeusSpawn = RU_Zeus_Mig19
    elseif text:find("mig21_red") then
        zeusSpawn = RU_Zeus_Mig21
    elseif text:find("mig23_red") then
        zeusSpawn = RU_Zeus_Mig23
    elseif text:find("mig25_red") then
        zeusSpawn = RU_Zeus_Mig25
    elseif text:find("su25_red") then
        zeusSpawn = RU_Zeus_Su25T
    elseif text:find("mi24_red") then
        zeusSpawn = RU_Zeus_Mi24
    elseif text:find("mi8_red") then
        zeusSpawn = RU_Zeus_Mi8    
    elseif text:find("ka50_red") then
        zeusSpawn = RU_Zeus_Ka50   
        
        elseif text:find("ru_zeus_srmaa") then
        zeusSpawn = RU_ZEUS_SRMAAA
        elseif text:find("ru_zeus_mobileinf") then
        zeusSpawn = RU_ZEUS_MobileInf
        elseif text:find("ru_zeus_infsquad") then
        zeusSpawn = RU_ZEUS_InfSquad
        elseif text:find("ru_zeus_uaz") then
        zeusSpawn = RU_ZEUS_UAZ
        elseif text:find("ru_zeus_t55") then
        zeusSpawn = RU_ZEUS_T55
        elseif text:find("ru_zeus_t555group") then
        zeusSpawn = RU_ZEUS_T555Group
        elseif text:find("ru_zeus_mortar") then
        zeusSpawn = RU_ZEUS_Mortar
        elseif text:find("ru_zeus_igla") then
        zeusSpawn = RU_ZEUS_Igla
        elseif text:find("ru_zeus_s300") then
        zeusSpawn = RU_ZEUS_S300
        elseif text:find("ru_zeus_sa2") then
        zeusSpawn = RU_ZEUS_SA2

    -- BLUE
    elseif text:find("f14_blue") then
        zeusSpawn =  US_Zeus_F14
    elseif text:find("f15c_blue") then
        zeusSpawn =  US_Zeus_F15C
    elseif text:find("f16c_blue") then
        zeusSpawn =  US_Zeus_F16C
    elseif text:find("f18c_blue") then
        zeusSpawn =  US_Zeus_F18C
    elseif text:find("jf17_blue") then
        zeusSpawn =  US_Zeus_JF17
              
    elseif text:find("ah64_blue") then
        zeusSpawn = US_Zeus_AH64    
    elseif text:find("ch47_blue") then
        zeusSpawn =  US_Zeus_ch47d   
    elseif text:find("ch53_blue") then
        zeusSpawn = US_Zeus_ch53
    elseif text:find("uh60_blue") then
        zeusSpawn = US_Zeus_uh60        
    elseif text:find("uh1_blue") then
        zeusSpawn =  US_Zeus_uh1      
    elseif text:find("uh1_slick_blue") then
        zeusSpawn =  US_Zeus_uh1_slick    
        
        elseif text:find("us_zeus_srmaaa") then
        zeusSpawn =  US_ZEUS_SRMAAA
        elseif text:find("us_zeus_abramscompany") then
        zeusSpawn =  US_ZEUS_AbramsCompany 
        elseif text:find("us_zeus_abrams5group") then
        zeusSpawn =  US_ZEUS_Abrams5Group 
        elseif text:find("us_zeus_abrams") then
        zeusSpawn =  US_ZEUS_Abrams 
        elseif text:find("us_zeus_hmmwv") then
        zeusSpawn =  US_ZEUS_HMMWV 
        elseif text:find("us_zeus_hqgroup") then
        zeusSpawn =  US_ZEUS_HQGroup 
        elseif text:find("us_zeus_mobileinf") then
        zeusSpawn =  US_ZEUS_MobileInf
        elseif text:find("us_zeus_infsquad") then
        zeusSpawn =  US_ZEUS_InfSquad  
        --elseif text:find("us_zeus_mortar") then
        --zeusSpawn =  US_ZEUS_Mortar
        elseif text:find("us_zeus_stinger") then
        zeusSpawn =  US_ZEUS_Stinger   
        elseif text:find("us_zeus_support") then
        zeusSpawn =  US_ZEUS_Support
        
        		
  	elseif text:find("jtac") then
    	JTAC_ZEUS = JTAC_MQ_ZEUS:SpawnFromVec3(coord)
    	JTAC_ZEUS_NAME = JTAC_ZEUS:GetName()
    	JTACAutoLase(JTAC_ZEUS_NAME, 1685, true, "all")
    	trigger.action.outText ( "JTAC:  ".. JTAC_ZEUS_NAME .." on station lasing 1685. \nNOTE: If you wish to delete Zeus-spawned JTACS use the map marker command -delete jtac", 60)
    	
    	
    	env.info("JTAC:  ".. JTAC_ZEUS_NAME .."  spawned!")
    	
    elseif text:find("us_zeus_paladin5") then
      
      PALADIN_ZEUS = US_ZEUS_Paladin5:SpawnFromVec3(coord)
      PALADIN_ZEUS_NAME = PALADIN_ZEUS:GetName()    
      paladin = ARTY:New(GROUP:FindByName(PALADIN_ZEUS_NAME))
      paladin:SetMaxFiringRange(20)
      paladin:SetMarkAssignmentsOn()
      paladin:Start()
      
      env.info("Spawn:  ".. PALADIN_ZEUS_NAME .."  spawned!")
	
	    return
	    
	  elseif text:find("us_zeus_mortar") then
      
      MORTAR_ZEUS = US_ZEUS_Mortar:SpawnFromVec3(coord)
      MORTAR_ZEUS_NAME = MORTAR_ZEUS:GetName()    
      mortar = ARTY:New(GROUP:FindByName(MORTAR_ZEUS_NAME))
      mortar:SetMaxFiringRange(6)
      mortar:SetMarkAssignmentsOn()
      mortar:Start()
      
      env.info("Spawn:  ".. PALADIN_ZEUS_NAME .."  spawned!")
  
      return
	end
	
	spawnAltitude = 4000

	zeusSpawn:SpawnFromVec3(coord)

		env.info( "" .. text .. " on MAP MARKER succesfully CREATED.")
		--trigger.action.outText( "" .. text .. " on MAP MARKER succesfully CREATED.", 10)

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

        local vec3 = {z=Event.pos.z, x=Event.pos.x}
        local coord = COORDINATE:NewFromVec3(vec3)

        local playerUnit = Event.initiator:getTypeName()
        
        
--        env.info(playerUnit .. " is your unit type.")

        if Event.text:lower():find("-create") then
            handleSpawnRequest(text, coord)
        elseif Event.text:lower():find("-debug") then
            handleDebugRequest(text, coord) 
        elseif Event.text:lower():find("-destroy") then
            handleDestroyRequest(text, coord)
        elseif Event.text:lower():find("-delete jtac") then
            handleDeleteJtacRequest()
		elseif Event.text:lower():find("-nuke") then
			handleNukeRequest(text, coord)
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

env.info('ZEUS: Loaded')