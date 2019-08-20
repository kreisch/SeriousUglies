-- Moose scripting for the dynamic version of "Combined Arms - an ugly winter"
-- This mission is a total dynamic setup and represents the Battle for Dhvari.

-- SETUP Sounds
soundRadioBeep = USERSOUND:New( "radiobeep.ogg" )
soundUIBeep = USERSOUND:New( "Ui beep.ogg" )

-- END SETUP Sounds


-- SETUP Ground-Warfare
-- Infantry Cargo Dispatcher US

    local SetCargoInfantry = SET_CARGO:New():FilterTypes( "Infantry" ):FilterStart()
    local SetAPC = SET_GROUP:New():FilterPrefixes( "US_PC_MarineExpedition" ):FilterStart()
    local SetDeployZones = SET_ZONE:New():FilterPrefixes( "USDeploy" ):FilterStart()
    
    AICargoDispatcherAPC = AI_CARGO_DISPATCHER_APC:New( SetAPC, SetCargoInfantry, nil, SetDeployZones ) 
    
    function AICargoDispatcherAPC:OnAfterDeployed( From, Event, To, CarrierGroup, DeployZone )
    
      soundRadioBeep:ToCoalition(coalition.side.BLUE)
      MESSAGE:NewType( "Overlord, Rainman, we " .. CarrierGroup:GetName() .. " deployed all troops in zone " .. DeployZone:GetName(), MESSAGE.Type.Information ):ToBlue()
    
    end
    
    AICargoDispatcherAPC:Start()
-- END of Infantry Cargo Dispatcher US

Spawn_Infantry_Marine_Expedition_1 = SPAWN:New( "Infantry#CARGO(T=Infantry,RR=150) #001" ):InitLimit(14, 900):SpawnScheduled( 30, 0 )
Spawn_Infantry_Marine_Expedition_2 = SPAWN:New( "Infantry#CARGO(T=Infantry,RR=150) #002" ):InitLimit(14, 900):SpawnScheduled( 60, 0 )
Spawn_Infantry_Marine_Expedition_3 = SPAWN:New( "Infantry#CARGO(T=Infantry,RR=150) #003" ):InitLimit(14, 900):SpawnScheduled( 90, 0 )
Spawn_Infantry_Marine_Expedition_4 = SPAWN:New( "Infantry#CARGO(T=Infantry,RR=150) #004" ):InitLimit(14, 900):SpawnScheduled( 900, 0 )
Spawn_Infantry_Marine_Expedition_5 = SPAWN:New( "Infantry#CARGO(T=Infantry,RR=150) #005" ):InitLimit(14, 900):SpawnScheduled( 900, 0 )
Spawn_Infantry_Marine_Expedition_6 = SPAWN:New( "Infantry#CARGO(T=Infantry,RR=150) #006" ):InitLimit(14, 900):SpawnScheduled( 900, 0 )

Spawn_US_PC_MarineExpedition = SPAWN:New( "US_PC_MarineExpedition #001" ):InitLimit(12, 900):SpawnScheduled( 60, 0 )

-- END of Setup Ground-Warfare

-- SETUP A2A
    DetectionSetGroup = SET_GROUP:New()
    DetectionSetGroup:FilterPrefixes( { "RU_AWACS", "RU_EWR" } )
    DetectionSetGroup:FilterStart()
    
    Detection = DETECTION_AREAS:New( DetectionSetGroup, 30000 )
    
    -- Setup the A2A dispatcher, and initialize it.
    A2ADispatcher = AI_A2A_DISPATCHER:New( Detection )
    
    
    A2ADispatcher:SetTacticalDisplay( false )
    
    -- Setup the squadrons.
    
    A2ADispatcher:SetSquadron( "Maykop", AIRBASE.Caucasus.Maykop_Khanskaya, { "CAP_Mig23" } )
    A2ADispatcher:SetSquadron( "Mozdok", AIRBASE.Caucasus.Mozdok, { "CAP_Mig29" } )
    CAPZoneRU = ZONE_POLYGON:New( "RU_Border", GROUP:FindByName( "RU_Border" ) )
    A2ADispatcher:SetSquadronCap( "Mozdok", CAPZoneRU, 4000, 14000, 600, 800, 800, 1200 )
    A2ADispatcher:SetSquadronCap( "Maykop", CAPZoneRU, 6000, 20000, 600, 800, 800, 1200 )
    A2ADispatcher:SetSquadronCapInterval( "Mozdok", 1, 10, 600, 1 )
    A2ADispatcher:SetSquadronCapInterval( "Maykop", 2, 10, 300, 1 )
    A2ADispatcher:SetSquadronGrouping( "Mozdok", 2 )
    A2ADispatcher:SetSquadronGrouping( "Maykop", 2 )
    
    
    Spawn_Hind2 = SPAWN:New( "RU_Hind_ #001" ):InitLimit( 2, 10 ):SpawnScheduled( 240, .5 )
    Spawn_Hind = SPAWN:New( "RU_Hind_" ):InitLimit( 2, 10 ):SpawnScheduled( 240, .5 )

--##################### End of Setup A2A











