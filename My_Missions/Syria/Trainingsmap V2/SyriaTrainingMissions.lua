

local SamSiteKH = nil
local SamSiteTL = nil

-- Creating an object
local M03SMission = Mission:new("M03S")
M03SMission.MissionBriefing  = "Destroy the two SA-5 Sites at your designated areas!"
M03SMission.Zones_Set_Prefix = "M03S"
M03SMission.UnitTable_Easy   = {"Template_Red_AAATruck","Template_Red_KamazTruck", "Template_Red_3T55", "Template_Red_15Inf", "Template_Red_15Inf"}
M03SMission.NumberOfSpawns_Easy = 16
M03SMission.UnitTable_Medium = {"Template_Red_RPGTeam","Template_Red_Shilka", "Template_Red_ZSU57-2","Template_Red_SA-8OSA"}
M03SMission.NumberOfSpawns_Medium = 16
M03SMission.UnitTable_Hard   = {"Template_Red_SA-13Strela","Template_Red_SA-15Tor"}
M03SMission.NumberOfSpawns_Hard = 7

M03SMission.startAdditional = function(_level)
	SamSiteKH = SPAWN:New("M03S_SA5_KH"):Spawn()
	SamSiteTL = SPAWN:New("M03S_SA5_TL"):Spawn()
end

M03SMission.stopAdditional = function()
	SamSiteKH:Destroy()
	SamSiteTL:Destroy()
	SamSiteKH = nil
	SamSiteTL = nil
end


addToF10Menu(M03SMission, MenuCoalitionBlueA2G)


