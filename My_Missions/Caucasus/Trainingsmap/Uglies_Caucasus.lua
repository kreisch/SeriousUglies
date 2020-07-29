local CarlosUnitsAFAC = SPAWN:New("S1_AFAC")
local CarlosUnitsEasy = SPAWN:New("S1_Carlos")
local CarlosUnitsMedium1 = SPAWN:New("S1_Carlos_Medium")
local CarlosUnitsHard = SPAWN:New("S1_Carlos_Hard")

local MarcosUnitsEasy1 = SPAWN:New("S2_MotInf #003")
local MarcosUnitsEasy2 = SPAWN:New("S2_Buildings")
local MarcosUnitsEasy3 = SPAWN:New("S2_MotInf #002")
local MarcosUnitsEasy4 = SPAWN:New("S2_Trucks #001")
local MarcosUnitsEasy5 = SPAWN:New("S2_Buildings #003")
local MarcosUnitsEasy6 = SPAWN:New("S2_MotInf #001")
local MarcosUnitsEasy7 = SPAWN:New("S2_Buildings #002")
local MarcosUnitsEasy8 = SPAWN:New("S2_MotInf")
local MarcosUnitsEasy9 = SPAWN:New("S2_Trucks")
local MarcosUnitsEasy10 = SPAWN:New("S2_Buildings #001")
local MarcosUnitsEasy11 = SPAWN:New("S2_MotInf #001")
local MarcosUnitsEasy12 = SPAWN:New("S2_Tanks")
local MarcosUnitsEasy13 = SPAWN:New("S2_Tanks #001")
local MarcosUnitsMedium1 = SPAWN:New("S2_SA8")
local MarcosUnitsMedium2 = SPAWN:New("S2_AAA_Medium #002")
local MarcosUnitsMedium3 = SPAWN:New("S2_AAA_Medium")
local MarcosUnitsMedium4 = SPAWN:New("S2_SA2_Medium")

local MarcosUnitsHard1 = SPAWN:New("S2_SA2_Hard #001")
local MarcosUnitsHard2 = SPAWN:New("S2_SA11_Hard")

local Marcos2UnitsEasy1 = SPAWN:New("S3_Easy")
local Marcos2UnitsEasy2 = SPAWN:New("S3_Troops_Easy")
local Marcos2UnitsEasy3 = SPAWN:New("S3_CargoTrucks_Easy")
local Marcos2UnitsEasy4 = SPAWN:New("S3_Troops_Easy")
local Marcos2UnitsEasy5 = SPAWN:New("S3_Manpads #001")
local Marcos2UnitsEasy6 = SPAWN:New("S3_Troops_Easy #001")
local Marcos2UnitsEasy7 = SPAWN:New("S3_Troops_Easy #002")
local Marcos2UnitsEasy8 = SPAWN:New("S3_Troops_Easy #003")
local Marcos2UnitsEasy9 = SPAWN:New("S3_Troops_Easy #004")

local Marcos2UnitsMedium1 = SPAWN:New("S3_Manpads_Medium")
local Marcos2UnitsMedium2 = SPAWN:New("S3_Manpads_Medium #001")
local Marcos2UnitsMedium3 = SPAWN:New("S3_Manpads_Medium #002")
local Marcos2UnitsMedium4 = SPAWN:New("S3_Medium")

local Marcos2UnitsHard1 = SPAWN:New("S3_SA2_Hard")


local carlos = -1
local marcos = -1
local marcos2 = -1
local shipDrones = -1

-- START Drohnen

local droneWillie1 = SPAWN:New("Willie1")
local droneWillie2 = SPAWN:New("Willie2")
local droneWillie3 = SPAWN:New("Willie3")
local droneWillie4 = SPAWN:New("Willie4")
local droneWillie5 = SPAWN:New("Willie5")
local droneWillie6 = SPAWN:New("Willie6")
local droneWillie7 = SPAWN:New("Willie7")

local droneIL76Active = false

local function DroneStart()
 if not droneIL76Active then
 
   droneWillie1:ReSpawn()
   droneWillie2:ReSpawn()
   droneWillie3:ReSpawn()
   droneWillie4:ReSpawn()
   droneWillie5:ReSpawn()
   droneWillie6:ReSpawn()
   droneWillie7:ReSpawn()

   
   droneIL76Active = true
   MessageToAll("WARNING: Drohne Willie unterwegs!",60,"Drone Willie Spawn")
   
   else
   
   MessageToAll("WARNING: Drohne Willie schon unterwegs!",10,"Drone Willie Error Spawn")  
 end
end


