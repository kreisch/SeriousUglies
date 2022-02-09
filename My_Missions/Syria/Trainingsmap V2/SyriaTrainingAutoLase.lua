local JTacSet = SET_GROUP:New():FilterPrefixes("JTac"):FilterCoalitions("blue"):FilterStart()
local Pilotset = SET_CLIENT:New():FilterCoalitions("blue"):FilterActive(true):FilterStart()
local autolaser = AUTOLASE:New(JTacSet,coalition.side.BLUE,"Widow",Pilotset)

autolaser:SetLasingParameters(5000,300)
autolaser:SetMaxLasingTargets(1)
--autolaser:SetNotifyPilots(true)
--autolaser:NotifyPilots("we are lasing", 15)

--- (User) Function enable sending messages via SRS.
-- @param #AUTOLASE self
-- @param #boolean OnOff Switch usage on and off
-- @param #string Path Path to SRS directory, e.g. C:\\Program Files\\DCS-SimpleRadio-Standalon
-- @param #number Frequency Frequency to send, e.g. 243
-- @param #number Modulation Modulation i.e. radio.modulation.AM or radio.modulation.FM
-- @return #AUTOLASE self 
--autolaser:SetUsingSRS(true,"C:\\DCS_DATA\\SRS",251,radio.modulation.FM)


-- Note - message are shown to pilots in the #SET_CLIENT only if using the pilotset option, else to the coalition.


-- AUTOLASE:OnAfterLasing(From, Event, To, LaserSpot)
-- AUTOLASE:OnAfterRecceKIA(From, Event, To, RecceName)
-- AUTOLASE:OnAfterTargetDestroyed(From, Event, To, UnitName, RecceName)
-- AUTOLASE:OnAfterTargetLost(From, Event, To, UnitName, RecceName)

       --     local recce = SPAWN:New("Reaper")
       --       :InitDelayOff()
       --       :OnSpawnGroup(
       --         function (group)
       --           local unit = group:GetUnit(1)
       --           local name = unit:GetName()
       --           autolaser:SetRecceLaserCode(name,1688)
       --           autolaser:SetRecceSmokeColor(name,SMOKECOLOR.Red)
       --         end
       --       )
       --       :InitCleanUp(60)
       --       :InitLimit(1,0)
       --       :SpawnScheduled(30,0.5)



