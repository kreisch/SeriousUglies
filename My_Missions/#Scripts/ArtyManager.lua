local artyGroup = {}
local artilleryScheduler = nil

local function fireArty(coalitionOfArty,TargetZonesSet)
    local coalitionOfTargets = nil
    if coalitionOfArty == "blue" then
        coalitionOfTargets = "red"
    elseif  coalitionOfArty == "red" then
        coalitionOfTargets = "blue"
    else
        -- Error, you fucked up the coalition.
    end
    local unitsToKillSet = SET_GROUP:New():FilterCategoryGround():FilterCoalitions(coalitionOfTargets):FilterZones(TargetZonesSet):FilterOnce()
    if unitsToKillSet:Count() > 0 then
        for i = 1, #artyGroup, 1 do
          local randomGroupToTarget = unitsToKillSet:GetRandom()
          local randomUnit = math.random(1, randomGroupToTarget:GetSize())
          local randomUnitOfGroup   = randomGroupToTarget:GetUnit(randomUnit)
          local amountOfShots = math.random(5, 10)
          artyGroup[i]:AssignTargetCoord(randomUnitOfGroup:GetCoordinate(), nil, nil, amountOfShots, 1)
        end
      trigger.action.outSound("radiobeep.ogg")
      trigger.action.outText("All stations, all stations, Roger that! Loki is firing in 2 minutes, clear the corridor ASAP!", 15)
    else
      trigger.action.outSound("radiobeep.ogg")
      trigger.action.outText("Negative, no targets in our range!", 15)
    end

end

local function getFireRangeOfArtyType(type)
    local _type = type
    local _range = {0,0}
    if _type        == "SAU Gvozdika" then
        _range[1] = 0.1
        _range[2] = 14.8
    elseif _type    == "Grad-URAL" then
        _range[1] = 0.1
        _range[2] = 18.8
    elseif _type    == "SpGH_Dana" then
        _range[1] = 0.1
        _range[2] = 18.5
    elseif _type    == "Uragan_BM-27" then
        _range[1] = 11
        _range[2] = 35
    elseif _type    == "SAU Akatsia" then
        _range[1] = 0.1
        _range[2] = 16.8
    elseif _type    == "2B11 mortar" then
        _range[1] = 0.1
        _range[2] = 6.8
    elseif _type    == "SAU 2-C9" then
        _range[1] = 0.1
        _range[2] = 6.7
    elseif _type    == "M-109" then
        _range[1] = 0.1
        _range[2] = 21.7
    elseif _type    == "M12_GMC" then
        _range[1] = 0.1
        _range[2] = 18
    elseif _type    == "M2A1-105" then
        _range[1] = 0.1
        _range[2] = 11
    elseif _type    == "MLRS" then
        _range[1] = 9.5
        _range[2] = 31
    else
         _range = {0.1,20}
        -- Fucked up the range?
    end
    return _range
end

local function initArty(artyGroupsSet, coalitionOfArty, TargetZonesSet)
    env.info('Arty: Loading')

    
    local artyIndex = 0
    artyGroupsSet:ForEachGroup(
    --- @param Wrapper.Group#GROUP MooseGroup
    function( MooseGroup )
        local _group = MooseGroup
        local _unit1ofGroup = _group:GetUnit(1)
        local _type = _unit1ofGroup:GetTypeName()
        artyIndex = artyIndex + 1
        artyGroup[artyIndex] = MooseGroup
        artyGroup[artyIndex]=ARTY:New(GROUP:FindByName(artyGroup[artyIndex]:GetName()))
        local _range = getFireRangeOfArtyType(_type)
        artyGroup[artyIndex]:SetMinFiringRange(_range[1])
        artyGroup[artyIndex]:SetMaxFiringRange(_range[2])
        artyGroup[artyIndex]:SetAutoRelocateToFiringRange(1)
        artyGroup[artyIndex]:SetReportOFF()
        artyGroup[artyIndex]:SetDebugOFF()
        -- Start ARTY process.
        artyGroup[artyIndex]:Start()
    end 
    )
    env.info('Arty: Loaded')

    artilleryScheduler = SCHEDULER:New( nil,
        function()
                    fireArty(coalitionOfArty, TargetZonesSet)
        end, {}, 15, 180 )

    
    return artyGroup
end

function stopArty()
    artilleryScheduler:Stop()
end

local TargetZonesSet            = SET_ZONE:New():FilterPrefixes("Arty_Targets"):FilterOnce()
local BlueArtySet               = SET_GROUP:New():FilterCoalitions("blue"):FilterCategoryGround():FilterPrefixes({"US_Arty"}):FilterStart()
if BlueArtySet:Count() > 0 then
    initArty(BlueArtySet, "blue", TargetZonesSet)
end