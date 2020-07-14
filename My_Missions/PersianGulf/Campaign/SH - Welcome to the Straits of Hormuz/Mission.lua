-- Welcome to Hormuz



-- Create RAT object from Heli template.
local PerryHeli=RAT:New("RAT_PerryHeli1")
-- Huey departing from FARP Berlin.
PerryHeli:SetDeparture({"HazzardPerry #001"})
-- Flying to Normandy.
PerryHeli:SetDestination({"Fujairah Intl"})
-- Take-off with engines on.
PerryHeli:SetTakeoff("cold")
PerryHeli:InitLimit(5,10)
PerryHeli:Commute()
-- Spawn two aircraft.
PerryHeli:SpawnScheduled(2,0)


-- Spawn Tankers Arco and Shell
Spawn_Vehicle_1 = SPAWN
  :New( "Arco" )
  :InitKeepUnitNames()
  :InitLimit( 1, 1 )
  :InitRepeat()
  :SpawnScheduled( 5, 0 )
  -- Spawn Tankers Arco and Shell
Spawn_Vehicle_1 = SPAWN
  :New( "Shell" )
  :InitKeepUnitNames()
  :InitLimit( 1, 1 )
  :InitRepeat()
  :SpawnScheduled( 5, 0 )