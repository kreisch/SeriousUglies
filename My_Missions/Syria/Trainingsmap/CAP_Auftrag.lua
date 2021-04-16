---
-- Mission: Combat Air Patrol (CAP)
-- 
-- An F-16 group will perform a DCS CAP in zone Delta and attack all targets it detects automatically.
-- 
-- At 08:15 two enemy groups will fly into the CAP zone and should be engaged.
-- The enemies will not attack as they are on a simple orbit mission where the ROE prohibit any engagement.
---
--
--

-- Cap Zone South sector.
local RED_CAP_South=ZONE:New("RED_CAP_South")
-- Cap Zone Central sector
local RED_CAP_Central = ZONE:New("RED_CAP_Central")
-- CAP Zone North sector
local RED_CAP_North = ZONE:New("RED_CAP_North")


local mission_RED_CAP_North=AUFTRAG:NewCAP(RED_CAP_North, 10000, 350)
mission_RED_CAP_North:SetTime("6:20", "19:00")
--Create a new CAP mission for center sector.
local mission_RED_CAP_Central=AUFTRAG:NewCAP(RED_CAP_Central, 10000, 350)
mission_RED_CAP_Central:SetTime("6:20", "19:00")
--Create a new CAP mission for south sector.
local mission_RED_CAP_South=AUFTRAG:NewCAP(RED_CAP_South, 10000, 350)
mission_RED_CAP_South:SetTime("6:20", "19:00")



local Mig29_CAP_North = FLIGHTGROUP:New("Red_Mig29_CAP_North_Group1") -- North Group
Mig29_CAP_North:AddMission(mission_RED_CAP_North)
local Mig29_CAP_Center = FLIGHTGROUP:New("Red_Mig29_CAP_Central_Group1") -- Center Group
Mig29_CAP_Center:AddMission(mission_RED_CAP_Central)
-- Create a flightgroup and assign mission to pilot -> South sector
local Mig29_CAP_South=FLIGHTGROUP:New("Red_Mig29_CAP_South_Group1")
Mig29_CAP_South:AddMission(mission_RED_CAP_South)


