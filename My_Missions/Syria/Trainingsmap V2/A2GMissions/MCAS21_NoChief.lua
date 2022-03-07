-- Ablaufplanung
-- Mission wird aktiviert, FOB_Dallas wird gespawned
-- Blaue Infanterie wird mit SpawnTimer platziert, Sobald eine Gruppe zerstört ist, spawnt sie erneut ohne Limit
-- Blaue Infanterie bekommt INTEL; Bei OnNewContact wird roter Rauch auf das Ziel geworfen, Position sollte um die tatsächliche Position herum schwanken (Framework?)
-- Sobald Spieler in Dallas-Areal eindringen, startet ein X-Minuten-Timer
-- Nach Ablauf der X-Minuten spawnen Mörser in einer zufälligen Zone, Prefix MCAS21RedMortarSpawn1-X
-- Mörser bekommen FOB_Dallas als Ziel zugewiesen
-- FOB_Dallas bekommt als "OnEventHit" einen Funkspruch, dieser darf nur alle X-Minuten durchkommen und muss randomisiert sein (2-3 Stück?)
-- Wenn Mörser-Gruppe zerstört ist, spawnt Infanterie in der näheren Umgebung des FOBs; Anzahl der spawnenden Wellen ist konfigurierbar
-- Nachdem die vorletzte Gruppe erledigt wurde, CASEVAC
-- Fertig...?

local playerWasInZone = false
local activeMortarTrapZone = -1

local function initMission(configuration)
    ZoneScheduler = nil
    _configuration = configuration

    ClientSet = SET_CLIENT:New():FilterCoalitions("blue"):FilterActive():FilterStart()

    ZoneDallas                          = ZONE:New("MCAS21_Delete")
    ZoneDallasInfSet                    = SET_ZONE:New():FilterPrefixes("MCAS21BlueSpawn"):FilterOnce()
    ZoneDallasInfTable                  = zoneSetToList(ZoneDallasInfSet)
    ZoneDallasMortarTrapSet             = SET_ZONE:New():FilterPrefixes("MCAS21RedMortarSpawn1"):FilterOnce()
    ZoneDallasMortarTrapSetTable        = zoneSetToList(ZoneDallasMortarTrapSet)

    MCAS21_FOB_Dallas                   = SPAWN:New("MCAS2_FOB_Dallas-1")
    MCAS21_FOB_DallasInfTemplate        = {"Template_CTLD_Blue_Inf12", "Template_CTLD_Blue_Inf8"}
    MCAS21_FOB_Dallas_RU_Mortar_Trap_Spawn      = SPAWN:New("MCAS2_RU_DallasMortarTrap"):InitRandomizePosition( true , 50, 10 )
    MCAS21_FOB_Dallas_RU_Mortar_Trap2_Spawn     = SPAWN:New("MCAS2_RU_DallasMortarTrap-1")
    

end

local function spawnMortarTrapDallas()
    activeMortarTrapZone = math.random( 1, #ZoneDallasMortarTrapSetTable )
    local ZoneName = ZoneDallasMortarTrapSetTable[activeMortarTrapZone]:GetName()
    local SpawnVec3 = POINT_VEC3:NewFromVec3( ZONE:New( ZoneName ):GetVec3() )
    MCAS21_FOB_Dallas_RU_Mortar_Trap_Spawn:SpawnFromVec3( SpawnVec3:GetVec3() )
    MCAS21_FOB_Dallas_RU_Mortar_Trap2_Spawn:SpawnFromVec3( SpawnVec3:GetVec3() )

end

local function TimerPlayerArrivedAtDallas() -- Starts a scheduler to check if Player is around the FOB_Dallas; On arrival, start 2 minute Counter
    ZoneScheduler = SCHEDULER:New(nil,function() 
        ClientSet:ForEachClientInZone(ZoneDallas,function(MooseUnit) 
            ---@class UNIT:CONTROLLABLE
            local _Unit = MooseUnit
            local coal = _Unit:GetCoalition()
            --local type = _Unit:GetTypeName() -- kreisch: Sollte Typ wie z.B. UH-1H liefern
            --local category = _Unit:getCategory() -- kreisch: Sollte Type liefern: Airplane, Helicopter, Ground, Ship, Structure
            if coal == coalition.side.BLUE then
                if (playerWasInZone == false) then
                    spawnMortarTrapDallas()
                    ZoneScheduler:Stop()
                    playerWasInZone = true
                end
            else
                -- Set you trigger
            end
    
        end)
    
    
    end,{},10,5,nil,nil) -- Start after ten seconds and repeats every 5 sec, change to whatever you like.
    ZoneScheduler:Start()
end


local function spawnUnits()
    MCAS21_FOB_Dallas:Spawn() -- Spawn Dallas
    local usInfDallas = SpawnGroupsOfTemplatesInListOfZones(5, ZoneDallasInfTable, MCAS21_FOB_DallasInfTemplate, "MCAS21_Dallas_Inf_US",5) -- SpawnInf around Dallas
    for i = 1, #usInfDallas, 1 do                       -- Add the Event listener for Event.Hit for US Inf.
        usInfDallas[i]:HandleEvent( EVENTS.Hit )
        local _g = usInfDallas[i]
        function _g:OnEventHit( EventData )
            self:E( "I just got hit and I am part of " .. EventData.TgtGroupName )
            EventData.TgtUnit:MessageToAll( "I just got hit and I am part of " .. EventData.TgtGroupName, 15, "Alert!" )
        end
    end

end

local function DespawnUnits()
    local unitsToKill = SET_GROUP:New():FilterCategoryGround():FilterZones({"MCAS21_Delete"}):FilterOnce()
    if unitsToKill:Count() > 0 then
        unitsToKill:ForEachGroup( 
        function( MooseGroup ) 
            local _g = MooseGroup --Wrapper.GROUP object    
            _g:Destroy()
          end 
        )
     end
end

local function addF10Marker()

end

local function removeF10Marker()
    

end

local function endMission()
    DespawnUnits()
    removeF10Marker()
end

local function startMission(configuration)
    initMission(configuration)
    spawnUnits()
    addF10Marker()
    TimerPlayerArrivedAtDallas()
end

-- Add Menu
local MenuCoalitionBlueMISSIONNAME        = MENU_COALITION:New( coalition.side.BLUE,          "MCAS21: Tiberias", MenuCoalitionBlueA2GMissions )
local MenuCoalitionBlueMISSIONNAMEMenuStart   = MENU_COALITION_COMMAND:New( coalition.side.BLUE,  "Start Tiberias", MenuCoalitionBlueMISSIONNAME, startMission, 1)
local MenuCoalitionBlueMISSIONNAMEMenuEnd     = MENU_COALITION_COMMAND:New( coalition.side.BLUE,  "End Tiberias", MenuCoalitionBlueMISSIONNAME, endMission)
