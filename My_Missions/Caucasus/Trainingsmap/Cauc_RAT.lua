-- RAT Section BLUE

local RAT_Blue_C130 = RAT:New("RAT_Blue_C130")
RAT_Blue_C130:SetTakeoff("cold")
RAT_Blue_C130:ContinueJourney()
RAT_Blue_C130:SetCoalition("sameonly")
RAT_Blue_C130:SpawnScheduled(600,0.5):InitLimit(2,0):SpawnScheduleStart()


local RAT_Blue_C17 = RAT:New("RAT_Blue_C17")
RAT_Blue_C17:SetTakeoff("cold")
RAT_Blue_C17:ContinueJourney()
RAT_Blue_C17:SetCoalition("sameonly")
RAT_Blue_C17:SpawnScheduled(600,0.5):InitLimit(2,0):SpawnScheduleStart()

local RAT_Blue_B52 = RAT:New("RAT_Blue_B52")
RAT_Blue_B52:SetTakeoff("cold")
RAT_Blue_B52:ContinueJourney()
RAT_Blue_B52:SetCoalition("sameonly")
RAT_Blue_B52:SpawnScheduled(600,0.5):InitLimit(2,0):SpawnScheduleStart()

local RAT_Blue_S3B = RAT:New("RAT_Blue_S3B")
RAT_Blue_S3B:SetTakeoff("cold")
RAT_Blue_S3B:ContinueJourney()
RAT_Blue_S3B:SetCoalition("sameonly")
RAT_Blue_S3B:SpawnScheduled(600,0.5):InitLimit(2,0):SpawnScheduleStart()

local US_RAT_UH60 = RAT:New("RAT_UH60")
US_RAT_UH60:SetTakeoff("cold")
US_RAT_UH60:SetDeparture( {"TarawaCoast"})
US_RAT_UH60:SetDestination( {"Senaki-Kolkhi"})
US_RAT_UH60:ExcludedAirports("GeorgeWashington")
US_RAT_UH60:ContinueJourney()
US_RAT_UH60:SetCoalition("sameonly")
US_RAT_UH60:SpawnScheduled(100,0.5):InitLimit(3,0):SpawnScheduleStart()

-- RAT Section RED

local RAT_Red_AN30M = RAT:New("RAT_Red_AN30M")
RAT_Red_AN30M:SetTakeoff("cold")
RAT_Red_AN30M:ContinueJourney()
RAT_Red_AN30M:SetCoalition("sameonly")
RAT_Red_AN30M:SpawnScheduled(600,0.5):InitLimit(2,0):SpawnScheduleStart()

local RAT_Red_IL76 = RAT:New("RAT_Red_IL76")
RAT_Red_IL76:SetTakeoff("cold")
RAT_Red_IL76:ContinueJourney()
RAT_Red_IL76:SetCoalition("sameonly")
RAT_Red_IL76:SpawnScheduled(600,0.5):InitLimit(2,0):SpawnScheduleStart()

local RAT_Red_YAK40 = RAT:New("RAT_Red_YAK40")
RAT_Red_YAK40:SetTakeoff("cold")
RAT_Red_YAK40:ContinueJourney()
RAT_Red_YAK40:SetCoalition("sameonly")
RAT_Red_YAK40:SpawnScheduled(600,0.5):InitLimit(2,0):SpawnScheduleStart()