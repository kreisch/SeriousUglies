-- Units for Rebel Mission Roy
royEasy = SPAWN:New("Royy #006")
royMedium1 = SPAWN:New("Royy Medium")
royMedium2 = SPAWN:New("Royy Medium #001")
royHard1 = SPAWN:New("Royy Hard 1")
royHard2 = SPAWN:New("Royy Hard 1 #001")
-- Units for Rebel Mission Zaymi
zaymiEasy = SPAWN:New("Zaymi #008")
zaymiMedium1 = SPAWN:New("Zaymi Medium")
zaymiMedium2 = SPAWN:New("Zaymi Medium #002")
zaymiMedium3 = SPAWN:New("Zaymi Medium #004")
zaymiHard1 = SPAWN:New("Zaymi Hard")
zaymiHard2 = SPAWN:New("Zaymi Hard #001")
-- Units for convoy
convoyStationaryEasy = SPAWN:New("Breakdown Convoy_Stationary")
convoyStationaryEasy2 = SPAWN:New("Breakdown Convoy_Stationary #001")
convoyStationaryMedium = SPAWN:New("Breakdown Convoy_Stationary_SAM")
convoyStationareHard = SPAWN:New("Breakdown Convoy_Stationary_Tunguskas")
convoyMoving = SPAWN:New("Convoy_Moving")
-- Units for montain
mountainhideoutEasy = SPAWN:New("Rebel Hideout #005")
mountainhideoutMedium = SPAWN:New("Rebel Hideout_Medium")
mountainhideoutMedium1 = SPAWN:New("Rebel Hideout_Medium #001")
mountainhideoutMedium2 = SPAWN:New("Rebel Hideout_Medium #002")
mountainhideoutMedium3 = SPAWN:New("Rebel Hideout_Medium #003")
mountainhideoutMedium4 = SPAWN:New("Rebel Hideout_Medium #004")
mountainhideoutHell = SPAWN:New("Rebel Hideout_Hell #004")
mountainhideoutHell2 = SPAWN:New("Rebel Hideout_Hell #003")
mountainhideoutHell3 = SPAWN:New("Rebel Hideout_Hell")




local strike1 = false
local defense = false
local boghammer = false
local roy = -1
local zaymi = -1
local convoy = -1
local convoyMovingboolean = -1
local mountain = -1
local RU_EWR_Initialized = false

local shipDrones = -1



local HQBlue = GROUP:FindByName("HQBlue")
local CommandCenterBlue = COMMANDCENTER:New( HQBlue, "Overlord" )
local HQRed = GROUP:FindByName("HQRed")
local CommandCenterRed = COMMANDCENTER:New( HQRed, "Mastermind" )
local ScoringBlue = SCORING:New( "Score" )


function StopMove( GroundGroup )
  
  BASE:E("Stop")
  local Command = GroundGroup:CommandStopRoute( true )
  GroundGroup:SetCommand(Command)

end
function StartMove( GroundGroup )
  
  BASE:E("Start")
  local Command = GroundGroup:CommandStopRoute( false )
  GroundGroup:SetCommand(Command)

end



-- No MOOSE settings menu.
_SETTINGS:SetPlayerMenuOff()


local function GlobalDefenseStart()
  if defense == false then
  
    globalDefenseGroup1 = SPAWN:New("GD_SAM_Hawk"):ReSpawn()
    globalDefenseGroup2 = SPAWN:New("GD_SAM_Hawk #001"):ReSpawn()
    globalDefenseGroup4 = SPAWN:New("GD_SAM_S300"):ReSpawn()
    globalDefenseGroup5 = SPAWN:New("GD_SAM_S300 #001"):ReSpawn()
    globalDefenseGroup9 = SPAWN:New("GD_SAM_S300 #002"):ReSpawn()
    globalDefenseGroup10 = SPAWN:New("GD_SAM_S300 #003"):ReSpawn()
    
    globalDefenseEWR0 = SPAWN:New("RU_EWR"):ReSpawn()
    globalDefenseEWR1 = SPAWN:New("RU_EWR #001"):ReSpawn()
    globalDefenseEWR2 = SPAWN:New("RU_EWR #002"):ReSpawn()
    globalDefenseEWR3 = SPAWN:New("RU_EWR #003"):ReSpawn()
    globalDefenseEWR4 = SPAWN:New("RU_EWR #004"):ReSpawn()
    globalDefenseEWR6 = SPAWN:New("RU_EWR #006"):ReSpawn()
    globalDefenseEWR7 = SPAWN:New("RU_EWR #007"):ReSpawn()
    
    MessageToAll("Overlord to all units, the iranian defense is now online",30,"Setup")
    defense = true
  end