local function DroneEnd()
 if droneIL76Active then
  droneWillie1:GetLastAliveGroup():Destroy()
  droneWillie2:GetLastAliveGroup():Destroy()
  droneWillie3:GetLastAliveGroup():Destroy()
  droneWillie4:GetLastAliveGroup():Destroy()
  droneWillie5:GetLastAliveGroup():Destroy()
  droneWillie6:GetLastAliveGroup():Destroy()
  droneWillie7:GetLastAliveGroup():Destroy()

  droneIL76Active = false
  MessageToAll("WARNING: Drohne Willie offline!",60,"Drone Willie Despawn")
  else 
   MessageToAll("WARNING: Drohne Willie bereits offline!",10,"Drone Willie Despawn")  
 end 
end


-- ENDE Drohnen

---
-- Name: AID-A2A-016 - Refuel Tanker Test
-- Author: FlightControl
-- Date Created: 01 Aug 2017
-- 
-- Modified by kreisch for Caucasus Trainingsmap

local CAPactive = false
local CAPinit = false

--- ###########################################################################
-- CAP methods are INACTIVE they are currently handled by the IADS Script completely.
--local function RedCAPStart ()
--
--    if not CAPinit then
--    CAPactive = true
--    CAPinit = true
--        -- Define a SET_GROUP object that builds a collection of groups that define the EWR network.
--        -- Here we build the network with all the groups that have a name starting with DF CCCP AWACS and DF CCCP EWR.
--        DetectionSetGroup = SET_GROUP:New()
--        DetectionSetGroup:FilterPrefixes( { "Red_Awacs", "Red_EWR" } )
--        DetectionSetGroup:FilterStart()
--        
--        Detection = DETECTION_AREAS:New( DetectionSetGroup, 30000 )
--        
--        -- Setup the A2A dispatcher, and initialize it.
--        A2ADispatcher = AI_A2A_DISPATCHER:New( Detection )
--        
--        
--        -- Initialize the dispatcher, setting up a radius of 100km where any airborne friendly 
--        -- without an assignment within 100km radius from a detected target, will engage that target.
--        A2ADispatcher:SetEngageRadius( 100000 )
--        
--        
--        --A2ADispatcher:SetTacticalDisplay( true )
--        
--        -- Test intercept.
--        A2ADispatcher:SetIntercept( 30 )
--        
--        -- Setup the squadrons.
--        
--        A2ADispatcher:SetSquadron( "Sochi", AIRBASE.Caucasus.Maykop_Khanskaya, { "Mig28_CAP1" }, 20 )
--        A2ADispatcher:SetSquadronCap( "Sochi", ZONE:New( "RedPatrolZone1" ), 4000, 8000, 600, 800, 1000, 1300 )
--        A2ADispatcher:SetSquadronCapInterval("Sochi", 2, 30, 600, 1 ) 
--        A2ADispatcher:SetSquadronGci( "Sochi", 900, 1200 )
--        
--        
--        A2ADispatcher:SetDefaultFuelThreshold( 0.9 )
--        A2ADispatcher:SetDefaultTanker( "RED_Tanker_CAP1" )
--        
--        
--        A2ADispatcher:SetSquadron( "Beslan", AIRBASE.Caucasus.Beslan, { "Mig28_CAP2" }, 20 )
--        A2ADispatcher:SetSquadronCap( "Beslan", ZONE:New( "RedPatrolZone2" ), 4000, 8000, 600, 800, 1000, 1300 )
--        A2ADispatcher:SetSquadronCapInterval( "Beslan", 2, 30, 600, 1 ) 
--        A2ADispatcher:SetSquadronGci( "Beslan", 900, 1200 )
--        
--        A2ADispatcher:SetSquadronFuelThreshold( "Beslan", 0.8 )
--        A2ADispatcher:SetSquadronTanker( "Beslan", "RED_Tanker_CAP2" )
--    end
--    if not CAPactive then
--        A2ADispatcher:Start()
--    end
--end
--
--local function RedCAPEnd()
--
--    A2ADispatcher:Stop()
--    CAPactive = false
--    MessageToAll("CAP-Detection Stopped",20,"CAP Stop")
--    
--end


local function CarlosStart(difficult)
carlos = difficult
        if difficult >= 1 then
          CarlosUnitsEasy:ReSpawn()
          CarlosUnitsAFAC:ReSpawn()
        end
        if difficult >= 2 then
          CarlosUnitsMedium1:ReSpawn()
        end
        if difficult >= 3 then
          CarlosUnitsHard:ReSpawn()
        end
        MessageToAll("Carlos Spawned!",60,"Carlos-Active")
        ctld.JTACAutoLase('S1_AFAC', 1688)
end

