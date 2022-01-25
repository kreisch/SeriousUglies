-- Create a Client SET

clientSet = SET_CLIENT:New():FilterActive():FilterStart()

actualZone = ZONE:New("NameFromMissionEditor") -- This refering to a Zone created in Mission Editor. Paste in the name of the zone over NameFromMissionEditor.

mySchdueler = SCHEDULER:New(nil,function() 
    clientSet:ForEachClientInZone(actualZone,function(MooseUnit) 
        ---@class UNIT:CONTROLLABLE
        local _Unit = MooseUnit
        local coal = _Unit:GetCoalition()
        local type = _Unit:GetTypeName() -- kreisch: Sollte Typ wie z.B. UH-1H liefern
        local category = _Unit:getCategory() -- kreisch: Sollte Type liefern: Airplane, Helicopter, Ground, Ship, Structure
        if coal == coalition.side.BLUE then
            -- Set you trigger
        else
            -- Set you trigger
        end

    end)


end,{},10,5,nil,nil) -- Start after ten seconds and repeats every 5 sec, change to whatever you like.