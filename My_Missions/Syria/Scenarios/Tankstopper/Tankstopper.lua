local artyGroup = {}

env.info('Arty: Loading')
-- Creat a new ARTY object from a Paladin group.
BlueArtySet=SET_GROUP:New():FilterCoalitions("blue"):FilterCategoryGround():FilterPrefixes({"US_Arty"}):FilterStart()
--BlueArtyList = zoneSetToList(BlueArtySet)

local artyIndex = 0
BlueArtySet:ForEachGroup(
  --- @param Wrapper.Group#GROUP MooseGroup
  function( MooseGroup )
    local _group = MooseGroup
    local _unit1ofGroup = _group:GetUnit(1)
    local _type = _unit1ofGroup:GetTypeName()
    trigger.action.outText("_type is " .. _type, 15)

    artyIndex = artyIndex + 1
    artyGroup[artyIndex] = MooseGroup
    artyGroup[artyIndex]=ARTY:New(GROUP:FindByName(artyGroup[artyIndex]:GetName()))
    -- Set the max firing range. A Paladin unit has a range of 20 km.
    artyGroup[artyIndex]:SetMaxFiringRange(20)
    artyGroup[artyIndex]:SetReportOFF()
    artyGroup[artyIndex]:SetDebugOFF()
    artyGroup[artyIndex]:SetAutoRelocateToFiringRange(1)
    -- Start ARTY process.
    artyGroup[artyIndex]:Start()
  end 
)
env.info('Arty: Loaded')

local function fireArty()
    local unitsToKillSet = SET_GROUP:New():FilterCategoryGround():FilterCoalitions("red"):FilterZones({ZONE:New("Arty_Targets")}):FilterOnce()
    --trigger.action.outText("unitsToKillSet: " .. unitsToKillSet:Count() , 30)
    if unitsToKillSet:Count() > 0 then
        --trigger.action.outText("BlueArtySet: " .. BlueArtySet:Count() , 30)
        for i = 1, artyIndex, 1 do
          --trigger.action.outText("Arty Index: " .. artyIndex , 30)

          --local randomArty = math.random(1, artyIndex)
          local randomGroupToTarget = unitsToKillSet:GetRandom()
          local randomUnit = math.random(1, randomGroupToTarget:GetSize())
          local randomUnitOfGroup   = randomGroupToTarget:GetUnit(randomUnit)
          --trigger.action.outText("Tgt Ident " ..randomUnit , 30)
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

    -- local artilleryScheduler = SCHEDULER:New( nil,
    --             function()
    --               fireArty()
    --           end, {}, 15, 180 )


local MenuArty        = MENU_COALITION:New( coalition.side.BLUE, "Request Artillery Support" )
local MenuArtyFire    = MENU_COALITION_COMMAND:New( coalition.side.BLUE,  "Start FIRE Mission", MenuArty, fireArty)

