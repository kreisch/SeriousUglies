--- 1980s setting of Serious Uglies ---
--- @author: kreisch

local HQBlue = GROUP:FindByName("HQBlue")
local CommandCenterBlue = COMMANDCENTER:New( HQBlue, "Overlord" )
local HQRED = GROUP:FindByName("HQRED")
local CommandCenterRed = COMMANDCENTER:New( HQRED, "MasterEvil" )

RoadblockWest = GROUP:FindByName("KvemoSba_RoadOutpost")
RoadblockEast = GROUP:FindByName("Kazbegi_RoadOutpost")

function Conflict_East_Border()
  if RoadblockEast:IsAlive() then
    -- BLUE UNITS
    BlueConvoy1 = SPAWN:New("TaskForceEast_Convoy1-1"):InitLimit(16,6):SpawnScheduled(300,0.5)
    
    -- RED UNITS
    --Roadblock = SPAWN:New("Kazbegi_RoadOutpost"):Spawn()
    --Defensive = SPAWN:New("Kazbegi_RoadOutpost-1"):Spawn()
    BorderForces1 = SPAWN:New("TaskForce_RU_East_BorderForces"):Spawn()
    BorderForces2 = SPAWN:New("TaskForce_RU_East_BorderForces-1"):Spawn()
    BorderForces3 = SPAWN:New("TaskForce_RU_East_BorderForces-2"):Spawn()
    
    RedConvoy1 = SPAWN:New("TaskForce_RU_East_Convoy1-1"):InitLimit(12,3):SpawnScheduled(300,0.5)
    RedConvoy2 = SPAWN:New("TaskForce_RU_East_Convoy1-2"):InitLimit(12,3):SpawnScheduled(600,0.7)
      
      ---- Spawn JTAC
      Spawn_Drone_Name = SPAWN:New( "US_BAI_RECCE_Reaper_East" ):Spawn():GetName()
      ctld.JTACAutoLase(Spawn_Drone_Name, 1688)
      
      
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
            --A2GDispatcherBlue:SetCommandCenter( CommandCenterBlue )
            
            -- Show a tactical display.
            --A2GDispatcherBlue:SetTacticalDisplay( false )
            --A2GDispatcherBlue:SetTacticalMenu("A2G Dispatcher", "HQ")
            
            
            -- Setup the patrols.
            
            -- The patrol zone.
            local PatrolZonePowerPlant = ZONE_POLYGON:NewFromGroupName("Zone_EastBorder_CAS")
            
            A2GDispatcherBlue:SetSquadron( "US_A10_CAS", AIRBASE.Caucasus.Mozdok, { "US_A10_CAS" })
            A2GDispatcherBlue:SetSquadronFuelThreshold("US_A10_CAS",0.2)
            --A2GDispatcherBlue:SetSquadronTanker("US_A10_CAS","Arco31")
            A2GDispatcherBlue:SetSquadronBaiPatrol2( "US_A10_CAS", PatrolZonePowerPlant, 800, 1200, 2000, 5000, "BARO", 5000, 230, 1000, 5000, "BARO" ) -- New API
            A2GDispatcherBlue:SetSquadronBaiPatrolInterval( "US_A10_CAS", 1, 30, 40, 1 )
            A2GDispatcherBlue:SetSquadronTakeoffInAir("US_A10_CAS",2000)
            A2GDispatcherBlue:SetSquadronOverhead( "US_A10_CAS", 1 )
            
                      ----##################################################################------
            -- Feel the russian style!
            -- Define a SET_GROUP object that builds a collection of groups that define the recce network.
            -- Here we build the network with all the groups that have a name starting with CCCP Recce.
            
            local DetectionSetGroupRUBAI = SET_GROUP:New()
            DetectionSetGroupRUBAI:FilterPrefixes( { "TaskForce_RU" } )
            DetectionSetGroupRUBAI:FilterStart()
            
            local DetectionRUBAI = DETECTION_AREAS:New( DetectionSetGroupRUBAI, 1000 )
            
            -- Setup the A2A dispatcher, and initialize it.
            A2GDispatcherRed = AI_A2G_DISPATCHER:New( DetectionRUBAI )
            
            
            -- Add defense coordinates.
            A2GDispatcherRed:AddDefenseCoordinate( "HQ", HQRED:GetCoordinate() )
            A2GDispatcherRed:SetDefenseReactivityHigh() -- High defense reactivity. So far proximity of a threat will trigger a defense action.
            A2GDispatcherRed:SetDefenseRadius( 9000000 ) -- Defense radius wide enough to also trigger defenses far away.
  
            -- Setup the patrols.
            -- The patrol zone.
            local PatrolZonePowerPlant = ZONE_POLYGON:NewFromGroupName("Zone_EastBorder_CAS")
            
            A2GDispatcherRed:SetSquadron( "RU_Cas_East", AIRBASE.Caucasus.Tbilisi_Lochini, { "RU_Cas_East" })
            A2GDispatcherRed:SetSquadronFuelThreshold("RU_Cas_East",0.2)
            A2GDispatcherRed:SetSquadronBaiPatrol2( "RU_Cas_East", PatrolZonePowerPlant, 800, 1200, 2000, 5000, "BARO", 5000, 230, 1000, 5000, "BARO" ) -- New API
            A2GDispatcherRed:SetSquadronBaiPatrolInterval( "RU_Cas_East", 1, 30, 40, 1 )
            A2GDispatcherRed:SetSquadronTakeoffInAir("RU_Cas_East",2000)
      env.info("Loaded A2G CAS Zone EAST")
    else
      Conflict_West_Border()
    end
