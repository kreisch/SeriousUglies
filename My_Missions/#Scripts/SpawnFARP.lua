-- Just define a static called "farp" and use this for spawning. Credits to Pikey.

local Zone = ZONE:New("zone")
local coord = Zone:GetRandomPointVec2()
local farp = SPAWNSTATIC:NewFromStatic("farp"):SpawnFromPointVec2(coord, 0)