end
local function GlobalDefenseEnd()
    if defense == true then
      globalDefenseGroup1:Destroy()
      globalDefenseGroup2:Destroy()
      globalDefenseGroup4:Destroy()
      globalDefenseGroup5:Destroy()
      globalDefenseGroup9:Destroy()
      globalDefenseGroup10:Destroy()
      
      globalDefenseEWR0:Destroy()
      globalDefenseEWR1:Destroy()
      globalDefenseEWR2:Destroy()
      globalDefenseEWR3:Destroy()
      globalDefenseEWR4:Destroy()
      globalDefenseEWR6:Destroy()
      globalDefenseEWR7:Destroy()


    MessageToAll("Overlord to all units, the iranian defense is now offline ",30,"Setup")
    defense = false
  end
end

local function Mig29DroneWestStart()

Spawn_Mig29_Dumb_Drone1 = SPAWN:New("Mig29DroneWest"):InitLimit(2,0):InitRepeatOnLanding():SpawnScheduled(15,0):ReSpawn()

end

local function Mig29DroneWestEnd()

Spawn_Mig29_Dumb_Drone1:Destroy()

end


local function Su27DroneWestStart()

Spawn_Su27_Drone_West = SPAWN:New("Su27DroneWest"):InitLimit(2,0):InitRepeatOnLanding():SpawnScheduled(15,0):ReSpawn()

end

local function Su27DroneWestEnd()

Spawn_Su27_Drone_West:Destroy()

end

local function F16DroneWestStart()

Spawn_F16_Drone_West = SPAWN:New("F16DroneWest"):InitLimit(2,0):InitRepeatOnLanding():SpawnScheduled(15,0):ReSpawn()

end

local function F16DroneWestEnd()

Spawn_F16_Drone_West:Destroy()

end

local function IL76DroneWestStart()

Spawn_IL76_Drone_West = SPAWN:New("IL76DroneWest"):InitLimit(2,0):InitRepeatOnLanding():SpawnScheduled(15,0):ReSpawn()

end

local function IL76DroneWestEnd()

Spawn_IL76_Drone_West:Destroy()

end



local function PvP1Start()

    PvP1_Trucks = SPAWN:New("PvP1_Trucks"):ReSpawn()
    PvP1_Trucks2 = SPAWN:New("PvP1_Trucks2"):ReSpawn()
    PvP1_Tanks = SPAWN:New("PvP1_Tanks"):ReSpawn()
    PvP1_Pickups = SPAWN:New("PvP1_Pickups"):ReSpawn()
    Tanker_PvP1_RussiaNorth = SPAWN:New("Tanker_PvP1_RussiaNorth"):ReSpawn()

    -- Confirm successful creation
    MessageToAll("The PvP Area NW of Sirri Island is now armed!",30,"PvP")
end

local function PvP1End()

    PvP1_Trucks:Destroy()
    PvP1_Trucks2:Destroy()
    PvP1_Tanks:Destroy()
    PvP1_Pickups:Destroy()
    Tanker_PvP1_RussiaNorth:Destroy()
    MessageToAll("The PvP Area NW of Sirri Island is now dis-armed!",30,"PvP")
end