end

-- in work
function stop()
  autoGFT_East_Blue:stopReinforcing()
end

function Conflict_West_Border()
  if RoadblockWest:IsAlive() then
    -- BLUE UNITS
    BlueConvoy1 = SPAWN:New("TaskForceWest_Convoy1-2"):InitLimit(16,6):SpawnScheduled(300,0.5)
    
    -- RED UNITS
    --Roadblock = SPAWN:New("KvemoSba_RoadOutpost"):Spawn()
    --Defensive = SPAWN:New("KvemoSbaGround-2"):Spawn()
    BorderForces1 = SPAWN:New("TaskForce_RU_West_BorderForces"):Spawn()
    BorderForces2 = SPAWN:New("TaskForce_RU_West_BorderForces-1"):Spawn()
    BorderForces3 = SPAWN:New("TaskForce_RU_West_BorderForces-2"):Spawn()
    BorderForces4 = SPAWN:New("TaskForce_RU_West_BorderForces-3"):Spawn()
    
    RedConvoy1 = SPAWN:New("TaskForce_RU_West_Convoy1-1"):InitLimit(12,3):SpawnScheduled(300,0.5)
    RedConvoy2 = SPAWN:New("TaskForce_RU_West_Convoy1-2"):InitLimit(12,3):SpawnScheduled(600,0.7)
    
      
      
          ---- Spawn JTAC
      Spawn_Drone_Name = SPAWN:New( "US_BAI_RECCE_Reaper_West" ):Spawn():GetName()
      ctld.JTACAutoLase(Spawn_Drone_Name, 1688)
      
      --- Define CAS now
      env.info("Loading A2G CAS Zone West")
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
            --A2GDispatcherBlue:SetCommandCenter( CommandCenterBlue )
            
            -- Show a tactical display.
            --A2GDispatcherBlue:SetTacticalDisplay( false )
            --A2GDispatcherBlue:SetTacticalMenu("A2G Dispatcher", "HQ")
           
            -- Setup the patrols.
            -- The patrol zone.
            local PatrolZonePowerPlant = ZONE_POLYGON:NewFromGroupName("Zone_WestBorder_CAS")
            
            A2GDispatcherBlue:SetSquadron( "US_A10_CAS", AIRBASE.Caucasus.Mozdok, { "US_A10_CAS" })
            A2GDispatcherBlue:SetSquadronFuelThreshold("US_A10_CAS",0.2)
            --A2GDispatcherBlue:SetSquadronTanker("US_A10_CAS","Arco31")
            A2GDispatcherBlue:SetSquadronBaiPatrol2( "US_A10_CAS", PatrolZonePowerPlant, 800, 1200, 2000, 5000, "BARO", 5000, 230, 1000, 5000, "BARO" ) -- New API
            A2GDispatcherBlue:SetSquadronBaiPatrolInterval( "US_A10_CAS", 1, 30, 40, 1 )
            A2GDispatcherBlue:SetSquadronTakeoffInAir("US_A10_CAS",2000)
            A2GDispatcherBlue:SetSquadronOverhead( "US_A10_CAS", 1 )
            
            
            ----##################################################################------
            -- Feel the russian style!
            -- Define a SET_GROUP object that builds a collection of groups that define the recce network.
            -- Here we build the network with all the groups that have a name starting with CCCP Recce.
            
            local DetectionSetGroupRUBAI = SET_GROUP:New()
            DetectionSetGroupRUBAI:FilterPrefixes( { "TaskForce_RU" } )
            DetectionSetGroupRUBAI:FilterStart()
            
            local DetectionRUBAI = DETECTION_AREAS:New( DetectionSetGroupRUBAI, 1000 )
            
            -- Setup the A2A dispatcher, and initialize it.
            A2GDispatcherRed = AI_A2G_DISPATCHER:New( DetectionRUBAI )
            
            
            -- Add defense coordinates.
            A2GDispatcherRed:AddDefenseCoordinate( "HQ", HQRED:GetCoordinate() )
            A2GDispatcherRed:SetDefenseReactivityHigh() -- High defense reactivity. So far proximity of a threat will trigger a defense action.
            A2GDispatcherRed:SetDefenseRadius( 9000000 ) -- Defense radius wide enough to also trigger defenses far away.
  
            -- Setup the patrols.
            -- The patrol zone.
            local PatrolZonePowerPlant = ZONE_POLYGON:NewFromGroupName("Zone_WestBorder_CAS")
            
            A2GDispatcherRed:SetSquadron( "RU_Cas_East", AIRBASE.Caucasus.Tbilisi_Lochini, { "RU_Cas_East" })
            A2GDispatcherRed:SetSquadronFuelThreshold("RU_Cas_East",0.2)
            A2GDispatcherRed:SetSquadronBaiPatrol2( "RU_Cas_East", PatrolZonePowerPlant, 800, 1200, 2000, 5000, "BARO", 5000, 230, 1000, 5000, "BARO" ) -- New API
            A2GDispatcherRed:SetSquadronBaiPatrolInterval( "RU_Cas_East", 1, 30, 40, 1 )
            A2GDispatcherRed:SetSquadronTakeoffInAir("RU_Cas_East",2000)                       
      env.info("Loaded A2G CAS Zone West")
      
      else
        Conflict_East_Border()
      end
end
local switch = math.random (1,2)

if switch == 1 then
    Conflict_East_Border()
end

if switch == 2 then
  Conflict_West_Border()
end



