local Blue_DetectionSetGroup = SET_GROUP:New():FilterCoalitions("blue"):FilterActive():FilterStart()
local BlueIntel = INTEL:New(Blue_DetectionSetGroup, "blue", "CIA")
BlueIntel:SetClusterAnalysis(true, true)
BlueIntel:SetVerbosity(2)
BlueIntel:__Start(2)
local armygroup = {}
armygroup[1] = ARMYGROUP:New(GROUP:FindByName("US_Paladin-1"))
armygroup[1]:AddWeaponRange(0, UTILS.KiloMetersToNM(20))

armygroup[2] = ARMYGROUP:New(GROUP:FindByName("US_Paladin-5"))
armygroup[2]:AddWeaponRange(0, UTILS.KiloMetersToNM(20))

-- -- Paladin platoon
-- local platoonARTY=PLATOON:New("US_Paladin-1", 4, "M109 Paladin")
-- platoonARTY:AddMissionCapability({AUFTRAG.Type.ARTY}, 90)
-- platoonARTY:AddWeaponRange(UTILS.KiloMetersToNM(0.5), UTILS.KiloMetersToNM(20))

-- local brigade=BRIGADE:New("Housing", "Brigade Senaki")
-- brigade:AddPlatoon(platoonARTY)
-- brigade:Start()

function BlueIntel:OnAfterNewContact(From, Event, To, contact)
    local trgtGrp = GROUP:FindByName(contact.groupname)
    contactMarker = MARKER:New(trgtGrp:GetCoordinate(), "Firemission"):ReadOnly():ToAll()
    local auftrag=AUFTRAG:NewARTY(trgtGrp, 5, 30)
    for k=1, #armygroup, 1 do
        armygroup[k]:AddMission(auftrag)
      end
end
