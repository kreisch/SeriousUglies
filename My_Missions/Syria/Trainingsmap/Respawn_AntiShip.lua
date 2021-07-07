




SCHEDULER:New( nil, function()
  local mission=AUFTRAG:NewANTISHIP("Naval-1",2000)
  local fg=FLIGHTGROUP:New("US_ANTI_SHIP-1")
  fg:AddMission(mission)
  
end, {},120, 900, .8)