local function CapEastStart()
       
          -- Define a SET_GROUP object that builds a collection of groups that define the EWR network.
          -- Here we build the network with all the groups that have a name starting with DF CCCP AWACS and DF CCCP EWR.
          local DetectionSetGroupRuEast = SET_GROUP:New()
          DetectionSetGroupRuEast:FilterPrefixes( { "RU_EWR"} )
          DetectionSetGroupRuEast:FilterStart()
          
          local DetectionRuWest = DETECTION_AREAS:New( DetectionSetGroupRuEast, 30000 )
          
          -- Setup the A2A dispatcher, and initialize it.
          A2ADispatcherRUeast = AI_A2A_DISPATCHER:New( DetectionRuWest )
          A2ADispatcherRUeast:SetCommandCenter( CommandCenterRed )
          
          -- Enable the tactical display panel.
          A2ADispatcherRUeast:SetTacticalDisplay( false )
          A2ADispatcherRUeast:SetTacticalMenu( "Debug Dispatchers", "A2A East" )
          
          -- Initialize the dispatcher, setting up a border zone. This is a polygon, 
          -- which takes the waypoints of a late activated group with the name CCCP Border as the boundaries of the border area.
          -- Any enemy crossing this border will be engaged.
          RUcapBorderEast = ZONE_POLYGON:New( "RUCAP_RED_EAST_ZONE", GROUP:FindByName( "RUCAP_RED_EAST_ZONE" ) )
          A2ADispatcherRUeast:SetBorderZone( RUcapBorderEast )
          
          -- Initialize the dispatcher, setting up a radius of 100km where any airborne friendly 
          -- without an assignment within 200km radius from a detected target, will engage that target.
          A2ADispatcherRUeast:SetEngageRadius( 200000 )
          
          -- Setup the squadrons.
          A2ADispatcherRUeast:SetSquadron( "RUCAPEast", AIRBASE.PersianGulf.Bandar_Abbas_Intl, { "RUCAPEast" })
          
          -- Setup the overhead
          A2ADispatcherRUeast:SetSquadronOverhead( "RUCAPEast", 1 )
          
          -- Setup the Grouping
          A2ADispatcherRUeast:SetSquadronGrouping( "RUCAPEast", 4 )
          
          -- Setup the Takeoff methods
          A2ADispatcherRUeast:SetSquadronTakeoffFromRunway( "RUCAPEast" )
          
          -- Setup the Landing methods
          A2ADispatcherRUeast:SetSquadronLandingNearAirbase( "RUCAPEast" )
          
          -- GCI Squadron execution.
          A2ADispatcherRUeast:SetSquadronGci2( "RUCAPEast", 600, 1200, 100, 100, "RADIO" )
          
          A2ADispatcherRUeast:SetDefaultTanker("IranTanker1")
          
          -- Set the language of the squadrons to Russian.
          A2ADispatcherRUeast:SetSquadronLanguage( "RUCAPEast", "RU" )
          
          A2ADispatcherRUeast:SetSquadronRadioFrequency( "RUCAPEast", 127.5 )

end

local function CapEastEnd()
  A2ADispatcherRUeast:Stop()
end

