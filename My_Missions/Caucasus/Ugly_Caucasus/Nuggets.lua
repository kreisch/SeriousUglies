-- START Nugget 03 - TRUCKS ################################################################################################################################
local Nugget03Active = false
local Nugget03Trucks1 = SPAWN:New("Nugget 03 - Trucks 1")
local Nugget03Trucks2 = SPAWN:New("Nugget 03 - Trucks 2")
local Nugget03Trucks3 = SPAWN:New("Nugget 03 - Trucks 3")
local Nugget03Trucks4 = SPAWN:New("Nugget 03 - Trucks 4")
 
 
 
 
function Nugget03Start()
 if not Nugget03Active then
 
   Nugget03Trucks1:ReSpawn()
   Nugget03Trucks2:ReSpawn()
   Nugget03Trucks3:ReSpawn()
   Nugget03Trucks4:ReSpawn()
   
   Nugget03Active = true
   MessageToAll("Nugget 03 - Trucks sind gespawned!",60,"Nugget 03 Spawn")
   
   else
   
   MessageToAll("Nugget 03 - Trucks sind bereits gespawned!",60,"Nugget 03 Error Spawn")  
 end
end
 
function Nugget03End()
 if Nugget03Active then
  Nugget03Trucks1:GetLastAliveGroup():Destroy()
  Nugget03Trucks2:GetLastAliveGroup():Destroy()
  Nugget03Trucks3:GetLastAliveGroup():Destroy()
  Nugget03Trucks4:GetLastAliveGroup():Destroy()
  Nugget03Active = false
  MessageToAll("Nugget 03 - Trucks sind despawned!",60,"Nugget 03 Despawn")
  else 
   MessageToAll("Nugget 03 - Trucks sind noch nicht gespawned!",60,"Nugget 03 Error Despawn")  
 end 
end
 
-- ENDE Nugget 03 - TRUCKS #################################################################################################################################

 -- START Nugget 04 - BTRs ################################################################################################################################ 

local Nugget04Active = false
local Nugget04BTRs = SPAWN:New("Nugget 04 - BTRs")

function Nugget04Start()
 if not Nugget04Active then
   Nugget04BTRs:ReSpawn()
   Nugget04Active = true
   MessageToAll("Nugget 04 - BTRs sind gespawned!",60,"Nugget 04 Spawn")
   
   else
   
   MessageToAll("Nugget 04 - BTRs sind bereits gespawned!",60,"Nugget 04 Error Spawn")  
 end
end

function Nugget04End()
 if Nugget04Active then
  Nugget04BTRs:GetLastAliveGroup():Destroy()
  Nugget04Active = false
  MessageToAll("Nugget 04 - BTRs sind despawned!",60,"Nugget 04 Despawn")
  else 
   MessageToAll("Nugget 04 - BTRs sind noch nicht gespawned!",60,"Nugget 04 Error Despawn")  
 end 
end
 
 -- ENDE Nugget 04 - BTRs ################################################################################################################################
 
 -- START Nugget 05 - Bunkers BTRs Trucks ################################################################################################################################ 

local Nugget05Active = false
local Nugget05Trucks = SPAWN:New("Nugget 05 - Trucks")
local Nugget05BTRs = SPAWN:New("Nugget 05 - BTRs")
local Nugget05Bunkers = SPAWN:New("Nugget 05 - Bunker")

function Nugget05Start()
 if not Nugget05Active then
   Nugget05Trucks:ReSpawn()
   Nugget05BTRs:ReSpawn()
   Nugget05Bunkers:ReSpawn()
   Nugget05Active = true
   MessageToAll("Nugget 05 - Einheiten sind gespawned!",60,"Nugget 05 Spawn")
   
   else
   
   MessageToAll("Nugget 05 - Einheiten sind bereits gespawned!",60,"Nugget 05 Error Spawn")  
 end
end

function Nugget05End()
 if Nugget05Active then
  Nugget05Trucks:GetLastAliveGroup():Destroy()
  Nugget05BTRs:GetLastAliveGroup():Destroy()
  Nugget05Bunkers:GetLastAliveGroup():Destroy()
  
  Nugget05Active = false
  MessageToAll("Nugget 05 - Einheiten sind despawned!",60,"Nugget 05 Despawn")
  else 
   MessageToAll("Nugget 05 - Einheiten sind noch nicht gespawned!",60,"Nugget 05 Error Despawn")  
 end 
end
 
 -- ENDE Nugget 05 - Bunkers BTRs Trucks ################################################################################################################################ 

  -- START Nugget 06 - Bunkers BTRs Trucks ################################################################################################################################ 

local Nugget06Active = false
local Nugget06Trucks = SPAWN:New("Nugget 06 - Units")


