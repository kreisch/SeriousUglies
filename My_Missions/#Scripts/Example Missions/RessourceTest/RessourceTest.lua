------ This file represents a first draft of ressource management
-- The original content and inspiration is taken of https://www.youtube.com/watch?v=YeuGL0duEgY, all credits to DeltaNineNine! Thanks buddy!
-- written by kreisch

-- Define the variable to contain all warehouses
local warehouse= {}


-- Define the airfield warehouses
warehouse.Senaki = WAREHOUSE:New(STATIC:FindByName("Warehouse Senaki"), "Senaki") -- Defines the senaki warehouse
warehouse.Kobuleti = WAREHOUSE:New(STATIC:FindByName("Warehouse Kobuleti"), "Kobuleti") -- Defines the kobuleti warehouse

-- Define a FARP warehouse
warehouse.London = WAREHOUSE:New(STATIC:FindByName("Warehouse London"), "Kobuleti")

-- Define a ship warehouse
warehouse.Tarawa = WAREHOUSE:New(UNIT:FindByName("Tarawa"),"Tarawa")


-- Start all the warehouses you created, required by MOOSE
warehouse.Senaki:Start()
warehouse.Kobuleti:Start()
warehouse.London:Start()
warehouse.Tarawa:Start()


-- Fill the warehouses with Assets. A warehous without asset will not work
-- All assets must be defined as a "Late activate" group in the mission
-- The payload of the asset-group and the airframe and the fuel will be your "resource" transfer
warehouse.Kobuleti:AddAsset("CARGO_US_A10C_1", 40)
warehouse.Tarawa:AddAsset("Apache Supply", 40)


-- Generic method to handle the resource requests.
function requestRessource(fromWarehouse, toWarehouse, groupName, number)
  fromWarehouse:AddRequest(toWarehouse, WAREHOUSE.Descriptor.GROUPNAME, groupName, number, nil, nil, nil, "Resupply")
end

-- Define a List with routes
fromToWarehouse = {
  {warehouse.Kobuleti, warehouse.Senaki}
}

-- Example method to run a specific supply run at the same time
function scheduleRequest()
    requestRessource(warehouse.Kobuleti,warehouse.Senaki,"CARGO_US_A10C_1",1)
    requestRessource(warehouse.Tarawa,warehouse.London,"Apache Supply",1)
    
end

-- Scheduler to activate the resource transport
SCHEDULER:New(nil,scheduleRequest(),{},10,20*60,1.0,20*60*10+20)