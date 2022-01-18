Zone1         =     ZONE:New( "Zone1" )
Zone2         =     ZONE:New( "Zone2" )

Zone1_vec = Zone1:GetVec3()
Zone2_vec = Zone2:GetVec3()

SpawnZoneTable = {
Zone1, Zone2,
}

TemplateTable_EASY_Rebels = { 
"btr80",
"btr82",
"bmp3",
}

RandomSpawn = SPAWN:New("A2G_Init")
:InitRandomizeTemplate(TemplateTable_EASY_Rebels)
:InitRandomizeZones(SpawnZoneTable)
:InitLimit( 15, 0 )
:SpawnScheduled(5,0)
