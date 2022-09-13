trigger.action.outText("CTLD start loading", 15)
-- Instantiate and start a CTLD for the blue side, using helicopter groups named "Helicargo" and alias "Lufttransportbrigade I"
my_ctld = CTLD:New(coalition.side.BLUE,{"helicargo", "UH1H", "UH60", "SA342","MI8","Mi24","KA50","AH64D", "Hercules", "C130"},"CTLD_Blue")

my_ctld.useprefix = true -- (DO NOT SWITCH THIS OFF UNLESS YOU KNOW WHAT YOU ARE DOING!) Adjust **before** starting CTLD. If set to false, *all* choppers of the coalition side will be enabled for CTLD.
my_ctld.CrateDistance = 35 -- List and Load crates in this radius only.
my_ctld.dropcratesanywhere = true -- Option to allow crates to be dropped anywhere.
my_ctld.maximumHoverHeight = 15 -- Hover max this high to load.
my_ctld.minimumHoverHeight = 4 -- Hover min this low to load.
my_ctld.forcehoverload = false -- Crates (not: troops) can **only** be loaded while hovering.
my_ctld.hoverautoloading = true -- Crates in CrateDistance in a LOAD zone will be loaded automatically if space allows.
my_ctld.smokedistance = 2000 -- Smoke or flares can be request for zones this far away (in meters).
my_ctld.movetroopstowpzone = true -- Troops and vehicles will move to the nearest MOVE zone...
my_ctld.movetroopsdistance = 5000 -- .. but only if this far away (in meters)
my_ctld.smokedistance = 2000 -- Only smoke or flare zones if requesting player unit is this far away (in meters)
my_ctld.suppressmessages = false -- Set to true if you want to script your own messages.
my_ctld.repairtime = 300 -- Number of seconds it takes to repair a unit.
my_ctld.cratecountry = country.id.GERMANY -- ID of crates. Will default to country.id.RUSSIA for RED coalition setups.
my_ctld.allowcratepickupagain = true  -- allow re-pickup crates that were dropped.
my_ctld.enableslingload = false -- allow cargos to be slingloaded - might not work for all cargo types
my_ctld.pilotmustopendoors = false -- force opening of doors
my_ctld.SmokeColor = SMOKECOLOR.Red -- color to use when dropping smoke from heli 
my_ctld.FlareColor = FLARECOLOR.Red -- color to use when flaring from heli
my_ctld.basetype = "container_cargo" -- default shape of the cargo container 

local farpCounter = 0


-- update unit capabilities for testing - allow 5 crates
my_ctld:UnitCapabilities("UH-1H", true, true,           1, 12, 15,2800)
my_ctld:UnitCapabilities("SA342L", false, false,        0, 3, 12,500)
my_ctld:UnitCapabilities("SA342M", false, false,        0, 3, 12,500)
my_ctld:UnitCapabilities("Mi-24P", true, true,          3, 8, 18, 3500)
my_ctld:UnitCapabilities("Mi-8MT", true, true,          5, 24, 15, 9200 )
my_ctld:UnitCapabilities("UH-60L", true, true,          5, 12, 15,9200)
my_ctld:UnitCapabilities("AH-64D BLK.II", false, false, 0, 0, 15, 500)
my_ctld:UnitCapabilities("Hercules", true, true,       15, 64, 25, 19090) -- maximumLoadWeight 42.000pounds -- Maximum 64 Paratroopers


-- define statics cargo
--my_ctld:AddCratesCargo("FOB",{"Template_Blue_FOB"},CTLD_CARGO.Enum.FOB,45,500,nil)
--my_ctld:AddCratesCargo("FOB",{"Template_Blue_FOB-1"},CTLD_CARGO.Enum.FOB,2,500,nil)
--my_ctld:AddStaticsCargo("Ammunition-1",50,nil) -- ammuntion weight 50kg ;) stock 25 pc
-- my_ctld:AddCratesCargo("FARP",{"Template_Blue_FARP_Support"},CTLD_CARGO.Enum.VEHICLE,1,100)

-- if you want to add weight to your Heli, crates can have a weight in kg **per crate**. Fly carefully.
my_ctld:AddCratesCargo("(SAM) M1097 Avenger 2*",      {"Template_Blue_Humvee"},CTLD_CARGO.Enum.VEHICLE,2,2775)
my_ctld:AddCratesCargo("(SAM) M1097 Avenger 2*",      {"M1097 Avenger"},CTLD_CARGO.Enum.VEHICLE,2,2775)
my_ctld:AddCratesCargo("(SAM) M6 Linebacker 3*",      {"M6 Linebacker"},CTLD_CARGO.Enum.VEHICLE,3,2775)
my_ctld:AddCratesCargo("(SAM) Roland ADS 3*",          {"Roland ADS"},CTLD_CARGO.Enum.VEHICLE,3,2775)
my_ctld:AddCratesCargo("(SAM) Roland ADS With Radar 5*",      {"Roland Radar Site With Launcher"},CTLD_CARGO.Enum.VEHICLE,5,2775)

my_ctld:AddCratesCargo("(SAM) M48 Chaparral 3*",      {"M48 Chaparral"},CTLD_CARGO.Enum.VEHICLE,3,2775)
my_ctld:AddCratesCargo("Stryker ATGM 5*",             {"M1134 Stryker ATGM"},CTLD_CARGO.Enum.VEHICLE,5,2775)
my_ctld:AddCratesCargo("Fuchs 5*",                    {"TPZ"},CTLD_CARGO.Enum.VEHICLE,5,2775)


