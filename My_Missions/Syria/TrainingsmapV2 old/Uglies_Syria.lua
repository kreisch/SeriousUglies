local MinakhWeaponsRangeUnitsTrucks1 = SPAWN:New("Mi_Trucks-1"):InitRandomizePosition(true,10,40)
local MinakhWeaponsRangeUnitsTrucks2 = SPAWN:New("Mi_Trucks-2"):InitRandomizePosition(true,10,40)
local MinakhWeaponsRangeUnitsBTRs = SPAWN:New("Mi_BTRs-1"):InitRandomizePosition(true,10,40)
local MinakhWeaponsRangeUnitsAAA = SPAWN:New("Mi_AAA-1"):InitRandomizePosition(true,10,40)
local MinakhWeaponsRangeUnitsDerby = SPAWN:New("Mi_SAM-1"):InitRandomizePosition(true,10,40)

local MinakhWeaponsRange = -1


--local YB34RangeUnitsTrucks = SPAWN:New("YB34_Trucks-1"):InitRandomizePosition(true,10,40)
--local YB34RangeUnitsBMPs = SPAWN:New("YB34_BMPs-1"):InitRandomizePosition(true,10,40)
--local YB34RangeUnitsAAAs = SPAWN:New("YB34_AAA-1"):InitRandomizePosition(true,10,40)
--local YB34RangeUnitsSAMs = SPAWN:New("YB34_SAMs-1"):InitRandomizePosition(true,10,40)

local YB34Range = -1


local BT36WeaponsRangeUnitsEasy1 = SPAWN:New("BT36_Easy-1"):InitRandomizePosition(true,10,40)
local BT36WeaponsRangeUnitsEasy2 = SPAWN:New("BT36_Easy-2"):InitRandomizePosition(true,10,40)
local BT36WeaponsRangeUnitsMedium = SPAWN:New("BT36_Medium-1"):InitRandomizePosition(true,10,40)

local BT36WeaponsRange = -1



--local AlZabadaniUrbanHellUnitsEasy1 = SPAWN:New("UH_easy-1"):InitRandomizePosition(true,10,40)
--local AlZabadaniUrbanHellUnitsEasy2 = SPAWN:New("UH_easy-2"):InitRandomizePosition(true,10,40)
--local AlZabadaniUrbanHellUnitsEasy3 = SPAWN:New("UH_easy-3"):InitRandomizePosition(true,10,40)
--local AlZabadaniUrbanHellUnitsEasy4 = SPAWN:New("UH_easy-4"):InitRandomizePosition(true,10,40)
--local AlZabadaniUrbanHellUnitsEasy5 = SPAWN:New("UH_easy-5"):InitRandomizePosition(true,10,40)
--local AlZabadaniUrbanHellUnitsEasy6 = SPAWN:New("UH_easy-6"):InitRandomizePosition(true,10,40)
--local AlZabadaniUrbanHellUnitsEasy7 = SPAWN:New("UH_easy-7"):InitRandomizePosition(true,10,40)
--local AlZabadaniUrbanHellUnitsEasy8 = SPAWN:New("UH_easy-8"):InitRandomizePosition(true,10,40)
--local AlZabadaniUrbanHellUnitsEasy9 = SPAWN:New("UH_easy-9"):InitRandomizePosition(true,10,40)
--local AlZabadaniUrbanHellUnitsEasy10 = SPAWN:New("UH_easy-10"):InitRandomizePosition(true,10,40)
--local AlZabadaniUrbanHellUnitsEasy11 = SPAWN:New("UH_easy-11"):InitRandomizePosition(true,10,40)
--local AlZabadaniUrbanHellUnitsEasy12 = SPAWN:New("UH_easy-12"):InitRandomizePosition(true,10,40)
--local AlZabadaniUrbanHellUnitsEasy13 = SPAWN:New("UH_easy-13"):InitRandomizePosition(true,10,40)
--local AlZabadaniUrbanHellUnitsEasy14 = SPAWN:New("UH_easy-14"):InitRandomizePosition(true,10,40)
--local AlZabadaniUrbanHellUnitsEasy15 = SPAWN:New("UH_easy-15"):InitRandomizePosition(true,10,40)
--local AlZabadaniUrbanHellUnitsEasy16 = SPAWN:New("UH_easy-16"):InitRandomizePosition(true,10,40)
--local AlZabadaniUrbanHellUnitsEasy17 = SPAWN:New("UH_easy-17"):InitRandomizePosition(true,10,40)
--local AlZabadaniUrbanHellUnitsEasy18 = SPAWN:New("UH_easy-18"):InitRandomizePosition(true,10,40)
--local AlZabadaniUrbanHellUnitsEasy19 = SPAWN:New("UH_easy-19"):InitRandomizePosition(true,10,40)
--local AlZabadaniUrbanHellUnitsEasy20 = SPAWN:New("UH_easy-20"):InitRandomizePosition(true,10,40)
--local AlZabadaniUrbanHellUnitsEasy21 = SPAWN:New("UH_easy-21"):InitRandomizePosition(true,10,40)
--local AlZabadaniUrbanHellUnitsEasy22 = SPAWN:New("UH_easy-22"):InitRandomizePosition(true,10,40)
--local AlZabadaniUrbanHellUnitsMedium1 = SPAWN:New("UH_medium-1"):InitRandomizePosition(true,10,40)
--local AlZabadaniUrbanHellUnitsMedium2 = SPAWN:New("UH_medium-2"):InitRandomizePosition(true,10,40)
--local AlZabadaniUrbanHellUnitsMedium3 = SPAWN:New("UH_medium-3"):InitRandomizePosition(true,10,40)
--local AlZabadaniUrbanHellUnitsMedium4 = SPAWN:New("UH_medium-4"):InitRandomizePosition(true,10,40)
--local AlZabadaniUrbanHellUnitsMedium5 = SPAWN:New("UH_medium-5"):InitRandomizePosition(true,10,40)

