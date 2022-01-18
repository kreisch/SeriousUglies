--- Robbed from Pikey, edited by kreisch :D
env.info("Squadrons and Airwings: Starting configuration")

local deadF18 = 0
local deadHarriers= 0
 
local f18Wildcats=SQUADRON:New("US_Squadron_F18_Wildcats", 40, "US_Wildcats") --Ops.Squadron#SQUADRON
f18Wildcats:SetCallsign(CALLSIGN.Aircraft.Dodge)
f18Wildcats:SetRadio(251)
f18Wildcats:SetSkill(AI.Skill.HIGH)
f18Wildcats:AddMissionCapability({AUFTRAG.Type.CAP, AUFTRAG.Type.SEAD, AUFTRAG.Type.BAI, AUFTRAG.Type.PATROLZONE}, 100)
f18Wildcats:SetMissionRange(900)

local e2Hawkers=SQUADRON:New("US_E2Hawkers", 8, "US_Hawkers") --Ops.Squadron#SQUADRON
e2Hawkers:SetCallsign(CALLSIGN.AWACS.Darkstar)
e2Hawkers:SetRadio(240.5)
e2Hawkers:SetSkill(AI.Skill.HIGH)
e2Hawkers:AddMissionCapability(AUFTRAG.Type.AWACS,100)
e2Hawkers:SetMissionRange(500)

local tankerBoys=SQUADRON:New("US_S3Bs", 12, "US_Hawkers") --Ops.Squadron#SQUADRON
tankerBoys:SetRadio(251)
tankerBoys:SetSkill(AI.Skill.HIGH)
tankerBoys:AddMissionCapability({AUFTRAG.Type.TANKER},100)
tankerBoys:SetMissionRange(700)

local harriers=SQUADRON:New("US_Harriers", 20, "US_Harriers") --Ops.Squadron#SQUADRON
harriers:SetRadio(251)
harriers:SetSkill(AI.Skill.HIGH)
harriers:AddMissionCapability({AUFTRAG.Type.CAS, AUFTRAG.Type.BAI},100)
harriers:SetMissionRange(700)

 -- Cap Zone South sector.

local BLUE_CAP_South = ZONE:New("BLUE_CAP_South-1")
-- Cap Zone Central sector
local RED_CAP_Central = ZONE:New("RED_CAP_Central")
local BLUE_CAP_CENTRAL = ZONE:New("BLUE_CAP_Central")
-- CAP Zone North sector
local RED_CAP_North = ZONE:New("RED_CAP_North")
local BLUE_CAP_NORTH = ZONE:New("BLUE_CAP_North")
local AAR_South = ZONE:New("AAR_South")
local SW_Recon_Zone = ZONE:New("SW_Recon_Zone")
local AFAC_South = ZONE:New("AFAC_Zone_South")
 
--Create the Airwing; Each Airwing conisits of "N" squadrons 
 --local CVN73=AIRWING:New("Ramat David", "Ramat David")
 local CVN73=AIRWING:New("USS George Washington", "USS George Washington")
 local Tarawa=AIRWING:New("LHA-1 Tarawa","LHA-1 Tarawa")
 
 Tarawa:AddSquadron(harriers)
 CVN73:AddSquadron(f18Wildcats)
 CVN73:AddSquadron(e2Hawkers)
 CVN73:AddSquadron(tankerBoys)
   
   
local mission=AUFTRAG:NewPATROLZONE(SW_Recon_Zone,350,15000)
mission:SetRepeatOnFailure(999)
mission:SetRepeatOnSuccess(999)
CVN73:AddMission(mission)

local mission=AUFTRAG:NewCAP(BLUE_CAP_South, 10000, 350)
mission:SetRepeatOnFailure(999)
mission:SetRepeatOnSuccess(999)
CVN73:AddMission(mission)

local mission=AUFTRAG:NewCAP(BLUE_CAP_CENTRAL, 10000, 350)
mission:SetRepeatOnFailure(999)
mission:SetRepeatOnSuccess(999)
CVN73:AddMission(mission)

local mission=AUFTRAG:NewCAP(BLUE_CAP_NORTH, 10000, 350)
mission:SetRepeatOnFailure(999)
mission:SetRepeatOnSuccess(999)
CVN73:AddMission(mission)

local mission=AUFTRAG:NewAWACS(BLUE_CAP_NORTH:GetCoordinate(),24000,350,270,20)
mission:SetRepeatOnFailure(999)
mission:SetRepeatOnSuccess(999)
CVN73:AddMission(mission)

local mission=AUFTRAG:NewCAS(AFAC_South,16000,350)
mission:SetRepeatOnFailure(999)
mission:SetRepeatOnSuccess(999)
Tarawa:AddMission(mission)

