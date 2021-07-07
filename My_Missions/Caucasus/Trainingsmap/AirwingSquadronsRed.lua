local Mig29_Krasnodar=SQUADRON:New("Red_Mig29_CAP_Krasnodar", 50, "Red_Mig29_CAP_Krasnodar") --Ops.Squadron#SQUADRON
Mig29_Krasnodar:SetCallsign(CALLSIGN.Aircraft.Uzi)
Mig29_Krasnodar:SetSkill(AI.Skill.HIGH)
Mig29_Krasnodar:AddMissionCapability(AUFTRAG.Type.CAP, 100)
Mig29_Krasnodar:SetMissionRange(500)

local Mig29_CAP_Mineralnye=SQUADRON:New("Red_Mig29_CAP_Mineralnye", 50, "Red_Mig29_CAP_Mineralnye") --Ops.Squadron#SQUADRON
Mig29_CAP_Mineralnye:SetCallsign(CALLSIGN.Aircraft.Uzi)
Mig29_CAP_Mineralnye:SetSkill(AI.Skill.HIGH)
Mig29_CAP_Mineralnye:AddMissionCapability(AUFTRAG.Type.CAP, 100)
Mig29_CAP_Mineralnye:SetMissionRange(500)

local Mig29_CAP_Mozdok=SQUADRON:New("Red_Mig29_CAP_Mozdok", 50, "Red_Mig29_CAP_Mozdok") --Ops.Squadron#SQUADRON
Mig29_CAP_Mozdok:SetCallsign(CALLSIGN.Aircraft.Uzi)
Mig29_CAP_Mozdok:SetSkill(AI.Skill.HIGH)
Mig29_CAP_Mozdok:AddMissionCapability(AUFTRAG.Type.CAP, 100)
Mig29_CAP_Mozdok:SetMissionRange(500)

local Su33_Cap_Kuznetsov=SQUADRON:New("Red_Su33_Cap_Kuznetsov", 50, "Red_Su33_Cap_Kuznetsov") --Ops.Squadron#SQUADRON
Su33_Cap_Kuznetsov:SetCallsign(CALLSIGN.Aircraft.Uzi)
Su33_Cap_Kuznetsov:SetSkill(AI.Skill.HIGH)
Su33_Cap_Kuznetsov:AddMissionCapability(AUFTRAG.Type.CAP, 100)
Su33_Cap_Kuznetsov:SetMissionRange(500)


--Create the Airwing; Each Airwing conisits of "N" squadrons
local AW_Krasnodar=AIRWING:New("KrasC", "Airwing_Krasnodar-Center")
local AW_Mineralnye_Vody=AIRWING:New("Mineralnye Vody", "Airwing_Mineralnye Vody")
local AW_Mozdok=AIRWING:New("Mozdok", "Airwing_Mozdok")
local AW_Kuznetsov=AIRWING:New("Kuznetsov", "Airwing_Kuznetsov")
 
 -- Payloads
local Mig29CAP=AW_Krasnodar:NewPayload(GROUP:FindByName("Red_Mig29_CAP_Payload1"), -1, {AUFTRAG.Type.CAP}, 100)
local Mig29CAP=AW_Mineralnye_Vody:NewPayload(GROUP:FindByName("Red_Mig29_CAP_Payload1"), -1, {AUFTRAG.Type.CAP}, 100)
local Mig29CAP=AW_Mozdok:NewPayload(GROUP:FindByName("Red_Mig29_CAP_Payload1"), -1, {AUFTRAG.Type.CAP}, 100)
local Su33CAP=AW_Kuznetsov:NewPayload(GROUP:FindByName("Red_Su33_Cap_Payload1"), -1, {AUFTRAG.Type.CAP}, 100)


  local SchedulerAddNewSquadrons = SCHEDULER:New( nil, 
  function()
     AW_Krasnodar:AddSquadron(Mig29_Krasnodar)
     AW_Mineralnye_Vody:AddSquadron(Mig29_CAP_Mineralnye)
     AW_Mozdok:AddSquadron(Mig29_CAP_Mozdok)
     AW_Kuznetsov:AddSquadron(Su33_Cap_Kuznetsov)
     trigger.action.outText("KGB: We were just resupplied!", 10)
     
     
  end, {}, 1, 14400
  )

 -- Start the AirwingProcess
 AW_Krasnodar:Start()
 AW_Mineralnye_Vody:Start()
 AW_Mozdok:Start()
 AW_Kuznetsov:Start()
 
 -- Define the zones
local RED_CAP_WestSouth=ZONE:New("RED_CAP_WestSouth")
local RED_CAP_WestNorth=ZONE:New("RED_CAP_WestNorth")
local RED_CAP_Central=ZONE:New("RED_CAP_Central")
local RED_CAP_East=ZONE:New("RED_CAP_East")
local RED_CAP_AttackSouth=ZONE:New("RED_CAP_AttackSouth")

local mission=AUFTRAG:NewCAP(RED_CAP_WestSouth, 10000, 350)
mission:SetRepeatOnFailure(99)
mission:SetRepeatOnSuccess(99)
mission:SetEnableMarkers()
AW_Krasnodar:AddMission(mission)
AW_Kuznetsov:AddMission(mission)

local mission=AUFTRAG:NewCAP(RED_CAP_WestNorth, 10000, 350)
mission:SetRepeatOnFailure(99)
mission:SetRepeatOnSuccess(99)
mission:SetEnableMarkers()
AW_Krasnodar:AddMission(mission)

local mission=AUFTRAG:NewCAP(RED_CAP_Central, 10000, 350)
mission:SetRepeatOnFailure(99)
mission:SetRepeatOnSuccess(99)
mission:SetEnableMarkers()
AW_Mineralnye_Vody:AddMission(mission)
AW_Krasnodar:AddMission(mission)

local mission=AUFTRAG:NewCAP(RED_CAP_East, 10000, 350)
mission:SetRepeatOnFailure(99)
mission:SetRepeatOnSuccess(99)
mission:SetEnableMarkers()
AW_Mozdok:AddMission(mission)


 