local UrbanHell = -1




--local ZahleConvoyUnits = SPAWN:New("ZA_Convoy-1")
--local ZahleConvoyUnitsEasy = SPAWN:New("ZA_Convoy-2")


local function MinakhWeaponsRangeStart(difficult)
	MinakhWeaponsRange = difficult
		if difficult >= 1 then
			MinakhWeaponsRangeUnitsTrucks1:ReSpawn()
			MinakhWeaponsRangeUnitsTrucks2:ReSpawn()
		end
		if difficult >= 2 then
			MinakhWeaponsRangeUnitsBTRs:ReSpawn()
		end
		if difficult >= 3 then
			MinakhWeaponsRangeUnitsAAA:ReSpawn()
		end
		if difficult >= 4 then
			MinakhWeaponsRangeUnitsDerby:ReSpawn()
		end
		MessageToAll("Minakh Weaponsrange is now active!",60,"Minakh Range activated")
end

local function MinakhWeaponsRangeEnd()
	if MinakhWeaponsRange >= 1 then
		MinakhWeaponsRangeUnitsTrucks1:GetLastAliveGroup():Destroy()
		MinakhWeaponsRangeUnitsTrucks2:GetLastAliveGroup():Destroy()
    end
	if MinakhWeaponsRange >= 2 then
		MinakhWeaponsRangeUnitsBTRs:GetLastAliveGroup():Destroy()
	end
	if MinakhWeaponsRange >= 3 then
		MinakhWeaponsRangeUnitsAAA:GetLastAliveGroup():Destroy()
	end
	if MinakhWeaponsRange >= 4 then
		MinakhWeaponsRangeUnitsDerby:GetLastAliveGroup():Destroy()
	end
	MessageToAll("Minakh Weaponsrange de-spawned!",10,"Minakh Weaponsrange de-activated")
	MinakhWeaponsRange = -1
end

local function YB34RangeStart(difficult)
	YB34Range = difficult
		if difficult >= 1 then
			YB34RangeUnitsTrucks:ReSpawn()
		end
		if difficult >= 2 then
			YB34RangeUnitsBMPs:ReSpawn()
			YB34RangeUnitsAAAs:ReSpawn()
		end
		if difficult >= 3 then
			YB34RangeUnitsSAMs:ReSpawn()
		end
		MessageToAll ("YB34 Weaponsrange is now active!",60,"YB34 Range activated")
end

