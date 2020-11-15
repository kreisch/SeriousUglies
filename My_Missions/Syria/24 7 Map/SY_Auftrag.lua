


function testcase10()
-- AUFTRAG: Forward Air Controller Airborne (FACA)
MESSAGE:New("AUFTRAG: Forward Air Controller - Airborne 'FAC(A)'"
.."\n " 
.."\nA Kiowa will provide FAC(A) on the Red Target X GROUP"
.."\n "
.."\nThe Kiowa performs the FAC(A) task and can be contacted via the DCS radio menu."
, 20):ToAll()
ping:ToAll()
  local Target=GROUP:FindByName("Red Target X")
  local afac=FLIGHTGROUP:New("OH-58 Group")
  local mission=AUFTRAG:NewFACA(Target)
  afac:SetRadio(225)
  --afac:SetDefaultCallsign(CALLSIGN.AWACS.Darkstar, 5)
  afac:AddMission(mission)
end



TopMenu1 = MENU_MISSION:New( "Auftrag Demo 1-8" )
TopMenu2 = MENU_MISSION:New( "Auftrag Demo 9-16" )

Menu10 = MENU_MISSION_COMMAND:New("FAC(A)", TopMenu2, testcase10)