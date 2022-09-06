ZoneTable = { ZONE:New( "lolzone" )}

Spawn_Vehicle_1 = SPAWN:New( "lolship" )
  :InitRandomizeZones( ZoneTable )
  
Spawn_Vehicle_1:Spawn()