local function CapWestStart()

              -- Define a SET_GROUP object that builds a collection of groups that define the EWR network.
          -- Here we build the network with all the groups that have a name starting with DF CCCP AWACS and DF CCCP EWR.
          local DetectionSetGroupRuWest = SET_GROUP:New()
          DetectionSetGroupRuWest:FilterPrefixes( { "RU_EWR"} )
          DetectionSetGroupRuWest:FilterStart()
          
          local DetectionRuWest = DETECTION_AREAS:New( DetectionSetGroupRuWest, 30000 )
          
          -- Setup the A2A dispatcher, and initialize it.
          A2ADispatcherRUwest = AI_A2A_DISPATCHER:New( DetectionRuWest )
          A2ADispatcherRUwest:SetCommandCenter( CommandCenterRed )
          
          -- Enable the tactical display panel.
          A2ADispatcherRUwest:SetTacticalDisplay( false )
          A2ADispatcherRUwest:SetTacticalMenu( "Debug Dispatchers", "A2A West" )
          
          -- Initialize the dispatcher, setting up a border zone. This is a polygon, 
          -- which takes the waypoints of a late activated group with the name CCCP Border as the boundaries of the border area.
          -- Any enemy crossing this border will be engaged.
          RUcapBorderWest = ZONE_POLYGON:New( "RUCAP_RED_WEST_ZONE", GROUP:FindByName( "RUCAP_RED_WEST_ZONE" ) )
          A2ADispatcherRUwest:SetBorderZone( RUcapBorderWest )
          
          -- Initialize the dispatcher, setting up a radius of 100km where any airborne friendly 
          -- without an assignment within 200km radius from a detected target, will engage that target.
          A2ADispatcherRUwest:SetEngageRadius( 200000 )
          
          -- Setup the squadrons.
          A2ADispatcherRUwest:SetSquadron( "RUCAPWest", AIRBASE.PersianGulf.Shiraz_International_Airport, { "RUCAPWest" })
          
          -- Setup the overhead
          A2ADispatcherRUwest:SetSquadronOverhead( "RUCAPWest", 1 )
          
          -- Setup the Grouping
          A2ADispatcherRUwest:SetSquadronGrouping( "RUCAPWest", 4 )
          
          -- Setup the Takeoff methods
          --A2ADispatcherRUwest:SetSquadronTakeoffFromRunway( "RUCAPWest" )
          A2ADispatcherRUwest:SetSquadronTakeoffInAir("RUCAPWest",3000)
          
          -- Setup the Landing methods
          A2ADispatcherRUwest:SetSquadronLandingNearAirbase("RUCAPWest")
          
          -- GCI Squadron execution.
          A2ADispatcherRUwest:SetSquadronGci2( "RUCAPWest", 600, 1200, 100, 100, "RADIO" )
          
          A2ADispatcherRUwest:SetDefaultTanker("IranTanker1")
          
          -- Set the language of the squadrons to Russian.
          A2ADispatcherRUwest:SetSquadronLanguage( "RUCAPWest", "RU" )
          
          A2ADispatcherRUwest:SetSquadronRadioFrequency( "RUCAPWest", 127.5 )
end

local function CapWestEnd()
          A2ADispatcherRUwest:Stop()
end

local function RebelRoySpawn(difficult)
roy = difficult

      if difficult >= 1 then
        royEasy:ReSpawn()
      end
      if difficult >= 2 then
        royMedium1:ReSpawn()
        royMedium2:ReSpawn()
      end
      if difficult >= 3 then
        royHard1:ReSpawn()
        royHard2:ReSpawn()
      end
      ctld.JTACAutoLase('Misty_Royy', 1688, true,"all", 4)
      MessageToAll("Locals report of a training camp of the local militia near the town Royy. Civilians are close - NO Cluster Munition - Coordinate: N24 38'58, E56 6'35, ALT:1 818ft." ,60,"Roy")

end


local function RebelRoyEnd()
  if roy >= 1 then
          royEasy:GetLastAliveGroup():Destroy()
  end
  if roy >= 2 then
          royMedium1:GetLastAliveGroup():Destroy()
          royMedium2:GetLastAliveGroup():Destroy()
  end
  if roy >= 3 then
          royHard1:GetLastAliveGroup():Destroy()
          royHard2:GetLastAliveGroup():Destroy()
  end         
          roy = -1
end


local function RebelZaymiSpawn(difficult)
zaymi = difficult
      if difficult >= 1 then
      zaymiEasy:ReSpawn()
      
      end
      if difficult >= 2 then
        zaymiMedium1:ReSpawn()
        zaymiMedium2:ReSpawn()
        zaymiMedium3:ReSpawn()
      end
      if difficult >= 3 then
        zaymiHard1:ReSpawn()
        zaymiHard2:ReSpawn()
      end
      MessageToAll("Locals report of a training camp of the local militia near the town Zayami. Civilian are close - NO Cluster Munition -Coordinate: N24 27'13, E56 16'45, ALT: 1745ft.",60,"Zaymi")
      ctld.JTACAutoLase('Misty_Zaymi', 1688, true,"all", 4)