my_ctld:AddTroopsCargo("Engineer Team",                 {"Template_CTLD_Blue_Wrench"},CTLD_CARGO.Enum.ENGINEERS,4,80)
my_ctld:AddTroopsCargo("Infantry Squad 12",             {"Template_CTLD_Blue_Inf12"},CTLD_CARGO.Enum.TROOPS,12,80)
my_ctld:AddTroopsCargo("Infantry Squad 8",              {"Template_CTLD_Blue_Inf8"},CTLD_CARGO.Enum.TROOPS,8,80)
my_ctld:AddTroopsCargo("Infantry Mortar-Team",          {"Template_CTLD_Blue_Mortar"},CTLD_CARGO.Enum.TROOPS,6,200)
my_ctld:AddTroopsCargo("Infantry JTac Widow",           {"Template_CTLD_Blue_JTac"},CTLD_CARGO.Enum.TROOPS,4,80)
my_ctld:AddTroopsCargo("Infantry Stingerteam",          {"Template_CTLD_Blue_Stingerteam"},CTLD_CARGO.Enum.TROOPS,5,80)--Template_CTLD_Blue_Stingerteam

my_ctld:AddCTLDZone("LHA-1 Tarawa",   CTLD.CargoZoneType.SHIP,nil,true,true,240,20)
my_ctld:AddCTLDZone("FOB Alpha",      CTLD.CargoZoneType.LOAD,nil,true,true)
my_ctld:AddCTLDZone("Bassel Al-Assad",CTLD.CargoZoneType.LOAD,nil,true,true)
my_ctld:AddCTLDZone("Incirlik",       CTLD.CargoZoneType.LOAD,nil,true,true)
my_ctld:AddCTLDZone("Aleppo",       CTLD.CargoZoneType.LOAD,nil,true,true)--Aleppo
my_ctld:AddCTLDZone("AbuCTLD",       CTLD.CargoZoneType.LOAD,nil,true,true)
my_ctld:AddCTLDZone("FOB LimaCTLD",       CTLD.CargoZoneType.LOAD,nil,true,true)
my_ctld:AddCTLDZone("FOB MikeCTLD",       CTLD.CargoZoneType.LOAD,nil,true,true)
my_ctld:AddCTLDZone("Hama",       CTLD.CargoZoneType.LOAD,nil,true,true)
my_ctld:AddCTLDZone("Hatay",       CTLD.CargoZoneType.LOAD,nil,true,true)
my_ctld:AddCTLDZone("Palmyra",       CTLD.CargoZoneType.LOAD,nil,true,true)
my_ctld:AddCTLDZone("Tabqa",       CTLD.CargoZoneType.LOAD,nil,true,true)
my_ctld:AddCTLDZone("Taftanaz",       CTLD.CargoZoneType.LOAD,nil,true,true)
my_ctld:AddCTLDZone("Rene Mouawad",       CTLD.CargoZoneType.LOAD,nil,true,true)


my_ctld.enableHercules = true -- Set This ti TRUE and DO NOT USE THE FOLLOWING line! Otherwise you allow both and the doors of hell will open...
--local herccargo = CTLD_HERCULES:New("blue", "Hercules", my_ctld)
my_ctld.HercMinAngels = 155 -- for troop/cargo drop via chute in meters  (155), ca 470 ft
my_ctld.HercMaxAngels = 2000 -- for troop/cargo drop via chute in meters (2000), ca 6000 ft
my_ctld.HercMaxSpeed = 77 -- 77mps or 270kph or 150kn
my_ctld.EngineerSearch = 2000 -- teams will search for crates in this radius.



function my_ctld:OnAfterCratesBuild(From,Event,To,Group,Unit,Vehicle)
  local vname = Vehicle:GetName()
  local vunit = Vehicle:GetUnit(1)
  local vunitname = vunit:GetName()
  local vgroup = vunit:GetGroup()
  if (string.match(vunitname, "FOB")) then --Get Unit Type : Wenn FOBCrate dann los
    my_ctld:AddCTLDZone(vname,CTLD.CargoZoneType.LOAD,SMOKECOLOR.Blue,true,true)
    MessageToAll("A new FOB has been created!")

  -- elseif string.match(vunitname, "FARP") then
  --   -- Get the zone of the drop, which are SupportUnits. Then place the Static Airfield under the SupportUnits
  --   -- Since the FARP object will be "teleported", we will need to implement a counter. Use 10 templates and after those are full, it is not possible to place a FARP
  --   -- anymore. After each drop, increase counter and teleport the next template.
  --   if (farpCounter < 11) then
  --     farpCounter = farpCounter + 1
  --     local zone = ZONE_GROUP:New("FARP Zone" .. farpCounter, vgroup, 10)
  --     local coord = zone:GetRandomPointVec2()
  --     local farp = SPAWNSTATIC:NewFromStatic("farp"..farpCounter):SpawnFromPointVec2(coord, 0)
  --     --trigger.action.outTextForGroup(Group:getID(), "You have deployed FARP # " .. farpCounter, 15)
  --   else
  --     --trigger.action.outTextForGroup(Group:getID(), "All Farps already in use, no deploy possible", 15)
  --   end
  end
end

my_ctld.enableLoadSave = true -- allow auto-saving and loading of files

my_ctld.saveinterval = 300 -- save every 5 minutes
my_ctld.filename = "FootHoldCTLD.csv" -- example filename
my_ctld.filepath = lfs.writedir().. "Missions\\Saves" -- example path
my_ctld.eventoninject = true -- fire OnAfterCratesBuild and OnAfterTroopsDeployed events when loading (uses Inject functions)
my_ctld:__Start(5)
my_ctld:__Load(10)
--my_ctld:TraceOn()
trigger.action.outText("CTLD loaded", 15)



