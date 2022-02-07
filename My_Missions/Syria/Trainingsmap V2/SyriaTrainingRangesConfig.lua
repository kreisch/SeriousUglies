local MinakhWeaponsRangeUnitsTrucks1 = SPAWN:New("Mi_Trucks-1"):InitRandomizePosition(true,10,40)
local MinakhWeaponsRangeUnitsTrucks2 = SPAWN:New("Mi_Trucks-2"):InitRandomizePosition(true,10,40)
local MinakhWeaponsRangeUnitsBTRs = SPAWN:New("Mi_BTRs-1"):InitRandomizePosition(true,10,40)
local MinakhWeaponsRangeUnitsAAA = SPAWN:New("Mi_AAA-1"):InitRandomizePosition(true,10,40)
local MinakhWeaponsRangeUnitsDerby = SPAWN:New("Mi_SAM-1"):InitRandomizePosition(true,10,40)

local MinakhWeaponsRange = -1

local YB34Range = -1


local BT36WeaponsRangeUnitsEasy1 = SPAWN:New("BT36_Easy-1"):InitRandomizePosition(true,10,40)
local BT36WeaponsRangeUnitsEasy2 = SPAWN:New("BT36_Easy-2"):InitRandomizePosition(true,10,40)
local BT36WeaponsRangeUnitsMedium = SPAWN:New("BT36_Medium-1"):InitRandomizePosition(true,10,40)

local BT36WeaponsRange = -1


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

local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Scud Convoy: Start", MenuCoalitionBlueMissionSetupA2GScudConvoy, ScudConvoyStart, 1)
local MenuAdd = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Scud Convoy: End", MenuCoalitionBlueMissionSetupA2GScudConvoy, ScudConvoyEnd)
