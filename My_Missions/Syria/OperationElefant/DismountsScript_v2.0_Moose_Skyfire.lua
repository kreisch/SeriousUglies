---------------------------------------
----  Dismounts Script  ----
---------------------------------------
--
--  v1.0 - 5. July 2013
--  By Marc "MBot" Marbot
--  v1.5 - 6. May 2017
--  Igneous01
--  Added counts/check for remaining alive units
--  Added support for flag (When flag is 2, unit is mounted, when flag is 1, unit is dismounted, when flag is 0, units are dead)
--
--  v2.0 09.2022 
--  Skyfire
--  Adapted to moose to fit there
--  Removed flag support
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  Control functions:
--
--  AddDismounts(UnitName, dm_type)
--    UnitName: string, name of group
--    dm_type: string, "MANPADS", "Mortar", "Rifle", "ZU-23"
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

do
  --Table that holds all ground units that carry mounted units
  local DismountsCarrier = {}

  local function InitDMUnits(dm_type, countryID, carrierUnitID)

    local result
    return result

  end

  --Function to add mounted units to a carrier
  -- _unit (UNIT) - name of the individual vehicle unit in ME (NOT GROUP NAME)
  -- dm_type (String) - type of mounted units to hold ("Rifle", "Mortar", "Manpad")
  function AddDismounts(_unit, dm_type) --Options for dm_type: "Rifle", "Mortar", "Manpad"
    for n = 1, #DismountsCarrier do
      if DismountsCarrier[n].unit == _unit then
        env.info("AddDismounts: " .. _unit:GetName() .. " is already registered.")
        return
      end
    end

    DismountsCarrier[#DismountsCarrier + 1] = {
      unit = _unit,     -- the unit to observe
      cargo_type = dm_type,  -- the dismount type to be spawned
      cargo_group = nil,  -- the spawned group
      cargo_status = "mounted",  -- the state of the dismount
      deadUnits = {}   -- the index of dead units of the dismount
    }

  end

  
  --Function to return the composition of the spawned group
  local function GetDmGroup(_unit)
    -- local dmVec2 = {                  --Determine the x,y Vec2 position of the dismounts (10m behind of the carrier)
    --   x = carrierPos.p.x + carrierPos.x.x * -10,
    --   y = carrierPos.p.z + carrierPos.x.z * -10,
    -- }
  end


  --function to check if the dismounts carriers are moving
  local function CheckMovement()
--    env.info("Dismounts CheckMovement...")

    for n = 1, #DismountsCarrier do
      local theUnit = DismountsCarrier[n].unit
      env.info("Dismounts Checking: " .. theUnit:GetName())

      if theUnit:IsAlive() == true then
        env.info("Unit OK: " .. theUnit:GetName())

        local velVec = theUnit:GetVelocityVec3() --Velocity is a Vec3
        env.info("Unit speed: velVec.x: " .. velVec.x .. ",velVec.y: " .. velVec.y .. ",velVec.z: " .. velVec.z)

        if velVec.x < 0.001 and velVec.y < 0.001 and velVec.z < 0.001 and
           velVec.x > -0.001 and velVec.y > -0.001 and velVec.z > -0.001 then  --Check if speed is zero
          env.info("Unit has stopped: " .. theUnit:GetName())

          if DismountsCarrier[n].cargo_status == "mounted" then
            env.info("Init dismounting of: " .. theUnit:GetName())

--            local carrierPos = theUnit:getPosition()
--            local group = GetDmGroup(theUnit)
            DismountsCarrier[n].cargo_status = "dismounted"
          end
        else  --Else carrier is moving
          env.info("Unit is moving: " .. theUnit:GetName())

          --Remount rifle squad only when speed bigger than 5.3 m/s (19 kph). Remount everyone else immediately when moving.
          if DismountsCarrier[n].cargo_status == "dismounted" then
            env.info("Unit is moving again, init mounting: " .. theUnit:GetName())

            DismountsCarrier[n].cargo_status = "mounted"
            
            -- local spawnedGroup = DismountsCarrier[n].cargo_group
            -- if spawnedGroup ~= nil and spawnedGroup:IsAlive() then  --Check if the group is still alive
            --   -- store dead units
            --   local numAlive = spawnedGroup:CountAliveUnits()
            --   env.info(numAlive .. " units still alive of " .. theUnit:GetName())
            -- else
            --   DismountsCarrier[n].cargo_status = "lost"
            --   DismountsCarrier[n].cargo_group = nil
            -- end
          end
        end
      else
        -- if DismountsCarrier[n].cargo_status ~= "lost" then
        --   local g = Group.getByName("Dismounts_" .. DismountsCarrier[n].UnitID)
        --   if g == nil then  --If mounted group is dead as well, raise handlers/flags
        --     DismountsCarrier[n].cargo_status = "lost"
        --   end
        -- end
      end
    end
    return timer.getTime() + 5
  end
  timer.scheduleFunction(CheckMovement, nil, timer.getTime() + 1)
end


local dismountTestUnit = GROUP:FindByName("Dismount_Test")

AddDismounts(dismountTestUnit:GetUnit(1), "DISM_RifleIns")