-- Assign all TACANs to Tankers Arco, Shell and Texaco

-- BASE:TraceLevel(3)

local Tanker1 = UNIT:FindByName("Arco")
local Tanker2 = UNIT:FindByName("Shell")
local Tanker3 = UNIT:FindByName("Texaco")
local ChopperTarawa = UNIT:FindByName("ChopperTarawa")

--Tanker1, Arco
local BeaconAircraftTanker1 = Tanker1:GetBeacon()
BeaconAircraftTanker1:AATACAN(11, "Arco", true)

--Tanker2, Shell
local BeaconAircraftTanker2 = Tanker2:GetBeacon()
BeaconAircraftTanker2:AATACAN(12, "Shell", true)

--Tanker3, Texaco
local BeaconAircraftTanker3 = Tanker3:GetBeacon()
BeaconAircraftTanker3:AATACAN(13, "Texaco", true)

-- Tarawa for the Choppers
local BeaconLand = LandUnit:GetBeacon()
BeaconLand:RadioBeacon("Morse.ogg", 129, radio.modulation.AM, 100, 0)

