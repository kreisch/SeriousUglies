if env.mission.theatre == "Caucasus" then
airbase_1 = "Gudauta"
airbase_2 = "Sochi-Adler"
airbase_3 = "Sukhumi-Babushara"

carrier_nimitz = "CVN-7X"
carrier_tarawa = "LHA-1 Tarawa"
carrier_kuznetzov = "CV Kuznetsov"
end

if env.mission.theatre == "MarianaIslands" then
airbase_1 = "Andersen AFB"
airbase_2 = "Rota Intl"
airbase_3 = "Antonio B. Won Pat Intl"

carrier_nimitz = "CVN-7X"
carrier_tarawa = "LHA-1 Tarawa"
carrier_kuznetzov = "CV Kuznetsov"
end



if env.mission.theatre == "Normandy" then
airbase_1 = "Bazenville"
airbase_2 = "Sainte-Croix-sur-Mer"
airbase_3 = "Sukhumi-Babushara"

carrier_nimitz = "CVN-7X"
carrier_tarawa = "LHA-1 Tarawa"
carrier_kuznetzov = "CV Kuznetsov"
end

if env.mission.theatre == "Nevada" then
airbase_1 = "Nellis AFB"
airbase_2 = "Nellis AFB"
airbase_3 = "McCarran International Airport"
airbase_4 = "North Las Vegas"

carrier_nimitz = "Stennis"
carrier_tarawa = "LHA-1 Tarawa"
carrier_kuznetzov = "CV Kuznetsov"
end

if env.mission.theatre == "PersianGulf" then
airbase_1 = "Al Minhad AFB"
airbase_2 = "Bandar Abbas Intl"
airbase_3 = "Dubai Intl"

carrier_nimitz = "CVN-7X"
carrier_tarawa = "LHA-1 Tarawa"
carrier_kuznetzov = "CV Kuznetsov"
end

if env.mission.theatre == "Syria" and syra_map_type == "syr_al" then
airbase_1 = "Kuweires"
airbase_2 = "Aleppo"
airbase_3 = "Hatay"

carrier_nimitz = "CVN-7X"
carrier_tarawa = "LHA-1 Tarawa"
carrier_kuznetzov = "CV Kuznetsov"
end


if env.mission.theatre == "Syria" and syra_map_type == "syr_dm" then
airbase_1 = "Al-Dumayr"
airbase_2 = "Mezzeh"
airbase_3 = "Damascus"

carrier_nimitz = "CVN-7X"
carrier_tarawa = "LHA-1 Tarawa"
carrier_kuznetzov = "CV Kuznetsov"
end

if env.mission.theatre == "Syria" and syra_map_type == "syr_cy" then
airbase_1 = "Larnaca"
airbase_2 = "Paphos"
airbase_3 = "Larnaca"

carrier_nimitz = "CVN-7X"
carrier_tarawa = "LHA-1 Tarawa"
carrier_kuznetzov = "CV Kuznetsov"
end

min_distance = 80
--max_distance_destination = 300
inactive_timer = 300

if fighter_jet_combat_mode == "hold" then
		roe_setting = "hold"
	elseif fighter_jet_combat_mode == "return" then
		roe_setting = "return"
	elseif fighter_jet_combat_mode == "free" then
		roe_setting = "free"
	elseif fighter_jet_combat_mode == true then
		roe_setting = "free"
	elseif fighter_jet_combat_mode == false then
		roe_setting = "hold"
end

if random_civ_air_traffic == true then

if enable_large_1 == true and env.mission.theatre ~= "Nevada" then

if mission_era == "modern" then
	 yak=RAT:New("RAT_LARGE_1")
	elseif mission_era == "ww2" then
	 yak=RAT:New("RAT_LARGE_1_WW2")
	elseif mission_era == "korean_war" then
	 yak=RAT:New("RAT_LARGE_1_KOREAN_WAR")
