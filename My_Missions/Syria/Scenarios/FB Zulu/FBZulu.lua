-- Define groups from editor
local RuSupportConvoy = SPAWN:New("RU-Support-Convoy")
local TemplateTableAttackers = { "Template_15Inf_BMP", "Template_T55"}


-- Define zones

local zoneFbTarget      = ZONE:New("FB-Target")
local zoneFightingZone  = ZONE:New("FightingZone")
local zoneSetSpawnsRed  = SET_ZONE:New():FilterPrefixes("Spawn_Red"):FilterOnce()

--trigger.action.outText("Set size:  " .. zoneSetSpawnsRed:Count, 60)


function zoneSetToList(zoneSet)
    _zoneList = {}
    _zoneSet = zoneSet
    local k = 1
    _zoneSet:ForEachZone(function(zoneElement)
        _zoneList[k] = zoneElement
        k = k + 1
    end)
    return _zoneList
end

local function spawnEnemiesAttackingFarp()

GroupAttackingFbSpawn = SPAWN:NewWithAlias( "RedSpawnDummy" )
  :InitLimit( 100, 10 )
  :InitRandomizeTemplate( TemplateTableAttackers ) 
  :InitRandomizeZones( zoneSetToList(zoneSetSpawnsRed) )
  :SpawnScheduled( 30, .5 )



end


spawnEnemiesAttackingFarp()