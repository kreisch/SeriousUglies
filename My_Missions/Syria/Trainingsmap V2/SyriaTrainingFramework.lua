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

function showDistanceToTankers(_client)
    local TankerSet = SET_GROUP:New():FilterPrefixes("Arco"):FilterPrefixes("Shell"):FilterPrefixes("Texaco"):FilterStart()
    local index = 1

    local clientName = "Kein Player"

    if _client:GetPlayer() then
        clientName = _client:GetPlayer()
    end

    trigger.action.outText("We have the following tanker for you:", 30)

    local distMap = {}

    if TankerSet:Count() > 0 then
        TankerSet:ForEachGroup(function(_group)

          -- Player position.
          local playerCoord=_client:GetClientGroupUnit():GetCoordinate()
            
          -- Distance.            
          local dist=_group:GetCoordinate():Get3DDistance(playerCoord) -- into KM
          local type_name = _group:GetUnits()[1]:GetTypeName()

          distMap[#distMap+1] = {_group, type_name, dist}
--          trigger.action.outText("Found: " .. _group:GetName() .. ", with distance: " .. UTILS.Round( UTILS.MetersToNM( dist ), 2 ) .. "NM", 60)
        end)
    else
        trigger.action.outText("No tanker found!", 60)
    end

    -- this uses an custom sorting function ordering by score descending
    table.sort(distMap, function (a, b) 
            if a[2] == b[2] then return a[3] < b[3] 
            else return a[2] > b[2] end
        end)

    local lastType = ""
    local messageStr = ""

    for i=1,#distMap do
      if distMap[i][2] ~= lastType then
          messageStr = messageStr .. "Type: " .. distMap[i][2] .. "\n"
--          trigger.action.outText("Type: " .. distMap[i][2], 30)
          lastType = distMap[i][2] 
      end

      local velocity =  UTILS.Round(distMap[i][1]:GetVelocityKNOTS(), 0)
      local altitude =  UTILS.Round(UTILS.MetersToFeet(distMap[i][1]:GetHeight()), 0)

      messageStr = messageStr .. distMap[i][1]:GetName() .. ", distance: " .. UTILS.Round( UTILS.MetersToNM( distMap[i][3] ), 2 ) .. "NM, speed: " .. velocity .. "kts, alt: " .. altitude .. "ft\n"
--      trigger.action.outText(distMap[i][1]:GetName() .. ", distance: " .. UTILS.Round( UTILS.MetersToNM( distMap[i][3] ), 2 ) .. "NM, speed:" .. velocity .. "kts, alt:" .. altitude .. "ft", 30)
    end

    if messageStr ~= "" then
        trigger.action.outText(messageStr, 30)
    end
end

ClientSet = SET_CLIENT:New()
                      :FilterOnce()

function SetEventHandler()
    ClientBirth = ClientSet:HandleEvent(EVENTS.PlayerEnterAircraft)
end

function ClientSet:OnEventPlayerEnterAircraft(event_data)
    local unit_name = event_data.IniUnitName
    local client = CLIENT:FindByName(unit_name)
    local client_name = client:GetPlayer()

    env.info("Client connected!")
    env.info(unit_name)

    MESSAGE:New("Welcome, " .. client_name):ToClient(client)

    MenuTankerHelper           = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Show Me The Tanker", nil, showDistanceToTankers, client)
end

SetEventHandler()

