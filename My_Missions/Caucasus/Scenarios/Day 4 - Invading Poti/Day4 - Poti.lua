
BASE:TraceOnOff(false)
BASE:TraceAll(true)
BASE:TraceLevel(2)

-- TACANs and Beacons
do

    local ChopperTarawa = UNIT:FindByName("ChopperTarawa")
    local HawkTacan = UNIT:FindByName("HawkTacan")
    

    
    -- Tarawa for the Choppers
    local BeaconLand = ChopperTarawa:GetBeacon()
    BeaconLand:RadioBeacon("Morse.ogg", 129, radio.modulation.AM, 100, 0)
    local TarawaTacan = HawkTacan:GetBeacon()
    TarawaTacan:AATACAN(15, "Tarawa", true)


end

-- HQ, JTACs, Designation, Detection etc.
    HQ = GROUP:FindByName( "ChopperTarawa" )
    US_CC = COMMANDCENTER:New( HQ, "HQ" )
do
    RecceSetGroup = SET_GROUP:New():FilterPrefixes( "Recce" ):FilterStart()
    -- Let the RecceSetGroup vehicles in the collection detect targets and group them in AREAS of 1000 meters.
    RecceDetection = DETECTION_AREAS:New( RecceSetGroup, 500 )
    
    -- Create an AttackGroup which must contain players.
    AttackSet = SET_GROUP:New():FilterPrefixes("Hitman"):FilterStart()
    
    -- This set is only for Poti
    -- Create a RecceDesignater Object
    RecceDesignation = DESIGNATE:New( US_CC, RecceDetection, AttackSet )
    -- And configure it
    RecceDesignation:GenerateLaserCodes()
    --RecceDesignation:SetAutoLase(true)
    RecceDesignation:SetThreatLevelPrioritization(true)

end


do

local RussianTroopsPoti = SET_GROUP:New():FilterPrefixes("RussianInfantryPoti"):FilterStart()
local DismountsIterator = 0

local Poticlear = false
local PotiZone = ZONE:New("PotiCleared")
local SpawnNorth = ZONE:New("RusSpawnNorth")


RussianTroopsPoti:_EventOnDeadOrCrash(function()
    Poticlear = true

end)

RussianConvoyNorth1Template = SPAWN:New( "Warg" ):InitLimit( 40, 5 )
:OnSpawnGroup(
    function(MooseGroup)
      BASE:E("Dismounts Go")

          for UnitId, UnitData in pairs( MooseGroup:GetUnits() ) do
            local UnitAction = UnitData -- Wrapper.Unit#UNIT
            --BASE:E(UnitAction:GetName())
            BASE:E(UnitAction:GetTypeName())
                if DismountsIterator % 2 == 0 then
                  AddDismounts(UnitAction:GetName(), "ZU-23")
                else
                  AddDismounts(UnitAction:GetName(), "Rifle")
                end
            DismountsIterator = DismountsIterator + 1
          end
    end)
    
PotiClearedScheduler = SCHEDULER:New(nil,
function()
  if Poticlear then
        BASE:E("Spawn Triggered")
        RussianConvoyNorth1Template:SpawnScheduled( 180, 0 )
  end
end,
{} ,20 ,30)


end