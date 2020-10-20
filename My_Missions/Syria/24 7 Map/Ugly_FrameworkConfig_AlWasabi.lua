---------------------------------------------------------------------------------------------------
-- This file is just the configuration for the Ugly-Framework. 
-- Any parameter can be set directly in the Ugly_Framwork.lua, 
-- but handling in multiple mission is much easier with a separate config file.

-- Remember to load the Ugly_Framework first, then set any config and finally start the framework


assert(Ugly ~= nil, "\n\n** HEY MISSION-DESIGNER! **\n\nThe Ugly Framework has not been loaded!\n\nMake sure Ugly_Framework is running\n*before* running this script!\n")

-- The global save interval
Ugly.saveInterval = 666

-- If true, print any debug text
Ugly.showDebugText = false

-- How long in seconds is the message displayed
Ugly.messageShowTime = 10

Ugly.AutoRecceMarkerPrefix = "M_" -- if "" no marker is created
-- not in use currently Ugly.KeepDeadRecceMarker = true -- if "" no marker is created 

Ugly.PathToUserData = "C:\\temp" -- A directory "Persistence" is automatically added to the base directory
Ugly.MissionSuffix = "AlWasabi"

Ugly.ExportMapIntervall = 5
Ugly.exportRedUnits = false

local LiveMapBaseDirectory = "C:\\DCS-WebMap\\Serious Uglies\\02 Maps Missions Server\\98 Server Admin\\Syria-Livemap\\"