--- 1980s setting of Serious Uglies ---
--- @author: kreisch

-- First we define a random number to determine which lane will go active

local HQBlue = GROUP:FindByName("HQBlue")
local CommandCenterBlue = COMMANDCENTER:New( HQBlue, "Overlord" )



local switch = math.random (1,1)

if switch == 1 then
  -- BLUE UNITS
  autogft_Setup:new()
    :addBaseZone("Vladikavkaz_Blue_Base")
    :startUsingRoads()
    :setSpeed(90)
    :addControlZone("East_Border_Obj3")
    :addControlZone("East_Border_Obj2")
    :addControlZone("East_Border_Obj1")
  
  -- RED UNITS
  autogft_Setup:new()
    :addBaseZone("Kazbegi_Red_Base-1")
    :startUsingRoads()
    :setSpeed(90)
    :addControlZone("East_Border_Obj3")
    :addControlZone("East_Border_Obj2")
    :addControlZone("East_Border_Obj1")
    
    ctld.JTACAutoLase('US_BAI_RECCE_Reaper_East', 1688)
    --- Define CAS now
    env.info("Loading A2G CAS Zone EAST")
          -- Initialize A2G
          --
          -- Define a SET_GROUP object that builds a collection of groups that define the recce network.
          -- Here we build the network with all the groups that have a name starting with CCCP Recce.
          
          local DetectionSetGroupUSBAI = SET_GROUP:New()
          DetectionSetGroupUSBAI:FilterPrefixes( { "US_BAI_RECCE" } )
          DetectionSetGroupUSBAI:FilterStart()
          
          local DetectionUSBAI = DETECTION_AREAS:New( DetectionSetGroupUSBAI, 1000 )
          
          -- Setup the A2A dispatcher, and initialize it.
          A2GDispatcherBlue = AI_A2G_DISPATCHER:New( DetectionUSBAI )
          
          
          -- Add defense coordinates.
          A2GDispatcherBlue:AddDefenseCoordinate( "HQ", HQBlue:GetCoordinate() )
          A2GDispatcherBlue:SetDefenseReactivityHigh() -- High defense reactivity. So far proximity of a threat will trigger a defense action.
          A2GDispatcherBlue:SetDefenseRadius( 9000000 ) -- Defense radius wide enough to also trigger defenses far away.
          
          -- Communication to the players within the coalition. The HQ services the communication of the defense actions.
          A2GDispatcherBlue:SetCommandCenter( CommandCenterBlue )
          
          -- Show a tactical display.
          --A2GDispatcherBlue:SetTacticalDisplay( false )
          --A2GDispatcherBlue:SetTacticalMenu("A2G Dispatcher", "HQ")
          
          
          -- Setup the patrols.
          
          -- The patrol zone.
          local PatrolZonePowerPlant = ZONE_POLYGON:NewFromGroupName("Zone_EastBorder_CAS")
          
          A2GDispatcherBlue:SetSquadron( "F15E-Strike", AIRBASE.Caucasus.Mozdok, { "F15E-Strike" })
          A2GDispatcherBlue:SetSquadronFuelThreshold("F15E-Strike",0.2)
          --A2GDispatcherBlue:SetSquadronTanker("F15E-Strike","Arco31")
          A2GDispatcherBlue:SetSquadronBaiPatrol2( "F15E-Strike", PatrolZonePowerPlant, 800, 1200, 2000, 5000, "BARO", 5000, 230, 1000, 5000, "BARO" ) -- New API
          A2GDispatcherBlue:SetSquadronBaiPatrolInterval( "F15E-Strike", 1, 30, 40, 1 )
          A2GDispatcherBlue:SetSquadronTakeoffInAir("F15E-Strike",2000)
          A2GDispatcherBlue:SetSquadronOverhead( "F15E-Strike", 2 )
    env.info("Loaded A2G CAS Zone EAST")
end

if switch == 2 then
  -- BLUE UNITS
  autogft_Setup:new()
    :addBaseZone("Alagir_Blue_Base")
    :startUsingRoads()
    :setSpeed(90)
    :addControlZone("West_Border_Ob1")
    :addControlZone("West_Border_Ob2")
    :addControlZone("West_Border_Ob3")
  
  -- RED UNITS
  autogft_Setup:new()
    :addBaseZone("KvemoSba_Red_Base")
    :startUsingRoads()
    :setSpeed(90)
    :addControlZone("West_Border_Ob1")
    :addControlZone("West_Border_Ob2")
    :addControlZone("West_Border_Ob3")

end