end


local function RebelZaymiEnd()
  if difficult >= 1 then
    zaymiEasy:GetLastAliveGroup():Destroy()
  end
  if difficult >= 2 then
        zaymiMedium1:GetLastAliveGroup():Destroy()
        zaymiMedium2:GetLastAliveGroup():Destroy()
        zaymiMedium3:GetLastAliveGroup():Destroy()
  end
    if difficult >= 3 then
        zaymiHard1:GetLastAliveGroup():Destroy()
        zaymiHard2:GetLastAliveGroup():Destroy()
  end    
        zaymi = -1
end


local function RebelConvoySpawnStationary(difficult)
convoy = difficult
      if difficult >= 1 then
        convoyStationaryEasy:ReSpawn()
        convoyStationaryEasy2:ReSpawn()
      
      end
      if difficult >= 2 then
        convoyStationaryMedium:ReSpawn()
      end
      if difficult >= 3 then
        convoyStationareHard:ReSpawn()
      end
ctld.JTACAutoLase('Misty_Convoy', 1688)
      MessageToAll("A UAV spotted a rebel convoy break down on the road thru the mountain, this is our change to destroy the equipment of the group.The position is N24 12'53, E56 14'25, ALT:1693ft.",60,"Convoy")
end


local function RebelConvoySationaryEnd()
    if convoy >= 1 then
        convoyStationaryEasy:GetLastAliveGroup():Destroy()
        convoyStationaryEasy2:GetLastAliveGroup():Destroy()
    end
    if convoy >= 2 then
        convoyStationaryMedium:GetLastAliveGroup():Destroy()
    end
    if convoy >= 3 then
        convoyStationareHard:GetLastAliveGroup():Destroy()
    end      
     convoy = -1
end

local function RebelConvoySpawnMoving(difficult)
  convoyMovingboolean = difficult
      convoyMoving:ReSpawn()
      MessageToAll("Warning, Locals report that a convoy of rebels is moving from the East Coast (Sihlat) to our FARP London! They are on the road!",60,"ConvoyMoving")
      
end

local function RebelConvoyMovingEnd()
  if convoyMovingboolean >= 1 then
    convoyMoving:GetLastAliveGroup():Destroy()
  end
end


local function RebelMountainSpawn(difficult)
mountain = difficult
      if difficult >= 1 then
      mountainhideoutEasy:ReSpawn()
      end
      if difficult >= 2 then
        mountainhideoutMedium:ReSpawn()
        mountainhideoutMedium1:ReSpawn()
        mountainhideoutMedium2:ReSpawn()
        mountainhideoutMedium3:ReSpawn()
        mountainhideoutMedium4:ReSpawn()
      end
      if difficult >= 3 then
        mountainhideoutHell:ReSpawn()
        mountainhideoutHell2:ReSpawn()
        mountainhideoutHell3:ReSpawn()
        
      end
      ctld.JTACAutoLase('Misty_Mountain', 1688)
      MessageToAll("A army patrol spotted a hidden rebel outpost in the mountain, SE of Al Ain city - Our patrol had to leave the area after the report. Coordinate: N23 57'8, E56 16'43, ALT: 2562ft.",60,"Mountain")
end


local function RebelMountainEnd()
  if mountain >= 1 then
    mountainhideoutEasy:GetLastAliveGroup():Destroy()
  end
   if mountain >= 2 then
      mountainhideoutMedium:GetLastAliveGroup():Destroy()
      mountainhideoutMedium1:GetLastAliveGroup():Destroy()
      mountainhideoutMedium2:GetLastAliveGroup():Destroy()
      mountainhideoutMedium3:GetLastAliveGroup():Destroy()
      mountainhideoutMedium4:GetLastAliveGroup():Destroy()
 end
   if mountain >= 3 then
    mountainhideoutHell:GetLastAliveGroup():Destroy()
    mountainhideoutHell2:GetLastAliveGroup():Destroy()
    mountainhideoutHell3:GetLastAliveGroup():Destroy()
 end  
        mountain = -1
