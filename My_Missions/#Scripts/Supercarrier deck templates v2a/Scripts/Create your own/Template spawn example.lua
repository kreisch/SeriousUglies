-- Creats a UH-60 on the helipad of a Hazard perry.

local staticObj = {
	["name"] = "TemplateHeli", -- unit name (Name this something identifiable if you wish to remove it later)

-- Copy and paste over this with the units information
                                    ["livery_id"] = "US Army grey",
                                        ["category"] = "Helicopters",
                                        ["offsets"] = {
                                            ["y"] = -0.04261922975019,
                                            ["angle"] = 31.422595242879,
                                            ["x"] = -52.962714671613,
                                        }, -- end of ["offsets"]
                                        ["type"] = "UH-60A",
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