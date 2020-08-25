------------ Script to start the Bigwing Tankers and Awacs



env.info("SPAWNING: Spawning BigWings")


Spawn_Arco11 = SPAWN:New("Arco 1-1"):InitLimit( 1, 2 )
Spawn_Arco11:InitRepeatOnLanding()
Spawn_Arco11:InitDelayOff()
Spawn_Arco11:SpawnScheduled(180,0)

Spawn_Arco21 = SPAWN:New("Arco 2-1"):InitLimit( 1, 2 )
Spawn_Arco21:InitRepeatOnLanding()
Spawn_Arco21:InitDelayOff()
Spawn_Arco21:SpawnScheduled(180,0)

Spawn_Texaco11 = SPAWN:New("Texaco 1-1"):InitLimit( 1, 2 )
Spawn_Texaco11:InitRepeatOnLanding()
Spawn_Texaco11:InitDelayOff()
Spawn_Texaco11:SpawnScheduled(180,0)

Spawn_Focus = SPAWN:New("Focus"):InitLimit( 1, 2 )
Spawn_Focus:InitRepeatOnLanding()
Spawn_Focus:InitDelayOff()
Spawn_Focus:SpawnScheduled(180,0)

env.info("SPAWNING: Spawned Bigwings")
