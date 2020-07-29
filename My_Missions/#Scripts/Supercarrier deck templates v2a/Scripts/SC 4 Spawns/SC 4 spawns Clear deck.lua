-- Created by Redkite: https://www.youtube.com/user/RedKiteRender/

local staticObj = {

	["groupId"] = 400,		-- ids of the unit we're spawning (will auto increment if id taken)
	["unitId"] = 401,
	["rate"] = 30,
	["name"] = "4temp EL1 Hornet 1", -- unit name (Name this something identifiable if you wish to remove it later)

	["type"] = "FA-18C_hornet", 			-- unit, category and livery of unit to place.
	["category"] = "Planes",
	["livery_id"] = "VFA-37",

	["y"] = -274433.54379664,
	["heading"] = 37.55948550292,		-- The initial location of the unit (required else unit will offet on origin of map)
	["x"] = -90767.765053252,

	["offsets"] = {				-- The offsets that choose where on the deck it will spawn
		["y"] = 31.035356269975,
		["angle"] = 4.7123889803847,
		["x"] = 23.392320767991
	}, -- end of ["offsets"]
	["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
	["linkOffset"] = true,
	["dead"] = false,
}
coalition.addStaticObject(country.id.USA, staticObj)

-- ********************************************************



local staticObj = {

	["groupId"] = 401,		-- ids of the unit we're spawning (will auto increment if id taken)
	["unitId"] = 401,
	["rate"] = 30,
	["name"] = "4temp EL1 Hornet 2", -- unit name (Name this something identifiable if you wish to remove it later)

	["type"] = "FA-18C_hornet", 			-- unit, category and livery of unit to place.
	["category"] = "Planes",
	["livery_id"] = "VFA-37",

	["y"] = 274432.9647788,
	["heading"] =  4.7123889803847,		-- The initial location of the unit (required else unit will offet on origin of map)
	["x"] =  -90757.458535686,

	["offsets"] = {				-- The offsets that choose where on the deck it will spawn
		["y"] = 31.61437411001,
		["angle"] = 4.7123889803847,
		["x"] = 33.698838333992,
	}, -- end of ["offsets"]
	["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
	["linkOffset"] = true,
	["dead"] = false,
}
coalition.addStaticObject(country.id.USA, staticObj)

-- ********************************************************



local staticObj = {

	["groupId"] = 403,		-- ids of the unit we're spawning (will auto increment if id taken)
	["unitId"] = 403,
	["rate"] = 30,
	["name"] = "4temp EL2 S3", -- unit name (Name this something identifiable if you wish to remove it later)

	["type"] = "S-3B Tanker", 			-- unit, category and livery of unit to place.
	["category"] = "Planes",
	["livery_id"] = "usaf standard",
    
    ["offsets"] = {				-- The offsets that choose where on the deck it will spawn
		["y"] = 29.84889531997,
		["angle"] =  4.4505895925855,
		["x"] = -14.761768433003,
    }, -- end of ["offsets"]

	["y"] = -274434.73025759,	-- The initial location of the unit (required else unit will offet on origin of map)
	["x"] =  -90805.919142453,
	["heading"] =  4.4505895925855,	

	["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
	["linkOffset"] = true,
	["dead"] = false,
}
coalition.addStaticObject(country.id.USA, staticObj)

-- ********************************************************

local staticObj = {
    
-- Segment you need to change start  
	["groupId"] = 1,		-- id's of the unit we're spawning (will auto increment if id taken)
	["unitId"] = 1,
	["name"] = "4temp EL2 Hornet", -- unit name (Name this something identifiable if you wish to remove it later)
    
    
  
	["livery_id"] = "VFA-37",
	["category"] = "Planes",
	["offsets"] = {				-- The offsets that choose where on the deck it will spawn
		["y"] = 31.382766969968,
		["angle"] = 4.7123889803847,
		["x"] = -25.013570722003,
	}, -- end of ["offsets"]
	["type"] = "FA-18C_hornet", 			-- unit, category and livery of unit to place.
-- Segment you need to change end


	["x"] = -90816.170944742,			-- The initial location of the unit (required else unit will offet on origin of map)
	["y"] = -274433.19638594,
	["heading"] = 4.7123889803847,
	["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
	["linkOffset"] = true,
	["dead"] = false,
	["rate"] = 30,
}
coalition.addStaticObject(country.id.USA, staticObj)

-- ********************************************************


local staticObj = {

-- Segment you need to change start  

	["name"] = "4temp Finger Seahawk", -- unit name (Name this something identifiable if you wish to remove it later)


	["livery_id"] = "standard",
	["category"] = "Helicopters",
	["offsets"] = {				-- The offsets that choose where on the deck it will spawn
		["y"] = -25.023610410048,
		["angle"] = 1.7976891295542,
		["x"] = -120.511512843,
	}, -- end of ["offsets"]
	["type"] = "SH-60B",			-- unit, category and livery of unit to place.
-- Segment you need to change end

-- these can be left as is, but are required.
	["groupId"] = 33,		-- id's of the unit we're spawning (will auto increment if id taken)
	["unitId"] = 33,
	["y"] = -00127900,			-- The initial location of the unit (required else unit will offet on origin of map)
	["x"] = -00126557,			
	["heading"] = 37.55948550292,
	["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
	["linkOffset"] = true,
	["dead"] = false,
	["rate"] = 30,
}
coalition.addStaticObject(country.id.USA, staticObj)

-- ********************************************************


local staticObj = {

-- Segment you need to change start  

	["name"] = "4temp Corral Crane", -- unit name (Name this something identifiable if you wish to remove it later)


	["category"] = "ADEquipment",
	["offsets"] = {				-- The offsets that choose where on the deck it will spawn
		["y"] = 33.351427629997,
		["angle"] = 4.6600291028249,
		["x"] = -0.92642854900623,
	}, -- end of ["offsets"]
	["type"] = "AS32-36A",			-- unit, category and livery of unit to place.
-- Segment you need to change end

-- these can be left as is, but are required.
	["groupId"] = 33,		-- id's of the unit we're spawning (will auto increment if id taken)
	["unitId"] = 33,
	["y"] = -00127900,			-- The initial location of the unit (required else unit will offet on origin of map)
	["x"] = -00126557,			
	["heading"] = 37.55948550292,
	["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
	["linkOffset"] = true,
	["dead"] = false,
	["rate"] = 30,
}
coalition.addStaticObject(country.id.USA, staticObj)

-- ********************************************************

local staticObj = {

-- Segment you need to change start  

	["name"] = "4temp Point Firetruck", -- unit name (Name this something identifiable if you wish to remove it later)


	["category"] = "ADEquipment",
	["offsets"] = {				-- The offsets that choose where on the deck it will spawn
                                            ["y"] = 32.424999079958,
                                            ["angle"] = 5.4279739737024,
                                            ["x"] = 72.724640796994,
	}, -- end of ["offsets"]
	["type"] = "AS32-p25",			-- unit, category and livery of unit to place.
-- Segment you need to change end

-- these can be left as is, but are required.
	["groupId"] = 33,		-- id's of the unit we're spawning (will auto increment if id taken)
	["unitId"] = 33,
	["y"] = -00127900,			-- The initial location of the unit (required else unit will offet on origin of map)
	["x"] = -00126557,			
	["heading"] = 37.55948550292,
	["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
	["linkOffset"] = true,
	["dead"] = false,
	["rate"] = 30,
}
coalition.addStaticObject(country.id.USA, staticObj)

-- ********************************************************

local staticObj = {
    
-- Segment you need to change start  

	["name"] = "4temp Junk Yard Tug", -- unit name (Name this something identifiable if you wish to remove it later)


	["category"] = "ADEquipment",
	["offsets"] = {				-- The offsets that choose where on the deck it will spawn
                                            ["y"] = 30.242116749985,
                                            ["angle"] = 2.4958208303519,
                                            ["x"] = -79.610005513998,
	}, -- end of ["offsets"]
	["type"] = "AS32-31A",			-- unit, category and livery of unit to place.
-- Segment you need to change end

-- these can be left as is, but are required.
	["groupId"] = 33,		-- id's of the unit we're spawning (will auto increment if id taken)
	["unitId"] = 33,
	["y"] = -00127900,			-- The initial location of the unit (required else unit will offet on origin of map)
	["x"] = -00126557,			
	["heading"] = 37.55948550292,
	["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
	["linkOffset"] = true,
	["dead"] = false,
	["rate"] = 30,
}
coalition.addStaticObject(country.id.USA, staticObj)


-- ********************************************************

local staticObj = {
-- Segment you need to change start  

	["name"] = "4temp EL4 Tomcat 1", -- unit name (Name this something identifiable if you wish to remove it later)

                                        ["livery_id"] = "VF-102 Diamondbacks",
                                        ["category"] = "Planes",
                                        ["offsets"] = 
                                        {
                                            ["y"] = -32.180430089997,
                                            ["angle"] = 1.9373154697137,
                                            ["x"] = -98.393250321998,
                                        }, -- end of ["offsets"]
                                        ["type"] = "F-14B",
-- Segment you need to change end

-- these can be left as is, but are required.
--	["groupId"] = 33,		-- id's of the unit we're spawning (will auto increment if id taken?)
	["unitId"] = 33,
	["y"] = -00127900,			-- The initial location of the unit (required else unit will offet on origin of map)
	["x"] = -00126557,			
	["heading"] = 37.55948550292,
	["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
	["linkOffset"] = true,
	["dead"] = false,
	["rate"] = 30,
}
coalition.addStaticObject(country.id.USA, staticObj)

-- ********************************************************


local staticObj = {

	["name"] = "4temp EL4 Tomcat 2", -- unit name (Name this something identifiable if you wish to remove it later)
-- Copy and paste over this with the units information
                                    ["livery_id"] = "VF-102 Diamondbacks 102",
                                        ["category"] = "Planes",
                                        ["offsets"] = 
                                        {
                                            ["y"] = -32.924847350048,
                                            ["angle"] = 1.7627825445143,
                                            ["x"] = -110.574623714,
                                        }, -- end of ["offsets"]
                                        ["type"] = "F-14B",
-- Copy and paste over this with the units information end

-- these can be left as is, but is required.
	["groupId"] = 33,		-- id's of the unit we're spawning (will auto increment if id taken?)
	["unitId"] = 33,
	["y"] = -00127900,			-- The initial location of the unit (required else unit will offet on origin of map)
	["x"] = -00126557,			
	["heading"] = 37.55948550292,
	["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
	["linkOffset"] = true,
	["dead"] = false,
	["rate"] = 30,
}
coalition.addStaticObject(country.id.USA, staticObj)

-- ********************************************************

local staticObj = {

	["name"] = "4temp Corral E2", -- unit name (Name this something identifiable if you wish to remove it later)
-- Copy and paste over this with the units information
                                       ["livery_id"] = "E-2D Demo",
                                        ["category"] = "Planes",
                                        ["offsets"] = 
                                        {
                                            ["y"] = 30.665721859958,
                                            ["angle"] = 4.6949356878647,
                                            ["x"] = 8.8025239199924,
                                        }, -- end of ["offsets"]
                                        ["type"] = "E-2C",
-- Copy and paste over this with the units information end

-- these can be left as is, but is required.
	["groupId"] = 33,		-- id's of the unit we're spawning (will auto increment if id taken?)
	["unitId"] = 33,
	["y"] = -00127900,			-- The initial location of the unit (required else unit will offet on origin of map)
	["x"] = -00126557,			
	["heading"] = 37.55948550292,
	["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
	["linkOffset"] = true,
	["dead"] = false,
	["rate"] = 30,
}
coalition.addStaticObject(country.id.USA, staticObj)

-- ********************************************************

local staticObj = {

	["name"] = "4temp Point Hornet", -- unit name (Name this something identifiable if you wish to remove it later)
-- Copy and paste over this with the units information
                                        ["livery_id"] = "VFA-37",
                                        ["category"] = "Planes",
                                        ["type"] = "FA-18C_hornet",
                                        ["offsets"] = 
                                        {
                                            ["y"] = 34.190822379955,
                                            ["angle"] = 3.3335788713092,
                                            ["x"] = 61.561528349994,
                                        }, -- end of ["offsets"]
-- Copy and paste over this with the units information end

-- these can be left as is, but is required.
	["groupId"] = 33,		-- id's of the unit we're spawning (will auto increment if id taken?)
	["unitId"] = 33,
	["y"] = -00127900,			-- The initial location of the unit (required else unit will offet on origin of map)
	["x"] = -00126557,			
	["heading"] = 37.55948550292,
	["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
	["linkOffset"] = true,
	["dead"] = false,
	["rate"] = 30,
}
coalition.addStaticObject(country.id.USA, staticObj)

-- ********************************************************


local staticObj = {

	["name"] = "4temp LSO Station 3", -- unit name (Name this something identifiable if you wish to remove it later)
-- Copy and paste over this with the units information
                                        ["category"] = "Personnel",
                                        ["offsets"] = 
                                        {
                                            ["y"] = -22.370473980031,
                                            ["angle"] = 2.4434609527921,
                                            ["x"] = -130.61201797701,
                                        }, -- end of ["offsets"]
                                        ["shape_name"] = "carrier_lso_usa",
                                        ["type"] = "Carrier LSO Personell",
-- Copy and paste over this with the units information end

-- these can be left as is, but is required.
	["groupId"] = 33,		-- id's of the unit we're spawning (will auto increment if id taken?)
	["unitId"] = 33,
	["y"] = -00127900,			-- The initial location of the unit (required else unit will offet on origin of map)
	["x"] = -00126557,			
	["heading"] = 37.55948550292,
	["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
	["linkOffset"] = true,
	["dead"] = false,
	["rate"] = 30,
}
coalition.addStaticObject(country.id.USA, staticObj)

-- ********************************************************



local staticObj = {

	["name"] = "4temp LSO Station 1", -- unit name (Name this something identifiable if you wish to remove it later)
-- Copy and paste over this with the units information
                                        ["category"] = "Personnel",
                                        ["offsets"] = 
                                        {
                                            ["y"] = -21.789118479996,
                                            ["angle"] = 4.2935099599061,
                                            ["x"] = -129.42353100701,
                                        }, -- end of ["offsets"]
                                        ["shape_name"] = "carrier_lso1_usa",
                                        ["type"] = "Carrier LSO Personell 1",
-- Copy and paste over this with the units information end

-- these can be left as is, but is required.
	["groupId"] = 33,		-- id's of the unit we're spawning (will auto increment if id taken?)
	["unitId"] = 33,
	["y"] = -00127900,			-- The initial location of the unit (required else unit will offet on origin of map)
	["x"] = -00126557,			
	["heading"] = 37.55948550292,
	["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
	["linkOffset"] = true,
	["dead"] = false,
	["rate"] = 30,
}
coalition.addStaticObject(country.id.USA, staticObj)

-- ********************************************************


local staticObj = {

	["name"] = "4temp LSO Station 2", -- unit name (Name this something identifiable if you wish to remove it later)
-- Copy and paste over this with the units information
                                       ["livery_id"] = "white",
                                        ["category"] = "Personnel",
                                        ["offsets"] = 
                                        {
                                            ["y"] = -22.656188270019,
                                            ["angle"] = 1.850049007114,
                                            ["x"] = -129.497732263,
                                        }, -- end of ["offsets"]
                                        ["shape_name"] = "carrier_tech_USA",
                                        ["type"] = "us carrier tech",
                                        ["unitId"] = 17,
-- Copy and paste over this with the units information end

-- these can be left as is, but is required.
	["groupId"] = 33,		-- id's of the unit we're spawning (will auto increment if id taken?)
	["unitId"] = 33,
	["y"] = -00127900,			-- The initial location of the unit (required else unit will offet on origin of map)
	["x"] = -00126557,			
	["heading"] = 37.55948550292,
	["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
	["linkOffset"] = true,
	["dead"] = false,
	["rate"] = 30,
}
coalition.addStaticObject(country.id.USA, staticObj)

-- ********************************************************

local staticObj = {

	["name"] = "4temp Point Tech 3", -- unit name (Name this something identifiable if you wish to remove it later)
-- Copy and paste over this with the units information
                                        ["livery_id"] = "white",
                                        ["category"] = "Personnel",
                                        ["offsets"] = 
                                        {
                                            ["y"] = 31.799837369996,
                                            ["angle"] = 1.850049007114,
                                            ["x"] = 58.869844022993,
                                        }, -- end of ["offsets"]
                                        ["shape_name"] = "carrier_tech_USA",
                                        ["type"] = "us carrier tech",
-- Copy and paste over this with the units information end

-- these can be left as is, but is required.
	["groupId"] = 33,		-- id's of the unit we're spawning (will auto increment if id taken?)
	["unitId"] = 33,
	["y"] = -00127900,			-- The initial location of the unit (required else unit will offet on origin of map)
	["x"] = -00126557,			
	["heading"] = 37.55948550292,
	["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
	["linkOffset"] = true,
	["dead"] = false,
	["rate"] = 30,
}
coalition.addStaticObject(country.id.USA, staticObj)
-- ********************************************************
local staticObj = {

	["name"] = "4temp Point Tech 2", -- unit name (Name this something identifiable if you wish to remove it later)
-- Copy and paste over this with the units information
                                        ["livery_id"] = "purple",
                                        ["category"] = "Personnel",
                                        ["offsets"] = 
                                        {
                                            ["y"] = 36.657607259986,
                                            ["angle"] = 5.9341194567807,
                                            ["x"] = 60.15744568099,
                                        }, -- end of ["offsets"]
                                        ["shape_name"] = "carrier_tech_USA",
                                        ["type"] = "us carrier tech",
-- Copy and paste over this with the units information end

-- these can be left as is, but is required.
	["groupId"] = 33,		-- id's of the unit we're spawning (will auto increment if id taken?)
	["unitId"] = 33,
	["y"] = -00127900,			-- The initial location of the unit (required else unit will offet on origin of map)
	["x"] = -00126557,			
	["heading"] = 37.55948550292,
	["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
	["linkOffset"] = true,
	["dead"] = false,
	["rate"] = 30,
}
coalition.addStaticObject(country.id.USA, staticObj)
-- ********************************************************
local staticObj = {

	["name"] = "4temp Point Tech 1", -- unit name (Name this something identifiable if you wish to remove it later)
-- Copy and paste over this with the units information
                                        ["livery_id"] = "purple",
                                        ["category"] = "Personnel",
                                        ["offsets"] = 
                                        {
                                            ["y"] = 32.502165549959,
                                            ["angle"] = 2.460914245312,
                                            ["x"] = 67.356309497001,
                                        }, -- end of ["offsets"]
                                        ["shape_name"] = "carrier_tech_USA",
                                        ["type"] = "us carrier tech",
-- Copy and paste over this with the units information end

-- these can be left as is, but is required.
	["groupId"] = 33,		-- id's of the unit we're spawning (will auto increment if id taken?)
	["unitId"] = 33,
	["y"] = -00127900,			-- The initial location of the unit (required else unit will offet on origin of map)
	["x"] = -00126557,			
	["heading"] = 37.55948550292,
	["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
	["linkOffset"] = true,
	["dead"] = false,
	["rate"] = 30,
}
coalition.addStaticObject(country.id.USA, staticObj)
-- ********************************************************
local staticObj = {

	["name"] = "4temp Corral Tech 1", -- unit name (Name this something identifiable if you wish to remove it later)
-- Copy and paste over this with the units information
                                        ["livery_id"] = "yellow",
                                        ["category"] = "Personnel",
                                        ["offsets"] = 
                                        {
                                            ["y"] = 25.203805239988,
                                            ["angle"] = 4.7472955654246,
                                            ["x"] = 15.325497041995,
                                        }, -- end of ["offsets"]
                                        ["shape_name"] = "carrier_tech_USA",
                                        ["type"] = "us carrier tech",
-- Copy and paste over this with the units information end

-- these can be left as is, but is required.
	["groupId"] = 33,		-- id's of the unit we're spawning (will auto increment if id taken?)
	["unitId"] = 33,
	["y"] = -00127900,			-- The initial location of the unit (required else unit will offet on origin of map)
	["x"] = -00126557,			
	["heading"] = 37.55948550292,
	["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
	["linkOffset"] = true,
	["dead"] = false,
	["rate"] = 30,
}
coalition.addStaticObject(country.id.USA, staticObj)
-- ********************************************************
local staticObj = {

	["name"] = "4temp Corral Tech 2", -- unit name (Name this something identifiable if you wish to remove it later)
-- Copy and paste over this with the units information
                                        ["livery_id"] = "yellow",
                                        ["category"] = "Personnel",
                                        ["offsets"] = 
                                        {
                                            ["y"] = 24.753144659975,
                                            ["angle"] = 5.218534463463,
                                            ["x"] = 13.844755134996,
                                        }, -- end of ["offsets"]
                                        ["shape_name"] = "carrier_tech_USA",
                                        ["type"] = "us carrier tech",
-- Copy and paste over this with the units information end

-- these can be left as is, but is required.
	["groupId"] = 33,		-- id's of the unit we're spawning (will auto increment if id taken?)
	["unitId"] = 33,
	["y"] = -00127900,			-- The initial location of the unit (required else unit will offet on origin of map)
	["x"] = -00126557,			
	["heading"] = 37.55948550292,
	["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
	["linkOffset"] = true,
	["dead"] = false,
	["rate"] = 30,
}
coalition.addStaticObject(country.id.USA, staticObj)
-- ********************************************************
local staticObj = {

	["name"] = "4temp Junk Yard Seaman", -- unit name (Name this something identifiable if you wish to remove it later)
-- Copy and paste over this with the units information
                                        ["category"] = "Personnel",
                                        ["offsets"] = 
                                        {
                                            ["y"] = 31.255831669958,
                                            ["angle"] = 4.7472955654246,
                                            ["x"] = -78.473079361007,
                                        }, -- end of ["offsets"]
                                        ["shape_name"] = "carrier_seaman_USA",
                                        ["type"] = "Carrier Seaman",
-- Copy and paste over this with the units information end

-- these can be left as is, but is required.
	["groupId"] = 33,		-- id's of the unit we're spawning (will auto increment if id taken?)
	["unitId"] = 33,
	["y"] = -00127900,			-- The initial location of the unit (required else unit will offet on origin of map)
	["x"] = -00126557,			
	["heading"] = 37.55948550292,
	["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
	["linkOffset"] = true,
	["dead"] = false,
	["rate"] = 30,
}
coalition.addStaticObject(country.id.USA, staticObj)
-- ********************************************************
local staticObj = {

	["name"] = "4temp EL2 Tug", -- unit name (Name this something identifiable if you wish to remove it later)
-- Copy and paste over this with the units information
                                        ["category"] = "ADEquipment",
                                        ["offsets"] = 
                                        {
                                            ["y"] = 25.035044669989,
                                            ["angle"] = 2.4958208303519,
                                            ["x"] = -22.810439552006,
                                        }, -- end of ["offsets"]
                                        ["type"] = "AS32-31A",
-- Copy and paste over this with the units information end

-- these can be left as is, but is required.
	["groupId"] = 33,		-- id's of the unit we're spawning (will auto increment if id taken?)
	["unitId"] = 33,
	["y"] = -00127900,			-- The initial location of the unit (required else unit will offet on origin of map)
	["x"] = -00126557,			
	["heading"] = 37.55948550292,
	["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
	["linkOffset"] = true,
	["dead"] = false,
	["rate"] = 30,
}
coalition.addStaticObject(country.id.USA, staticObj)
-- ********************************************************