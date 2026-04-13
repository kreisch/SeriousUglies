-- Todo: F10 Marker nutzen um CTLD Move-Zones hinzuzufügen
-- CSAR
-- JTAC
-- C130 Fahrzeuge transportieren


BASE:I("CTLD : is loading.")

local DC_ctld = CTLD:New(coalition.side.BLUE,{"CH.47","SA342L", "UH.1H", "Hercules", "Mi.8MT","Ми.8МТВ2","Ми.24П","UH.60L", "Mi.24P", "OH58D", "UH.60.DAP","C.130J.30"},"Lufttransportbrigade I")

DC_ctld.dropcratesanywhere = true
DC_ctld.forcehoverload = false

DC_ctld.UseC130DynamicCargoAutoBuild = true
DC_ctld.UseC130LoadAndUnload = true
DC_ctld.enableFixedWing = true
DC_ctld.FixedMinAngels = 100 -- for troop/cargo drop via chute in meters, ca 470 ft
DC_ctld.FixedMaxSpeed = 200 -- 77mps or 270kph or 150kn

DC_ctld.CrateDistance = 65
DC_ctld.PackDistance = 65
DC_ctld.maximumHoverHeight = 20
DC_ctld.minimumHoverHeight = 3
DC_ctld.smokedistance = 8000
DC_ctld.dropAsCargoCrate = true
DC_ctld.nobuildinloadzones = false
DC_ctld.movecratesbeforebuild = false
DC_ctld.hoverautoloading = false
DC_ctld.enableslingload = true
DC_ctld.usesubcats = true
DC_ctld.pilotmustopendoors = false
DC_ctld.buildtime = 30
DC_ctld.onestepmenu = true
DC_ctld.basetype = "uh1h_cargo"
DC_ctld.RadioSoundFC3 = "beaconsilent.ogg"
DC_ctld.VehicleMoveFormation= {AI.Task.VehicleFormation.VEE, AI.Task.VehicleFormation.ECHELON_LEFT, AI.Task.VehicleFormation.ECHELON_RIGHT, AI.Task.VehicleFormation.RANK, AI.Task.VehicleFormation.CONE}
DC_ctld.EngineerSearch = 2000


DC_ctld.returntroopstobase = false

--- DC_CTLD specifics:
DC_ctld.amountOfAmmoPerBigCrates = 10
DC_ctld.amountOfCratesPerBigAmmoDelivery = 4

DC_ctld:__Start(2)

-- Define Zones here:
DC_ctld:AddCTLDZone("hannoverctld",CTLD.CargoZoneType.LOAD,SMOKECOLOR.Blue,true,true)

DC_ctld.WarehouseDropzones = {
  -- Add a Zone and an according Warehouse to it.
  {ZONE:New("zoneGoslarLandingStrip"), "WarehouseGoslarLandingStrip"},
}


-- Define Payload here:
-- Magical "X of all"
DC_ctld:AddCratesCargoNoMove("Ammo: " ..DC_ctld.amountOfAmmoPerBigCrates.." of all",{"CTLD_AAV"},CTLD_CARGO.Enum.FOB, DC_ctld.amountOfCratesPerBigAmmoDelivery, 4000, 100, "CTLDSubMenu", nil,nil,nil,nil,"cds_crate",nil, "iso_container")
DC_ctld:AddCratesCargoNoMove("FARP",{"CTLD_FOB"},CTLD_CARGO.Enum.FOB, 4, 4000, 100, "CTLDSubMenu", nil,nil,nil,nil,"cds_crate",nil, "iso_container")
DC_ctld:AddCratesCargo("Humvee",      {"CTLD_Humvee_AT"}, CTLD_CARGO.Enum.VEHICLE, 4, 3000, nil, "ANTI TANK")
DC_ctld:AddCratesCargoNoMove("Chief: 5 Leopard",{"CTLD_FOB"},CTLD_CARGO.Enum.FOB, 4, 4000, 100, "CTLDSubMenu", nil,nil,nil,nil,"cds_crate",nil, "iso_container")
DC_ctld:AddCratesCargoNoMove("Chief: 10 Marder",{"CTLD_FOB"},CTLD_CARGO.Enum.FOB, 4, 4000, 100, "CTLDSubMenu", nil,nil,nil,nil,"cds_crate",nil, "iso_container")

-- Static Payloads
DC_ctld:AddCratesCargoNoMove("CTLD_AAV",{"CTLD_AAV"},CTLD_CARGO.Enum.FOB, 3, 2800, 10, "CTLDSubMenu", nil,nil,nil,nil,"cds_crate",nil, "iso_container_small")
BASE:I("CTLD : loaded.")

