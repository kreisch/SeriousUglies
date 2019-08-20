-- START Global Defense BLUE
local BlueGlobalDefense1 = SPAWN:New("Blue_SAM_Global_Defense_1")
local BlueGlobalDefense2 = SPAWN:New("Blue_SAM_Global_Defense_2")
local BlueGlobalDefense3 = SPAWN:New("Blue_SAM_Global_Defense_3")
local BlueGlobalDefense4 = SPAWN:New("Blue_SAM_Global_Defense_4")
local BlueGlobalDefense5 = SPAWN:New("Blue_SAM_Global_Defense_5")
local BlueGlobalDefense6 = SPAWN:New("Blue_SAM_Global_Defense_6")
local BlueGlobalDefense7 = SPAWN:New("Blue_SAM_Global_Defense_7")
local BlueGlobalDefense8 = SPAWN:New("Blue_SAM_Global_Defense_8")
local BlueGlobalDefense9 = SPAWN:New("Blue_SAM_Global_Defense_9")
local BlueGlobalDefense10 = SPAWN:New("Blue_SAM_Global_Defense_10")
local BlueGlobalDefense11 = SPAWN:New("Blue_SAM_Global_Defense_11")

local GlobalDefenseBlueActive = false

function GlobalDefenseStart()
 if not GlobalDefenseBlueActive then
 
   BlueGlobalDefense1:ReSpawn()
   BlueGlobalDefense2:ReSpawn()
   BlueGlobalDefense3:ReSpawn()
   BlueGlobalDefense4:ReSpawn()
   BlueGlobalDefense5:ReSpawn()
   BlueGlobalDefense6:ReSpawn()
   BlueGlobalDefense7:ReSpawn()
   BlueGlobalDefense8:ReSpawn()
   BlueGlobalDefense9:ReSpawn()
   BlueGlobalDefense10:ReSpawn()
   BlueGlobalDefense11:ReSpawn()
   
   
   GlobalDefenseBlueActive = true
   MessageToAll("WARNING: Blue Defense-Network online!",60,"Global Defense Blue Start")
   
   else
   
   MessageToAll("WARNING: Blue Defense-Network already active!",10,"Global Defense Blue Error Spawn")  
 end
end


function GlobalDefenseEnd()
 if GlobalDefenseBlueActive then
  BlueGlobalDefense1:GetLastAliveGroup():Destroy()
  BlueGlobalDefense2:GetLastAliveGroup():Destroy()
  BlueGlobalDefense3:GetLastAliveGroup():Destroy()
  BlueGlobalDefense4:GetLastAliveGroup():Destroy()
  BlueGlobalDefense5:GetLastAliveGroup():Destroy()
  BlueGlobalDefense6:GetLastAliveGroup():Destroy()
  BlueGlobalDefense7:GetLastAliveGroup():Destroy()
  BlueGlobalDefense8:GetLastAliveGroup():Destroy()
  BlueGlobalDefense9:GetLastAliveGroup():Destroy()
  BlueGlobalDefense10:GetLastAliveGroup():Destroy()
  BlueGlobalDefense11:GetLastAliveGroup():Destroy()
  
  GlobalDefenseBlueActive = false
  MessageToAll("WARNING: Blue Defense-Network offline!",60,"Global Defense Blue Despawn")
  else 
   MessageToAll("WARNING: Blue Defense-Network already offline!",10,"Global Defense Blue Despawn")  
 end 
end


-- ENDE Global Defense BLUE



-- START Global Defense RED

local RedGlobalDefense1 = SPAWN:New("Red_SAM_Global_Defense_1")
local RedGlobalDefense2 = SPAWN:New("Red_SAM_Global_Defense_2")
local RedGlobalDefense3 = SPAWN:New("Red_SAM_Global_Defense_3")
local RedGlobalDefense4 = SPAWN:New("Red_SAM_Global_Defense_4")
local RedGlobalDefense5 = SPAWN:New("Red_SAM_Global_Defense_5")


local GlobalDefenseRedActive = false

function GlobalDefenseStart()
 if not GlobalDefenseRedActive then
 
   RedGlobalDefense1:ReSpawn()
   RedGlobalDefense2:ReSpawn()
   RedGlobalDefense3:ReSpawn()
   RedGlobalDefense4:ReSpawn()
   RedGlobalDefense5:ReSpawn()
   
   GlobalDefenseRedActive = true
   MessageToAll("WARNING: Red Defense-Network online!",60,"Global Defense Red Start")
   
   else
   
   MessageToAll("WARNING: Red Defense-Network already active!",10,"Global Defense Red Error Spawn")  
 end
end


function GlobalDefenseEnd()
 if GlobalDefenseRedActive then
  RedGlobalDefense1:GetLastAliveGroup():Destroy()
  RedGlobalDefense2:GetLastAliveGroup():Destroy()
  RedGlobalDefense3:GetLastAliveGroup():Destroy()
  RedGlobalDefense4:GetLastAliveGroup():Destroy()
  RedGlobalDefense5:GetLastAliveGroup():Destroy()

  GlobalDefenseRedActive = false
  MessageToAll("WARNING: Red Defense-Network offline!",60,"Global Defense Blue Despawn")
  else 
   MessageToAll("WARNING: Red Defense-Network already offline!",10,"Global Defense Blue Despawn")  
 end 
end

