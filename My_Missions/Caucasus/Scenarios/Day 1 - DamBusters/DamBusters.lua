-- Assign all TACANs to Tankers Arco, Shell and Texaco

-- BASE:TraceLevel(3)

local Tanker1 = UNIT:FindByName("Tanker1")
local Tanker2 = UNIT:FindByName("Tanker2")
local Tanker3 = UNIT:FindByName("Tanker3")

--Tanker1, Arco
local BeaconAircraftTanker1 = Tanker1:GetBeacon()
BeaconAircraftTanker1:AATACAN(11, "Arco", true)

--Tanker2, Shell
local BeaconAircraftTanker2 = Tanker2:GetBeacon()
BeaconAircraftTanker2:AATACAN(12, "Shell", true)

--Tanker3, Texaco
local BeaconAircraftTanker3 = Tanker3:GetBeacon()
BeaconAircraftTanker3:AATACAN(13, "Texaco", true)



