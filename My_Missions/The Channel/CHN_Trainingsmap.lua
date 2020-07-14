-- Define the CAPs

-- RED SIDE
          local RU_HQ_Group = GROUP:FindByName( "3R_HQ" )
          local RU_HQ_CC = COMMANDCENTER:New( RU_HQ_Group, "3R_HQ" )
          
          -- Define a SET_GROUP object that builds a collection of groups that define the EWR network.
          -- Here we build the network with all the groups that have a name starting with DF CCCP AWACS and DF CCCP EWR.
          local DetectionSetGroup = SET_GROUP:New()
          DetectionSetGroup:FilterPrefixes( { "3R_Dunkirk"} )
          DetectionSetGroup:FilterStart()
          
          local Detection = DETECTION_AREAS:New( DetectionSetGroup, 30000 )
          
          -- Setup the A2A dispatcher, and initialize it.
          A2ADispatcher = AI_A2A_DISPATCHER:New( Detection )
          A2ADispatcher:SetCommandCenter( RU_HQ_CC )
          
          -- Enable the tactical display panel.
          A2ADispatcher:SetTacticalDisplay( false )
          A2ADispatcher:SetTacticalMenu( "Dispatchers", "A2A" )
          
          -- Initialize the dispatcher, setting up a border zone. This is a polygon, 
          -- which takes the waypoints of a late activated group with the name CCCP Border as the boundaries of the border area.
          -- Any enemy crossing this border will be engaged.
          CCCPBorderZone = ZONE_POLYGON:New( "3R Border", GROUP:FindByName( "3R Border" ) )
          A2ADispatcher:SetBorderZone( CCCPBorderZone )
          
          -- Initialize the dispatcher, setting up a radius of 100km where any airborne friendly 
          -- without an assignment within 100km radius from a detected target, will engage that target.
          A2ADispatcher:SetEngageRadius( 200000 )
          
          -- Setup the squadrons.
          A2ADispatcher:SetSquadron( "Merville_Calonne_CAP", AIRBASE.TheChannel.Merville_Calonne, { "3R_CAP_Merville_Calonne" })
          
          -- Setup the overhead
          A2ADispatcher:SetSquadronOverhead( "Merville_Calonne_CAP", 1 )
          
          -- Setup the Grouping
          A2ADispatcher:SetSquadronGrouping( "Merville_Calonne_CAP", 4 )
          
          -- Setup the Takeoff methods
          A2ADispatcher:SetSquadronTakeoffFromRunway( "Merville_Calonne_CAP" )
          
          -- Setup the Landing methods
          A2ADispatcher:SetSquadronLandingAtRunway( "Merville_Calonne_CAP" )
          
          -- GCI Squadron execution.
          A2ADispatcher:SetSquadronGci2( "Merville_Calonne_CAP", 900, 1200, 100, 100, "RADIO" )
          
          -- Set the language of the squadrons to Russian.
          A2ADispatcher:SetSquadronLanguage( "Merville_Calonne_CAP", "RU" )
          
          A2ADispatcher:SetSquadronRadioFrequency( "Merville_Calonne_CAP", 127.5 )

--  BLUE SIDE

          local US_HQ_Group = GROUP:FindByName( "US_HQ" )
          local US_HQ_CC = COMMANDCENTER:New( US_HQ_Group, "US_HQ" )
          
          -- Define a SET_GROUP object that builds a collection of groups that define the EWR network.
          -- Here we build the network with all the groups that have a name starting with DF CCCP AWACS and DF CCCP EWR.
          local US_DetectionSetGroup = SET_GROUP:New()
          US_DetectionSetGroup:FilterPrefixes( { "US_"} )
          US_DetectionSetGroup:FilterStart()
          
          local US_Detection = DETECTION_AREAS:New( US_DetectionSetGroup, 30000 )
          
          -- Setup the A2A dispatcher, and initialize it.
          US_A2ADispatcher = AI_A2A_DISPATCHER:New( US_Detection )
          US_A2ADispatcher:SetCommandCenter( US_HQ_CC )
          
          -- Enable the tactical display panel.
          US_A2ADispatcher:SetTacticalDisplay( true )
          US_A2ADispatcher:SetTacticalMenu( "Dispatchers", "A2A" )
          
          -- Initialize the dispatcher, setting up a border zone. This is a polygon, 
          -- which takes the waypoints of a late activated group with the name CCCP Border as the boundaries of the border area.
          -- Any enemy crossing this border will be engaged.
          USBorderZone = ZONE_POLYGON:New( "US Border", GROUP:FindByName( "US Border" ) )
          US_A2ADispatcher:SetBorderZone( USBorderZone )
          
          -- Initialize the dispatcher, setting up a radius of 100km where any airborne friendly 
          -- without an assignment within 100km radius from a detected target, will engage that target.
          US_A2ADispatcher:SetEngageRadius( 200000 )
          
          -- Setup the squadrons.
          US_A2ADispatcher:SetSquadron( "Manston_CAP", AIRBASE.TheChannel.Merville_Calonne, { "Manston_CAP" })
          
          -- Setup the overhead
          US_A2ADispatcher:SetSquadronOverhead( "Manston_CAP", 2 )
          
          -- Setup the Grouping
          US_A2ADispatcher:SetSquadronGrouping( "Manston_CAP", 4 )
          
          -- Setup the Takeoff methods
          US_A2ADispatcher:SetSquadronTakeoffFromRunway( "Manston_CAP" )
          
          -- Setup the Landing methods
          US_A2ADispatcher:SetSquadronLandingAtRunway( "Manston_CAP" )
          
          -- GCI Squadron execution.
          US_A2ADispatcher:SetSquadronGci2( "Manston_CAP", 900, 1200, 100, 100, "RADIO" )
          
          -- Set the language of the squadrons to Russian.
          US_A2ADispatcher:SetSquadronLanguage( "Manston_CAP", "EN" )
          
          US_A2ADispatcher:SetSquadronRadioFrequency( "Manston_CAP", 127.5 )