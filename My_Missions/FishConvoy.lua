local Mig29CAPbool = false
local Mig29CAP = SPAWN:New("CAP Rot")
 
function Mig29Start()
 if not Mig29CAPbool then
 
   Mig29CAP:ReSpawn()
   Mig29CAPbool = true
 
 end
end
 
function Mig29End()
 if Mig29CAPbool then
  Mig29CAP:GetLastAliveGroup():Destroy()
  Mig29CAPbool = false
  
 end 
end

MenuCoalitionBlueMissionSetupGamemaster = MENU_COALITION:New( coalition.side.BLUE, "GAME MASTER..." )
MenuCoalitionBlueGamemasterMIG29 = MENU_COALITION:New( coalition.side.BLUE, "MIG 29 CAP...", MenuCoalitionBlueMissionSetupGamemaster)
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Mig29 CAP : Start", MenuCoalitionBlueGamemasterMIG29, Mig29Start)
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Mig29 CAP : Ende", MenuCoalitionBlueGamemasterMIG29, Mig29End)