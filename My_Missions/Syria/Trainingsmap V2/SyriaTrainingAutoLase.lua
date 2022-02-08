local JTacSet = SET_GROUP:New():FilterPrefixes("JTac"):FilterCoalitions("blue"):FilterStart()
local Pilotset = SET_CLIENT:New():FilterCoalitions("blue"):FilterActive(true):FilterStart()
local autolaser = AUTOLASE:New(JTacSet,coalition.side.BLUE,"Widow",Pilotset)
-- local recce = SPAWN:New("Reaper")
-- :InitDelayOff()
-- :OnSpawnGroup(
--   function (group)
--     local unit = group:GetUnit(1)
--     local name = unit:GetName()
--     autolaser:SetRecceLaserCode(name,1688)
--     autolaser:SetRecceSmokeColor(name,SMOKECOLOR.Red)
--   end
-- )
-- :InitCleanUp(60)
-- :InitLimit(1,0)
-- :SpawnScheduled(30,0.5)


autolaser:SetNotifyPilots(true) -- defaults to true, also shown if debug == true
       -- Note - message are shown to pilots in the #SET_CLIENT only if using the pilotset option, else to the coalition.


-- AUTOLASE:OnAfterLasing(From, Event, To, LaserSpot)
-- AUTOLASE:OnAfterRecceKIA(From, Event, To, RecceName)
-- AUTOLASE:OnAfterTargetDestroyed(From, Event, To, UnitName, RecceName)
-- AUTOLASE:OnAfterTargetLost(From, Event, To, UnitName, RecceName)