local function YB34RangeEnd()
	if YB34Range >=1 then
		YB34RangeUnitsTrucks:GetLastAliveGroup():Destroy()
	end
	if YB34Range >=2 then
		YB34RangeUnitsBMPs:GetLastAliveGroup():Destroy()
		YB34RangeUnitsAAAs:GetLastAliveGroup():Destroy()
	end
	if YB34Range >=3 then
		YB34RangeUnitsSAMs:GetLastAliveGroup():Destroy()
	end
	MessageToAll("YB34 Range de-spawned",60,"YB34 Range de-activated")
	YB34Range = -1
end		

local function BT36WeaponsRangeStart(difficult)
	BT36WeaponsRange = difficult
		if difficult >= 1 then
			BT36WeaponsRangeUnitsEasy1:ReSpawn()
			BT36WeaponsRangeUnitsEasy2:ReSpawn()
		end
		if difficult >= 2 then
			BT36WeaponsRangeUnitsMedium:ReSpawn()
		end
		MessageToAll("BT36 Weaponsrange is now active!",60,"BT36 Range activated")
end

local function BT36WeaponsRangeEnd()
	if BT36WeaponsRange >=1 then
		BT36WeaponsRangeUnitsEasy1:GetLastAliveGroup():Destroy()
		BT36WeaponsRangeUnitsEasy2:GetLastAliveGroup():Destroy()
	end
	if BT36WeaponsRange >=2 then
		BT36WeaponsRangeUnitsMedium:GetLastAliveGroup():Destroy()
	end
	MessageToAll("BT36 Weaponsrange de-spawned",10,"BT36 Weaponsrange de-activated")
	BT36WeaponsRange = -1
end

local function UrbanHellStart(difficult)
	UrbanHell = difficult
		if difficult >= 1 then
			AlZabadaniUrbanHellUnitsEasy1:ReSpawn()
			AlZabadaniUrbanHellUnitsEasy2:ReSpawn()
			AlZabadaniUrbanHellUnitsEasy3:ReSpawn()
			AlZabadaniUrbanHellUnitsEasy4:ReSpawn()
			AlZabadaniUrbanHellUnitsEasy5:ReSpawn()
			AlZabadaniUrbanHellUnitsEasy6:ReSpawn()
			AlZabadaniUrbanHellUnitsEasy7:ReSpawn()
			AlZabadaniUrbanHellUnitsEasy8:ReSpawn()
			AlZabadaniUrbanHellUnitsEasy9:ReSpawn()
			AlZabadaniUrbanHellUnitsEasy10:ReSpawn()
			AlZabadaniUrbanHellUnitsEasy11:ReSpawn()
			AlZabadaniUrbanHellUnitsEasy12:ReSpawn()
			AlZabadaniUrbanHellUnitsEasy13:ReSpawn()
			AlZabadaniUrbanHellUnitsEasy14:ReSpawn()
			AlZabadaniUrbanHellUnitsEasy15:ReSpawn()
			AlZabadaniUrbanHellUnitsEasy16:ReSpawn()
			AlZabadaniUrbanHellUnitsEasy17:ReSpawn()
			AlZabadaniUrbanHellUnitsEasy18:ReSpawn()
			AlZabadaniUrbanHellUnitsEasy19:ReSpawn()
			AlZabadaniUrbanHellUnitsEasy20:ReSpawn()
			AlZabadaniUrbanHellUnitsEasy21:ReSpawn()
			AlZabadaniUrbanHellUnitsEasy22:ReSpawn()
		end
		if difficult >=2 then
			AlZabadaniUrbanHellUnitsMedium1:ReSpawn()
			AlZabadaniUrbanHellUnitsMedium2:ReSpawn()
			AlZabadaniUrbanHellUnitsMedium3:ReSpawn()
			AlZabadaniUrbanHellUnitsMedium4:ReSpawn()
			AlZabadaniUrbanHellUnitsMedium5:ReSpawn()
		end
		MessageToAll("Al Zabadani: Urban Hell started",60,"Urban Hell active")
end