-- Troops and Vehicles
DC_ctld:AddTroopsCargo("Wrenches",{"CTLD_Wrenches"},CTLD_CARGO.Enum.ENGINEERS,4)
DC_ctld:AddTroopsCargo("JTAC Widow",{"CTLD_JTAC_Widow"},CTLD_CARGO.Enum.TROOPS,2)
DC_ctld:AddUnits("Humvee",{"CTLD_Humvee_AT"},CTLD_CARGO.Enum.VEHICLE)

function DC_ctld:OnAfterGetCrates(From, Event, To, Group, Unit, Cargotable)
  local airbase = GetClosestAirbaseFromUnit(Unit)
    if not airbase then
      env.info("CTLD: Error: Airbase was nil.")
      return
    end
  local storage = airbase:GetStorage()
-- Debug
--   local airbaseName = airbase:GetName()
  local function AddCategory(categoryTable, categoryName)
    if not categoryTable then return end
    for weaponName, weaponPath in pairs(categoryTable) do
      if type(weaponPath) == "string" then
        storage:RemoveItem(weaponPath, DC_ctld.amountOfAmmoPerBigCrates)
      end
    end
  end

  ----------------------------------------------------------------
  -- ALLE KATEGORIEN AUTOMATISCH DURCHGEHEN
  ----------------------------------------------------------------

  for categoryName, categoryTable in pairs(ENUMS.Storage.weapons) do
    -- Nur Tabellen berücksichtigen (skip falls irgendwas anderes drin ist)
    if type(categoryTable) == "table" then
      AddCategory(categoryTable, categoryName)
    end
  end
end

function DC_ctld:OnAfterRemoveCratesNearby(From, Event, To, Group, Unit, Cargotable)
    if Unit then
        MESSAGE:New("Crates dropped by "..Unit:GetPlayerName(),10,"CTLD"):ToBlue()
            MESSAGE:New("Cargo was type of "..Cargotable[1].Name,10,"CTLD"):ToBlue()
            env.info("CTLD: Player " ..Unit:GetPlayerName() .. " loaded " ..Cargotable[1].Name)
            if Cargotable[1].Name == ("Ammo: " ..DC_ctld.amountOfAmmoPerBigCrates.." of all") then
              if not Cargotable[DC_ctld.amountOfCratesPerBigAmmoDelivery] then
                MESSAGE:New(Unit:GetPlayerName() .. " whoops, seems your payload is incomplete. You need " .. DC_ctld.amountOfAmmoPerBigCrates .. " crates for delivery!",30,"CTLD"):ToBlue()
              else
                RearmAfterCratesDropped(Unit)
              end

            -- Lieferung besteht aus was anderem als Munition, bspw. Fahrzeuge  
            else if Cargotable[1].Name == ("CTLD: Fahrzeug") then

                  end
            end
        --end 
    end
end

function CheckTableLandingZones(Unit)
  local isInZone = nil
  local warehouseName
      for i, entry in ipairs(DC_ctld.WarehouseDropzones) do
          local zone = entry[1]
          if Unit:IsInZone(zone) then
            isInZone = entry[1]
            warehouseName = entry[2]
            break
          end
      end
    env.info("CTLD: Found unit in zone " ..isInZone.. " with Warehouse " ..warehouseName)
  return warehouseName
end

function GetClosestAirbaseFromUnit(Unit)
    local airbase
        if Unit then
        local coord = Unit:GetCoordinate()
            if coord then
                airbase = coord:GetClosestAirbase(nil, coalition.side.BLUE)
                -- env.info("CTLD: Airbase is  " ..airbase:GetName(),10,"CTLD")
            else
                env.info("CTLD: Error: Coord was nil.")
            end
        end

    return airbase
end

--- Funktion um 
function RearmAfterCratesDropped(Unit)


  local airbase = GetClosestAirbaseFromUnit(Unit)
  if not airbase then
    env.info("CTLD: Error: Airbase was nil.")
    return
  end

  local storage = airbase:GetStorage()
-- Debug
--   local airbaseName = airbase:GetName()

  ----------------------------------------------------------------
  -- GENERISCHE FUNKTION
  ----------------------------------------------------------------
  local function AddCategory(categoryTable, categoryName)

    if not categoryTable then return end

    for weaponName, weaponPath in pairs(categoryTable) do

      if type(weaponPath) == "string" then

        -- Debug:
        -- local oldAmount = storage:GetItemAmount(weaponPath) or 0

        -- env.info(string.format(
        --   "CTLD: [%s] %s at %s = %d → +10",
        --   categoryName,
        --   weaponPath,
        --   airbaseName,
        --   oldAmount
        -- ))

        storage:AddItem(weaponPath, DC_ctld.amountOfAmmoPerBigCrates)

      end

    end
  end

  ----------------------------------------------------------------
  -- ALLE KATEGORIEN AUTOMATISCH DURCHGEHEN
  ----------------------------------------------------------------

  for categoryName, categoryTable in pairs(ENUMS.Storage.weapons) do

    -- Nur Tabellen berücksichtigen (skip falls irgendwas anderes drin ist)
    if type(categoryTable) == "table" then
      AddCategory(categoryTable, categoryName)
    end

  end