local function CarlosEnd()
  if carlos >= 1 then
    CarlosUnitsEasy:GetLastAliveGroup():Destroy()
    CarlosUnitsAFAC:GetLastAliveGroup():Destroy()
  end
   if carlos >= 2 then
    CarlosUnitsMedium1:GetLastAliveGroup():Destroy()
 end
   if carlos >= 3 then
    CarlosUnitsHard:GetLastAliveGroup():Destroy()
 end  
      MessageToAll("Carlos De-Spawned",60,"Carlos-inactive")
      carlos = -1
end


local function MarcosStart(difficult)
marcos = difficult
        if difficult >= 1 then
          MarcosUnitsEasy1:ReSpawn()
          MarcosUnitsEasy2:ReSpawn()
          MarcosUnitsEasy3:ReSpawn()
          MarcosUnitsEasy4:ReSpawn()
          MarcosUnitsEasy5:ReSpawn()
          MarcosUnitsEasy6:ReSpawn()
          MarcosUnitsEasy7:ReSpawn()
          MarcosUnitsEasy8:ReSpawn()
          MarcosUnitsEasy9:ReSpawn()
          MarcosUnitsEasy10:ReSpawn()
          MarcosUnitsEasy11:ReSpawn()
          MarcosUnitsEasy12:ReSpawn()
          MarcosUnitsEasy13:ReSpawn()
          
        end
        if difficult >= 2 then
          MarcosUnitsMedium1:ReSpawn()
          MarcosUnitsMedium2:ReSpawn()
          MarcosUnitsMedium3:ReSpawn()
          MarcosUnitsMedium4:ReSpawn()
        end
        if difficult >= 3 then
          MarcosUnitsHard1:ReSpawn()
          MarcosUnitsHard2:ReSpawn()
        end
        MessageToAll("marcos Spawned!",60,"marcos-Active")
end

local function MarcosEnd()
  if marcos >= 1 then
    MarcosUnitsEasy1:GetLastAliveGroup():Destroy()
    MarcosUnitsEasy2:GetLastAliveGroup():Destroy()
    MarcosUnitsEasy3:GetLastAliveGroup():Destroy()
    MarcosUnitsEasy4:GetLastAliveGroup():Destroy()
    MarcosUnitsEasy5:GetLastAliveGroup():Destroy()
    MarcosUnitsEasy6:GetLastAliveGroup():Destroy()
    MarcosUnitsEasy7:GetLastAliveGroup():Destroy()
    MarcosUnitsEasy8:GetLastAliveGroup():Destroy()
    MarcosUnitsEasy9:GetLastAliveGroup():Destroy()
    MarcosUnitsEasy10:GetLastAliveGroup():Destroy()
    MarcosUnitsEasy11:GetLastAliveGroup():Destroy()
    MarcosUnitsEasy12:GetLastAliveGroup():Destroy()
    MarcosUnitsEasy13:GetLastAliveGroup():Destroy()
  end
   if marcos >= 2 then
    MarcosUnitsMedium1:GetLastAliveGroup():Destroy()
    MarcosUnitsMedium2:GetLastAliveGroup():Destroy()
    MarcosUnitsMedium3:GetLastAliveGroup():Destroy()
    MarcosUnitsMedium4:GetLastAliveGroup():Destroy()
 end
   if marcos >= 3 then
    MarcosUnitsHard1:GetLastAliveGroup():Destroy()
    MarcosUnitsHard2:GetLastAliveGroup():Destroy()
 end  
      MessageToAll("marcos De-Spawned",60,"marcos-inactive")
      carlos = -1
end





local function Marcos2Start(difficult)
marcos2 = difficult
        if difficult >= 1 then
          Marcos2UnitsEasy1:ReSpawn()
          Marcos2UnitsEasy2:ReSpawn()
          Marcos2UnitsEasy3:ReSpawn()
          Marcos2UnitsEasy4:ReSpawn()
          Marcos2UnitsEasy5:ReSpawn()
          Marcos2UnitsEasy6:ReSpawn()
          Marcos2UnitsEasy7:ReSpawn()
          Marcos2UnitsEasy8:ReSpawn()
          Marcos2UnitsEasy9:ReSpawn()
        end
        if difficult >= 2 then
          Marcos2UnitsMedium1:ReSpawn()
          Marcos2UnitsMedium2:ReSpawn()
          Marcos2UnitsMedium3:ReSpawn()
          Marcos2UnitsMedium4:ReSpawn()
        end
        if difficult >= 3 then
          Marcos2UnitsHard1:ReSpawn()
        end
        MessageToAll("Marcos 2 Spawned!",60,"Marcos 2-Active")
end