end

------ Red Menue
local MenuCoalitionRedA2G = MENU_COALITION:New( coalition.side.RED, "Iran MissionSetup A2G" )
--local MenuCoalitionRedMissionSetupA2GGDefense = MENU_COALITION:New( coalition.side.RED, "Global Defense", MenuCoalitionRedA2G)
local MenuCoalitionRedMissionSetupA2GStrike1 = MENU_COALITION:New( coalition.side.RED, "Strike 1", MenuCoalitionRedA2G)
local MenuCoalitionRedMissionSetupA2GBH = MENU_COALITION:New( coalition.side.RED, "Boghammer", MenuCoalitionRedA2G)


------- Blue Menue
MenuCoalitionBlueA2G = MENU_COALITION:New( coalition.side.BLUE, "MissionSetup A2G" )
local MenuCoalitionBlueA2A = MENU_COALITION:New( coalition.side.BLUE, "MissionSetup A2A" )

--local MenuCoalitionBlueMissionSetupA2GGDefense = MENU_COALITION:New( coalition.side.BLUE, "Global Defense...", MenuCoalitionBlueA2G)
local MenuCoalitionBlueMissionSetupA2GRebels = MENU_COALITION:New( coalition.side.BLUE, "Rebel Outpost Sub...", MenuCoalitionBlueA2G)
--local MenuCoalitionBlueMissionSetupA2GShips = MENU_COALITION:New( coalition.side.BLUE, "Ships...", MenuCoalitionBlueA2G)

local MenuCoalitionBlueMissionSetupA2GShipDrones = MENU_COALITION:New( coalition.side.BLUE, "Drones...", MenuCoalitionBlueMissionSetupA2GShips)
--local MenuCoalitionBlueMissionSetupA2GShipBoghammers = MENU_COALITION:New( coalition.side.BLUE, "Boghammers...", MenuCoalitionBlueMissionSetupA2GShips)

local MenuCoalitionBlueMissionSetupA2GRebelsConvoy = MENU_COALITION:New( coalition.side.BLUE, "Convoy...", MenuCoalitionBlueMissionSetupA2GRebels)
local MenuCoalitionBlueMissionSetupA2GRebelsZaymi = MENU_COALITION:New( coalition.side.BLUE, "Zaymi...", MenuCoalitionBlueMissionSetupA2GRebels)
local MenuCoalitionBlueMissionSetupA2GRebelsMountain = MENU_COALITION:New( coalition.side.BLUE, "Mountain Outpost...", MenuCoalitionBlueMissionSetupA2GRebels)
local MenuCoalitionBlueMissionSetupA2GRebelsRoy = MENU_COALITION:New( coalition.side.BLUE, "Royy Outpost...", MenuCoalitionBlueMissionSetupA2GRebels)



local MenuCoalitionBlueMissionSetupA2ADroneWest = MENU_COALITION:New( coalition.side.BLUE, "Drones West...", MenuCoalitionBlueA2A)
local MenuCoalitionBlueMissionSetupA2ADroneEast = MENU_COALITION:New( coalition.side.BLUE, "Drones East...", MenuCoalitionBlueA2A)


local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Mig29DroneWest : Start", MenuCoalitionBlueMissionSetupA2ADroneWest, Mig29DroneWestStart )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Mig29DroneWest : End", MenuCoalitionBlueMissionSetupA2ADroneWest, Mig29DroneWestEnd )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Su27DroneWest : Start", MenuCoalitionBlueMissionSetupA2ADroneWest, Su27DroneWestStart )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Su27DroneWest : End", MenuCoalitionBlueMissionSetupA2ADroneWest, Su27DroneWestEnd )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "F16DroneWest : Start", MenuCoalitionBlueMissionSetupA2ADroneWest, F16DroneWestStart )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "F16DroneWest : End", MenuCoalitionBlueMissionSetupA2ADroneWest, F16DroneWestEnd )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "IL76DroneWest : Start", MenuCoalitionBlueMissionSetupA2ADroneWest, IL76DroneWestStart )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "IL76DroneWest : End", MenuCoalitionBlueMissionSetupA2ADroneWest, IL76DroneWestEnd )