end
yak:SetDeparture({airbase_1, airbase_2})
yak:SetMaxDistance(max_distance_destination)
yak:TimeDestroyInactive(inactive_timer)
yak:ATC_Messages(false)
yak:SetFLcruise(air_traffic_flight_level)
	if civ_allow_immortal == true then
		yak:Immortal()
	end
	if civ_allow_invisible == true then
		yak:Invisible()
	end
yak:Spawn(civ_rat_spawns)
end

if enable_large_2 == true then

if mission_era == "modern" then
 c130=RAT:New("RAT_LARGE_2")
	elseif mission_era == "ww2" then
 c130=RAT:New("RAT_LARGE_2_WW2")
	elseif mission_era == "korean_war" then
 c130=RAT:New("RAT_LARGE_2_KOREAN_WAR")
end
c130:SetDeparture({airbase_1, airbase_2})
c130:SetMaxDistance(max_distance_destination)
c130:TimeDestroyInactive(inactive_timer)
c130:ATC_Messages(false)
c130:SetFLcruise(air_traffic_flight_level)
	if civ_allow_immortal == true then
		c130:Immortal()
	end
	if civ_allow_invisible == true then
		c130:Invisible()
	end
c130:Spawn(civ_rat_spawns)
end

if enable_large_3 == true then

if mission_era == "modern" then
 c17=RAT:New("RAT_LARGE_3")
elseif mission_era == "ww2" then
 c17=RAT:New("RAT_LARGE_3_WW2")
elseif mission_era == "korean_war" then
 c17=RAT:New("RAT_LARGE_3_KOREAN_WAR")
end
c17:SetDeparture({airbase_1, airbase_2})
c17:SetMaxDistance(max_distance_destination)
c17:TimeDestroyInactive(inactive_timer)
c17:ATC_Messages(false)
c17:SetFLcruise(air_traffic_flight_level)
	if civ_allow_immortal == true then
		c17:Immortal()
	end
	if civ_allow_invisible == true then
		c17:Invisible()
	end
c17:Spawn(civ_rat_spawns)
end

if enable_large_4 == true and env.mission.theatre ~= "Nevada" then

if mission_era == "modern" then
 an26=RAT:New("RAT_LARGE_4")
	elseif mission_era == "ww2" then
 an26=RAT:New("RAT_LARGE_4_WW2")
	elseif mission_era == "korean_war" then
 an26=RAT:New("RAT_LARGE_4_KOREAN_WAR")
end
an26:SetDeparture({airbase_1, airbase_2})
an26:SetMaxDistance(max_distance_destination)
an26:TimeDestroyInactive(inactive_timer)
an26:ATC_Messages(false)
an26:SetFLcruise(air_traffic_flight_level)
	if civ_allow_immortal == true then
		an26:Immortal()
	end
	if civ_allow_invisible == true then
		an26:Invisible()
	end
an26:Spawn(civ_rat_spawns)
end

--NTTR ONLY FOR MCCARRAN
if enable_large_1 == true and env.mission.theatre == "Nevada" then
	timer.scheduleFunction(function() 
	if mission_era == "modern" then
		 yak=RAT:New("RAT_LARGE_1")
			elseif mission_era == "ww2" then
		 yak=RAT:New("RAT_LARGE_1_WW2")
	elseif mission_era == "korean_war" then
		 yak=RAT:New("RAT_LARGE_1_KOREAN_WAR")
end
			if trigger.misc.getUserFlag('AGH2-Inside') == 0 or trigger.misc.getUserFlag('MR4-Inside') == 0 then
				yak:SetDeparture({airbase_3})
				--an26:SetDeparture({airbase_3})
				elseif trigger.misc.getUserFlag('AGH2-Inside') == 1 or trigger.misc.getUserFlag('MR4-Inside') == 1 then
				yak:SetDeparture({airbase_4})
				--an26:SetDeparture({airbase_4})
			end
		yak:SetMaxDistance(max_distance_destination)
		yak:TimeDestroyInactive(inactive_timer)
		yak:ATC_Messages(false)
		yak:SetFLcruise(air_traffic_flight_level)
			if civ_allow_immortal == true then
				yak:Immortal()
			end
			if civ_allow_invisible == true then
				yak:Invisible()
			end
		--yak:SetSpawnDelay(120)
		yak:Spawn(civ_rat_spawns)
	end, nil, timer.getTime() + 120  )
