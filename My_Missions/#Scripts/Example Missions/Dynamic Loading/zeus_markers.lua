env.info('ZEUS: Loading')
SupportHandler = EVENTHANDLER:New()


------ A2A RED
--------- Jets
--RU_Zeus_F5    = SPAWN:New("RU_Zeus_F5")
--RU_Zeus_Mig19 = SPAWN:New("RU_Zeus_Mig19")
--RU_Zeus_Mig21 = SPAWN:New("RU_Zeus_Mig21")
--RU_Zeus_Mig23 = SPAWN:New("RU_Zeus_Mig23")
--RU_Zeus_Mig25 = SPAWN:New("RU_Zeus_Mig25")
--RU_Zeus_Su25T = SPAWN:New("RU_Zeus_Su25T")
--------- Helo
--RU_Zeus_Mi24 = SPAWN:New("RU_Zeus_Mi24")
--RU_Zeus_Mi8  = SPAWN:New("RU_Zeus_Mi8")
--RU_Zeus_Ka50 = SPAWN:New("RU_Zeus_Ka50")
--
--
------ GROUND RED
----
--RU_ZEUS_SRMAAA      = SPAWN:New("RU_ZEUS_SRMAAA")
--RU_ZEUS_MobileInf   = SPAWN:New("RU_ZEUS_MobileInf")
--RU_ZEUS_InfSquad    = SPAWN:New("RU_ZEUS_InfSquad")
--RU_ZEUS_UAZ         = SPAWN:New("RU_ZEUS_UAZ")
--RU_ZEUS_T55         = SPAWN:New("RU_ZEUS_T55")
--RU_ZEUS_T555Group   = SPAWN:New("RU_ZEUS_T555Group")
--RU_ZEUS_Mortar      = SPAWN:New("RU_ZEUS_Mortar")
--RU_ZEUS_Igla        = SPAWN:New("RU_ZEUS_Igla")
--RU_ZEUS_S300        = SPAWN:New("S_RU_ZEUS_S300")
--RU_ZEUS_SA2         = SPAWN:New("S_RU_ZEUS_SA2")
----
------ A2A BLUE
--------- Jets
--US_Zeus_F5          = SPAWN:New("US_Zeus_F5")
--US_Zeus_F14         = SPAWN:New("US_Zeus_F14")
--US_Zeus_F15C        = SPAWN:New("US_Zeus_F15C")
--US_Zeus_F16C        = SPAWN:New("US_Zeus_F16C")
--US_Zeus_F18C        = SPAWN:New("US_Zeus_F18C")
--US_Zeus_JF17        = SPAWN:New("US_Zeus_JF17")
--------- Helo
--US_Zeus_AH64        = SPAWN:New("US_Zeus_AH64")
--US_Zeus_ch47d       = SPAWN:New("US_Zeus_ch47d")
--US_Zeus_ch53        = SPAWN:New("US_Zeus_ch53")
--US_Zeus_uh60        = SPAWN:New("US_Zeus_uh60")
--US_Zeus_uh1         = SPAWN:New("US_Zeus_uh1")
--US_Zeus_uh1_slick   = SPAWN:New("US_Zeus_uh1_slick")
------ GROUND BLUE
--
--US_ZEUS_SRMAAA          = SPAWN:New("US_ZEUS_SRMAAA")
--US_ZEUS_AbramsCompany   = SPAWN:New("US_ZEUS_AbramsCompany")
--US_ZEUS_Abrams5Group    = SPAWN:New("US_ZEUS_Abrams5Group")
--US_ZEUS_Abrams          = SPAWN:New("US_ZEUS_Abrams")
--US_ZEUS_HMMWV           = SPAWN:New("US_ZEUS_HMMWV")
--US_ZEUS_HQGroup         = SPAWN:New("US_ZEUS_HQGroup")
--US_ZEUS_MobileInf       = SPAWN:New("US_ZEUS_MobileInf")
--US_ZEUS_InfSquad        = SPAWN:New("US_ZEUS_InfSquad")
--US_ZEUS_Mortar          = SPAWN:New("US_ZEUS_Mortar")
--US_ZEUS_Stinger         = SPAWN:New("US_ZEUS_Stinger")
--US_ZEUS_Paladin5        = SPAWN:New("Arty_US_ZEUS_Paladin5")
--US_ZEUS_Support         = SPAWN:New("US_ZEUS_Support")
--US_ZEUS_Downed_Pilot    = SPAWN:New("Downed Pilot_Zeus")