local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Convoy: Easy", MenuCoalitionBlueMissionSetupA2GRebelsConvoy, RebelConvoySpawnStationary,1 )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Convoy: Medium", MenuCoalitionBlueMissionSetupA2GRebelsConvoy, RebelConvoySpawnStationary, 2 )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Convoy: Hard", MenuCoalitionBlueMissionSetupA2GRebelsConvoy, RebelConvoySpawnStationary, 3 )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Convoy: Moving", MenuCoalitionBlueMissionSetupA2GRebelsConvoy, RebelConvoySpawnMoving, 1 )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Convoy: End", MenuCoalitionBlueMissionSetupA2GRebelsConvoy, RebelConvoySationaryEnd )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Convoy: End", MenuCoalitionBlueMissionSetupA2GRebelsConvoy, RebelConvoyMovingEnd )

local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Zaymi: Easy", MenuCoalitionBlueMissionSetupA2GRebelsZaymi, RebelZaymiSpawn, 1 )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Zaymi: Medium", MenuCoalitionBlueMissionSetupA2GRebelsZaymi, RebelZaymiSpawn, 2 )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Zaymi: Hard", MenuCoalitionBlueMissionSetupA2GRebelsZaymi, RebelZaymiSpawn, 3 )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Zaymi: End", MenuCoalitionBlueMissionSetupA2GRebelsZaymi, RebelZaymiEnd )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Mountain Outpost: Easy", MenuCoalitionBlueMissionSetupA2GRebelsMountain, RebelMountainSpawn, 1 )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Mountain Outpost: Medium", MenuCoalitionBlueMissionSetupA2GRebelsMountain, RebelMountainSpawn, 2 )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Mountain Outpost: HELL", MenuCoalitionBlueMissionSetupA2GRebelsMountain, RebelMountainSpawn, 3 )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Mountain Outpost: End", MenuCoalitionBlueMissionSetupA2GRebelsMountain, RebelMountainEnd )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Royy Outpost: Easy", MenuCoalitionBlueMissionSetupA2GRebelsRoy, RebelRoySpawn, 1)
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Royy Outpost: Medium", MenuCoalitionBlueMissionSetupA2GRebelsRoy, RebelRoySpawn, 2 )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Royy Outpost: Hard", MenuCoalitionBlueMissionSetupA2GRebelsRoy, RebelRoySpawn, 3 )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Royy Outpost: End", MenuCoalitionBlueMissionSetupA2GRebelsRoy, RebelRoyEnd )



--------
--Initialize the map
GlobalDefenseStart()
--CapEastStart()
--CapWestStart()


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
A2GDispatcherBlue:SetTacticalDisplay( false )
A2GDispatcherBlue:SetTacticalMenu("A2G Dispatcher", "HQ")


-- Setup the patrols.

-- The patrol zone.
local PatrolZonePowerPlant = ZONE:New( "PatrolZonePowerPlant" )

A2GDispatcherBlue:SetSquadron( "F15E-Strike", AIRBASE.PersianGulf.Al_Dhafra_AB, { "F15E-Strike" })
A2GDispatcherBlue:SetSquadronFuelThreshold("F15E-Strike",0.2)
A2GDispatcherBlue:SetSquadronTanker("F15E-Strike","Arco31")
A2GDispatcherBlue:SetSquadronBaiPatrol2( "F15E-Strike", PatrolZonePowerPlant, 800, 1200, 22000, 28000, "BARO", 22000, 230, 1000, 30000, "BARO" ) -- New API
A2GDispatcherBlue:SetSquadronBaiPatrolInterval( "F15E-Strike", 1, 300, 1200, 1 )
A2GDispatcherBlue:SetSquadronTakeoffFromParkingHot( "F15E-Strike" )
A2GDispatcherBlue:SetSquadronOverhead( "F15E-Strike", 2 )