end

if enable_large_4 == true and env.mission.theatre == "Nevada" then
	timer.scheduleFunction(function() 
	if mission_era == "modern" then
		 an26=RAT:New("RAT_LARGE_4")
			elseif mission_era == "ww2" then
		 an26=RAT:New("RAT_LARGE_4_WW2")
	elseif mission_era == "korean_war" then
		 an26=RAT:New("RAT_LARGE_4_KOREAN_WAR")
end
			if trigger.misc.getUserFlag('AGH2-Inside') == 0 or trigger.misc.getUserFlag('MR4-Inside') == 0 then
				an26:SetDeparture({airbase_3})
				--an26:SetDeparture({airbase_3})
				elseif trigger.misc.getUserFlag('AGH2-Inside') == 1 or trigger.misc.getUserFlag('MR4-Inside') == 1 then
				an26:SetDeparture({airbase_4})
				--an26:SetDeparture({airbase_4})
			end
		an26:SetMaxDistance(max_distance_destination)
		an26:TimeDestroyInactive(inactive_timer)
		an26:ATC_Messages(false)
		an26:SetFLcruise(air_traffic_flight_level)
			if civ_allow_immortal == true then
				an26:Immortal()
			end
			if civ_allow_invisible == true then
				an26:Invisible()
			end
		--an26:SetSpawnDelay(120)
		an26:Spawn(civ_rat_spawns)
	end, nil, timer.getTime() + 120  )
end

	timer.scheduleFunction(function() 
	trigger.action.outText("Random Civilian Air Traffic is ENABLED...", 10)
	end, nil, timer.getTime() + 8  )


end

if random_civ_air_traffic == false then
	timer.scheduleFunction(function() 
	trigger.action.outText("Random Civilian Air Traffic is DISABLED...", 10)
	end, nil, timer.getTime() + 8  )

end

if random_fighter_air_traffic == true then

  --non nttr:
if enable_f14_cv_to_ground == true and env.mission.theatre ~= "Nevada" and mission_era == "modern" then
--if enable_f14 == true then --nttr only
 f14=RAT:New("RAT_F14")
f14:SetTerminalType(AIRBASE.TerminalType.FighterAircraft)
f14:SetTakeoff(cv_takeoff_mode)
f14:SetDeparture({carrier_nimitz})
--f14:SetDestination({carrier_nimitz})
f14:SetMaxDistance(max_distance_destination)
f14:TimeDestroyInactive(inactive_timer)
f14:ATC_Messages(false)
f14:SetROE(roe_setting)
f14:SetROT("evade")
f14:SetFLcruise(air_traffic_flight_level)
	if fighter_jet_immortal == true then
		f14:Immortal()
	end
	if fighter_jet_invisible == true then
		f14:Invisible()
	end
f14:SetSpawnDelay(120)
f14:SetSpawnInterval(120)
f14:Spawn(fighter_rat_f14_cv_spawns)
end

if enable_f14_ground_to_cv == true and env.mission.theatre ~= "Nevada" and mission_era == "modern" then
 f14_grnd=RAT:New("RAT_F14_grnd")
f14_grnd:SetTerminalType(AIRBASE.TerminalType.FighterAircraft)
f14_grnd:SetTakeoff(cv_takeoff_mode)
f14_grnd:SetDeparture({airbase_1, airbase_2})
f14_grnd:SetDestination({carrier_nimitz})
f14_grnd:SetMaxDistance(max_distance_destination)
f14_grnd:TimeDestroyInactive(inactive_timer)
f14_grnd:ATC_Messages(false)
f14_grnd:SetROE(roe_setting)
f14_grnd:SetROT("evade")
	if fighter_jet_immortal == true then
		f14_grnd:Immortal()
	end
	if fighter_jet_invisible == true then
		f14_grnd:Invisible()
	end