local function Marcos2End()
  if marcos2 >= 1 then
    Marcos2UnitsEasy1:GetLastAliveGroup():Destroy()
    Marcos2UnitsEasy2:GetLastAliveGroup():Destroy()
    Marcos2UnitsEasy3:GetLastAliveGroup():Destroy()
    Marcos2UnitsEasy4:GetLastAliveGroup():Destroy()
    Marcos2UnitsEasy5:GetLastAliveGroup():Destroy()
    Marcos2UnitsEasy6:GetLastAliveGroup():Destroy()
    Marcos2UnitsEasy7:GetLastAliveGroup():Destroy()
    Marcos2UnitsEasy8:GetLastAliveGroup():Destroy()
    Marcos2UnitsEasy9:GetLastAliveGroup():Destroy()
  end
   if marcos2 >= 2 then
    Marcos2UnitsMedium1:GetLastAliveGroup():Destroy()
    Marcos2UnitsMedium2:GetLastAliveGroup():Destroy()
    Marcos2UnitsMedium3:GetLastAliveGroup():Destroy()
    Marcos2UnitsMedium4:GetLastAliveGroup():Destroy()
 end
   if marcos2 >= 3 then
    Marcos2UnitsHard1:GetLastAliveGroup():Destroy()
 end  
      MessageToAll("Marcos 2 De-Spawned",60,"Marcos 2-inactive")
      marcos2 = -1
end


-- Menüstruktur
-- 1st Level!
MenuCoalitionBlueA2G = MENU_COALITION:New( coalition.side.BLUE, "MissionSetup A2G..." )
MenuCoalitionBlueA2A = MENU_COALITION:New( coalition.side.BLUE, "MissionSetup A2A..." )

-- 2nd Level!
local MenuCoalitionBlueMissionSetupA2GCarlosMarcos = MENU_COALITION:New( coalition.side.BLUE, "Carlos and Marcos...", MenuCoalitionBlueA2G)
local MenuCoalitionBlueMissionSetupA2ADrones = MENU_COALITION:New( coalition.side.BLUE, "Drones...", MenuCoalitionBlueA2A)
local MenuCoalitionBlueMissionSetupA2ADroneIL76 = MENU_COALITION:New( coalition.side.BLUE, "Drohne Willie (IL76)...", MenuCoalitionBlueMissionSetupA2ADrones)

-- 3rd Level !
local MenuCoalitionBlueMissionSetupA2GCarlos = MENU_COALITION:New( coalition.side.BLUE, "Carlos...", MenuCoalitionBlueMissionSetupA2GCarlosMarcos)
local MenuCoalitionBlueMissionSetupA2GMarcos = MENU_COALITION:New( coalition.side.BLUE, "Marcos...", MenuCoalitionBlueMissionSetupA2GCarlosMarcos)
local MenuCoalitionBlueMissionSetupA2GShips = MENU_COALITION:New( coalition.side.BLUE, "Ships...", MenuCoalitionBlueA2G)

-- Action Level!
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Drohne Willie (IL76) : Start", MenuCoalitionBlueMissionSetupA2ADroneIL76, DroneStart )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Drohne Willie (IL76) : End", MenuCoalitionBlueMissionSetupA2ADroneIL76, DroneEnd )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Carlos S1 Easy : Start", MenuCoalitionBlueMissionSetupA2GCarlos, CarlosStart, 1 )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Carlos S1 Medium : Start", MenuCoalitionBlueMissionSetupA2GCarlos, CarlosStart, 2 )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Carlos S1 Hard : Start", MenuCoalitionBlueMissionSetupA2GCarlos, CarlosStart, 3 )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Carlos S1 : End", MenuCoalitionBlueMissionSetupA2GCarlos, CarlosEnd )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Marcos S2 Easy : Start", MenuCoalitionBlueMissionSetupA2GMarcos, MarcosStart , 1 )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Marcos S2 Medium : Start", MenuCoalitionBlueMissionSetupA2GMarcos, MarcosStart , 2 )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Marcos S2 Hard : Start", MenuCoalitionBlueMissionSetupA2GMarcos, MarcosStart , 3 )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Marcos S2 : End", MenuCoalitionBlueMissionSetupA2GMarcos, MarcosEnd )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Marcos S3 Easy : Start", MenuCoalitionBlueMissionSetupA2GMarcos, Marcos2Start , 1 )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Marcos S3 Medium : Start", MenuCoalitionBlueMissionSetupA2GMarcos, Marcos2Start , 2 )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Marcos S3 Hard : Start", MenuCoalitionBlueMissionSetupA2GMarcos, Marcos2Start , 3 )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Marcos S3 : End", MenuCoalitionBlueMissionSetupA2GMarcos, Marcos2End)















