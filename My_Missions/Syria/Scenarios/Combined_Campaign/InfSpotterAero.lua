



local Red_DetectionSetGroup = SET_GROUP:New()
Red_DetectionSetGroup:FilterPrefixes( { "Red_Spotter" } )
Red_DetectionSetGroup:FilterOnce()


local RedIntel = INTEL:New(Red_DetectionSetGroup,"red","InfSpotter")
RedIntel:SetClusterAnalysis(true,true)
RedIntel:SetVerbosity(2)
RedIntel:__Start(2)

local SamTrap = GROUP:FindByName( "MyPrettySam" )
SamTrap:SetAIOff()
local SamOffOn = false

  local BlueVictory = USERSOUND:New( "radiobeep.ogg" )
  

function RedIntel:OnAfterNewContact(From, Event, To, Contact)
    BlueVictory:ToAll() -- Play the sound that Blue has won.
    local text = string.format("NEW contact %s detected by %s", Contact.groupname, Contact.recce or "unknown") 
    local m = MESSAGE:New(text,15,"KGB"):ToAll() 
    
    if not SamOffOn then
      SamTrap:SetAIOn()
      SamOffOn = true
      local m = MESSAGE:New("Sam is booting up",15,"KGB"):ToAll() 
    end
end