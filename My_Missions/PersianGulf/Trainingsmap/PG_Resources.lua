------ This file represents a first draft of ressource management
-- The original content and inspiration is taken of https://www.youtube.com/watch?v=YeuGL0duEgY, all credits to DeltaNineNine! Thanks buddy!
-- written by kreisch
-- 
-- This represents a first draft on the PG map.
-- Intended to be used in the PG scenario, this is ONLY A PROTOTYPE! BUGS PRESENT!



-- Define the variable to contain all warehouses
local warehouse= {}


-- Define the airfield warehouses
warehouse.bandarAbbas1 = WAREHOUSE:New(STATIC:FindByName("Warehouse BandarAbbas1"), "BandarAbbas1") -- Defines the BandarAbbas1 warehouse
--warehouse.bandarAbbas2 = WAREHOUSE:New(STATIC:FindByName("Warehouse BandarAbbas2"), "BandarAbbas2") -- Defines the BandarAbbas2 warehouse

-- Define a FARP warehouse
--warehouse.London = WAREHOUSE:New(STATIC:FindByName("Warehouse London"), "Kobuleti")

-- Define a ship warehouse
--warehouse.Tarawa = WAREHOUSE:New(UNIT:FindByName("Tarawa"),"Tarawa")


-- Start all the warehouses you created, required by MOOSE
warehouse.bandarAbbas1:Start()
--warehouse.bandarAbbas2:Start()
--warehouse.London:Start()
--warehouse.Tarawa:Start()


-- Fill the warehouses with Assets. A warehous without asset will not work
-- All assets must be defined as a "Late activate" group in the mission
-- The payload of the asset-group and the airframe and the fuel will be your "resource" transfer
warehouse.bandarAbbas1:AddAsset("RU_Resource_BandarAbbas_Mig21", 20)
--warehouse.bandarAbbas2:AddAsset("Apache Supply", 40)


-- Generic method to handle the resource requests.
-- DO NOT CHANGE
function requestRessource(fromWarehouse, toWarehouse, groupName, number)
  fromWarehouse:AddRequest(toWarehouse, WAREHOUSE.Descriptor.GROUPNAME, groupName, number, nil, nil, nil, "Resupply")
end

-- Define a List with routes
--fromToWarehouse = {
--  {warehouse.Kobuleti, warehouse.Senaki}
--}


-- DISABLED RESOURCE REQUESTS
---- Example method to run a specific supply run at the same time
--function scheduleRequest()
--    requestRessource(warehouse.Kobuleti,warehouse.Senaki,"CARGO_US_A10C_1",1)
--    
--end
--
---- Scheduler to activate the resource transport
--SCHEDULER:New(nil,scheduleRequest(),{},10,20*60,1.0,20*60*10+20)