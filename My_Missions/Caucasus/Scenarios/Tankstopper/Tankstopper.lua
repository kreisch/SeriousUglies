armygroup = {}

armygroup[1]  = ARMYGROUP:New(GROUP:FindByName("Blue_Paladin-1"))
armygroup[1]  :AddWeaponRange(0, UTILS.KiloMetersToNM(21))
armygroup[2]  = ARMYGROUP:New(GROUP:FindByName("Blue_Paladin-2"))
armygroup[2]  :AddWeaponRange(0, UTILS.KiloMetersToNM(21))
armygroup[3]  = ARMYGROUP:New(GROUP:FindByName("Blue_Paladin-3"))
armygroup[3]  :AddWeaponRange(0, UTILS.KiloMetersToNM(21))
armygroup[4]  = ARMYGROUP:New(GROUP:FindByName("Blue_Paladin-4"))
armygroup[4]  :AddWeaponRange(0, UTILS.KiloMetersToNM(21))
armygroup[5]  = ARMYGROUP:New(GROUP:FindByName("Blue_Paladin-5"))
armygroup[5]  :AddWeaponRange(0, UTILS.KiloMetersToNM(21))
armygroup[6]  = ARMYGROUP:New(GROUP:FindByName("Blue_Paladin-6"))
armygroup[6]  :AddWeaponRange(0, UTILS.KiloMetersToNM(21))


--THIS IS A CUSTOM FUNCTION TO CREATE A MISSION FOR ALL DETECTIONS OF THE RIGHT TYPE
local function ATO(contact)
    --trigger.action.outText("CIA: I found a " .. contact.attribute .. " called " ..  contact.groupname, 30)
    if (contact.attribute == "Ground_APC") or (contact.attribute == "Ground_Artillery") or (contact.attribute =="Ground_Truck") or (contact.attribute =="Ground_Tank") 
    or (contact.attribute =="Ground_Infantry") then
            local target=GROUP:FindByName(contact.groupname)
            if (target) then
              local auftrag=AUFTRAG:NewARTY(target, 5, 30)
                function auftrag:OnAfterDone(From, Event, To)
                    trigger.action.outText("Paladins, Firemission done, over! Reloading!", 10)
                end
              for k=1, #armygroup, 1 do
                armygroup[k]:AddMission(auftrag)
              end
            end
      end
  
  end --endfunc


      --Define BlueReconSet
      BlueReconSet=SET_GROUP:New():FilterCoalitions("blue"):FilterPrefixes({"US_Recon"}):FilterStart() -- Filtern auf Prefix
      --Declare an INTEL based off that SET, for BLUE coalition
      IntelBlue = INTEL:New(BlueReconSet, coalition.side.BLUE) 
      --IntelBlue:SetClusterAnalysis(true,true)
      --IntelBlue:SetVerbosity(2)
            --- Function called when a NEW contact is detected by the specified Agents.
        function IntelBlue:OnAfterNewContact(From, Event, To, Contact)
          local contact=Contact --Ops.Intelligence#INTEL.Contact
          ATO(contact) --fire the function for the contact  
        end --end OnAfterNew
      IntelBlue:Start() --start it
  



      -- Scheduler
      -- Alle 120 Sekunden (Prüfen wie lange der Zielvorgang braucht) alle Kontakte von Intel nehmen
      -- Überprüfung der Reichweite und FireMission geben