function Nugget06Start()
 if not Nugget06Active then
   Nugget06Trucks:ReSpawn()
   Nugget06Active = true
   MessageToAll("Nugget 06 - Einheiten sind gespawned!",60,"Nugget 06 Spawn")
   
   else
   
   MessageToAll("Nugget 06 - Einheiten sind bereits gespawned!",60,"Nugget 06 Error Spawn")  
 end
end

function Nugget06End()
 if Nugget06Active then
  Nugget06Trucks:GetLastAliveGroup():Destroy()
  
  Nugget06Active = false
  MessageToAll("Nugget 06 - Einheiten sind despawned!",60,"Nugget 06 Despawn")
  else 
   MessageToAll("Nugget 06 - Einheiten sind noch nicht gespawned!",60,"Nugget 06 Error Despawn")  
 end 
end
 
 -- ENDE Nugget 06 - Bunkers BTRs Trucks ################################################################################################################################
 
   -- START Nugget 07 - Bunkers BTRs Trucks ################################################################################################################################ 

local Nugget07Active = false
local Nugget07Trucks = SPAWN:New("Nugget 07 - Drones")


function Nugget07Start()
 if not Nugget07Active then
   Nugget07Trucks:ReSpawn()
   Nugget07Active = true
   MessageToAll("Nugget 07 - Einheiten sind gespawned!",60,"Nugget 07 Spawn")
   
   else
   
   MessageToAll("Nugget 07 - Einheiten sind bereits gespawned!",60,"Nugget 07 Error Spawn")  
 end
end

function Nugget07End()
 if Nugget07Active then
  Nugget07Trucks:GetLastAliveGroup():Destroy()
  
  Nugget07Active = false
  MessageToAll("Nugget 07 - Einheiten sind despawned!",60,"Nugget 07 Despawn")
  else 
   MessageToAll("Nugget 07 - Einheiten sind noch nicht gespawned!",60,"Nugget 07 Error Despawn")  
 end 
end
 
 -- ENDE Nugget 07 - Bunkers BTRs Trucks ################################################################################################################################
  

-- MENÜ STRUKTUR ############################################################################################################################################  
   -- Aufbau des Menü-Punkts "Nugget Training"
MenuCoalitionBlueMissionSetupA2GNuggets = MENU_COALITION:New( coalition.side.BLUE, "Nugget-Training", MenuCoalitionBlueA2G)
 
 -- Submenüs für Nuggets
MenuCoalitionBlueMissionSetupNuggets03 = MENU_COALITION:New( coalition.side.BLUE, "Nugget-03", MenuCoalitionBlueMissionSetupA2GNuggets)
MenuCoalitionBlueMissionSetupNuggets04 = MENU_COALITION:New( coalition.side.BLUE, "Nugget-04", MenuCoalitionBlueMissionSetupA2GNuggets)
MenuCoalitionBlueMissionSetupNuggets05 = MENU_COALITION:New( coalition.side.BLUE, "Nugget-05", MenuCoalitionBlueMissionSetupA2GNuggets)
MenuCoalitionBlueMissionSetupNuggets06 = MENU_COALITION:New( coalition.side.BLUE, "Nugget-06", MenuCoalitionBlueMissionSetupA2GNuggets)
MenuCoalitionBlueMissionSetupNuggets07 = MENU_COALITION:New( coalition.side.BLUE, "Nugget-07", MenuCoalitionBlueMissionSetupA2GNuggets)
 
 -- Aktion an Menü-Punkt binden.
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Nugget 03 : Start", MenuCoalitionBlueMissionSetupNuggets03, Nugget03Start)
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Nugget 03 : Ende", MenuCoalitionBlueMissionSetupNuggets03, Nugget03End)
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Nugget 04 : Start", MenuCoalitionBlueMissionSetupNuggets04, Nugget04Start)
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Nugget 04 : Ende", MenuCoalitionBlueMissionSetupNuggets04, Nugget04End)
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Nugget 05 : Start", MenuCoalitionBlueMissionSetupNuggets05, Nugget05Start)
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Nugget 05 : Ende", MenuCoalitionBlueMissionSetupNuggets05, Nugget05End)
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Nugget 06 : Start", MenuCoalitionBlueMissionSetupNuggets06, Nugget06Start)
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Nugget 06 : Ende", MenuCoalitionBlueMissionSetupNuggets06, Nugget06End)
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Nugget 07 : Start", MenuCoalitionBlueMissionSetupNuggets07, Nugget07Start)
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Nugget 07 : Ende", MenuCoalitionBlueMissionSetupNuggets07, Nugget07End)
-- MENÜ STRUKTUR ############################################################################################################################################  