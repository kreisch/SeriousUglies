-- Contains the recovery tanker and barons respawn tanker config

env.info("Carrier: Loading configuration for Recovery Tanker")

-- S-3B Recovery Tanker spawning in air. Groupname
local tanker2=RECOVERYTANKER:New("USS George Washington", "RecoveryTanker")
--tanker:SetTakeoffAir()
tanker2:SetRadio(121)
tanker2:SetModex(912)
tanker2:SetTACAN(21, "SHL11")
tanker2:SetTakeoffCold()
tanker2:Start()

-- Rescue Helo with home base Lake Erie. Has to be a global object! Group name for helo
rescuehelo2=RESCUEHELO:New("USS Rafael Peralta", "RescueHelo")
rescuehelo2:SetHomeBase(AIRBASE:FindByName("USS Rafael Peralta"))
rescuehelo2:SetModex(41)
rescuehelo2:SetTakeoffAir()
rescuehelo2:__Start(1)

env.info("Carrier: Loaded configuration for Tanker")



local groupName = 'Texaco 1-1' -- Name of the group in the ME
local lowFuelThreshold = 0.08 -- RTB when less then this amount of fuel
local lowHealthThreshold = 0.75 -- RTB when less then this amount of health
barons_respawn_script.checkstate(groupName, lowFuelThreshold, lowHealthThreshold, true)


local groupName = 'Texaco 2-1' -- Name of the group in the ME
local lowFuelThreshold = 0.08 -- RTB when less then this amount of fuel
local lowHealthThreshold = 0.75 -- RTB when less then this amount of health
barons_respawn_script.checkstate(groupName, lowFuelThreshold, lowHealthThreshold, true)

local groupName = 'Arco 1-1' -- Name of the group in the ME
local lowFuelThreshold = 0.08 -- RTB when less then this amount of fuel
local lowHealthThreshold = 0.75 -- RTB when less then this amount of health
barons_respawn_script.checkstate(groupName, lowFuelThreshold, lowHealthThreshold, true)

local groupName = 'Arco 2-1' -- Name of the group in the ME
local lowFuelThreshold = 0.08 -- RTB when less then this amount of fuel
local lowHealthThreshold = 0.75 -- RTB when less then this amount of health
barons_respawn_script.checkstate(groupName, lowFuelThreshold, lowHealthThreshold, true)

local groupName = 'Arco 3-1' -- Name of the group in the ME
local lowFuelThreshold = 0.08 -- RTB when less then this amount of fuel
local lowHealthThreshold = 0.75 -- RTB when less then this amount of health
barons_respawn_script.checkstate(groupName, lowFuelThreshold, lowHealthThreshold, true)

local groupName = 'A-50 AWACS' -- Name of the group in the ME
local lowFuelThreshold = 0.08 -- RTB when less then this amount of fuel
local lowHealthThreshold = 0.75 -- RTB when less then this amount of health
barons_respawn_script.checkstate(groupName, lowFuelThreshold, lowHealthThreshold, true)

local groupName = 'Overlord 1-1' -- Name of the group in the ME
local lowFuelThreshold = 0.08 -- RTB when less then this amount of fuel
local lowHealthThreshold = 0.75 -- RTB when less then this amount of health
barons_respawn_script.checkstate(groupName, lowFuelThreshold, lowHealthThreshold, true)

local groupName = 'Darkstar 1-1' -- Name of the group in the ME
local lowFuelThreshold = 0.08 -- RTB when less then this amount of fuel
local lowHealthThreshold = 0.75 -- RTB when less then this amount of health
barons_respawn_script.checkstate(groupName, lowFuelThreshold, lowHealthThreshold, true)

local groupName = 'Texaco 5-1' -- Name of the group in the ME
local lowFuelThreshold = 0.08 -- RTB when less then this amount of fuel
local lowHealthThreshold = 0.75 -- RTB when less then this amount of health
barons_respawn_script.checkstate(groupName, lowFuelThreshold, lowHealthThreshold, true)




