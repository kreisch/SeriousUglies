


-- Instantiate and start a CTLD for the blue side, using helicopter groups named "Helicargo" and alias "Lufttransportbrigade I"
my_ctld = CTLD:New(coalition.side.BLUE,{"Helicargo"},"CTLD_Blue")

my_ctld.useprefix = false -- (DO NOT SWITCH THIS OFF UNLESS YOU KNOW WHAT YOU ARE DOING!) Adjust **before** starting CTLD. If set to false, *all* choppers of the coalition side will be enabled for CTLD.
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


-- update unit capabilities for testing - allow 5 crates
my_ctld:UnitCapabilities("UH-1H", true, true, 5, 12, 15)
my_ctld:UnitCapabilities("SA342L", false, false, 5, 3, 12)
my_ctld:UnitCapabilities("SA342M", false, false, 5, 3, 12)
my_ctld:UnitCapabilities("Mi-24P", true, true, 5, 8, 18)
my_ctld:UnitCapabilities("Mi-8MT", true, true, 5, 24, 15)
my_ctld:UnitCapabilities("UH-60L", true, true, 5, 12, 15)
my_ctld:UnitCapabilities("Hercules", true, true, 15, 64, 25)

-- define statics cargo
--my_ctld:AddCratesCargo("FOB",{"Template_FOB"},CTLD_CARGO.Enum.FOB,2,500,nil)
my_ctld:AddCratesCargo("FOB",{"Template_Blue_FOB-1"},CTLD_CARGO.Enum.FOB,2,500,nil)
my_ctld:AddStaticsCargo("Ammunition-1",50,nil) -- ammuntion weight 50kg ;) stock 25 pc

my_ctld:AddTroopsCargo("Infantry Squad 12",{"Template_CTLD_Blue_Inf12"},CTLD_CARGO.Enum.TROOPS,12,80)
my_ctld:AddTroopsCargo("Infantry Mortar-Team",{"Template_CTLD_Blue_Mortar"},CTLD_CARGO.Enum.TROOPS,6,200)
my_ctld:AddTroopsCargo("No Weight:Infantry Squad 12",{"Template_CTLD_Blue_Inf12"},CTLD_CARGO.Enum.TROOPS,12)
my_ctld:AddTroopsCargo("No Weight:Infantry Mortar-Team",{"Template_CTLD_Blue_Mortar"},CTLD_CARGO.Enum.TROOPS,6)

my_ctld:AddCTLDZone("LHA-1 Tarawa",CTLD.CargoZoneType.SHIP,SMOKECOLOR.Blue,true,true,240,20)
my_ctld:AddCTLDZone("CTLD_AlQusayr",CTLD.CargoZoneType.LOAD,SMOKECOLOR.Blue,true,true)
my_ctld:AddCTLDZone("CTLD_Hatay",CTLD.CargoZoneType.LOAD,SMOKECOLOR.Blue,true,true)
my_ctld:AddCTLDZone("CTLD_Incirlik",CTLD.CargoZoneType.LOAD,nil,true,true)
my_ctld:AddCTLDZone("CTLD_RamatDavid",CTLD.CargoZoneType.LOAD,SMOKECOLOR.Blue,true,true)
my_ctld:AddCTLDZone("CTLD_Rayak",CTLD.CargoZoneType.LOAD,SMOKECOLOR.Blue,true,true)
my_ctld:AddCTLDZone("CTLD_RoshPina",CTLD.CargoZoneType.LOAD,SMOKECOLOR.Blue,true,true)
my_ctld:AddCTLDZone("CTLD_KiryatShmona",CTLD.CargoZoneType.LOAD,SMOKECOLOR.Blue,true,true)


function my_ctld:OnAfterCratesBuild(From,Event,To,Group,Unit,Vehicle)
  local vname = Vehicle:GetName()
  local vunit = Vehicle:GetUnit(1)
  local vunitname = vunit:GetName()
  --Get Unit Type : Wenn FOBCrate dann los
  if (string.match(vunitname, "FOB")) then
    local zone = ZONE_UNIT:New(vname,vunit,100)
    my_ctld:AddCTLDZone(vname,CTLD.CargoZoneType.LOAD,SMOKECOLOR.Blue,true,true)
    MessageToAll("A new FOB has been created!")
  end
end



my_ctld:__Start(5)