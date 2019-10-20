RedClients = SET_CLIENT:New():FilterCoalitions("red"):FilterStart()
BlueClients = SET_CLIENT:New():FilterCoalitions("blue"):FilterStart()

boghammerGroupSpawn = SPAWN:New("Boghammer")
iranian_AWACS_North = SPAWN:New("S1_AAA_Helipad")
iranian_Tanker_North = SPAWN:New("AWACS_North")
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

local ShipDronesUnarmed = SPAWN:New("TgtShipDrones")


local strike1 = false
local defense = false
local boghammer = false
local roy = -1
local zaymi = -1
local convoy = -1
local convoyMovingboolean = -1
local mountain = -1

local shipDrones = -1



local GroupBlue = SET_GROUP:New():FilterCoalitions( "blue" ):FilterStart()
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


local function Strike1Start()
  if strike1 == false then
    --Spawn Units
    strike1_group1 = SPAWN:New("S1_AAA_Helipad"):ReSpawn()
    strike1_group2 = SPAWN:New("S1_AAA_North"):ReSpawn()
    strike1_group3 = SPAWN:New("S1_AAA_South"):ReSpawn()
    strike1_group4 = SPAWN:New("S1_SA11_East"):ReSpawn()
    strike1_group5 = SPAWN:New("S1_SA6_West"):ReSpawn()
    strike1_group6 = SPAWN:New("S1_Shiraz_SA11 #002"):ReSpawn()
    strike1_group7 = SPAWN:New("S1_Shiraz_SA6 #001"):ReSpawn()
    
    strike1_group8 = SPAWN:New("S1_SA6_West #001"):ReSpawn()
    strike1_group9 = SPAWN:New("S1_SA6_West #002"):ReSpawn()
    strike1_group10 = SPAWN:New("S1_SA11_East #001"):ReSpawn()
    strike1_group11 = SPAWN:New("S1_Factory_T1"):ReSpawn()
    
    strike1_group12 = SPAWN:New("S1_Widow"):ReSpawn()
    strike1_group13 = SPAWN:New("S1_Slingshot_1-3"):ReSpawn()
    strike1_group14 = SPAWN:New("S1_Slingshot_1-2"):ReSpawn()
    strike1_group15 = SPAWN:New("S1_Slingshot_1-1"):ReSpawn()
    
    strike1_group16 = SPAWN:New("S1_SA6_N"):ReSpawn()
    strike1_group17 = SPAWN:New("S1_SA6_N #001"):ReSpawn()
    strike1_group18 = SPAWN:New("S1_SA6_N #003"):ReSpawn()
    strike1_group19 = SPAWN:New("S1_SA6_N #002"):ReSpawn()
    strike1_group20 = SPAWN:New("S1_SA2"):ReSpawn()
    strike1_group21 = SPAWN:New("S1_SA2 #001"):ReSpawn()
    strike1_group22 = SPAWN:New("S1_SA2 #002"):ReSpawn()
    strike1_group23 = SPAWN:New("S1_SA300#1"):ReSpawn()
    
    
  end
end
local function Strike1End()
  if strike1 == true then
    strike1_group1:Destroy()
    strike1_group2:Destroy()
    strike1_group3:Destroy()
    strike1_group4:Destroy()
    strike1_group5:Destroy()
    strike1_group6:Destroy()
    strike1_group7:Destroy()
    strike1_group8:Destroy()
    strike1_group9:Destroy()
    strike1_group10:Destroy()
    strike1_group11:Destroy()
    strike1_group12:Destroy()
    strike1_group13:Destroy()
    strike1_group14:Destroy()
    strike1_group15:Destroy()
    strike1_group16:Destroy()
    strike1_group17:Destroy()
    strike1_group18:Destroy()
    strike1_group19:Destroy()
    strike1_group20:Destroy()
    strike1_group21:Destroy()
    strike1_group22:Destroy()
    strike1_group23:Destroy()
--    radiobeep:ToAll()
    MessageToAll("Strike 1 is now - inactive",30,"Setup")
    strike1 = false
  end
end

