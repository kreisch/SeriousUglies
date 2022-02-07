local zoneToCheck = ZONE:New("TestDeployZone")


function startTestTransportMission(zone)

   
   local ammocounter = 0
   function my_ctld:OnAfterCratesDropped(From, Event, To, Group, Unit, Cargotable)
      if (Unit:IsInZone(zone)) then
              
           local table = Cargotable
            for _,_cargo in pairs (table) do
              -- count objects
              local cargo = _cargo -- Ops.CTLD#CTLD_CARGO
              local name = cargo:GetName()
              if string.find(name,"Ammunition") then
                ammocounter = ammocounter + 1
                local obj = cargo:GetPositionable()
                if obj and obj:IsAlive() then -- "load" on truck
                  obj:Destroy()
                end
              end
            end
            if (ammocounter > 0) then
              MessageToAll("Air America war erneut erfolgreich!")
              trigger.action.outSound("Murica.ogg")
            end
      end
   
   
   
--       if Unit then
--          local cargo = _cargo -- Ops.CTLD#CTLD_CARGO
--          local name = cargo:GetName()
--          if string.find(name,"Ammunition") then
--             local PlayerName = Unit:GetPlayerName()
--             if (Unit:IsInZone(zoneToCheck)) then
--               MessageToAll("Air America war erneut erfolgreich!")
--              end
--          end
--       end
   end
end


startTestTransportMission(zoneToCheck)