-- Assign all tankers to Tacan Beacons

-- Assign Units
--Shell S3B 264Mhz
local Shell = UNIT:FindByName("Shell")
-- Texaco KC130 265Mhz
local Texaco = UNIT:FindByName("Texaco")
-- Arco2 IL78M
local Arco2 = UNIT:FindByName("101")

--Assign Beacons to Units

local ShellTacanBeacon = Shell:GetBeacon()
ShellTacanBeacon:AATACAN(12, "Shell", true)

local TexacoTacanBeacon = Texaco:GetBeacon()
TexacoTacanBeacon:AATACAN(14, "Texaco", true)

local Arco2TacanBeacon = Arco2:GetBeacon()
Arco2TacanBeacon:AATACAN(15, "Arco2", true)