f14_grnd:SetFLcruise(air_traffic_flight_level)
f14_grnd:SetSpawnDelay(120)
f14_grnd:SetSpawnInterval(120)
f14_grnd:Spawn(fighter_rat_f14_grnd_spawns)
end


if enable_f18_cv_to_ground == true and env.mission.theatre ~= "Nevada" and mission_era == "modern" then
--if enable_f18 == true then --nttr only
 f18=RAT:New("RAT_F18")
f18:SetTerminalType(AIRBASE.TerminalType.FighterAircraft)
f18:SetTakeoff(cv_takeoff_mode)
f18:SetDeparture({carrier_nimitz})
--f18:SetDestination({carrier_nimitz})
f18:SetMaxDistance(max_distance_destination)
f18:TimeDestroyInactive(inactive_timer)
f18:ATC_Messages(false)
f18:SetROE(roe_setting)
f18:SetROT("evade")
f18:SetFLcruise(air_traffic_flight_level)
	if fighter_jet_immortal == true then
		f18:Immortal()
	end
	if fighter_jet_invisible == true then
		f18:Invisible()
	end
f18:Spawn(fighter_rat_f18_cv_spawns)
end

if enable_f18_ground_to_cv == true and env.mission.theatre ~= "Nevada" and mission_era == "modern" then
 f18_grnd=RAT:New("RAT_F18_grnd")
f18_grnd:SetTerminalType(AIRBASE.TerminalType.FighterAircraft)
f18_grnd:SetTakeoff(cv_takeoff_mode)
f18_grnd:SetDeparture({airbase_1, airbase_2})
f18_grnd:SetDestination({carrier_nimitz})
f18_grnd:SetMaxDistance(max_distance_destination)
f18_grnd:TimeDestroyInactive(inactive_timer)
f18_grnd:ATC_Messages(false)
f18_grnd:SetROE(roe_setting)
f18_grnd:SetROT("evade")
f18_grnd:SetFLcruise(air_traffic_flight_level)
	if fighter_jet_immortal == true then
		f18_grnd:Immortal()
	end
	if fighter_jet_invisible == true then
		f18_grnd:Invisible()
	end
f18_grnd:Spawn(fighter_rat_f18_grnd_spawns)
end

--NTTR ONLY

if enable_f14 == true and env.mission.theatre == "Nevada" and mission_era == "modern" then
  --if enable_f14 == true then --nttr only
   f14=RAT:New("RAT_F14")
  f14:SetTerminalType(AIRBASE.TerminalType.FighterAircraft)
  f14:SetTakeoff("hot")
  f14:SetDeparture({airbase_1})
  --f14:SetDestination({carrier_nimitz})
  f14:SetMaxDistance(max_distance_destination)
  f14:TimeDestroyInactive(inactive_timer)
  f14:ATC_Messages(false)
  f14:SetROE(roe_setting)
  f14:SetROT("evade")
  f14:SetFLcruise(air_traffic_flight_level)
    if fighter_jet_immortal == true then
      f14:Immortal()
    end
    if fighter_jet_invisible == true then
      f14:Invisible()
    end
  -- f14:SetSpawnDelay(120)
  -- f14:SetSpawnInterval(120)
  f14:Spawn(fighter_rat_f14_spawns)
  end
  
  if enable_f18 == true and env.mission.theatre == "Nevada" and mission_era == "modern" then
    --if enable_f18 == true then --nttr only
     f18=RAT:New("RAT_F18")
    f18:SetTerminalType(AIRBASE.TerminalType.FighterAircraft)
    f18:SetTakeoff("hot")
    f18:SetDeparture({airbase_1})
    --f18:SetDestination({carrier_nimitz})
    f18:SetMaxDistance(max_distance_destination)
    f18:TimeDestroyInactive(inactive_timer)
    f18:ATC_Messages(false)
    f18:SetROE(roe_setting)
    f18:SetROT("evade")
    f18:SetFLcruise(air_traffic_flight_level)
      if fighter_jet_immortal == true then
        f18:Immortal()
      end
      if fighter_jet_invisible == true then
        f18:Invisible()
      end
    f18:Spawn(fighter_rat_f18_spawns)