end

----- FARP SECTION
-- FARP Radio. First one has 130AM name London, next 131 name Dallas, and so forth. 
     local FARPFreq = 129
     local FARPName = 1  --numbers 1..10

     local FARPClearnames = {
       [1]="London",
       [2]="Dallas",
       [3]="Paris",
       [4]="Moscow",
       [5]="Berlin",
       [6]="Rome",
       [7]="Madrid",
       [8]="Warsaw",
       [9]="Dublin",
       [10]="Perth",
       }

     function BuildAFARP(Coordinate)
       local coord = Coordinate  --Core.Point#COORDINATE

       local FarpNameNumber = ((FARPName-1)%10)+1 -- make sure 11 becomes 1 etc
       local FName = FARPClearnames[FarpNameNumber] -- get clear name

       FARPFreq = FARPFreq + 1
       FARPName = FARPName + 1

       FName = FName .. " FAT COW "..tostring(FARPFreq).."AM" -- make name unique

       -- Get a Zone for loading 
       local ZoneSpawn = ZONE_RADIUS:New("FARP "..FName,Coordinate:GetVec2(),150,false)

       -- Spawn a FARP with our little helper and fill it up with resources (10t fuel each type, 10 pieces of each known equipment)
       UTILS.SpawnFARPAndFunctionalStatics(FName,Coordinate,ENUMS.FARPType.INVISIBLE,DC_ctld.coalition,country.id.USA,FarpNameNumber,FARPFreq,radio.modulation.AM,nil,nil,nil,10,10)

       -- Set a MapMarker for the new FARP.
       MARKER:New(Coordinate, "FARP FAT COW: "..tostring(FARPFreq).."AM" ):ReadOnly():ToAll()

       -- add a loadzone to CTLD
       DC_ctld:AddCTLDZone("FARP "..FName,CTLD.CargoZoneType.LOAD,SMOKECOLOR.Blue,true,true)
       local m  = MESSAGE:New(string.format("FARP %s in operation!",FName),15,"CTLD"):ToBlue() 
     end

     function DC_ctld:OnAfterCratesBuild(From,Event,To,Group,Unit,Vehicle)
       local name = Vehicle:GetName()
       if string.find(name,"CTLD_FOB",1,true) then
         local Coord = Vehicle:GetCoordinate()
         Vehicle:Destroy(false)
         BuildAFARP(Coord) 
       end
     end


     ----- JTAC
    
local JTacsAvailable = {} -- a list of available JTACs
local JTACcounter    = 0 -- Counter for JTacs
local JtacTargetList = {}
local JtacTargetCounter = 0 -- Counter specific for targets
local JtacMapMarker = {} -- Mapmarker, using JTACcounter as index, since a JTAC can only lase one target at a time.

local function CheckThreats(JTAC)
  local jtac = JTAC
  -- Get the highst (detected) threat to the group.
  local threatunit,threatlevel=jtac:GetHighestThreat()
  
  -- Set of detected units.
  local detectedset=jtac:GetDetectedUnits()
  
  -- Cound number of alive detected units. 
  local ndetected=detectedset:CountAlive()
  
  -- Info on detected units.
  local text=string.format("Detected units (%d):", ndetected)
  if ndetected>0 then  
    for _,_unit in pairs(detectedset:GetSet()) do
      local unit=_unit --Wrapper.Unit#UNIT
      text=text..string.format("\n- %s [threat level=%d]", unit:GetName(), unit:GetThreatLevel())
    end
  else
    text=text.." None"
  end
  
  -- We got a threat to the group.
  if threatunit then

    text=text..string.format("\nHighest detected threat %s with threat level %d", threatunit:GetName(), threatlevel)
    
    -- Current laser target.
    local target=jtac:GetLaserTarget()
    
    local newtarget=nil --Wrapper.Unit#UNIT
    if target then
    
      local currentthreatlevel=target:GetThreatLevel()
      
      if threatlevel>currentthreatlevel then
        env.info("FF higher threat detected!")
        newtarget=threatunit
      end
    
    else
      env.info("FF no current target using this one")
      newtarget=threatunit
    end
    
    if newtarget then
      if jtac:IsLasing() then
        jtac:LaserOff()
      end
      env.info("FF New target "..newtarget:GetName())
      jtac:LaserOn(newtarget)
    end
  
  end

  -- Get current laser target.
  local unit=jtac:GetLaserTarget()
  if unit then
    text=text..string.format("\nLasing target %s at code %d", unit:GetName(), jtac:GetLaserCode())
  else
    text=text.."\nNot lasing any target"
  end
  text=text..string.format(" (ON=%s, LOS=%s)", tostring(jtac:IsLasing()), tostring(jtac.spot.LOS))

  -- Info message.
  -- MESSAGE:New(text, 25):ToAll()
  env.info(text)
