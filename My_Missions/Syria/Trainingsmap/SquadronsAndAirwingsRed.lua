--- Robbed from Pikey, edited by kreisch :D
env.info("Squadrons and Airwings RED: Starting configuration")

--CREATE THREE SQUADRONS
local Mig29Damascus=SQUADRON:New("Red_Mig29_CAP_Damascus", 50, "Mig29_Damascus") --Ops.Squadron#SQUADRON
Mig29Damascus:SetCallsign(CALLSIGN.Aircraft.Uzi)
Mig29Damascus:SetSkill(AI.Skill.HIGH)
Mig29Damascus:AddMissionCapability(AUFTRAG.Type.CAP, 100)
Mig29Damascus:SetMissionRange(100)

local Mig21Damascus=SQUADRON:New("Red_Mig21_CAP_Damascus", 50, "Mig21_Damascus") --Ops.Squadron#SQUADRON
Mig21Damascus:SetCallsign(CALLSIGN.Aircraft.Uzi)
Mig21Damascus:SetSkill(AI.Skill.HIGH)
Mig21Damascus:AddMissionCapability(AUFTRAG.Type.CAP, 100)
Mig21Damascus:SetMissionRange(100)

local Mig28Damascus=SQUADRON:New("Red_Mig28_CAP_Damascus", 50, "Mig28_Damascus") --Ops.Squadron#SQUADRON
Mig28Damascus:SetCallsign(CALLSIGN.Aircraft.Uzi)
Mig28Damascus:SetSkill(AI.Skill.HIGH)
Mig28Damascus:AddMissionCapability(AUFTRAG.Type.CAP, 100)
Mig28Damascus:SetMissionRange(100)

local Mig31Damascus=SQUADRON:New("Red_Mig31_CAP_Damascus", 50, "Mig31_Damascus") --Ops.Squadron#SQUADRON
Mig31Damascus:SetCallsign(CALLSIGN.Aircraft.Uzi)
Mig31Damascus:SetSkill(AI.Skill.HIGH)
Mig31Damascus:AddMissionCapability(AUFTRAG.Type.CAP, 100)
Mig31Damascus:SetMissionRange(100)

local RED_CAP_South=ZONE:New("RED_CAP_South")


--Create the Airwing; Each Airwing conisits of "N" squadrons 
 local DamascusAirfield=AIRWING:New("Damascus", "Damascus")


  local SchedulerAddNewSquadrons = SCHEDULER:New( nil, 
  function()
     DamascusAirfield:AddSquadron(Mig29Damascus)
      DamascusAirfield:AddSquadron(Mig21Damascus)
      DamascusAirfield:AddSquadron(Mig28Damascus)
      DamascusAirfield:AddSquadron(Mig31Damascus)
      
      local mission=AUFTRAG:NewCAP(RED_CAP_South, 10000, 350)
mission:SetRepeatOnFailure(99)
mission:SetRepeatOnSuccess(99)
mission:SetEnableMarkers()
DamascusAirfield:AddMission(mission)
     trigger.action.outText("KGB: We were just resupplied!", 10)
     
     
  end, {}, 1, 14400
  )
 
local Mig29CAP=DamascusAirfield:NewPayload(GROUP:FindByName("Mig29_Loadout_CAP1"), -1, {AUFTRAG.Type.CAP}, 100)
local Mig21CAP=DamascusAirfield:NewPayload(GROUP:FindByName("Mig21_Loadout_CAP1"), -1, {AUFTRAG.Type.CAP}, 100)
local Mig28CAP=DamascusAirfield:NewPayload(GROUP:FindByName("Mig28_Loadout_CAP1"), -1, {AUFTRAG.Type.CAP}, 100)
local Mig31CAP=DamascusAirfield:NewPayload(GROUP:FindByName("Mig31_Loadout_CAP1"), -1, {AUFTRAG.Type.CAP}, 100)

DamascusAirfield:Start()





env.info("Squadrons and Airwings RED: ENDED configuration")

--  env.info("Squadrons and Airwings RED: Setting up Intelligence")
-- 
-- local AgentSet=SET_GROUP:New():FilterCoalitions("red"):FilterCategoryAirplane():FilterStart()
-- 
-- --Declare an INTEL based off that SET, for BLUE coalition
--local kgb=INTEL:New(AgentSet, coalition.side.BLUE)  
--kgb:AddAcceptZone(ZONE:New("AFAC_Zone_South")) --give it an inclusive area  
--kgb:Start() --start it
--
----THIS IS A CUSTOM FUNCTION TO CREATE A MISSION FOR ALL DETECTIONS OF THE RIGHT TYPE
--function ATO(contact) 
--
--if (contact.attribute == "Ground_SAM") or (contact.attribute == "Ground_AAA") then
--    
--    local target=GROUP:FindByName(contact.groupname)
--    local auftrag=AUFTRAG:NewSEAD(target, 25000)
--    if (contact.attribute == "Ground_SAM") then
--      auftrag:SetRepeatOnFailure(2)
--    else
--      auftrag:SetRepeatOnFailure(1)
--    end
--    auftrag:SetEnableMarkers()
--    CVN73:AddMission(auftrag)
--    env.info("CIA: I found a " .. contact.attribute .. " called " ..  contact.groupname)
--    trigger.action.outText("CIA: I found a " .. contact.attribute .. " called " ..  contact.groupname, 30)
--
--elseif (contact.attribute == "Ground_APC") or (contact.attribute == "Ground_Artillery") or (contact.attribute =="Ground_Truck") or (contact.attribute =="Ground_Tank") then
--
--    local target=GROUP:FindByName(contact.groupname)
--    local auftrag=AUFTRAG:NewBAI(target, 1000)
--    auftrag:SetMissionAltitude(1000)
--    auftrag:SetEnableMarkers()
--    CVN73:AddMission(auftrag)
--    env.info("CIA: I found a " .. contact.attribute .. " called " ..  contact.groupname)
--    trigger.action.outText("CIA: I found a " .. contact.attribute .. " called " ..  contact.groupname, 30)
--  
--else
----    local target=GROUP:FindByName(contact.groupname)
----    local auftrag=AUFTRAG:NewBAI(target, 5000)
----    auftrag:SetMissionAltitude(1000)
----    KOB:AddMission(auftrag)
--end
--
--end --endfunc
--
----- Function called when a NEW contact is detected.
--function kgb:OnAfterNewContact(From, Event, To, Contact)
--  local contact=Contact --Ops.Intelligence#INTEL.Contact
--ATO(contact) --fire the function for the contact  
--end --end OnAfterNew
--
--env.info("Squadrons and Airwings RED: Setting up Intelligence is done")

 