function handleSpawnRequest(text, coord)


    zeusSpawn = nil
    local arty = nil
	-- RED
	env.info(text)
    if text:find("f5_red") then
        zeusSpawn = RU_Zeus_F5
    elseif text:find("mig19_red") then
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
    elseif text:find("f5_blue") then
        zeusSpawn =  US_Zeus_F5
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
    	
    	
    elseif text:find("us_zeus_downed_pilot") then
      
      local DOWNED_PILOT_ZEUS = US_ZEUS_Downed_Pilot:SpawnFromVec3(coord)    

      local _downedGroup = DOWNED_PILOT_ZEUS:GetDCSObject()
      local _downedUnit = DOWNED_PILOT_ZEUS:GetDCSUnit(1)

      trigger.action.setGroupAIOff(_downedGroup)
      local _freq = csar.generateADFFrequency()

      csar.addBeaconToGroup(_downedGroup:getName(), _freq)

      -- Generate DESCRIPTION text
      local _text = "Pilot of " .. _downedUnit:getName() .. " - " .. _downedUnit:getTypeName()

      csar.woundedGroups[_downedGroup:getName()] = { side = _downedGroup:getCoalition(), originalUnit = _downedUnit:getName(), frequency = _freq, desc = _text, player = nil }

      csar.initSARForPilot(_downedGroup, _freq)
      csar.addSpecialParametersToGroup(_downedGroup)
      
      return
    	
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
      
      elseif text:find("us_zeus_farp") then
      env.info("SpawneFarp!")
        FarpSpawner(coord)
      
      
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


        --local playerUnit = Event.initiator:getTypeName()
        
        
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


function FarpSpawner(coord)
  env.info("FARP Spawner STARTED")
  
  local coordinate = COORDINATE:NewFromCoordinate(coord)
  local SpawnFARP = SPAWNSTATIC:NewFromStatic( "Zeus_FARP", country.id.USA )
  --local SpawnFARPammo = SPAWNSTATIC:NewFromStatic( "Zeus_FARP_Ammo", country.id.USA )
  --local SpawnFARPfuel = SPAWNSTATIC:NewFromStatic( "Zeus_FARP_Fuel", country.id.USA )
  
  -- Do some offsets for coordinates!
  
  local vector = coordinate:GetVec2()
  local x = vector.x + 100
  local y = vector.y + 100
  
  
  SpawnFARP:SpawnFromCoordinate(coordinate,0)
  --SpawnFARPammo:SpawnFromPointVec2( POINT_VEC2:New( x, y ), 90)
  --SpawnFARPammo:SpawnFromCoordinate(Coordinate,0)
  --SpawnFARPfuel:SpawnFromCoordinate(Coordinate,0)
  
--  local SpawnBarrack = SPAWNSTATIC:NewFromStatic( "Barrack", country.id.GERMANY )
  
--  local ZonePointVec2 = ZonePosition:GetPointVec2()
  
--  local Building = SpawnBuilding:SpawnFromZone( ZonePosition, 0 )
  
--  for Heading = 0, 360,60 do
--    local Radial = Heading * ( math.pi*2 ) / 360
--    local x = ZonePointVec2:GetLat() + math.cos( Radial ) * 150
--    local y = ZonePointVec2:GetLon() + math.sin( Radial ) * 150
--    SpawnBarrack:SpawnFromPointVec2( POINT_VEC2:New( x, y ), Heading + 90 )
--  end
  
  env.info("FARP Spawner ENDED")
  
end

env.info('ZEUS: Loaded')