end


function DC_ctld:OnAfterTroopsDeployed(From, Event, To, Group, Unit, Troops)
  local jtac = nil 
  local deployedTroopsName = Troops:GetName()
      if string.find(deployedTroopsName, "JTAC") then
          env.info(Unit:GetPlayerName() .. " has dropped a JTAC.")
          jtac = CreateJTAC(Group, Unit, Troops, deployedTroopsName)
          -- trigger.action.outSoundForCoalition(2,"ding.ogg")
          TIMER:New(CheckThreats, jtac):Start(10, 10)
      else
      env.info(Unit:GetPlayerName() .. " has dropped something not a JTAC." .. deployedTroopsName)
    end 
end

function CreateJTAC(Group, Unit, Troops, deployedTroopsName)
      if Unit then
          MESSAGE:New(Unit:GetPlayerName().." deployed JTAC " ..deployedTroopsName.. "into the field!",30,"CTLD"):ToBlue()
      end 
      env.info("Creating JTAC " ..deployedTroopsName)
      local jtac = ARMYGROUP:New(deployedTroopsName)
      jtac:SetDetection(true)
      local JTACcounter = JTACcounter + 1
      -- jtac.DC_marker = MARKER:New(jtac:GetCoordinate(), "JTAC" .. jtac:GetName() .." is ready!"):ToCoalition( coalition.side.BLUE )

      --- Function called whenever a group has been detected for the first time.
      function jtac:OnAfterDetectedGroupNew(From, Event, To, Group)
        local group=Group --Wrapper.Group#GROUP
        local text=string.format("Detected NEW group %s", group:GetName())
        MESSAGE:New(text, 120):ToAll()
        env.info(text)
      end

      --- Function called whenever a dected group could not be detected anymore.
      function jtac:OnAfterDetectedGroupLost(From, Event, To, Group)
        local group=Group --Wrapper.Group#GROUP
        local text=string.format("LOST detected group %s", group:GetName())
        MESSAGE:New(text, 120):ToAll()
        env.info(text)
      end

      --- Function called when the LASER is switched on.
      function jtac:OnAfterLaserOn(From, Event, To, Target)
        -- Create a Mapmarker
        local targetName = Target:GetName()
        if (Target:IsAlive()) then
          JtacMapMarker[JTACcounter] = MARKER:New(Target:GetCoordinate(), "New Target, Type :" .. Target:GetCategoryName()
                    .."\nLaserCode " ..jtac:GetLaserCode()
                    .."\nMGRS: "..Target:GetCoordinate():ToStringMGRS()
                    .."\nLatLong: " ..Target:GetCoordinate():ToStringLL()
                    .."\nBulls: " ..Target:GetCoordinate():ToStringBULLS(coalition.side.BLUE, nil, true)):ReadOnly():ToAll()
        end
        local text=string.format("Switching LASER On (code %d)", jtac:GetLaserCode())
        MESSAGE:New(text, 60):ToAll()
        env.info(text)
      end

      --- Function called when the LASER code is changed.
      function jtac:OnAfterLaserCode(From, Event, To, Code)
        local text=string.format("Switching to LASER code %d", Code)
        MESSAGE:New(text, 60):ToAll()
        env.info(text)
      end

      function jtac:OnAfterLaserOff(From, Event, To)
        -- Remove Mapmarker
        JtacMapMarker[JTACcounter]:Remove()
      end
      return jtac
end

-- function InitializeJTACsAfterMissionLoad()
--   env.info("CTLD: Init JTACs")
--     local SetJTACs = SET_GROUP:New():FilterActive():FilterCoalitions("blue"):FilterPrefixes("JTAC"):FilterOnce()

--     for _,group in pairs(SetJTACs:GetSetNames()) do
--       env.info("CTLD: Init JTAC no. " .._.." name " ..group)
--       CreateJTAC(nil, nil, nil, group)
--       TIMER:New(CheckThreats, group):Start(30, 10)
--     end
--     env.info("CTLD: JTACs initialized.")
-- end


-- InitializeJTACsAfterMissionLoad()

-- -----       -- Loop over all groups spawned from that request.
-- --       for _,group in pairs(mygroupset:GetSetObjects()) do