local function GlobalDefenseStart()
  if defense == false then
    iranian_AWACS_North:ReSpawn()
    iranian_Tanker_North:ReSpawn()
  
    globalDefenseGroup1 = SPAWN:New("SAM_Hawk"):ReSpawn()
    globalDefenseGroup2 = SPAWN:New("SAM_Hawk #001"):ReSpawn()
    globalDefenseGroup4 = SPAWN:New("SAM_S300"):ReSpawn()
    globalDefenseGroup5 = SPAWN:New("SAM_S300 #001"):ReSpawn()

    globalDefenseGroup9 = SPAWN:New("SAM_S300 #005"):ReSpawn()
    
    globalDefenseEWR0 = SPAWN:New("EWR"):ReSpawn()
    globalDefenseEWR1 = SPAWN:New("EWR #001"):ReSpawn()
    globalDefenseEWR2 = SPAWN:New("EWR #002"):ReSpawn()
    globalDefenseEWR3 = SPAWN:New("EWR #003"):ReSpawn()
    globalDefenseEWR4 = SPAWN:New("EWR #004"):ReSpawn()
    globalDefenseEWR6 = SPAWN:New("EWR #006"):ReSpawn()
    globalDefenseEWR7 = SPAWN:New("EWR #007"):ReSpawn()
    globalDefenseEWR8 = SPAWN:New("EWR #008"):ReSpawn()
    
--    radiobeep:ToAll()
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
      
      globalDefenseEWR0:Destroy()
      globalDefenseEWR1:Destroy()
      globalDefenseEWR2:Destroy()
      globalDefenseEWR3:Destroy()
      globalDefenseEWR4:Destroy()
      globalDefenseEWR6:Destroy()
      globalDefenseEWR7:Destroy()
      globalDefenseEWR8:Destroy()

--    radiobeep:ToAll()
    MessageToAll("Overlord to all units, the iranian defense is now offline ",30,"Setup")
    defense = false
  end
end

local function BoghammerSpawn()
  if boghammer == false then
    boghammerGroup = boghammerGroupSpawn:ReSpawn()
    boghammer = true
    
    
  end
end
local function BoghammerEnd()
  if boghammer == true then
    boghammerGroup:Destroy()
  boghammer = false
  end
end

local function Mig29DroneWestStart()

Spawn_Mig29_Dumb_Drone1 = SPAWN:New("Mig29DroneWest"):InitLimit(2,1):InitRepeatOnLanding():SpawnScheduled(15,0):ReSpawn()

end

local function Mig29DroneWestEnd()

Spawn_Mig29_Dumb_Drone1:Destroy()

end


local function Su27DroneWestStart()

Spawn_Su27_Drone_West = SPAWN:New("Su27DroneWest"):InitLimit(2,1):InitRepeatOnLanding():SpawnScheduled(15,0):ReSpawn()

end

local function Su27DroneWestEnd()

Spawn_Su27_Drone_West:Destroy()

end

local function F16DroneWestStart()

Spawn_F16_Drone_West = SPAWN:New("F16DroneWest"):InitLimit(2,1):InitRepeatOnLanding():SpawnScheduled(15,0):ReSpawn()

end

local function F16DroneWestEnd()

Spawn_F16_Drone_West:Destroy()

end

local function IL76DroneWestStart()

Spawn_IL76_Drone_West = SPAWN:New("IL76DroneWest"):InitLimit(2,1):InitRepeatOnLanding():SpawnScheduled(15,0):ReSpawn()

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
    CapPlaneSpawnEast = SPAWN:New("RUCAPEast"):ReSpawn()
--    local CapPlane = GROUP:FindByName( "RUCAPEast" )    
--    GroupPolygon = GROUP:FindByName( "CAP_RED_EAST" )
--    PatrolZone = ZONE_POLYGON:New( "CAP_RED_EAST", GroupPolygon )
--    AICapZone = AI_CAP_ZONE:New( PatrolZone, 500, 10000, 400, 600 )    
--    AICapZone:SetControllable( CapPlane )   
--    AICapZone:__Start( 1 )
end

local function CapEastEnd()
  CapPlaneSpawnEast:Destroy()
end

local function CapWestStart()
    CapPlaneSpawnWest = SPAWN:New("RUCAPWest"):ReSpawn()