end

if enable_fighter_1 == true then
	if mission_era == "modern" then
	 f15=RAT:New("RAT_FIGHTER_1")
elseif mission_era == "ww2" then
	 f15=RAT:New("RAT_FIGHTER_1_WW2")
elseif mission_era == "korean_war" then
	 f15=RAT:New("RAT_FIGHTER_1_KOREAN_WAR")
end
  f15:SetTerminalType(AIRBASE.TerminalType.FighterAircraft)
  f15:SetDeparture({airbase_1, airbase_2})
  f15:SetMaxDistance(max_distance_destination)
  f15:TimeDestroyInactive(inactive_timer)
  f15:ATC_Messages(false)
  f15:SetROE(roe_setting)
  f15:SetROT("evade")
  f15:SetFLcruise(air_traffic_flight_level)
    if fighter_jet_immortal == true then
      f15:Immortal()
    end
    if fighter_jet_invisible == true then
      f15:Invisible()
    end
  f15:Spawn(fighter_rat_f15_spawns)
  end
  
  if enable_fighter_2 == true then
	if mission_era == "modern" then
   f16=RAT:New("RAT_FIGHTER_2")
elseif mission_era == "ww2" then
   f16=RAT:New("RAT_FIGHTER_2_WW2")
elseif mission_era == "korean_war" then
   f16=RAT:New("RAT_FIGHTER_2_KOREAN_WAR")
end
  f16:SetTerminalType(AIRBASE.TerminalType.FighterAircraft)
  f16:SetDeparture({airbase_1, airbase_2})
  f16:SetMaxDistance(max_distance_destination)
  f16:TimeDestroyInactive(inactive_timer)
  f16:ATC_Messages(false)
  f16:SetROE(roe_setting)
  f16:SetROT("evade")
  f16:SetFLcruise(air_traffic_flight_level)
    if fighter_jet_immortal == true then
      f16:Immortal()
    end
    if fighter_jet_invisible == true then
      f16:Invisible()
    end
  f16:Spawn(fighter_rat_f16_spawns)
  end

if enable_fighter_3 == true then
if mission_era == "modern" then
 a10=RAT:New("RAT_FIGHTER_3")
elseif mission_era == "ww2" then
 a10=RAT:New("RAT_FIGHTER_3_WW2")
elseif mission_era == "korean_war" then
 a10=RAT:New("RAT_FIGHTER_3_KOREAN_WAR")
end
a10:SetTerminalType(AIRBASE.TerminalType.FighterAircraft)
a10:SetDeparture({airbase_1, airbase_2})
a10:SetMaxDistance(max_distance_destination)
a10:TimeDestroyInactive(inactive_timer)
a10:ATC_Messages(false)
a10:SetROE(roe_setting)
a10:SetROT("evade")
a10:SetFLcruise(air_traffic_flight_level)
	if fighter_jet_immortal == true then
		a10:Immortal()
	end
	if fighter_jet_invisible == true then
		a10:Invisible()
	end
a10:Spawn(fighter_rat_a10_spawns)
end

	timer.scheduleFunction(function() 
	trigger.action.outText("Random Fighter Air Traffic is ENABLED...", 10)
	end, nil, timer.getTime() + 8  )


end

if random_fighter_air_traffic == false then
	timer.scheduleFunction(function() 
	trigger.action.outText("Random Fighter Air Traffic is DISABLED...", 10)
	end, nil, timer.getTime() + 8  )

end

-- if random_helo_air_traffic == true then

-- if enable_oh58 == true then
--  oh58=RAT:New("RAT_OH58D")
-- oh58:SetTerminalType(AIRBASE.TerminalType.OpenMedOrBig)
-- oh58:SetDeparture(airbase_1)
-- oh58:SetDestination({airbase_2, airbase_3})
-- oh58:Spawn(spawn_helo_amount)
-- end

