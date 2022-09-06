function merge(tbls)
	local res = {}
	for i,v in ipairs(tbls) do
		for i2,v2 in ipairs(v) do
			table.insert(res,v2)
		end
	end
	
	return res
end

function allExcept(tbls, except)
	local tomerge = {}
	for i,v in pairs(tbls) do
		if i~=except then
			table.insert(tomerge, v)
		end
	end
	return merge(tomerge)
end



upgrades = {
	ships = {
		blue = {'blueShip','blueShip','blueShip'},
		red = {'redShipS','redShipS','redShipM','redShipM','redShipL','redShipL'}
	},
	ships2 = {
		blue = {'blueShip'},
		red = {'redShipS','redShipS','redShipM','redShipM','redShipXL'}
	},
	carrier = {
		blue = {'blueShip'},
		red = {'redShipS'}
	},
	airfield = {
		blue = {'blueInfantry','blueSHORAD', 'bluePD'},
		red = {'redInfantry','redSHORAD', 'redPD'}
	},
	airfield2 = {
		blue = {'blueInfantry','blueSHORAD', 'bluePD'},
		red = {'redInfantry','redSHORAD', 'redPD2'}
	},
	generic = {
		blue = {'blueInfantry', 'blueArmor', 'blueSHORAD'},
		red = {'redInfantry','redArmor', 'redSHORAD'}
	},
	merad = {
		blue = {'blueSHORAD', 'blueMERAD'},
		red = {'redSHORAD', 'redMERAD'}
	},
	lorad = {
		blue = {'blueSHORAD', 'blueMERAD', 'bluePD'},
		red = {'redSHORAD', 'redLORAD', 'redPD'}
	},
	sa5 = {
		blue = {'blueSHORAD', 'blueLORAD'},
		red = {'redSHORAD','redSA5'}
	},
	insAirfield = {
		blue = {'blueInfantry','blueSHORAD', 'bluePD'},
		red = {'insInfantry','insArmor', 'insSHORAD'}
	},
	insGeneric = {
		blue = {'blueInfantry','blueSHORAD'},
		red = {'insInfantry','insArmor','insInfantry','insArmor', 'insSHORAD'}
	},
	insMaximum = {
		blue = {'blueInfantry'},
		red = {'insInfantry','insArmor','insInfantry','insArmor', 'insSHORAD','insInfantry','insArmor', 'insSHORAD'}
	},
	insMinimum = {
		blue = {'blueInfantry','blueSHORAD'},
		red = {'insInfantry', 'insSHORAD'}
	},
	insSAM = {
		blue = {'blueSHORAD', 'blueMERAD', 'bluePD'},
		red = {'insSHORAD', 'insSHORAD', 'insSHORAD'}
	},
	ewr = {
		blue = {'blueInfantry'},
		red = {'redEWR','redSHORAD'}
	},
	milbase = {
		blue = {'blueInfantry', 'blueArmor'},
		red = {'redInfantry','redArmor', 'redSHORAD','redArmor','redArmor'}
	},
	bigSAM = {
		blue = {'blueAmmo', 'blueAmmo', 'blueAmmo', 'blueAmmo', 'blueAmmo', 'blueAmmo', 'blueLORAD'},
		red = {'redAmmo','redAmmo', 'redSA11'}
	},
	radarstrike = {
		blue = {'blueInfantry'},
		red = {'redRadar'}
	},
	insOutpost = {
		blue = {'blueInfantry'},
		red = {'insOutpost'}
	},
	insAmbush = {
		blue = {'blueInfantry'},
		red = {'insAmbush'}
	},
	minimal = {
		blue = {'blueInfantry'},
		red = {'redInfantry'}
	}
}

local filepath = 'Operation Elefant.lua'
if lfs then 
	local dir = lfs.writedir()..'Missions/Saves/'
	lfs.mkdir(dir)
	filepath = dir..filepath
	env.info('Operation Elefant - Save file path: '..filepath)
end

bc = BattleCommander:new(filepath, 10, 60)
bc:loadFromDisk() --will load and overwrite default zone levels, sides, funds and available shop items
bc:init()
bc:startRewardPlayerContribution(15,{infantry = 10, ground = 20, sam = 40, airplane = 50, ship = 250, helicopter=50, crate=200, rescue = 100})
bc:addFunds(2, 3)
