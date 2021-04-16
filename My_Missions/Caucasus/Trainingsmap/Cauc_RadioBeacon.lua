--- Beacon for CSG-11
local GeorgeWashington = UNIT:FindByName("GeorgeWashington")
local GeorgeWashingtonBeacon = GeorgeWashington:GetBeacon()

-- Set the beacon and start it
GeorgeWashingtonBeacon:RadioBeacon("beacon.ogg", 40, radio.modulation.FM, 20, 5*60*720)


--- Beacon for Coast-Group
local TarawaCoast = UNIT:FindByName("TarawaCoast")
local TarawaCoastBeacon = TarawaCoast:GetBeacon()

-- Set the beacon and start it
TarawaCoastBeacon:RadioBeacon("beacon.ogg", 41, radio.modulation.FM, 20, 5*60*720)

--- Beacon for Trainings-Range
local TargetRangeRadio = UNIT:FindByName("TargetRangeRadio")
local TargetRangeRadioBeacon = TargetRangeRadio:GetBeacon()

-- Set the beacon and start it
TargetRangeRadioBeacon:RadioBeacon("beacon.ogg", 42, radio.modulation.FM, 20, 5*60*720)
