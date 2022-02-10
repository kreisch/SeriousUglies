    local SamSectorSouthSet             = SET_ZONE:New():FilterPrefixes("SAM_Spawns_South"):FilterOnce()
    local SamSectorNorthSet             = SET_ZONE:New():FilterPrefixes("SAM_Spawns_North"):FilterOnce()
    local ZoneTableSouth                = zoneSetToList(SamSectorSouthSet)
    local ZoneTableNorth                = zoneSetToList(SamSectorNorthSet)

    local SamUnitsMANPAD                = {"Template_Red_ManpadTeam"}
    local SamUnitsAAA                   = {"Template_Red_ZU23WithStrela", "Template_Red_AAATruck"}
    local SamUnitsShorad                = {"Template_Red_SAM_SA6", "Template_Red_SAM_SA8", "Template_Red_SAM_SA3"}
    local SamUnitsLorad                 = {"Template_Red_SAM_SA5", "Template_Red_SAM_SA2"}
    local SamUnitsLoradModern           = {"Template_Red_SAM_SA10"}
    local SamUnitsLoradModernFunkyShit  = {"Template_Red_SAM_SA10-Fortified"}

    local SAM_SitesManpads              = nil
    local SAM_SitesShorads              = nil
    local SAM_SitesAAA                  = nil
    local SAM_SitesLorads               = nil
    local SAM_SitesLoradsModern         = nil
    local SAM_SitesLoradsFunkyShit      = nil

    local MarkerTableManpads            = {}
    local MarkerTableShorads            = {}
    local MarkerTableAAA                = {}
    local MarkerTableLorads             = {}
    local MarkerTableLoradsModern       = {}
    local MarkerTableLoradsFunkyShit    = {}

    local MarkerTableNorth = {}
    local MarkerTableSouth = {}
    local _configuration = 0

    
function SpawnSamSites(configuration)
      _configuration = configuration[1]
local _sector        = configuration[2]
local ZoneTable = nil
if _sector == 1 then
    ZoneTable = ZoneTableNorth
    for i = 1, #ZoneTableNorth, 1 do
        MarkerTableNorth[i] = MARKER:New(ZoneTableNorth[i]:GetCoordinate(), "Danger..."):ReadOnly():ToAll()
    end
end
if _sector == 2 then
    ZoneTable = ZoneTableSouth
    for i = 1, #ZoneTableNorth, 1 do
        MarkerTableSouth[i] = MARKER:New(ZoneTableSouth[i]:GetCoordinate(), "Danger..."):ReadOnly():ToAll()
    end
end
    if _configuration >= 1 then
        SAM_SitesManpads    = SpawnGroupsOfTemplatesInListOfZones(3, ZoneTable, SamUnitsMANPAD, "SAM_Sites1-Manpads", 300)
        SAM_SitesShorads    = SpawnGroupsOfTemplatesInListOfZones(4, ZoneTable, SamUnitsShorad, "SAM_Sites1-Shorads", 300)
        SAM_SitesAAA        = SpawnGroupsOfTemplatesInListOfZones(3, ZoneTable, SamUnitsAAA   , "SAM_Sites1-AAA", 300)
    end
    if _configuration >= 2 then
        SAM_SitesLorads     = SpawnGroupsOfTemplatesInListOfZones(2, ZoneTable, SamUnitsLorad, "SAM_Sites1-Lorad", 400)
    end
end


function DeSpawnSamSites()
            local unitsToKill = SET_GROUP:New():FilterCategoryGround():FilterZones(SamSectorNorthSet):FilterOnce()
        if unitsToKill:Count() > 0 then
            unitsToKill:ForEachGroup( 
            function( MooseGroup ) 
                local _g = MooseGroup --Wrapper.GROUP object    
                _g:Destroy()
              end 
            )
         end
            local unitsToKill = SET_GROUP:New():FilterCategoryGround():FilterZones(SamSectorSouthSet):FilterOnce()
        if unitsToKill:Count() > 0 then
            unitsToKill:ForEachGroup( 
            function( MooseGroup ) 
                local _g = MooseGroup --Wrapper.GROUP object    
                _g:Destroy()
              end 
            )
         end
         MarkerDeleteAll()
end

function MarkerDeleteAll()
    for i = 1, #ZoneTableSouth, 1 do
        MarkerTableSouth[i]:Remove()
    end
    for i = 1, #ZoneTableNorth, 1 do
        MarkerTableNorth[i]:Remove()
    end
end


local MenuCoalitionBlueSamSiteControl           = MENU_COALITION        :New( coalition.side.BLUE, "SAM Control", MenuCoalitionBlueA2G)
local MenuCoalitionBlueSamSiteControlActivate   = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Spawn SAMs North", MenuCoalitionBlueSamSiteControl, SpawnSamSites,{2,1})
local MenuCoalitionBlueSamSiteControlActivate   = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Spawn SAMs South", MenuCoalitionBlueSamSiteControl, SpawnSamSites,{2,2})
local MenuCoalitionBlueSamSiteControlDeactive   = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Despawn ALL SAMs", MenuCoalitionBlueSamSiteControl, DeSpawnSamSites)