
    --local Zone_SAM_Spawns_South         = ZONE:New("SAM_Spawns_South")
    --local Zone_SAM_Spawns_Central       = ZONE:New("SAM_Spawns_Central")
    local SamSectorSouthSet             = SET_ZONE:New():FilterPrefixes("SAM_Spawns_South"):FilterOnce()
    local SamSectorNorthSet             = SET_ZONE:New():FilterPrefixes("SAM_Spawns_North"):FilterOnce()
    local ZoneTableSouth                = zoneSetToList(SamSectorSouthSet)
    local ZoneTableNorth                = zoneSetToList(SamSectorNorthSet)
    MessageToAll ("Sam Zones South " .. #ZoneTableSouth,60,"YB34 Range activated")
    MessageToAll ("Sam Zones North " .. #ZoneTableNorth,60,"YB34 Range activated")

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

function MarkAllGroups()
    -- for i = 1, #SAM_SitesManpads, 1 do
    --     MarkerTableManpads[i] = MARKER:New(SAM_SitesManpads[i]:GetCoordinate(), "Danger..."):ReadOnly():ToAll()
    -- end
    -- for i = 1, #SAM_SitesShorads, 1 do
    --     MarkerTableShorads[i] = MARKER:New(SAM_SitesShorads[i]:GetCoordinate(), "Danger..."):ReadOnly():ToAll()
    -- end
    -- for i = 1, #SAM_SitesAAA, 1 do
    --     MarkerTableAAA[i] = MARKER:New(SAM_SitesAAA[i]:GetCoordinate(), "Danger..."):ReadOnly():ToAll()
    -- end
    -- for i = 1, #SAM_SitesLorads, 1 do
    --     MarkerTableLorads[i] = MARKER:New(SAM_SitesLorads[i]:GetCoordinate(), "Danger..."):ReadOnly():ToAll()
    -- end
    -- if #SAM_SitesLoradsModern then
    --     for i = 1, #SAM_SitesLoradsModern, 1 do
    --         MarkerTableLoradsModern[i] = MARKER:New(SAM_SitesLoradsModern[i]:GetCoordinate(), "Danger..."):ReadOnly():ToAll()
    --     end
    -- end
    -- for i = 1, #SAM_SitesLoradsFunkyShit, 1 do
    --     MarkerTableLoradsFunkyShit[i] = MARKER:New(SAM_SitesLoradsFunkyShit[i]:GetCoordinate(), "Danger..."):ReadOnly():ToAll()
    -- end

end

function DeSpawnSamSites(sector)
    local _sector = sector
    if sector == 1 then
        local unitsToKill = SET_GROUP:New():FilterCategoryGround():FilterZones({SAM_Spawns_North}):FilterOnce()
        if unitsToKill:Count() > 0 then
            unitsToKill:ForEachGroup( 
            function( MooseGroup ) 
                local _g = MooseGroup --Wrapper.GROUP object    
                _g:Destroy()
              end 
            )
         end
    end
    if sector == 2 then
        local unitsToKill = SET_GROUP:New():FilterCategoryGround():FilterZones({SAM_Spawns_South}):FilterOnce()
        if unitsToKill:Count() > 0 then
            unitsToKill:ForEachGroup( 
            function( MooseGroup ) 
                local _g = MooseGroup --Wrapper.GROUP object    
                _g:Destroy()
              end 
            )
         end
    end

end

function MarkerDeleteAll()
    if _configuration == 1 then
        
    end
    if _configuration == 2 then
        
    end
    -- for i = 1, #MarkerTableManpads, 1 do
    --     MarkerTableManpads[i]:Remove()
    -- end
    -- for i = 1, #MarkerTableShorads, 1 do
    --     MarkerTableShorads[i]:Remove()
    -- end
    -- for i = 1, #MarkerTableAAA, 1 do
    --     MarkerTableAAA[i]:Remove()
    -- end
    -- for i = 1, #MarkerTableLorads, 1 do
    --     MarkerTableLorads[i]:Remove()
    -- end
    -- for i = 1, #MarkerTableLoradsModern, 1 do
    --     MarkerTableLoradsModern[i]:Remove()
    -- end
    -- for i = 1, #MarkerTableLoradsFunkyShit, 1 do
    --     MarkerTableLoradsFunkyShit[i]:Remove()
    -- end
end

SpawnSamSites({2,2})
MarkAllGroups()
local mytimer=TIMER:New(MarkerDeleteAll)
mytimer:Start(20)
