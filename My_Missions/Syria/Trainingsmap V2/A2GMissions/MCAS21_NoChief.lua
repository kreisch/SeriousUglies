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


local function initMission(configuration)
    ZoneScheduler = nil
    _configuration = configuration

    ClientSet = SET_CLIENT:New():FilterCoalitions("blue"):FilterActive():FilterStart()

    ZoneDallas = ZONE:New("MCAS21_MissionStartArea")

    MCAS21_FOB_Dallas                   = SPAWN:New("MCAS2_FOB_Dallas-1")
    MCAS21_FOB_DallasInf                = SET_GROUP:New():FilterCategoryGround():FilterCoalitions("blue"):FilterPrefixes("MCAS2_US_DallasInf"):FilterOnce()
    MCAS21_FOB_Dallas_RU_Mortar_Trap    = SET_GROUP:New():FilterCategoryGround():FilterCoalitions("red"):FilterPrefixes("MCAS2_RU_DallasMortarTrap"):FilterOnce()

end

local function spawnMortarTrapDallas()
    if MCAS21_FOB_Dallas_RU_Mortar_Trap:Count() > 0 then -- Spawn Mortar Trap
        MCAS21_FOB_Dallas_RU_Mortar_Trap:ForEachGroup( 
        function( MooseGroup ) 
            local _g = MooseGroup --Wrapper.GROUP object    
            _g:Spawn()
          end 
        )
     end

end

local function TimerPlayerArrivedAtDallas() -- Starts a scheduler to check if Player is around the FOB_Dallas; On arrival, start 2 minute Counter
    ZoneScheduler = SCHEDULER:New(nil,function() 
        clientSet:ForEachClientInZone(actualZone,function(MooseUnit) 
            ---@class UNIT:CONTROLLABLE
            local _Unit = MooseUnit
            local coal = _Unit:GetCoalition()
            local type = _Unit:GetTypeName() -- kreisch: Sollte Typ wie z.B. UH-1H liefern
            local category = _Unit:getCategory() -- kreisch: Sollte Type liefern: Airplane, Helicopter, Ground, Ship, Structure
            if coal == coalition.side.BLUE then
                spawnMortarTrapDallas()
                ZoneScheduler:Stop()
            else
                -- Set you trigger
            end
    
        end)
    
    
    end,{},10,5,nil,nil) -- Start after ten seconds and repeats every 5 sec, change to whatever you like.
    ZoneScheduler:Start()
end


local function spawnUnits()
    MCAS21_FOB_Dallas:Spawn() -- Spawn Dallas
    if MCAS21_FOB_DallasInf:Count() > 0 then -- Spawn Inf um Dallas herum
        MCAS21_FOB_DallasInf:ForEachGroup( 
        function( MooseGroup ) 
            local _g = MooseGroup --Wrapper.GROUP object    
            _g:Spawn()
          end 
        )
     end

end

local function DespawnUnits()

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