local function UrbanHellEnd()
	if UrbanHell >= 1 then
		AlZabadaniUrbanHellUnitsEasy1:GetLastAliveGroup():Destroy()
		AlZabadaniUrbanHellUnitsEasy2:GetLastAliveGroup():Destroy()
		AlZabadaniUrbanHellUnitsEasy3:GetLastAliveGroup():Destroy()
		AlZabadaniUrbanHellUnitsEasy4:GetLastAliveGroup():Destroy()
		AlZabadaniUrbanHellUnitsEasy5:GetLastAliveGroup():Destroy()
		AlZabadaniUrbanHellUnitsEasy6:GetLastAliveGroup():Destroy()
		AlZabadaniUrbanHellUnitsEasy7:GetLastAliveGroup():Destroy()
		AlZabadaniUrbanHellUnitsEasy8:GetLastAliveGroup():Destroy()
		AlZabadaniUrbanHellUnitsEasy9:GetLastAliveGroup():Destroy()
		AlZabadaniUrbanHellUnitsEasy10:GetLastAliveGroup():Destroy()
		AlZabadaniUrbanHellUnitsEasy11:GetLastAliveGroup():Destroy()
		AlZabadaniUrbanHellUnitsEasy12:GetLastAliveGroup():Destroy()
		AlZabadaniUrbanHellUnitsEasy13:GetLastAliveGroup():Destroy()
		AlZabadaniUrbanHellUnitsEasy14:GetLastAliveGroup():Destroy()
		AlZabadaniUrbanHellUnitsEasy15:GetLastAliveGroup():Destroy()
		AlZabadaniUrbanHellUnitsEasy16:GetLastAliveGroup():Destroy()
		AlZabadaniUrbanHellUnitsEasy17:GetLastAliveGroup():Destroy()
		AlZabadaniUrbanHellUnitsEasy18:GetLastAliveGroup():Destroy()
		AlZabadaniUrbanHellUnitsEasy19:GetLastAliveGroup():Destroy()
		AlZabadaniUrbanHellUnitsEasy20:GetLastAliveGroup():Destroy()
		AlZabadaniUrbanHellUnitsEasy21:GetLastAliveGroup():Destroy()
		AlZabadaniUrbanHellUnitsEasy22:GetLastAliveGroup():Destroy()
	end
	if UrbanHell >=2 then
		AlZabadaniUrbanHellUnitsMedium1:GetLastAliveGroup():Destroy()
		AlZabadaniUrbanHellUnitsMedium2:GetLastAliveGroup():Destroy()
		AlZabadaniUrbanHellUnitsMedium3:GetLastAliveGroup():Destroy()
		AlZabadaniUrbanHellUnitsMedium4:GetLastAliveGroup():Destroy()
		AlZabadaniUrbanHellUnitsMedium5:GetLastAliveGroup():Destroy()
	end
	MessageToAll("Al Zabadani: Urban Hell de-activated",10,"Urban Hell de-activated")
	UrbanHell = -1
end

local function ScudConvoyStart(difficult)
	ScudConvoyDifficulty = difficult
		if difficult >= 1 then
			ScudConvoyEasy1:ReSpawn()
		end
		MessageToAll("Scud Convoy started - Happy hunting!",60,"Scud Convoy active")
end

local function ScudConvoyEnd()
	if ScudConvoyDifficulty >= 1 then
		ScudConvoyEasy1:GetLastAliveGroup():Destroy()
	end
	MessageToAll("Scud Convoy de-activated",10,"Scud Convoy de-activated")
	ScudConvoyEasy1 = -1
end

-- Menüstruktur
-- 1st Level!
MenuCoalitionBlueA2G = MENU_COALITION:New( coalition.side.BLUE, "Mission Setup A2G" )

-- 2nd Level!
local MenuCoalitionBlueA2GMissionSetupA2GFixedWing = MENU_COALITION:New( coalition.side.BLUE, "Fixed Wing Training Ranges", MenuCoalitionBlueA2G)
local MenuCoalitionBlueMissionSetupA2GHeliRange = MENU_COALITION:New( coalition.side.BLUE, "Helicopter Training Ranges", MenuCoalitionBlueA2G) 
local MenuCoalitionBlueMissionSetupA2GGeneralRange = MENU_COALITION:New( coalition.side.BLUE, "General Training Ranges", MenuCoalitionBlueA2G) 