-- ENDE Global Defense RED

-- START Drohnen

local droneWillie1 = SPAWN:New("Willie1")
local droneWillie2 = SPAWN:New("Willie2")
local droneWillie3 = SPAWN:New("Willie3")
local droneWillie4 = SPAWN:New("Willie4")
local droneWillie5 = SPAWN:New("Willie5")
local droneWillie6 = SPAWN:New("Willie6")
local droneWillie7 = SPAWN:New("Willie7")

local droneIL76Active = false

function DroneStart()
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


function DroneEnd()
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

function RedCAPStart ()

    if not CAPinit then
    CAPactive = true
    CAPinit = true
        -- Define a SET_GROUP object that builds a collection of groups that define the EWR network.
        -- Here we build the network with all the groups that have a name starting with DF CCCP AWACS and DF CCCP EWR.
        DetectionSetGroup = SET_GROUP:New()
        DetectionSetGroup:FilterPrefixes( { "Red_Awacs", "Red_EWR" } )
        DetectionSetGroup:FilterStart()
        
        Detection = DETECTION_AREAS:New( DetectionSetGroup, 30000 )
        
        -- Setup the A2A dispatcher, and initialize it.
        A2ADispatcher = AI_A2A_DISPATCHER:New( Detection )
        
        
        -- Initialize the dispatcher, setting up a radius of 100km where any airborne friendly 
        -- without an assignment within 100km radius from a detected target, will engage that target.
        A2ADispatcher:SetEngageRadius( 100000 )
        
        
        A2ADispatcher:SetTacticalDisplay( true )
        
        -- Test intercept.
        A2ADispatcher:SetIntercept( 30 )
        
        -- Setup the squadrons.
        
        A2ADispatcher:SetSquadron( "Sochi", AIRBASE.Caucasus.Maykop_Khanskaya, { "Mig28_CAP1" }, 20 )
        A2ADispatcher:SetSquadronCap( "Sochi", ZONE:New( "RedPatrolZone1" ), 4000, 8000, 600, 800, 1000, 1300 )
        A2ADispatcher:SetSquadronCapInterval("Sochi", 2, 30, 600, 1 ) 
        A2ADispatcher:SetSquadronGci( "Sochi", 900, 1200 )
        
        
        A2ADispatcher:SetDefaultFuelThreshold( 0.9 )
        A2ADispatcher:SetDefaultTanker( "RED_Tanker_CAP1" )
        
        
        A2ADispatcher:SetSquadron( "Beslan", AIRBASE.Caucasus.Beslan, { "Mig28_CAP2" }, 20 )
        A2ADispatcher:SetSquadronCap( "Beslan", ZONE:New( "RedPatrolZone2" ), 4000, 8000, 600, 800, 1000, 1300 )
        A2ADispatcher:SetSquadronCapInterval( "Beslan", 2, 30, 600, 1 ) 
        A2ADispatcher:SetSquadronGci( "Beslan", 900, 1200 )
        
        A2ADispatcher:SetSquadronFuelThreshold( "Beslan", 0.8 )
        A2ADispatcher:SetSquadronTanker( "Beslan", "RED_Tanker_CAP2" )
    end
    if not CAPactive then
        A2ADispatcher:Start()
    end
end

function RedCAPEnd()

    A2ADispatcher:Stop()
    CAPactive = false
    MessageToAll("CAP-Detection Stopped",20,"CAP Stop")
    
end


-- Menüstruktur
-- 1st Level!
MenuCoalitionBlueA2G = MENU_COALITION:New( coalition.side.BLUE, "MissionSetup A2G" )
MenuCoalitionBlueA2A = MENU_COALITION:New( coalition.side.BLUE, "MissionSetup A2A" )
MenuCoalitionBluePvP = MENU_COALITION:New( coalition.side.BLUE, "PvP Setup" )

-- 2nd Level!
MenuCoalitionBlueMissionSetupA2GGDefenseBlue = MENU_COALITION:New( coalition.side.BLUE, "Global Defense Blue", MenuCoalitionBlueA2G)
MenuCoalitionBlueMissionSetupA2ADrones = MENU_COALITION:New( coalition.side.BLUE, "Drones", MenuCoalitionBlueA2A)
MenuCoalitionBlueMissionSetupA2ARedCap = MENU_COALITION:New( coalition.side.BLUE, "Russian CAP", MenuCoalitionBlueA2A)
MenuCoalitionBlueMissionSetupA2ADroneIL76 = MENU_COALITION:New( coalition.side.BLUE, "Drohne Willie (IL76)", MenuCoalitionBlueMissionSetupA2ADrones)


-- 3rd Level!
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Global Defense Red : Start", MenuCoalitionBlueMissionSetupA2GGDefenseBlue, GlobalDefenseStart )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Global Defense Red : End", MenuCoalitionBlueMissionSetupA2GGDefenseBlue, GlobalDefenseEnd )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Drohne Willie (IL76) : Start", MenuCoalitionBlueMissionSetupA2ADroneIL76, DroneStart )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Drohne Willie (IL76) : End", MenuCoalitionBlueMissionSetupA2ADroneIL76, DroneEnd )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Russian CAP : Start", MenuCoalitionBlueMissionSetupA2ARedCap, RedCAPStart )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Russian CAP : End", MenuCoalitionBlueMissionSetupA2ARedCap, RedCAPEnd )

