-- if enable_ch57 == true then
--  ch57=RAT:New("RAT_CH47")
-- ch57:SetTerminalType(AIRBASE.TerminalType.OpenMedOrBig)
-- ch57:SetDeparture(airbase_1)
-- ch57:SetDestination({airbase_2, airbase_3})
-- ch57:Spawn(spawn_helo_amount)
-- end

-- if enable_uh60 == true then
--  uh60=RAT:New("RAT_UH60")
-- uh60:SetTerminalType(AIRBASE.TerminalType.OpenMedOrBig)
-- uh60:SetDeparture(airbase_1)
-- uh60:SetDestination({airbase_2, airbase_3})
-- uh60:Spawn(spawn_helo_amount)
-- end

-- if enable_ah64 == true then
--  ah64=RAT:New("RAT_AH64D")
-- ah64:SetTerminalType(AIRBASE.TerminalType.OpenMedOrBig)
-- ah64:SetDeparture(airbase_1)
-- ah64:SetDestination({airbase_2, airbase_3})
-- ah64:Spawn(spawn_helo_amount)
-- end

	-- timer.scheduleFunction(function() 
	-- trigger.action.outText("Random Helo Air Traffic is ENABLED...", 10)
	-- end, nil, timer.getTime() + 8  )

-- end

-- if random_helo_air_traffic == false then
	-- timer.scheduleFunction(function() 
	-- trigger.action.outText("Random Helo Air Traffic is DISABLED...", 10)
	-- end, nil, timer.getTime() + 8  )

-- end

--[[
    AIRBASE.TerminalType.HelicopterOnly: Special spots for Helicopers.
    AIRBASE.TerminalType.Shelter: Hardened Air Shelter. Currently only on Caucaus map.
    AIRBASE.TerminalType.OpenMed: Open/Shelter air airplane only.
    AIRBASE.TerminalType.OpenBig: Open air spawn points. Generally larger but does not guarantee large aircraft are capable of spawning there.
    AIRBASE.TerminalType.OpenMedOrBig: Combines OpenMed and OpenBig spots.
    AIRBASE.TerminalType.HelicopterUnsable: Combines HelicopterOnly, OpenMed and OpenBig.
    AIRBASE.TerminalType.FighterAircraft: Combines Shelter, OpenMed and OpenBig spots. So effectively all spots usable by fixed wing aircraft.
--]]

--[[
--ADJUST RANDOM AI AIR TRAFFIC SPAWN SETTINGS HERE
--READ THE MISSION SETTINGS --README FILE FOR MORE DETAILS

random_civ_air_traffic = true
random_fighter_air_traffic = true
random_helo_air_traffic = true

-- # of aircraft spawns PER TYPE,
civ_rat_spawns = 1
fighter_rat_spawns = 2
helo_rat_spawns = 1

-- enable or disable ai aircraft types that will spawn in (use true or false)

-- civilian
enable_yak = true
enable_c130 = true
enable_c17 = true
enable_an26 = true

-- fighter jet
enable_f14 = true
enable_f15 = true
enable_f16 = true
enable_f18 = true
enable_a10 = true

-- helo
enable_oh58 = true
enable_ch57 = true
enable_uh60 = true
enable_ah64 = true
--]]