--    local CapPlane = GROUP:FindByName( "RUCAPWest" )    
--    GroupPolygon = GROUP:FindByName( "RUCAP_RED_WEST" )
--    PatrolZone = ZONE_POLYGON:New( "RUCAP_RED_WEST", GroupPolygon )
--    AICapZone = AI_CAP_ZONE:New( PatrolZone, 500, 10000, 400, 600 )    
--    AICapZone:SetControllable( CapPlane )   
--    AICapZone:__Start( 1 )
end

local function CapWestEnd()
  CapPlaneSpawnWest:Destroy()
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
--        local BlueVictory = USERSOUND:New( "HighwayDangerzone.ogg" )
--        BlueVictory:ToAll()
        
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


local function ShipDronesStart(difficult)
shipDrones = difficult
        if difficult >= 1 then
          ShipDronesUnarmed:ReSpawn()
        end
        if difficult >= 2 then
          

        end
        if difficult >= 3 then

        end
        MessageToAll("Ships Spawned!",60,"Ships-Active")
end

local function ShipDronesEnd()
  if shipDrones >= 1 then
      ShipDronesUnarmed:GetLastAliveGroup():Destroy()
  end
   if shipDrones >= 2 then

 end
   if shipDrones >= 3 then

 end  
      MessageToAll("Ships De-Spawned",60,"Marcos 2-inactive")
      shipDrones = -1
end

------ Red Menue
local MenuCoalitionRedA2G = MENU_COALITION:New( coalition.side.RED, "Iran MissionSetup A2G" )
local MenuCoalitionRedMissionSetupA2GGDefense = MENU_COALITION:New( coalition.side.RED, "Global Defense", MenuCoalitionRedA2G)
local MenuCoalitionRedMissionSetupA2GStrike1 = MENU_COALITION:New( coalition.side.RED, "Strike 1", MenuCoalitionRedA2G)
local MenuCoalitionRedMissionSetupA2GBH = MENU_COALITION:New( coalition.side.RED, "Boghammer", MenuCoalitionRedA2G)

local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.RED, "Global Defense : Start", MenuCoalitionRedMissionSetupA2GGDefense, GlobalDefenseStart )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.RED, "Global Defense : End", MenuCoalitionRedMissionSetupA2GGDefense, GlobalDefenseEnd )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.RED, "Strike 1 : Start", MenuCoalitionRedMissionSetupA2GStrike1, Strike1Start )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.RED, "Strike 1 : End", MenuCoalitionRedMissionSetupA2GStrike1, Strike1End )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.RED, "Boghammer : Start", MenuCoalitionRedMissionSetupA2GBH, BoghammerSpawn )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.RED, "Boghammer : End", MenuCoalitionRedMissionSetupA2GBH, BoghammerEnd )

------- Blue Menue
MenuCoalitionBlueA2G = MENU_COALITION:New( coalition.side.BLUE, "MissionSetup A2G" )
local MenuCoalitionBlueA2A = MENU_COALITION:New( coalition.side.BLUE, "MissionSetup A2A" )
local MenuCoalitionBluePvP = MENU_COALITION:New( coalition.side.BLUE, "PvP Setup" )

local MenuCoalitionBlueMissionSetupA2GGDefense = MENU_COALITION:New( coalition.side.BLUE, "Global Defense...", MenuCoalitionBlueA2G)
local MenuCoalitionBlueMissionSetupA2GRebels = MENU_COALITION:New( coalition.side.BLUE, "Rebel Outpost Sub...", MenuCoalitionBlueA2G)
local MenuCoalitionBlueMissionSetupA2GStrike1 = MENU_COALITION:New( coalition.side.BLUE, "Strike 1 - Factory Strike...", MenuCoalitionBlueA2G)
local MenuCoalitionBlueMissionSetupA2GShips = MENU_COALITION:New( coalition.side.BLUE, "Ships...", MenuCoalitionBlueA2G)

local MenuCoalitionBlueMissionSetupA2GShipDrones = MENU_COALITION:New( coalition.side.BLUE, "Drones...", MenuCoalitionBlueMissionSetupA2GShips)
local MenuCoalitionBlueMissionSetupA2GShipBoghammers = MENU_COALITION:New( coalition.side.BLUE, "Boghammers...", MenuCoalitionBlueMissionSetupA2GShips)