-- 3rd Level!
local MenuCoalitionBlueMissionSetupA2GWeaponsRange = MENU_COALITION:New( coalition.side.BLUE, "Minakh Weapons Range (north)", MenuCoalitionBlueA2GMissionSetupA2GFixedWing)
local MenuCoalitionBlueA2GTrainingSouthernRange = MENU_COALITION:New( coalition.side.BLUE, "YB34 Weapons Range (south)", MenuCoalitionBlueA2GMissionSetupA2GFixedWing)
local MenuCoalitionBlueMissionSetupA2GBT36Range = MENU_COALITION:New( coalition.side.BLUE, "BT36 Range", MenuCoalitionBlueMissionSetupA2GHeliRange)
local MenuCoalitionBlueMissionSetupA2GUrbanHell = MENU_COALITION:New( coalition.side.BLUE, "Helicopter Mission: Urban Hell", MenuCoalitionBlueMissionSetupA2GHeliRange)
local MenuCoalitionBlueMissionSetupA2GScudConvoy = MENU_COALITION:New( coalition.side.BLUE, "General Mission: Convoy", MenuCoalitionBlueMissionSetupA2GGeneralRange)
--local MenuCoalitionBlueMissionSetupA2GZahleConvoy = MENU_COALITION:New( coalition.side.BLUE, "Helicopter Mission: Convoy Escort", MenuCoalitionBlueMissionSetupA2GHeliRange)
--local MenuCoalitionBlueMissionSetupA2GCombinedArmsGolan = MENU_COALITION:New( coalition.side.BLUE, "Combined Arms: Golan Heights", MenuCoalitionBlueMissionSetupA2GHeliRange)


-- Action Level!
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Minakh Range Easy: Start", MenuCoalitionBlueMissionSetupA2GWeaponsRange, MinakhWeaponsRangeStart, 1 )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Minakh Range Medium: Start", MenuCoalitionBlueMissionSetupA2GWeaponsRange, MinakhWeaponsRangeStart, 2 )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Minakh Range Hard: Start", MenuCoalitionBlueMissionSetupA2GWeaponsRange, MinakhWeaponsRangeStart, 3 )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Minakh Range Derby: Start", MenuCoalitionBlueMissionSetupA2GWeaponsRange, MinakhWeaponsRangeStart, 4 )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Minakh Range: End", MenuCoalitionBlueMissionSetupA2GWeaponsRange, MinakhWeaponsRangeEnd)
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "YB34 Range Easy: Start", MenuCoalitionBlueA2GTrainingSouthernRange, YB34RangeStart, 1)
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "YB34 Range Medium: Start", MenuCoalitionBlueA2GTrainingSouthernRange, YB34RangeStart, 2)
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "YB34 Range Hard: Start", MenuCoalitionBlueA2GTrainingSouthernRange, YB34RangeStart, 3)
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "YB34 Range: End", MenuCoalitionBlueA2GTrainingSouthernRange, YB34RangeEnd)
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Weaponsrange BT36: Easy", MenuCoalitionBlueMissionSetupA2GBT36Range, BT36WeaponsRangeStart, 1 )
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Weaponsrange BT36: Medium", MenuCoalitionBlueMissionSetupA2GBT36Range, BT36WeaponsRangeStart, 2)
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Weaponsrange BT36: End", MenuCoalitionBlueMissionSetupA2GBT36Range, BT36WeaponsRangeEnd)
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Al Zabadani Urban Hell: Easy", MenuCoalitionBlueMissionSetupA2GUrbanHell, UrbanHellStart, 1)
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Al Zabadani Urban Hell: Medium", MenuCoalitionBlueMissionSetupA2GUrbanHell, UrbanHellStart, 2)
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Al Zabadani Urban Hell: End", MenuCoalitionBlueMissionSetupA2GUrbanHell, UrbanHellEnd)

local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Scud Convoy: Start", MenuCoalitionBlueMissionSetupA2GScudConvoy, ScudConvoyStart, 1)
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Scud Convoy: End", MenuCoalitionBlueMissionSetupA2GScudConvoy, ScudConvoyEnd)
--local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Convoy Escort: Easy", MenuCoalitionBlueMissionSetupA2GZahleConvoy, ZahleConvoyStart, 1)
--local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Convoy Escort: Medium", MenuCoalitionBlueMissionSetupA2GZahleConvoy, ZahleConvoyStart, 2)
--local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Convoy Escort: End", MenuCoalitionBlueMissionSetupA2GZahleConvoy, ZahleConvoyEnd)
