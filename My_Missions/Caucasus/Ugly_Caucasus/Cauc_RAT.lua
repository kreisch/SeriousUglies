-- RAT Section BLUE

local RAT_Blue_C130 = RAT:New("RAT_Blue_C130")
RAT_Blue_C130:SetTakeoff("cold")
RAT_Blue_C130:ContinueJourney()
RAT_Blue_C130:SetCoalition("sameonly")
RAT_Blue_C130:Spawn(5)

local RAT_Blue_C17 = RAT:New("RAT_Blue_C17")
RAT_Blue_C17:SetTakeoff("cold")
RAT_Blue_C17:ContinueJourney()
RAT_Blue_C17:SetCoalition("sameonly")
RAT_Blue_C17:Spawn(2)

local RAT_Blue_B52 = RAT:New("RAT_Blue_B52")
RAT_Blue_B52:SetTakeoff("cold")
RAT_Blue_B52:ContinueJourney()
RAT_Blue_B52:SetCoalition("sameonly")
RAT_Blue_B52:Spawn(1)

local RAT_Blue_S3B = RAT:New("RAT_Blue_S3B")
RAT_Blue_S3B:SetTakeoff("cold")
RAT_Blue_S3B:ContinueJourney()
RAT_Blue_S3B:SetCoalition("sameonly")
RAT_Blue_S3B:Spawn(3)

local RAT_Blue_AH1W = RAT:New("RAT_Blue_AH1W")
RAT_Blue_AH1W:SetTakeoff("cold")
RAT_Blue_AH1W:ContinueJourney()
RAT_Blue_AH1W:SetCoalition("sameonly")
RAT_Blue_AH1W:SetDeparture({"TarawaHeli"})
RAT_Blue_AH1W:SetDestination({"Kutaisi"})
RAT_Blue_AH1W:Spawn(1)

-- RAT Section RED

local RAT_Red_AN30M = RAT:New("RAT_Red_AN30M")
RAT_Red_AN30M:SetTakeoff("cold")
RAT_Red_AN30M:ContinueJourney()
RAT_Red_AN30M:SetCoalition("sameonly")
RAT_Red_AN30M:Spawn(3)

local RAT_Red_IL76 = RAT:New("RAT_Red_IL76")
RAT_Red_IL76:SetTakeoff("cold")
RAT_Red_IL76:ContinueJourney()
RAT_Red_IL76:SetCoalition("sameonly")
RAT_Red_IL76:Spawn(2)

local RAT_Red_YAK40 = RAT:New("RAT_Red_YAK40")
RAT_Red_YAK40:SetTakeoff("cold")
RAT_Red_YAK40:ContinueJourney()
RAT_Red_YAK40:SetCoalition("sameonly")
RAT_Red_YAK40:Spawn(3)