local MenuCoalitionBlueMissionSetupA2GRebelsConvoy = MENU_COALITION:New( coalition.side.BLUE, "Convoy...", MenuCoalitionBlueMissionSetupA2GRebels)
local MenuCoalitionBlueMissionSetupA2GRebelsZaymi = MENU_COALITION:New( coalition.side.BLUE, "Zaymi...", MenuCoalitionBlueMissionSetupA2GRebels)
local MenuCoalitionBlueMissionSetupA2GRebelsMountain = MENU_COALITION:New( coalition.side.BLUE, "Mountain Outpost...", MenuCoalitionBlueMissionSetupA2GRebels)
local MenuCoalitionBlueMissionSetupA2GRebelsRoy = MENU_COALITION:New( coalition.side.BLUE, "Royy Outpost...", MenuCoalitionBlueMissionSetupA2GRebels)



local MenuCoalitionBlueMissionSetupA2ADroneWest = MENU_COALITION:New( coalition.side.BLUE, "Drones West...", MenuCoalitionBlueA2A)
local MenuCoalitionBlueMissionSetupA2ADroneEast = MENU_COALITION:New( coalition.side.BLUE, "Drones East...", MenuCoalitionBlueA2A)
local MenuCoalitionBlueMissionSetupA2ACAP = MENU_COALITION:New( coalition.side.BLUE, "CAP...", MenuCoalitionBlueA2A)

local MenuCoalitionBlueMissionSetupPvP1 = MENU_COALITION:New( coalition.side.BLUE, "PvP : Strike 1...", MenuCoalitionBluePvP)

local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Global Defense : Start", MenuCoalitionBlueMissionSetupA2GGDefense, GlobalDefenseStart )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Global Defense : End", MenuCoalitionBlueMissionSetupA2GGDefense, GlobalDefenseEnd )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "CAP West : Start", MenuCoalitionBlueMissionSetupA2ACAP, CapWestStart )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "CAP West : End", MenuCoalitionBlueMissionSetupA2ACAP, CapWestEnd )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "CAP East : Start", MenuCoalitionBlueMissionSetupA2ACAP, CapEastStart )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "CAP East : End", MenuCoalitionBlueMissionSetupA2ACAP, CapEastEnd )

local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Strike 1 : Start", MenuCoalitionBlueMissionSetupA2GStrike1, Strike1Start )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Strike 1 : End", MenuCoalitionBlueMissionSetupA2GStrike1, Strike1End )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Boghammers : Start", MenuCoalitionBlueMissionSetupA2GShipBoghammers, BoghammerSpawn )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Boghammers : End", MenuCoalitionBlueMissionSetupA2GShipBoghammers, BoghammerEnd )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Tankers : Start", MenuCoalitionBlueMissionSetupA2GShipDrones, ShipDronesStart, 1 )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Tankers : End", MenuCoalitionBlueMissionSetupA2GShipDrones, ShipDronesEnd )

local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Mig29DroneWest : Start", MenuCoalitionBlueMissionSetupA2ADroneWest, Mig29DroneWestStart )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Mig29DroneWest : End", MenuCoalitionBlueMissionSetupA2ADroneWest, Mig29DroneWestEnd )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Su27DroneWest : Start", MenuCoalitionBlueMissionSetupA2ADroneWest, Su27DroneWestStart )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Su27DroneWest : End", MenuCoalitionBlueMissionSetupA2ADroneWest, Su27DroneWestEnd )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "F16DroneWest : Start", MenuCoalitionBlueMissionSetupA2ADroneWest, F16DroneWestStart )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "F16DroneWest : End", MenuCoalitionBlueMissionSetupA2ADroneWest, F16DroneWestEnd )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "IL76DroneWest : Start", MenuCoalitionBlueMissionSetupA2ADroneWest, IL76DroneWestStart )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "IL76DroneWest : End", MenuCoalitionBlueMissionSetupA2ADroneWest, IL76DroneWestEnd )

local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "PvP 1 Battle N of Sirri Island: Start", MenuCoalitionBlueMissionSetupPvP1, PvP1Start )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "PvP 1 Battle N of Sirri Island: End", MenuCoalitionBlueMissionSetupPvP1, PvP1End )

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