--[[
AIRBASE.Caucasus = {
  ["Gelendzhik"] = "Gelendzhik",
  ["Krasnodar_Pashkovsky"] = "Krasnodar-Pashkovsky",
  ["Sukhumi_Babushara"] = "Sukhumi-Babushara",
  ["Gudauta"] = "Gudauta",
  ["Batumi"] = "Batumi",
  ["Senaki_Kolkhi"] = "Senaki-Kolkhi",
  ["Kobuleti"] = "Kobuleti",
  ["Kutaisi"] = "Kutaisi",
  ["Tbilisi_Lochini"] = "Tbilisi-Lochini",
  ["Soganlug"] = "Soganlug",
  ["Vaziani"] = "Vaziani",
  ["Anapa_Vityazevo"] = "Anapa-Vityazevo",
  ["Krasnodar_Center"] = "Krasnodar-Center",
  ["Novorossiysk"] = "Novorossiysk",
  ["Krymsk"] = "Krymsk",
  ["Maykop_Khanskaya"] = "Maykop-Khanskaya",
  ["Sochi_Adler"] = "Sochi-Adler",
  ["Mineralnye_Vody"] = "Mineralnye Vody",
  ["Nalchik"] = "Nalchik",
  ["Mozdok"] = "Mozdok",
  ["Beslan"] = "Beslan",
  }
  
  AIRBASE.Nevada = {
  ["Creech_AFB"] = "Creech AFB",
  ["Groom_Lake_AFB"] = "Groom Lake AFB",
  ["McCarran_International_Airport"] = "McCarran International Airport",
  ["Nellis_AFB"] = "Nellis AFB",
  ["Beatty_Airport"] = "Beatty Airport",
  ["Boulder_City_Airport"] = "Boulder City Airport",
  ["Echo_Bay"] = "Echo Bay",
  ["Henderson_Executive_Airport"] = "Henderson Executive Airport",
  ["Jean_Airport"] = "Jean Airport",
  ["Laughlin_Airport"] = "Laughlin Airport",
  ["Lincoln_County"] = "Lincoln County",
  ["Mesquite"] = "Mesquite",
  ["Mina_Airport_3Q0"] = "Mina Airport 3Q0",
  ["North_Las_Vegas"] = "North Las Vegas",
  ["Pahute_Mesa_Airstrip"] = "Pahute Mesa Airstrip",
  ["Tonopah_Airport"] = "Tonopah Airport",
  ["Tonopah_Test_Range_Airfield"] = "Tonopah Test Range Airfield",
  }

AIRBASE.Normandy = {
  ["Saint_Pierre_du_Mont"] = "Saint Pierre du Mont",
  ["Lignerolles"] = "Lignerolles",
  ["Cretteville"] = "Cretteville",
  ["Maupertus"] = "Maupertus",
  ["Brucheville"] = "Brucheville",
  ["Meautis"] = "Meautis",
  ["Cricqueville_en_Bessin"] = "Cricqueville-en-Bessin",
  ["Lessay"] = "Lessay",
  ["Sainte_Laurent_sur_Mer"] = "Sainte-Laurent-sur-Mer",
  ["Biniville"] = "Biniville",
  ["Cardonville"] = "Cardonville",
  ["Deux_Jumeaux"] = "Deux Jumeaux",
  ["Chippelle"] = "Chippelle",
  ["Beuzeville"] = "Beuzeville",
  ["Azeville"] = "Azeville",
  ["Picauville"] = "Picauville",
  ["Le_Molay"] = "Le Molay",
  ["Longues_sur_Mer"] = "Longues-sur-Mer",
  ["Carpiquet"] = "Carpiquet",
  ["Bazenville"] = "Bazenville",
  ["Sainte_Croix_sur_Mer"] = "Sainte-Croix-sur-Mer",
  ["Beny_sur_Mer"] = "Beny-sur-Mer",
  ["Rucqueville"] = "Rucqueville",
  ["Sommervieu"] = "Sommervieu",
  ["Lantheuil"] = "Lantheuil",
  ["Evreux"] = "Evreux",
  ["Chailey"] = "Chailey",
  ["Needs_Oar_Point"] = "Needs Oar Point",
  ["Funtington"] = "Funtington",
  ["Tangmere"] = "Tangmere",
  ["Ford_AF"] = "Ford_AF",
  ["Goulet"] = "Goulet",
  ["Argentan"] = "Argentan",
  ["Vrigny"] = "Vrigny", 
  ["Essay"] = "Essay",
  ["Hauterive"] = "Hauterive",
  ["Barville"] = "Barville",
  ["Conches"] = "Conches",  
}

AIRBASE.PersianGulf = {
  ["Abu_Dhabi_International_Airport"] = "Abu Dhabi International Airport",
  ["Abu_Musa_Island_Airport"] = "Abu Musa Island Airport",
  ["Al_Ain_International_Airport"] = "Al Ain International Airport",
  ["Al_Bateen_Airport"] = "Al-Bateen Airport",
  ["Al_Dhafra_AB"] = "Al Dhafra AB",
  ["Al_Maktoum_Intl"] = "Al Maktoum Intl",
  ["Al_Minhad_AB"] = "Al Minhad AB",
  ["Bandar_Abbas_Intl"] = "Bandar Abbas Intl",
  ["Bandar_Lengeh"] = "Bandar Lengeh",
  ["Bandar_e_Jask_airfield"] = "Bandar-e-Jask airfield",
  ["Dubai_Intl"] = "Dubai Intl",  
  ["Fujairah_Intl"] = "Fujairah Intl",
  ["Havadarya"] = "Havadarya",
  ["Jiroft_Airport"] = "Jiroft Airport",
  ["Kerman_Airport"] = "Kerman Airport",
  ["Khasab"] = "Khasab",
  ["Kish_International_Airport"] = "Kish International Airport",
  ["Lar_Airbase"] = "Lar Airbase",
  ["Lavan_Island_Airport"] = "Lavan Island Airport",
  ["Liwa_Airbase"] = "Liwa Airbase",
  ["Qeshm_Island"] = "Qeshm Island",
  ["Ras_Al_Khaimah"] = "Ras Al Khaimah",
  ["Sas_Al_Nakheel_Airport"] = "Sas Al Nakheel Airport",
  ["Sharjah_Intl"] = "Sharjah Intl",
  ["Shiraz_International_Airport"] = "Shiraz International Airport",
  ["Sir_Abu_Nuayr"] = "Sir Abu Nuayr",
  ["Sirri_Island"] = "Sirri Island",
  ["Tunb_Island_AFB"] = "Tunb Island AFB",
  ["Tunb_Kochak"] = "Tunb Kochak",
}
--]]