local mission=AUFTRAG:NewTANKER(AAR_South:GetCoordinate(),18000,385,20,20,0)
mission:SetRepeatOnFailure(999)
mission:SetRepeatOnSuccess(999)
mission:SetRadio(131)
mission:SetTACAN(31,"TCN")
CVN73:AddMission(mission)

local mission=AUFTRAG:NewTANKER(AAR_South:GetCoordinate(),18000,385,20,20,1)
mission:SetRepeatOnFailure(999)
mission:SetRepeatOnSuccess(999)
mission:SetRadio(121)
mission:SetTACAN(21,"TCN")
CVN73:AddMission(mission)
     

 function f18Wildcats:OnEventUnitLost(EventData)
  deadF18 = deadF18+1
  if (deadF18 == 40) then
      CVN73:AddSquadron(f18Wildcats)
      trigger.action.outText("CIA: All Wildcats shot down! We were just resupplied!", 10)
      env.info("CIA: CVN73 resupplied all killed")
      deadF18 = 0
  end
 end
 
 -- Define Payloads to be used
 local F18SEAD=CVN73:NewPayload(GROUP:FindByName("F18_Payload_SEAD"), -1, {AUFTRAG.Type.SEAD}, 100)
 local F18CAP1=CVN73:NewPayload(GROUP:FindByName("F18_Payload_CAP1"), -1, {AUFTRAG.Type.CAP}, 100)
 local F18BAI1=CVN73:NewPayload(GROUP:FindByName("F18_Payload_BAI1"), -1, {AUFTRAG.Type.BAI}, 100)
 local F18Recon=CVN73:NewPayload(GROUP:FindByName("F18_Payload_Recon"), -1, {AUFTRAG.Type.PATROLZONE}, 100)
 local AV8BCAS=Tarawa:NewPayload(GROUP:FindByName("AV8B_Payload_CAS"), -1, {AUFTRAG.Type.CAS, AUFTRAG.Type.BAI}, 100)
 
 
 CVN73:Start()
 Tarawa:Start()
 
 env.info("Squadrons and Airwings: Ended configuration")
 env.info("Squadrons and Airwings: Setting up Intelligence")
 
local AgentSet=SET_GROUP:New():FilterCoalitions("blue"):FilterCategoryAirplane():FilterStart()
 
 --Declare an INTEL based off that SET, for BLUE coalition
local cia=INTEL:New(AgentSet, coalition.side.BLUE)  
cia:AddAcceptZone(ZONE:New("AFAC_Zone_South")) --give it an inclusive area  
cia:Start() --start it

--THIS IS A CUSTOM FUNCTION TO CREATE A MISSION FOR ALL DETECTIONS OF THE RIGHT TYPE
function ATO(contact) 

if (contact.attribute == "Ground_EWR") then
    
    local target=GROUP:FindByName(contact.groupname)
    local auftrag=AUFTRAG:NewSEAD(target, 20000)
    if (contact.attribute == "Ground_SAM") then
      auftrag:SetRepeatOnFailure(2)
    else
      auftrag:SetRepeatOnFailure(1)
    end
    auftrag:SetEnableMarkers()
    CVN73:AddMission(auftrag)
    env.info("CIA: I found a " .. contact.attribute .. " called " ..  contact.groupname)
    trigger.action.outText("CIA: I found a " .. contact.attribute .. " called " ..  contact.groupname, 30)

elseif (contact.attribute == "Ground_APC") or (contact.attribute == "Ground_Artillery") or (contact.attribute =="Ground_Truck") or (contact.attribute =="Ground_Tank") then

    local target=GROUP:FindByName(contact.groupname)
    local auftrag=AUFTRAG:NewBAI(target, 1000)
    auftrag:SetMissionAltitude(1000)
    auftrag:SetEnableMarkers()
    CVN73:AddMission(auftrag)
    Tarawa:AddMission(auftrag)
    env.info("CIA: I found a " .. contact.attribute .. " called " ..  contact.groupname)
    trigger.action.outText("CIA: I found a " .. contact.attribute .. " called " ..  contact.groupname, 30)
end

end --endfunc

--- Function called when a NEW contact is detected.
function cia:OnAfterNewContact(From, Event, To, Contact)
  local contact=Contact --Ops.Intelligence#INTEL.Contact
ATO(contact) --fire the function for the contact  
end --end OnAfterNew

env.info("Squadrons and Airwings: Setting up Intelligence is done")
 
 
 -- andere types: "Air_Fighter" "Air_AWACS" von contact.attribute "Air_AttackHelo" "Air_TransportPlane"