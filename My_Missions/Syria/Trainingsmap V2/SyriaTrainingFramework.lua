ioDesanitized = false

local MarkerHelipads                 = {}
local MarkerMASH                     = {}

if io and lfs and os then
    trigger.action.outText("io, lfs and os are available", 30)
    ioDesanitized = true
else
    trigger.action.outText("io, lfs or os not available -> MissionScripting.lua has to be modified to use this mission!",
        6000)
end




function MarkHeliPorts()
    local HeliPortSet = SET_ZONE:New():FilterPrefixes("Helipad"):FilterStart()
    local index = 1
    if HeliPortSet:Count() > 0 then
        HeliPortSet:ForEachZone(function(MooseZone)
            local _z = MooseZone -- Wrapper.GROUP object    
            MarkerHelipads[index] = MARKER:New(_z:GetCoordinate(), "Heliport"):ToAll()
            index = index + 1
        end)
    end
end

function RemoveHeliPortMarks()
    for k = 1, #MarkerHelipads, 1 do
        MarkerHelipads[k]:Remove()
    end
    MarkerHelipads = {}
end

function MarkMASH()
    local MashSet = SET_GROUP:New():FilterPrefixes("MASH"):FilterStart()
    local index = 1
    if MashSet:Count() > 0 then
        MashSet:ForEachGroup(function(MooseZone)
            local _z = MooseZone -- Wrapper.GROUP object    
            MarkerMASH[index] = MARKER:New(_z:GetCoordinate(), "MASH"):ToAll()
            index = index + 1
        end)
    end
end

function RemoveMASHMarks()
    for k = 1, #MarkerMASH, 1 do
        MarkerMASH[k]:Remove()
    end
    MarkerMASH = {}
end

function extendTable(t1, t2)
    return table.move(t2, 1, #t2, #t1 + 1, t1)
end


---- Function used to call dismounts.
-- Function used to call ARTY-Script by Moose for BLUE-Arty Units (Mortar, Paladin, MLRS)
-- Totally robbed from https://forums.eagle.ru/topic/258313-xcas-syria/ Thank you very much! All credits go to EasyEB
function AddAdditionalScriptsToGroups(MyGroup)
    local GroupName = MyGroup:GetName()
    local names = {}
    local units = Group.getByName(GroupName):getUnits()
    for i = 1, #units do
        local typeName = Unit.getTypeName(units[i])
        local unitName = Unit.getName(units[i])
        if string.match(typeName, "BMP") or string.match(typeName, "BTR") or string.match(typeName, "Cobra") or
            string.match(typeName, "135") or string.match(typeName, "Kamaz 43101") then
            AddDismounts(unitName, "RifleINS")
        elseif string.match(typeName, "Bradley") then
            AddDismounts(unitName, "Rifle")
        elseif string.match(typeName, "M1126 Stryker ICV") then
            AddDismounts(unitName, "Rifle")
        elseif string.match(typeName, "Ural") or string.match(typeName, "Grad-URAL") then
            AddDismounts(unitName, "TeamINS")
        else
        end
    end
    -- Check if it is arty and blue side, then add the arty-script
end

-- Function returns a Table of Groups
function SpawnGroupsOfTemplatesInListOfZones(NumberOfGroups, ZoneTable, Templates, Prefix, outerradius, innerradius)
    if outerradius == nil then
        outerradius = 5
    end
    if innerradius == nil then
        innerradius = 1
    end
    local spawns = {}
    for k = 1, NumberOfGroups, 1 do
        local tempGrpAlias = Prefix .. k
        spawns[k] = SPAWN:NewWithAlias("Randomizer", tempGrpAlias):InitRandomizeZones(ZoneTable):InitRandomizePosition(
            true, outerradius, innerradius ):InitRandomizeTemplate(Templates):Spawn()
        AddAdditionalScriptsToGroups(spawns[k])
    end

    return spawns
end

-- Spawn a JTAC
function spawnJTAC(coord)
    if JTACcounter < 10 then
        JTACcounter = JTACcounter + 1
        local tempGrpJtac = "TaftanazJtac-" .. JTACcounter
        JTACs[JTACcounter] = SPAWN:NewWithAlias("Predator", tempGrpJtac)
        Predator_Spawn = JTACs[JTACcounter]:SpawnFromVec3(coord)

        local OrbitTask = Predator_Spawn:TaskOrbitCircle(2000, 160)
        Predator_Spawn:SetTask(OrbitTask, 1)

        Predator_NAME = Predator_Spawn:GetName()
        ctld.JTACAutoLase(Predator_NAME, 1680 + JTACcounter, true, "all")
        trigger.action.outText("JTAC:  " .. Predator_NAME .. " on station lasing " .. 1680 + JTACcounter ..
                                   ". \nNOTE: If you wish to delete Zeus-spawned JTACS use the map marker command -delete jtac",
            60)
        env.info("JTAC:  " .. Predator_NAME .. "  spawned!")
    end
end

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

function SpawnManpadWhenDamaged()

end

function GetNamesOfZonesFromZoneTable(table)
    local _table = table
    local _zoneNamesTable = {}
        for i = 1, #_table, 1 do
            _zoneNamesTable[i] = _table[i]:GetName()
        end
    return _zoneNamesTable
end



--Function to stop a fire
function EndAFire(firecoord)
    firecoord:StopBigSmokeAndFire()
  end

-- Function to start a Fire within a zone
-- Returns the coord object of the fire
function StartAFire(FireZone, Timed)
    local rnd = math.random(1,8) -- Smoke size 1 = small smoke and fire; 8 = huge smoke
    local firecoord = FireZone:GetRandomCoordinate() -- Core.Point#COORDINATE
    firecoord:BigSmokeAndFire(rnd, nil, nil)
    
    if Timed == true then
        local fireDuration = math.random(minimumDurationFire,maximumDurationFire)
        local endFire=TIMER:New(EndAFire,firecoord)
        endFire:Start(fireDuration)
    end
    
    return firecoord
end

function StartAFireZoneList(ZoneList, Timed)
    local listOfFires = {}
    for i = 1, #ZoneList, 1 do
        listOfFires[i] = StartAFire(ZoneList[i], Timed)
    end

    return listOfFires
end

function StopAFireZoneList(ZoneList)
    for i = 1, #ZoneList, 1 do
        EndAFire(ZoneList[i])
    end
end