--[[ settings for non nevada
--ADJUST RANDOM AI AIR TRAFFIC SPAWN SETTINGS HERE
--READ THE MISSION SETTINGS --README FILE FOR MORE DETAILS

random_civ_air_traffic = true
random_fighter_air_traffic = true


-- # of civ aircraft spawns PER TYPE,
civ_rat_spawns = 1

-- set # of fighter aircraft spawns, for each type individually

fighter_rat_fighter_3_spawns = 1
fighter_rat_f18_grnd_spawns = 0
fighter_rat_f18_cv_spawns = 1
fighter_rat_fighter_2_spawns = 1
fighter_rat_fighter_1_spawns = 1
fighter_rat_f14_grnd_spawns = 0
fighter_rat_f14_cv_spawns = 1

air_traffic_flight_level = 100
--example:  200 = 20000ft

max_distance_destination = 380
--the max distance in KM 
--of the ai aircaft's final destination airfield, which are chosen at random

civ_allow_immortal = false 
civ_allow_invisible = false

fighter_jet_combat_mode = "return"
-- LEAVE IN QOUTES " " 
-- free is weapons free
-- hold is weapons hold
-- return is return firef

fighter_jet_immortal = false 
fighter_jet_invisible = false

--change takeoff setting for carrier ai aircraft
-- use "hot", "cold", or "runway"
cv_takeoff_mode = "hot"

-- enable or disable ai aircraft types that will spawn in (use true or false)
-- civilian
enable_large_1 = true
enable_large_2 = true
enable_large_3 = false
enable_large_4 = true

-- fighter jet
enable_f14_cv_to_ground = true
enable_f14_ground_to_cv = false
enable_fighter_1 = true
enable_fighter_2 = true
enable_f18_cv_to_ground = true
enable_f18_ground_to_cv = false
enable_fighter_3 = true

]]

env.info('RAT Script complete')