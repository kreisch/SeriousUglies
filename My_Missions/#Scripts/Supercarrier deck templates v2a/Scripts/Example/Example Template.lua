
local staticObj = {
	["name"] = "Example el1 Hornet 1", -- unit name (Name this something identifiable if you wish to remove it later)

-- Copy and paste over this with the units information
                                        ["livery_id"] = "VFA-106 high visibility",
                                        ["category"] = "Planes",
                                        ["type"] = "FA-18C_hornet",
                                        ["offsets"] = 
                                        {
                                            ["y"] = 32.666429390083,
                                            ["angle"] = 4.5553093477052,
                                            ["x"] = 35.438701674691,
                                        }, -- end of ["offsets"]
-- Copy and paste over this with the units information end

-- these can be left as is, but is required.
	["groupId"] = 1,		-- id's of the group/unit we're spawning (will auto increment if id taken?)
	["unitId"] = 1,
	["y"] = 0,			-- The initial location of the unit (required else unit will offset on origin of map)
	["x"] = 0,			
	["heading"] = 0,
	["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
	["linkOffset"] = true,
	["dead"] = false,
}
coalition.addStaticObject(country.id.USA, staticObj) -- makes the object

-- ********************************************************

local staticObj = {
	["name"] = "Example el1 Hornet 3", -- unit name (Name this something identifiable if you wish to remove it later)

-- Copy and paste over this with the units information
                                        ["livery_id"] = "VMFA-232 high visibility",
                                        ["category"] = "Planes",
                                        ["type"] = "FA-18C_hornet",
                                        ["offsets"] = 
                                        {
                                            ["y"] = 32.600902021048,
                                            ["angle"] = 4.7822021504645,
                                            ["x"] = 21.841772596817,
                                        }, -- end of ["offsets"]
-- Copy and paste over this with the units information end

-- these can be left as is, but is required.
	["groupId"] = 1,		-- id's of the group/unit we're spawning (will auto increment if id taken?)
	["unitId"] = 1,
	["y"] = 0,			-- The initial location of the unit (required else unit will offset on origin of map)
	["x"] = 0,			
	["heading"] = 0,
	["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
	["linkOffset"] = true,
	["dead"] = false,
}
coalition.addStaticObject(country.id.USA, staticObj) -- makes the object

-- ********************************************************


local staticObj = {
	["name"] = "Example el1 Hornet 2", -- unit name (Name this something identifiable if you wish to remove it later)

-- Copy and paste over this with the units information
                                        ["livery_id"] = "vfa-37",
                                        ["category"] = "Planes",
                                        ["type"] = "FA-18C_hornet",
                                        ["offsets"] = 
                                        {
                                            ["y"] = 31.519700431731,
                                            ["angle"] = 1.6057029118348,
                                            ["x"] = 28.656618978013,
                                        }, -- end of ["offsets"]
-- Copy and paste over this with the units information end

-- these can be left as is, but is required.
	["groupId"] = 1,		-- id's of the group/unit we're spawning (will auto increment if id taken?)
	["unitId"] = 1,
	["y"] = 0,			-- The initial location of the unit (required else unit will offset on origin of map)
	["x"] = 0,			
	["heading"] = 0,
	["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
	["linkOffset"] = true,
	["dead"] = false,
}
coalition.addStaticObject(country.id.USA, staticObj) -- makes the object

-- ********************************************************


local staticObj = {
	["name"] = "Example el1 Tech 1", -- unit name (Name this something identifiable if you wish to remove it later)

-- Copy and paste over this with the units information
                                        ["livery_id"] = "yellow",
                                        ["category"] = "Personnel",
                                        ["shape_name"] = "carrier_tech_USA",
                                        ["type"] = "us carrier tech",
                                        ["offsets"] = 
                                        {
                                            ["y"] = 20.150701902225,
                                            ["angle"] = 1.6057029118348,
                                            ["x"] = 23.479956823227,
                                        }, -- end of ["offsets"]
-- Copy and paste over this with the units information end

-- these can be left as is, but is required.
	["groupId"] = 1,		-- id's of the group/unit we're spawning (will auto increment if id taken?)
	["unitId"] = 1,
	["y"] = 0,			-- The initial location of the unit (required else unit will offset on origin of map)
	["x"] = 0,			
	["heading"] = 0,
	["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
	["linkOffset"] = true,
	["dead"] = false,
}
coalition.addStaticObject(country.id.USA, staticObj) -- makes the object

-- ********************************************************




