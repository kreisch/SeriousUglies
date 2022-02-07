---------------------------------------
----  Dismounts Scrip  ----
---------------------------------------
--
--  v1.0 - 5. July 2013
--  By Marc "MBot" Marbot
--  v1.5 - 6. May 2017
--  Igneous01
--  Added counts/check for remaining alive units
--  Added support for flag (When flag is 2, unit is mounted, when flag is 1, unit is dismounted, when flag is 0, units are dead)
--
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  Control functions:
--
--  AddDismounts(UnitName, dm_type)
--    UnitName: string, name of group
--    dm_type: string, "MANPADS", "Mortar", "Rifle", "ZU-23"
--    uflag (Optional, Number) - Mission Editor Flag number to set
--      When Units are dismounted, flag will be set to '1'
--      When Units are mounted, flag will be set to '2'
--      When units are dead, flag will be set to '0')
--      Default is -1 (no flag)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

do
  --Table that holds all ground units that carry mounted units
  local DismountsCarrier = {}

  local function deepCopyTable(object)
    local lookup_table = {}
    local function _copy(object)
      if type(object) ~= "table" then
        return object
      elseif lookup_table[object] then
        return lookup_table[object]
      end
      local new_table = {}
      lookup_table[object] = new_table
      for index, value in pairs(object) do
        new_table[_copy(index)] = _copy(value)
      end
      return setmetatable(new_table, getmetatable(object))
    end
    return _copy(object)
  end

  local function GetCoalitionCountry(countryID)
    if countryID == 0 or countryID == 1 or countryID == 16 or countryID == 17 or countryID == 18 or countryID == 19 then
      return "EAST"
    else
      return "WEST"
    end
  end

  local function InitDMUnits(dm_type, countryID, carrierUnitID)
    result = {}
    if dm_type == "MANPADS" then
      if GetCoalitionCountry(countryID) == "EAST" then
        result =
          {
            [1] =
            {
              ["y"] = 0,
              ["type"] = "SA-18 Igla-S manpad",
              ["name"] = "hpriority1 Dismounts_" .. carrierUnitID .. "_01",
              ["unitId"] = carrierUnitID + 10000,
              ["heading"] = 0,
              ["playerCanDrive"] = true,
              ["skill"] = "Random",
              ["x"] = 0,
            }, -- end of [1]
            [2] =
            {
              ["y"] = 0,
              ["type"] = "SA-18 Igla-S comm",
              ["name"] = "Dismounts_" .. carrierUnitID .. "_02",
              ["unitId"] = carrierUnitID + 11000,
              ["heading"] = 0,
              ["playerCanDrive"] = true,
              ["skill"] = "Random",
              ["x"] = 0,
            }, -- end of [2]
          }
      else
        result =
          {
            [1] =
            {
              ["y"] = 0,
              ["type"] = "Stinger manpad",
              ["name"] = "Dismounts_" .. carrierUnitID .. "_01",
              ["unitId"] = carrierUnitID + 23000,
              ["heading"] = 0,
              ["playerCanDrive"] = true,
              ["skill"] = "Random",
              ["x"] = 0,
            }, -- end of [1]
            [2] =
            {
              ["y"] = 0,
              ["type"] = "Stinger comm",
              ["name"] = "Dismounts_" .. carrierUnitID .. "_02",
              ["unitId"] = carrierUnitID + 24000,
              ["heading"] = 0,
              ["playerCanDrive"] = true,
              ["skill"] = "Random",
              ["x"] = 0,
            }, -- end of [2]
          }
      end
    elseif dm_type == "Mortar" then
      if GetCoalitionCountry(countryID) == "EAST" then
        result =
          {
            [1] =
            {
              ["y"] = 0,
              ["type"] = "2B11 mortar",
              ["name"] = "Dismounts_" .. carrierUnitID .. "_01",
              ["unitId"] = carrierUnitID + 12000,
              ["heading"] = 0,
              ["playerCanDrive"] = true,
              ["skill"] = "Random",
              ["x"] = 0,
            }, -- end of [1]
            [2] =
            {
              ["y"] = 0,
              ["type"] = "Infantry AK",
              ["name"] = "Dismounts_" .. carrierUnitID .. "_02",
              ["unitId"] = carrierUnitID + 13000,
              ["heading"] = 0,
              ["playerCanDrive"] = true,
              ["skill"] = "Random",
              ["x"] = 0,
            }, -- end of [2]
            [3] =
            {
              ["y"] = 0,
              ["type"] = "Infantry AK",
              ["name"] = "Dismounts_" .. carrierUnitID .. "_03",
              ["unitId"] = carrierUnitID + 14000,
              ["heading"] = 0,
              ["playerCanDrive"] = true,
              ["skill"] = "Random",
              ["x"] = 0,
            }, -- end of [3]
          }
      else
        result =
          {
            [1] =
            {
              ["y"] = 0,
              ["type"] = "2B11 mortar",
              ["name"] = "Dismounts_" .. carrierUnitID .. "_01",
              ["unitId"] = carrierUnitID + 25000,
              ["heading"] = 0,
              ["playerCanDrive"] = true,
              ["skill"] = "Random",
              ["x"] = 0,
            }, -- end of [1]
            [2] =
            {
              ["y"] = 0,
              ["type"] = "Soldier M4",
              ["name"] = "Dismounts_" .. carrierUnitID .. "_02",
              ["unitId"] = carrierUnitID + 26000,
              ["heading"] = 0,
              ["playerCanDrive"] = true,
              ["skill"] = "Random",
              ["x"] = 0,
            }, -- end of [2]
            [3] =
            {
              ["y"] = 0,
              ["type"] = "Soldier M4",
              ["name"] = "Dismounts_" .. carrierUnitID .. "_03",
              ["unitId"] = carrierUnitID + 27000,
              ["heading"] = 0,
              ["playerCanDrive"] = true,
              ["skill"] = "Random",
              ["x"] = 0,
            }
          }
      end
    elseif dm_type == "Rifle" then
      if GetCoalitionCountry(countryID) == "EAST" then
        result =
          {
            [1] =
            {
              ["y"] = 0,
              ["type"] = "Infantry AK",
              ["name"] = "Dismounts_" .. carrierUnitID .. "_01",
              ["unitId"] = carrierUnitID + 15000,
              ["heading"] = 0,
              ["playerCanDrive"] = true,
              ["skill"] = "Random",
              ["x"] = 0,
            }, -- end of [1]
            [2] =
            {
              ["y"] = 0,
              ["type"] = "Paratrooper RPG-16",
              ["name"] = "priority1 Dismounts_" .. carrierUnitID .. "_02",
              ["unitId"] = carrierUnitID + 16000,
              ["heading"] = 0,
              ["playerCanDrive"] = true,
              ["skill"] = "Random",
              ["x"] = 0,
            }, -- end of [2]
            [3] =
            {
              ["y"] = 0,
              ["type"] = "Infantry AK",
              ["name"] = "Dismounts_" .. carrierUnitID .. "_03",
              ["unitId"] = carrierUnitID + 17000,
              ["heading"] = 0,
              ["playerCanDrive"] = true,
              ["skill"] = "Random",
              ["x"] = 0,
            }, -- end of [3]
            [4] =
            {
              ["y"] = 0,
              ["type"] = "Infantry AK",
              ["name"] = "Dismounts_" .. carrierUnitID .. "_04",
              ["unitId"] = carrierUnitID + 18000,
              ["heading"] = 0,
              ["playerCanDrive"] = true,
              ["skill"] = "Random",
              ["x"] = 0,
            }, -- end of [4]
            [5] =
            {
              ["y"] = 0,
              ["type"] = "Infantry AK",
              ["name"] = "Dismounts_" .. carrierUnitID .. "_05",
              ["unitId"] = carrierUnitID + 19000,
              ["heading"] = 0,
              ["playerCanDrive"] = true,
              ["skill"] = "Random",
              ["x"] = 0,
            }, -- end of [5]
            [6] =
            {
              ["y"] = 0,
              ["type"] = "Infantry AK",
              ["name"] = "Dismounts_" .. carrierUnitID .. "_06",
              ["unitId"] = carrierUnitID + 20000,
              ["heading"] = 0,
              ["playerCanDrive"] = true,
              ["skill"] = "Random",
              ["x"] = 0,
            }, -- end of [6]
            [7] =
            {
              ["y"] = 0,
              ["type"] = "Infantry AK",
              ["name"] = "Dismounts_" .. carrierUnitID .. "_07",
              ["unitId"] = carrierUnitID + 21000,
              ["heading"] = 0,
              ["playerCanDrive"] = true,
              ["skill"] = "Random",
              ["x"] = 0,
            }, -- end of [7]
          }
      else
        result =
          {
            [1] =
            {
              ["y"] = 0,
              ["type"] = "Soldier M4",
              ["name"] = "Dismounts_" .. carrierUnitID .. "_01",
              ["unitId"] = carrierUnitID + 28000,
              ["heading"] = 0,
              ["playerCanDrive"] = true,
              ["skill"] = "Excellent",
              ["x"] = 0,
            }, -- end of [1]
            [2] =
            {
              ["y"] = 0,
              ["type"] = "Soldier M4",
              ["name"] = "Dismounts_" .. carrierUnitID .. "_02",
              ["unitId"] = carrierUnitID + 29000,
              ["heading"] = 0,
              ["playerCanDrive"] = true,
              ["skill"] = "Excellent",
              ["x"] = 0,
            }, -- end of [2]
            [3] =
            {
              ["y"] = 0,
              ["type"] = "Soldier M4",
              ["name"] = "Dismounts_" .. carrierUnitID .. "_03",
              ["unitId"] = carrierUnitID + 30000,
              ["heading"] = 0,
              ["playerCanDrive"] = true,
              ["skill"] = "Excellent",
              ["x"] = 0,
            }, -- end of [3]
            [4] =
            {
              ["y"] = 0,
              ["type"] = "Soldier M249",
              ["name"] = "Dismounts_" .. carrierUnitID .. "_04",
              ["unitId"] = carrierUnitID + 31000,
              ["heading"] = 0,
              ["playerCanDrive"] = true,
              ["skill"] = "Excellent",
              ["x"] = 0,
            }, -- end of [4]
            [5] =
            {
              ["y"] = 0,
              ["type"] = "Soldier M249",
              ["name"] = "Dismounts_" .. carrierUnitID .. "_05",
              ["unitId"] = carrierUnitID + 32000,
              ["heading"] = 0,
              ["playerCanDrive"] = true,
              ["skill"] = "Excellent",
              ["x"] = 0,
            }, -- end of [5]
            [6] =
            {
              ["y"] = 0,
              ["type"] = "Soldier M4",
              ["name"] = "Dismounts_" .. carrierUnitID .. "_06",
              ["unitId"] = carrierUnitID + 33000,
              ["heading"] = 0,
              ["playerCanDrive"] = true,
              ["skill"] = "Excellent",
              ["x"] = 0,
            }, -- end of [6]
          }
      end







    elseif dm_type == "RifleINS" then
      result =
        {
          [1] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK Ins",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_01",
            ["unitId"] = carrierUnitID + 37000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Excellent",
            ["x"] = 0,
          }, -- end of [1]
          [2] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK Ins",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_02",
            ["unitId"] = carrierUnitID + 38000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Excellent",
            ["x"] = 0,
          }, -- end of [2]
          [3] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK Ins",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_03",
            ["unitId"] = carrierUnitID + 39000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Excellent",
            ["x"] = 0,
          }, -- end of [3]
          [4] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK Ins",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_04",
            ["unitId"] = carrierUnitID + 40000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Excellent",
            ["x"] = 0,
          }, -- end of [4]
          [5] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK Ins",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_05",
            ["unitId"] = carrierUnitID + 41000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Excellent",
            ["x"] = 0,
          }, -- end of [5]
          [6] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK Ins",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_06",
            ["unitId"] = carrierUnitID + 42000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Excellent",
            ["x"] = 0,
          }, -- end of [6]
        }
















    elseif dm_type == "TeamINS" then
      result =
        {
          [1] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK Ins",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_01",
            ["unitId"] = carrierUnitID + 99000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Excellent",
            ["x"] = 0,
          }, -- end of [1]
          [2] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK Ins",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_02",
            ["unitId"] = carrierUnitID + 98000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Excellent",
            ["x"] = 0,
          }, -- end of [2]
          [3] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK Ins",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_03",
            ["unitId"] = carrierUnitID + 97000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Excellent",
            ["x"] = 0,
          }, -- end of [3]
          [4] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK Ins",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_04",
            ["unitId"] = carrierUnitID + 96000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Excellent",
            ["x"] = 0,
          }, -- end of [4]
        }















    elseif dm_type == "RifleRTG" then
      result =
        {
          [1] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_01",
            ["unitId"] = carrierUnitID + 43000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [1]
          [2] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_02",
            ["unitId"] = carrierUnitID + 44000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [2]
          [3] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_03",
            ["unitId"] = carrierUnitID + 45000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [3]
          [4] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_04",
            ["unitId"] = carrierUnitID + 46000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [4]
          [5] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_05",
            ["unitId"] = carrierUnitID + 47000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [5]
          [6] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_06",
            ["unitId"] = carrierUnitID + 48000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [6]
        }








    elseif dm_type == "TeamRTG" then
      result =
        {
          [1] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_01",
            ["unitId"] = carrierUnitID + 49000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [1]
          [2] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_02",
            ["unitId"] = carrierUnitID + 50000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [2]
          [3] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_03",
            ["unitId"] = carrierUnitID + 51000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [3]
          [4] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_04",
            ["unitId"] = carrierUnitID + 52000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [4]
        }
        
        
        
        
        
        
        
        
        
        
            elseif dm_type == "CrewRTG" then
      result =
        {
          [1] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_01",
            ["unitId"] = carrierUnitID + 49100,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [1]
          [2] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_02",
            ["unitId"] = carrierUnitID + 50100,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [2]
        }








    elseif dm_type == "TeamRTGAT" then
      result =
        {
          [1] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_01",
            ["unitId"] = carrierUnitID + 53000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [1]
          [2] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_02",
            ["unitId"] = carrierUnitID + 54000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [2]
          [3] =
          {
            ["y"] = 0,
            ["type"] = "Paratrooper RPG-16",
            ["name"] = "priority1 Dismounts_" .. carrierUnitID .. "_03",
            ["unitId"] = carrierUnitID + 55000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [3]
          [4] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_04",
            ["unitId"] = carrierUnitID + 56000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [4]
        }
        
        
        
        
        
        
    elseif dm_type == "TeamRTGAA" then
      result =
        {
          [1] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_01",
            ["unitId"] = carrierUnitID + 53000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [1]
          [2] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_02",
            ["unitId"] = carrierUnitID + 54000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [2]
          [3] =
          {
            ["y"] = 0,
            ["type"] = "SA-18 Igla-S manpad",
            ["name"] = "hpriority1 Dismounts_" .. carrierUnitID .. "_03",
            ["unitId"] = carrierUnitID + 55000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [3]
          [4] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_04",
            ["unitId"] = carrierUnitID + 56000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [4]
        }







    elseif dm_type == "PlatoonRTG" then
      result =
        {
          [1] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_01",
            ["unitId"] = carrierUnitID + 57000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [1]
          [2] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_02",
            ["unitId"] = carrierUnitID + 58000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [2]
          [3] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_03",
            ["unitId"] = carrierUnitID + 59000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [3]
          [4] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_04",
            ["unitId"] = carrierUnitID + 60000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [4]
          [5] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_05",
            ["unitId"] = carrierUnitID + 61000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [5]
          [6] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_06",
            ["unitId"] = carrierUnitID + 62000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [6]
          [7] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_07",
            ["unitId"] = carrierUnitID + 63000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [7]
          [8] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_08",
            ["unitId"] = carrierUnitID + 64000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [8]
          [9] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_09",
            ["unitId"] = carrierUnitID + 65000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [9]
          [10] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_010",
            ["unitId"] = carrierUnitID + 66000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [10]
          [11] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_011",
            ["unitId"] = carrierUnitID + 67000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [11]
          [12] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_012",
            ["unitId"] = carrierUnitID + 68000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [12]
        }
        
        
        
        
        
        
        




    elseif dm_type == "PlatoonRTGAT" then
      result =
        {
          [1] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_01",
            ["unitId"] = carrierUnitID + 69000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [1]
          [2] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_02",
            ["unitId"] = carrierUnitID + 70000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [2]
          [3] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_03",
            ["unitId"] = carrierUnitID + 71000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [3]
          [4] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_04",
            ["unitId"] = carrierUnitID + 72000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [4]
          [5] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_05",
            ["unitId"] = carrierUnitID + 73000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [5]
          [6] =
          {
            ["y"] = 0,
            ["type"] = "Paratrooper RPG-16",
            ["name"] = "priority1 Dismounts_" .. carrierUnitID .. "_06",
            ["unitId"] = carrierUnitID + 74000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [6]
          [7] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_07",
            ["unitId"] = carrierUnitID + 75000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [7]
          [8] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_08",
            ["unitId"] = carrierUnitID + 76000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [8]
          [9] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_09",
            ["unitId"] = carrierUnitID + 77000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [9]
          [10] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_010",
            ["unitId"] = carrierUnitID + 78000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [10]
          [11] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_011",
            ["unitId"] = carrierUnitID + 79000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [11]
          [12] =
          {
            ["y"] = 0,
            ["type"] = "Paratrooper RPG-16",
            ["name"] = "priority1 Dismounts_" .. carrierUnitID .. "_012",
            ["unitId"] = carrierUnitID + 80000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [12]
        }







    elseif dm_type == "PlatoonRTGAA" then
      result =
        {
          [1] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_01",
            ["unitId"] = carrierUnitID + 69000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [1]
          [2] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_02",
            ["unitId"] = carrierUnitID + 70000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [2]
          [3] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_03",
            ["unitId"] = carrierUnitID + 71000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [3]
          [4] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_04",
            ["unitId"] = carrierUnitID + 72000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [4]
          [5] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_05",
            ["unitId"] = carrierUnitID + 73000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [5]
          [6] =
          {
            ["y"] = 0,
            ["type"] = "SA-18 Igla-S manpad",
            ["name"] = "hpriority1 Dismounts_" .. carrierUnitID .. "_06",
            ["unitId"] = carrierUnitID + 74000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [6]
          [7] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_07",
            ["unitId"] = carrierUnitID + 75000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [7]
          [8] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_08",
            ["unitId"] = carrierUnitID + 76000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [8]
          [9] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_09",
            ["unitId"] = carrierUnitID + 77000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [9]
          [10] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_010",
            ["unitId"] = carrierUnitID + 78000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [10]
          [11] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_011",
            ["unitId"] = carrierUnitID + 79000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [11]
          [12] =
          {
            ["y"] = 0,
            ["type"] = "Paratrooper RPG-16",
            ["name"] = "priority1 Dismounts_" .. carrierUnitID .. "_012",
            ["unitId"] = carrierUnitID + 80000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [12]
        }
        
        
        
        
        














    elseif dm_type == "RifleRTGAT" then
      result =
        {
          [1] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_01",
            ["unitId"] = carrierUnitID + 81000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [1]
          [2] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_02",
            ["unitId"] = carrierUnitID + 82000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [2]
          [3] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_03",
            ["unitId"] = carrierUnitID + 83000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [3]
          [4] =
          {
            ["y"] = 0,
            ["type"] = "Paratrooper RPG-16",
            ["name"] = "priority1 Dismounts_" .. carrierUnitID .. "_04",
            ["unitId"] = carrierUnitID + 84000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [4]
          [5] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_05",
            ["unitId"] = carrierUnitID + 85000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [5]
          [6] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_06",
            ["unitId"] = carrierUnitID + 86000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [6]
        }











   elseif dm_type == "RifleRTGAA" then
      result =
        {
          [1] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_01",
            ["unitId"] = carrierUnitID + 81000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [1]
          [2] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_02",
            ["unitId"] = carrierUnitID + 82000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [2]
          [3] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_03",
            ["unitId"] = carrierUnitID + 83000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [3]
          [4] =
          {
            ["y"] = 0,
            ["type"] = "SA-18 Igla-S manpad",
            ["name"] = "hpriority1 Dismounts_" .. carrierUnitID .. "_04",
            ["unitId"] = carrierUnitID + 84000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [4]
          [5] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_05",
            ["unitId"] = carrierUnitID + 85000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [5]
          [6] =
          {
            ["y"] = 0,
            ["type"] = "Infantry AK",
            ["name"] = "Dismounts_" .. carrierUnitID .. "_06",
            ["unitId"] = carrierUnitID + 86000,
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["skill"] = "Random",
            ["x"] = 0,
          }, -- end of [6]
        }









    elseif dm_type == "ZU-23" then
      if GetCoalitionCountry(countryID) == "EAST" then
        result =
          {
            [1] =
            {
              ["y"] = 0,
              ["type"] = "ZU-23 Emplacement",
              ["name"] = "Dismounts_" .. carrierUnitID .. "_01",
              ["unitId"] = carrierUnitID + 22000,
              ["heading"] = 0,
              ["playerCanDrive"] = true,
              ["skill"] = "Random",
              ["x"] = 0,
            }, -- end of [1]
          }
      else
        result =
          {
            [1] =
            {
              ["y"] = 0,
              ["type"] = "ZU-23 Emplacement",
              ["name"] = "Dismounts_" .. carrierUnitID .. "_01",
              ["unitId"] = carrierUnitID + 35000,
              ["heading"] = 0,
              ["playerCanDrive"] = true,
              ["skill"] = "Random",
              ["x"] = 0,
            }, -- end of [1]
          }
      end
    end
    return result
  end

  local function UpdateUnitCoordinates(unitTable, dmVec2)
    for i = 1, #unitTable do
      unitTable[i].x = dmVec2.x + i
      unitTable[i].y = dmVec2.y - i
    end
    return unitTable
  end

  --Function to add mounted units to a carrier
  --UnitName (String) - name of the individual vehicle unit in ME (NOT GROUP NAME)
  --dm_type (String) - type of mounted units to hold ("MANPADS", "Mortar", "Rifle", "ZU-23")
  --uflag (Optional, Number) - Mission Editor Flag number to set
  --When Units are dismounted, flag will be set to '1'
  --When Units are mounted, flag will be set to '2'
  --When units are dead, flag will be set to '0')
  --Default is nil
  function AddDismounts(UnitName, dm_type, uflag) --Options for dm_type: "MANPADS", "Mortar", "Rifle", "ZU-23"
    local f = -1
    if uflag ~= nil then
      f = uflag
      trigger.action.setUserFlag(f, 2)
    end
    DismountsCarrier[#DismountsCarrier + 1] = {
      name = UnitName,
      --countryID = Unit.getByName(UnitName):getCountry(),
      countryID = country.id.RUSSIA,
      UnitID = Unit.getByName(UnitName):getID(),
      cargo = dm_type,
      cargo_status = "mounted",
      units = InitDMUnits(dm_type, Unit.getByName(UnitName):getCountry(), Unit.getByName(UnitName):getID()),
      flag = f
    }

  end


  --Function go get a unit heading
  local function GetHeading(Pos3)
    if (Pos3.x.x > 0) and (Pos3.x.z == 0) then
      return 0
    elseif (Pos3.x.x > 0) and (Pos3.x.z > 0) then
      return math.atan(Pos3.x.z / Pos3.x.x)
    elseif (Pos3.x.x == 0) and (Pos3.x.z > 0) then
      return math.rad(90)
    elseif (Pos3.x.x < 0) and (Pos3.x.z > 0) then
      return math.rad(90) - math.atan(Pos3.x.x / Pos3.x.z)
    elseif (Pos3.x.x < 0) and (Pos3.x.z == 0) then
      return math.rad(180)
    elseif (Pos3.x.x < 0) and (Pos3.x.z < 0) then
      return math.rad(180) + math.atan(Pos3.x.z / Pos3.x.x)
    elseif (Pos3.x.x == 0) and (Pos3.x.z < 0) then
      return math.rad(270)
    elseif (Pos3.x.x > 0) and (Pos3.x.z < 0) then
      return math.rad(270) - math.atan(Pos3.x.x / Pos3.x.z)
    end
  end


  --Repeating function to steer dismounted rifle squads
  local function SetRifleWaypoint(CarrierUnitName, DMGroupName)
    local function ScheduledFunction()
      local rifle = Group.getByName(DMGroupName)
      if rifle ~= nil then
        local rifle_leader = rifle:getUnit(1)
        if rifle_leader ~= nil then
          local rifle_leader_point = rifle_leader:getPoint()  --Get current position of the rifle leader for the first waypoint
          local rifle_controller = rifle:getController()  --Get controller of the rifle group for the waypoint task
          local carrier = Unit.getByName(CarrierUnitName)
          if carrier ~= nil then
            local carrier_pos = carrier:getPosition() --Get current position of the carrier for the second waypoint (100m in front of carrier)
            GoToTask = {
              id = 'Mission',
              params = {
                route = {
                  points = {
                    [1] = {
                      action = "Custom",
                      x = rifle_leader_point.x, --Current position of rifle leader
                      y = rifle_leader_point.z, --Current position of rifle leader
                      speed = 3.8888888888889,
                      ETA = 0,
                      ETA_locked = false,
                      name = "",
                      task = {
                        ["id"] = "ComboTask",
                        ["params"] =
                        {
                          ["tasks"] =
                          {
                          }, -- end of ["tasks"]
                        }, -- end of ["params"]
                      },
                    },
                    [2] = {
                      action = "Custom",
                      x = carrier_pos.p.x + carrier_pos.x.x * -10,  --100m in front of carrier
                      y = carrier_pos.p.z + carrier_pos.x.z * -10,  --100m in front of carrier
                      speed = 3.8888888888889,
                      ETA = 0,
                      ETA_locked = false,
                      name = "",
                      task = {
                        ["id"] = "ComboTask",
                        ["params"] =
                        {
                          ["tasks"] =
                          {
                          }, -- end of ["tasks"]
                        }, -- end of ["params"]
                      }
                    }
                  }
                }
              }
            }
            Controller.setTask(rifle_controller, GoToTask)
            return timer.getTime() + 15 --Repeat after 15 seconds, until rifle_leader is not existing anymore
          end
        end
      end
    end
    timer.scheduleFunction(ScheduledFunction, nil, timer.getTime() + 15)
  end


  --Function to return the composition of the spawned group
  local function GetDmGroup(countryID, carrierUnitID, carrierPos, dmType, CarrierUnitName, carrierUnits)
    local dmVec2 = {                  --Determine the x,y Vec2 position of the dismounts (10m behind of the carrier)
      x = carrierPos.p.x + carrierPos.x.x * -10,
      y = carrierPos.p.z + carrierPos.x.z * -10,
    }
    local heading = GetHeading(carrierPos)  --Get heading of the carrier when dismounting
    if GetCoalitionCountry(countryID) == "EAST" then  --If eastern country
      if dmType == "MANPADS" then   --If MANPADS
        local group = {
          ["visible"] = false,
          ["route"] =
          {
            ["spans"] =
            {
            }, -- end of ["spans"]
            ["points"] =
            {
              [1] =
              {
                ["alt"] = 0,
                ["type"] = "Turning Point",
                ["ETA"] = 0,
                ["alt_type"] = "BARO",
                ["formation_template"] = "",
                ["y"] = dmVec2.y,
                ["x"] = dmVec2.x,
                ["ETA_locked"] = true,
                ["speed"] = 5.5555555555556,
                ["action"] = "Off Road",
                ["task"] =
                {
                  ["id"] = "ComboTask",
                  ["params"] =
                  {
                    ["tasks"] =
                    {
                    }, -- end of ["tasks"]
                  }, -- end of ["params"]
                }, -- end of ["task"]
                ["speed_locked"] = true,
              }, -- end of [1]
            }, -- end of ["points"]
          }, -- end of ["route"]
          ["groupId"] = carrierUnitID + 10000,
          ["tasks"] =
          {
          }, -- end of ["tasks"]
          ["hidden"] = true,
          ["units"] = UpdateUnitCoordinates(carrierUnits, dmVec2), -- end of ["units"]
          ["y"] = dmVec2.y,
          ["x"] = dmVec2.x,
          ["name"] = "Dismounts_" .. carrierUnitID,
          ["start_time"] = 0,
          ["task"] = "Ground Nothing",
        }
      return group
    elseif dmType == "Mortar" then  --If Mortar
      local group = {
        ["visible"] = false,
        ["route"] =
        {
          ["spans"] =
          {
          }, -- end of ["spans"]
          ["points"] =
          {
            [1] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = dmVec2.y,
              ["x"] = dmVec2.x,
              ["ETA_locked"] = true,
              ["speed"] = 5.5555555555556,
              ["action"] = "Off Road",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [1]
          }, -- end of ["points"]
        }, -- end of ["route"]
        ["groupId"] = carrierUnitID + 10000,
        ["tasks"] =
        {
        }, -- end of ["tasks"]
        ["hidden"] = true,
        ["units"] = UpdateUnitCoordinates(carrierUnits, dmVec2), -- end of ["units"]
        ["y"] = dmVec2.y,
        ["x"] = dmVec2.x,
        ["name"] = "Dismounts_" .. carrierUnitID,
        ["start_time"] = 0,
        ["task"] = "Ground Nothing",
      }
    return group
    elseif dmType == "Rifle" then   --If rifle squad
      local group = {
        ["visible"] = false,
        ["route"] =
        {
          ["spans"] =
          {
          }, -- end of ["spans"]
          ["points"] =
          {
            [1] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = dmVec2.y,
              ["x"] = dmVec2.x,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [1]
            [2] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = carrierPos.p.z + carrierPos.x.z * 100,
              ["x"] = carrierPos.p.x + carrierPos.x.x * 100,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [2]
          }, -- end of ["points"]
        }, -- end of ["route"]
        ["groupId"] = carrierUnitID + 10000,
        ["tasks"] =
        {
        }, -- end of ["tasks"]
        ["hidden"] = true,
        ["units"] = UpdateUnitCoordinates(carrierUnits, dmVec2), -- end of ["units"]
        ["y"] = dmVec2.y,
        ["x"] = dmVec2.x,
        ["name"] = "Dismounts_" .. carrierUnitID,
        ["start_time"] = 0,
        ["task"] = "Ground Nothing",
      }
    SetRifleWaypoint(CarrierUnitName, "Dismounts_" .. carrierUnitID)  --Launch scheduled function to refresh the wayoint of the dismounted group
    return group




    elseif dmType == "RifleINS" then   --If rifle squad
      local group = {
        ["visible"] = false,
        ["route"] =
        {
          ["spans"] =
          {
          }, -- end of ["spans"]
          ["points"] =
          {
            [1] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = dmVec2.y,
              ["x"] = dmVec2.x,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [1]
            [2] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = carrierPos.p.z + carrierPos.x.z * 100,
              ["x"] = carrierPos.p.x + carrierPos.x.x * 100,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [2]
          }, -- end of ["points"]
        }, -- end of ["route"]
        ["groupId"] = carrierUnitID + 10000,
        ["tasks"] =
        {
        }, -- end of ["tasks"]
        ["hidden"] = true,
        ["units"] = UpdateUnitCoordinates(carrierUnits, dmVec2), -- end of ["units"]
        ["y"] = dmVec2.y,
        ["x"] = dmVec2.x,
        ["name"] = "Dismounts_" .. carrierUnitID,
        ["start_time"] = 0,
        ["task"] = "Ground Nothing",
      }
    SetRifleWaypoint(CarrierUnitName, "Dismounts_" .. carrierUnitID)  --Launch scheduled function to refresh the wayoint of the dismounted group
    return group







    elseif dmType == "TeamINS" then   --If rifle squad
      local group = {
        ["visible"] = false,
        ["route"] =
        {
          ["spans"] =
          {
          }, -- end of ["spans"]
          ["points"] =
          {
            [1] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = dmVec2.y,
              ["x"] = dmVec2.x,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [1]
            [2] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = carrierPos.p.z + carrierPos.x.z * 100,
              ["x"] = carrierPos.p.x + carrierPos.x.x * 100,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [2]
          }, -- end of ["points"]
        }, -- end of ["route"]
        ["groupId"] = carrierUnitID + 10000,
        ["tasks"] =
        {
        }, -- end of ["tasks"]
        ["hidden"] = true,
        ["units"] = UpdateUnitCoordinates(carrierUnits, dmVec2), -- end of ["units"]
        ["y"] = dmVec2.y,
        ["x"] = dmVec2.x,
        ["name"] = "Dismounts_" .. carrierUnitID,
        ["start_time"] = 0,
        ["task"] = "Ground Nothing",
      }
    SetRifleWaypoint(CarrierUnitName, "Dismounts_" .. carrierUnitID)  --Launch scheduled function to refresh the wayoint of the dismounted group
    return group











    elseif dmType == "RifleRTG" then   --If rifle squad
      local group = {
        ["visible"] = false,
        ["route"] =
        {
          ["spans"] =
          {
          }, -- end of ["spans"]
          ["points"] =
          {
            [1] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = dmVec2.y,
              ["x"] = dmVec2.x,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [1]
            [2] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = carrierPos.p.z + carrierPos.x.z * 100,
              ["x"] = carrierPos.p.x + carrierPos.x.x * 100,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [2]
          }, -- end of ["points"]
        }, -- end of ["route"]
        ["groupId"] = carrierUnitID + 10000,
        ["tasks"] =
        {
        }, -- end of ["tasks"]
        ["hidden"] = true,
        ["units"] = UpdateUnitCoordinates(carrierUnits, dmVec2), -- end of ["units"]
        ["y"] = dmVec2.y,
        ["x"] = dmVec2.x,
        ["name"] = "Dismounts_" .. carrierUnitID,
        ["start_time"] = 0,
        ["task"] = "Ground Nothing",
      }
    SetRifleWaypoint(CarrierUnitName, "Dismounts_" .. carrierUnitID)  --Launch scheduled function to refresh the wayoint of the dismounted group
    return group
















    elseif dmType == "TeamRTG" then   --If rifle squad
      local group = {
        ["visible"] = false,
        ["route"] =
        {
          ["spans"] =
          {
          }, -- end of ["spans"]
          ["points"] =
          {
            [1] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = dmVec2.y,
              ["x"] = dmVec2.x,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [1]
            [2] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = carrierPos.p.z + carrierPos.x.z * 100,
              ["x"] = carrierPos.p.x + carrierPos.x.x * 100,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [2]
          }, -- end of ["points"]
        }, -- end of ["route"]
        ["groupId"] = carrierUnitID + 10000,
        ["tasks"] =
        {
        }, -- end of ["tasks"]
        ["hidden"] = true,
        ["units"] = UpdateUnitCoordinates(carrierUnits, dmVec2), -- end of ["units"]
        ["y"] = dmVec2.y,
        ["x"] = dmVec2.x,
        ["name"] = "Dismounts_" .. carrierUnitID,
        ["start_time"] = 0,
        ["task"] = "Ground Nothing",
      }
    SetRifleWaypoint(CarrierUnitName, "Dismounts_" .. carrierUnitID)  --Launch scheduled function to refresh the wayoint of the dismounted group
    return group
    
    
    
    
    
    
    
    
    
    
    
    
        elseif dmType == "CrewRTG" then   --If rifle squad
      local group = {
        ["visible"] = false,
        ["route"] =
        {
          ["spans"] =
          {
          }, -- end of ["spans"]
          ["points"] =
          {
            [1] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = dmVec2.y,
              ["x"] = dmVec2.x,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [1]
            [2] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = carrierPos.p.z + carrierPos.x.z * 100,
              ["x"] = carrierPos.p.x + carrierPos.x.x * 100,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [2]
          }, -- end of ["points"]
        }, -- end of ["route"]
        ["groupId"] = carrierUnitID + 10000,
        ["tasks"] =
        {
        }, -- end of ["tasks"]
        ["hidden"] = true,
        ["units"] = UpdateUnitCoordinates(carrierUnits, dmVec2), -- end of ["units"]
        ["y"] = dmVec2.y,
        ["x"] = dmVec2.x,
        ["name"] = "Dismounts_" .. carrierUnitID,
        ["start_time"] = 0,
        ["task"] = "Ground Nothing",
      }
    SetRifleWaypoint(CarrierUnitName, "Dismounts_" .. carrierUnitID)  --Launch scheduled function to refresh the wayoint of the dismounted group
    return group









    elseif dmType == "TeamRTGAT" then   --If rifle squad
      local group = {
        ["visible"] = false,
        ["route"] =
        {
          ["spans"] =
          {
          }, -- end of ["spans"]
          ["points"] =
          {
            [1] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = dmVec2.y,
              ["x"] = dmVec2.x,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [1]
            [2] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = carrierPos.p.z + carrierPos.x.z * 100,
              ["x"] = carrierPos.p.x + carrierPos.x.x * 100,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [2]
          }, -- end of ["points"]
        }, -- end of ["route"]
        ["groupId"] = carrierUnitID + 10000,
        ["tasks"] =
        {
        }, -- end of ["tasks"]
        ["hidden"] = true,
        ["units"] = UpdateUnitCoordinates(carrierUnits, dmVec2), -- end of ["units"]
        ["y"] = dmVec2.y,
        ["x"] = dmVec2.x,
        ["name"] = "Dismounts_" .. carrierUnitID,
        ["start_time"] = 0,
        ["task"] = "Ground Nothing",
      }
    SetRifleWaypoint(CarrierUnitName, "Dismounts_" .. carrierUnitID)  --Launch scheduled function to refresh the wayoint of the dismounted group
    return group






    elseif dmType == "TeamRTGAA" then   --If rifle squad
      local group = {
        ["visible"] = false,
        ["route"] =
        {
          ["spans"] =
          {
          }, -- end of ["spans"]
          ["points"] =
          {
            [1] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = dmVec2.y,
              ["x"] = dmVec2.x,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [1]
            [2] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = carrierPos.p.z + carrierPos.x.z * 100,
              ["x"] = carrierPos.p.x + carrierPos.x.x * 100,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [2]
          }, -- end of ["points"]
        }, -- end of ["route"]
        ["groupId"] = carrierUnitID + 10000,
        ["tasks"] =
        {
        }, -- end of ["tasks"]
        ["hidden"] = true,
        ["units"] = UpdateUnitCoordinates(carrierUnits, dmVec2), -- end of ["units"]
        ["y"] = dmVec2.y,
        ["x"] = dmVec2.x,
        ["name"] = "Dismounts_" .. carrierUnitID,
        ["start_time"] = 0,
        ["task"] = "Ground Nothing",
      }
    SetRifleWaypoint(CarrierUnitName, "Dismounts_" .. carrierUnitID)  --Launch scheduled function to refresh the wayoint of the dismounted group
    return group





    elseif dmType == "PlatoonRTG" then   --If rifle squad
      local group = {
        ["visible"] = false,
        ["route"] =
        {
          ["spans"] =
          {
          }, -- end of ["spans"]
          ["points"] =
          {
            [1] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = dmVec2.y,
              ["x"] = dmVec2.x,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [1]
            [2] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = carrierPos.p.z + carrierPos.x.z * 100,
              ["x"] = carrierPos.p.x + carrierPos.x.x * 100,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [2]
          }, -- end of ["points"]
        }, -- end of ["route"]
        ["groupId"] = carrierUnitID + 10000,
        ["tasks"] =
        {
        }, -- end of ["tasks"]
        ["hidden"] = true,
        ["units"] = UpdateUnitCoordinates(carrierUnits, dmVec2), -- end of ["units"]
        ["y"] = dmVec2.y,
        ["x"] = dmVec2.x,
        ["name"] = "Dismounts_" .. carrierUnitID,
        ["start_time"] = 0,
        ["task"] = "Ground Nothing",
      }
    SetRifleWaypoint(CarrierUnitName, "Dismounts_" .. carrierUnitID)  --Launch scheduled function to refresh the wayoint of the dismounted group
    return group








    elseif dmType == "PlatoonRTGAT" then   --If rifle squad
      local group = {
        ["visible"] = false,
        ["route"] =
        {
          ["spans"] =
          {
          }, -- end of ["spans"]
          ["points"] =
          {
            [1] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = dmVec2.y,
              ["x"] = dmVec2.x,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [1]
            [2] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = carrierPos.p.z + carrierPos.x.z * 100,
              ["x"] = carrierPos.p.x + carrierPos.x.x * 100,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [2]
          }, -- end of ["points"]
        }, -- end of ["route"]
        ["groupId"] = carrierUnitID + 10000,
        ["tasks"] =
        {
        }, -- end of ["tasks"]
        ["hidden"] = true,
        ["units"] = UpdateUnitCoordinates(carrierUnits, dmVec2), -- end of ["units"]
        ["y"] = dmVec2.y,
        ["x"] = dmVec2.x,
        ["name"] = "Dismounts_" .. carrierUnitID,
        ["start_time"] = 0,
        ["task"] = "Ground Nothing",
      }
    SetRifleWaypoint(CarrierUnitName, "Dismounts_" .. carrierUnitID)  --Launch scheduled function to refresh the wayoint of the dismounted group
    return group





    elseif dmType == "PlatoonRTGAA" then   --If rifle squad
      local group = {
        ["visible"] = false,
        ["route"] =
        {
          ["spans"] =
          {
          }, -- end of ["spans"]
          ["points"] =
          {
            [1] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = dmVec2.y,
              ["x"] = dmVec2.x,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [1]
            [2] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = carrierPos.p.z + carrierPos.x.z * 100,
              ["x"] = carrierPos.p.x + carrierPos.x.x * 100,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [2]
          }, -- end of ["points"]
        }, -- end of ["route"]
        ["groupId"] = carrierUnitID + 10000,
        ["tasks"] =
        {
        }, -- end of ["tasks"]
        ["hidden"] = true,
        ["units"] = UpdateUnitCoordinates(carrierUnits, dmVec2), -- end of ["units"]
        ["y"] = dmVec2.y,
        ["x"] = dmVec2.x,
        ["name"] = "Dismounts_" .. carrierUnitID,
        ["start_time"] = 0,
        ["task"] = "Ground Nothing",
      }
    SetRifleWaypoint(CarrierUnitName, "Dismounts_" .. carrierUnitID)  --Launch scheduled function to refresh the wayoint of the dismounted group
    return group



    elseif dmType == "RifleRTGAT" then   --If rifle squad
      local group = {
        ["visible"] = false,
        ["route"] =
        {
          ["spans"] =
          {
          }, -- end of ["spans"]
          ["points"] =
          {
            [1] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = dmVec2.y,
              ["x"] = dmVec2.x,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [1]
            [2] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = carrierPos.p.z + carrierPos.x.z * 100,
              ["x"] = carrierPos.p.x + carrierPos.x.x * 100,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [2]
          }, -- end of ["points"]
        }, -- end of ["route"]
        ["groupId"] = carrierUnitID + 10000,
        ["tasks"] =
        {
        }, -- end of ["tasks"]
        ["hidden"] = true,
        ["units"] = UpdateUnitCoordinates(carrierUnits, dmVec2), -- end of ["units"]
        ["y"] = dmVec2.y,
        ["x"] = dmVec2.x,
        ["name"] = "Dismounts_" .. carrierUnitID,
        ["start_time"] = 0,
        ["task"] = "Ground Nothing",
      }
    SetRifleWaypoint(CarrierUnitName, "Dismounts_" .. carrierUnitID)  --Launch scheduled function to refresh the wayoint of the dismounted group
    return group








    elseif dmType == "RifleRTGAA" then   --If rifle squad
      local group = {
        ["visible"] = false,
        ["route"] =
        {
          ["spans"] =
          {
          }, -- end of ["spans"]
          ["points"] =
          {
            [1] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = dmVec2.y,
              ["x"] = dmVec2.x,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [1]
            [2] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = carrierPos.p.z + carrierPos.x.z * 100,
              ["x"] = carrierPos.p.x + carrierPos.x.x * 100,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [2]
          }, -- end of ["points"]
        }, -- end of ["route"]
        ["groupId"] = carrierUnitID + 10000,
        ["tasks"] =
        {
        }, -- end of ["tasks"]
        ["hidden"] = true,
        ["units"] = UpdateUnitCoordinates(carrierUnits, dmVec2), -- end of ["units"]
        ["y"] = dmVec2.y,
        ["x"] = dmVec2.x,
        ["name"] = "Dismounts_" .. carrierUnitID,
        ["start_time"] = 0,
        ["task"] = "Ground Nothing",
      }
    SetRifleWaypoint(CarrierUnitName, "Dismounts_" .. carrierUnitID)  --Launch scheduled function to refresh the wayoint of the dismounted group
    return group











    elseif dmType == "ZU-23" then   --If ZU-23 AAA
      local group = {
        ["visible"] = false,
        ["route"] =
        {
          ["spans"] =
          {
          }, -- end of ["spans"]
          ["points"] =
          {
            [1] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = dmVec2.y,
              ["x"] = dmVec2.x,
              ["ETA_locked"] = true,
              ["speed"] = 5.5555555555556,
              ["action"] = "Off Road",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [1]
          }, -- end of ["points"]
        }, -- end of ["route"]
        ["groupId"] = carrierUnitID + 10000,
        ["tasks"] =
        {
        }, -- end of ["tasks"]
        ["hidden"] = true,
        ["units"] = UpdateUnitCoordinates(carrierUnits, dmVec2), -- end of ["units"]
        ["y"] = dmVec2.y,
        ["x"] = dmVec2.x,
        ["name"] = "Dismounts_" .. carrierUnitID,
        ["start_time"] = 0,
        ["task"] = "Ground Nothing",
      }
    return group
    end
    else  --if western country
      if dmType == "MANPADS" then --If MANPADS
        local group = {
          ["visible"] = false,
          ["route"] =
          {
            ["spans"] =
            {
            }, -- end of ["spans"]
            ["points"] =
            {
              [1] =
              {
                ["alt"] = 0,
                ["type"] = "Turning Point",
                ["ETA"] = 0,
                ["alt_type"] = "BARO",
                ["formation_template"] = "",
                ["y"] = dmVec2.y,
                ["x"] = dmVec2.x,
                ["ETA_locked"] = true,
                ["speed"] = 5.5555555555556,
                ["action"] = "Off Road",
                ["task"] =
                {
                  ["id"] = "ComboTask",
                  ["params"] =
                  {
                    ["tasks"] =
                    {
                    }, -- end of ["tasks"]
                  }, -- end of ["params"]
                }, -- end of ["task"]
                ["speed_locked"] = true,
              }, -- end of [1]
            }, -- end of ["points"]
          }, -- end of ["route"]
          ["groupId"] = carrierUnitID + 10000,
          ["tasks"] =
          {
          }, -- end of ["tasks"]
          ["hidden"] = true,
          ["units"] = UpdateUnitCoordinates(carrierUnits, dmVec2), -- end of ["units"]
          ["y"] = dmVec2.y,
          ["x"] = dmVec2.x,
          ["name"] = "Dismounts_" .. carrierUnitID,
          ["start_time"] = 0,
          ["task"] = "Ground Nothing",
        }
      return group
    elseif dmType == "Mortar" then  --If Mortar
      local group = {
        ["visible"] = false,
        ["route"] =
        {
          ["spans"] =
          {
          }, -- end of ["spans"]
          ["points"] =
          {
            [1] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = dmVec2.y,
              ["x"] = dmVec2.x,
              ["ETA_locked"] = true,
              ["speed"] = 5.5555555555556,
              ["action"] = "Off Road",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [1]
          }, -- end of ["points"]
        }, -- end of ["route"]
        ["groupId"] = carrierUnitID + 10000,
        ["tasks"] =
        {
        }, -- end of ["tasks"]
        ["hidden"] = true,
        ["units"] = UpdateUnitCoordinates(carrierUnits, dmVec2), -- end of ["units"]
        ["y"] = dmVec2.y,
        ["x"] = dmVec2.x,
        ["name"] = "Dismounts_" .. carrierUnitID,
        ["start_time"] = 0,
        ["task"] = "Ground Nothing",
      }
    return group
    elseif dmType == "Rifle" then   --If rifle squad
      local group = {
        ["visible"] = false,
        ["route"] =
        {
          ["spans"] =
          {
          }, -- end of ["spans"]
          ["points"] =
          {
            [1] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = dmVec2.y,
              ["x"] = dmVec2.x,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [1]
            [2] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = carrierPos.p.z + carrierPos.x.z * 100,
              ["x"] = carrierPos.p.x + carrierPos.x.x * 100,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [2]
          }, -- end of ["points"]
        }, -- end of ["route"]
        ["groupId"] = carrierUnitID + 10000,
        ["tasks"] =
        {
        }, -- end of ["tasks"]
        ["hidden"] = true,
        ["units"] = UpdateUnitCoordinates(carrierUnits, dmVec2), -- end of ["units"]
        ["y"] = dmVec2.y,
        ["x"] = dmVec2.x,
        ["name"] = "Dismounts_" .. carrierUnitID,
        ["start_time"] = 0,
        ["task"] = "Ground Nothing",
      }
    SetRifleWaypoint(CarrierUnitName, "Dismounts_" .. carrierUnitID)  --Launch scheduled function to refresh the wayoint of the dismounted group
    return group


    elseif dmType == "RifleINS" then   --If rifle squad
      local group = {
        ["visible"] = false,
        ["route"] =
        {
          ["spans"] =
          {
          }, -- end of ["spans"]
          ["points"] =
          {
            [1] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = dmVec2.y,
              ["x"] = dmVec2.x,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [1]
            [2] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = carrierPos.p.z + carrierPos.x.z * 100,
              ["x"] = carrierPos.p.x + carrierPos.x.x * 100,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [2]
          }, -- end of ["points"]
        }, -- end of ["route"]
        ["groupId"] = carrierUnitID + 10000,
        ["tasks"] =
        {
        }, -- end of ["tasks"]
        ["hidden"] = true,
        ["units"] = UpdateUnitCoordinates(carrierUnits, dmVec2), -- end of ["units"]
        ["y"] = dmVec2.y,
        ["x"] = dmVec2.x,
        ["name"] = "Dismounts_" .. carrierUnitID,
        ["start_time"] = 0,
        ["task"] = "Ground Nothing",
      }
    SetRifleWaypoint(CarrierUnitName, "Dismounts_" .. carrierUnitID)  --Launch scheduled function to refresh the wayoint of the dismounted group
    return group



    elseif dmType == "TeamINS" then   --If rifle squad
      local group = {
        ["visible"] = false,
        ["route"] =
        {
          ["spans"] =
          {
          }, -- end of ["spans"]
          ["points"] =
          {
            [1] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = dmVec2.y,
              ["x"] = dmVec2.x,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [1]
            [2] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = carrierPos.p.z + carrierPos.x.z * 100,
              ["x"] = carrierPos.p.x + carrierPos.x.x * 100,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [2]
          }, -- end of ["points"]
        }, -- end of ["route"]
        ["groupId"] = carrierUnitID + 10000,
        ["tasks"] =
        {
        }, -- end of ["tasks"]
        ["hidden"] = true,
        ["units"] = UpdateUnitCoordinates(carrierUnits, dmVec2), -- end of ["units"]
        ["y"] = dmVec2.y,
        ["x"] = dmVec2.x,
        ["name"] = "Dismounts_" .. carrierUnitID,
        ["start_time"] = 0,
        ["task"] = "Ground Nothing",
      }
    SetRifleWaypoint(CarrierUnitName, "Dismounts_" .. carrierUnitID)  --Launch scheduled function to refresh the wayoint of the dismounted group
    return group



    elseif dmType == "RifleRTG" then   --If rifle squad
      local group = {
        ["visible"] = false,
        ["route"] =
        {
          ["spans"] =
          {
          }, -- end of ["spans"]
          ["points"] =
          {
            [1] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = dmVec2.y,
              ["x"] = dmVec2.x,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [1]
            [2] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = carrierPos.p.z + carrierPos.x.z * 100,
              ["x"] = carrierPos.p.x + carrierPos.x.x * 100,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [2]
          }, -- end of ["points"]
        }, -- end of ["route"]
        ["groupId"] = carrierUnitID + 10000,
        ["tasks"] =
        {
        }, -- end of ["tasks"]
        ["hidden"] = true,
        ["units"] = UpdateUnitCoordinates(carrierUnits, dmVec2), -- end of ["units"]
        ["y"] = dmVec2.y,
        ["x"] = dmVec2.x,
        ["name"] = "Dismounts_" .. carrierUnitID,
        ["start_time"] = 0,
        ["task"] = "Ground Nothing",
      }
    SetRifleWaypoint(CarrierUnitName, "Dismounts_" .. carrierUnitID)  --Launch scheduled function to refresh the wayoint of the dismounted group
    return group













    elseif dmType == "TeamRTG" then   --If rifle squad
      local group = {
        ["visible"] = false,
        ["route"] =
        {
          ["spans"] =
          {
          }, -- end of ["spans"]
          ["points"] =
          {
            [1] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = dmVec2.y,
              ["x"] = dmVec2.x,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [1]
            [2] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = carrierPos.p.z + carrierPos.x.z * 100,
              ["x"] = carrierPos.p.x + carrierPos.x.x * 100,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [2]
          }, -- end of ["points"]
        }, -- end of ["route"]
        ["groupId"] = carrierUnitID + 10000,
        ["tasks"] =
        {
        }, -- end of ["tasks"]
        ["hidden"] = true,
        ["units"] = UpdateUnitCoordinates(carrierUnits, dmVec2), -- end of ["units"]
        ["y"] = dmVec2.y,
        ["x"] = dmVec2.x,
        ["name"] = "Dismounts_" .. carrierUnitID,
        ["start_time"] = 0,
        ["task"] = "Ground Nothing",
      }
    SetRifleWaypoint(CarrierUnitName, "Dismounts_" .. carrierUnitID)  --Launch scheduled function to refresh the wayoint of the dismounted group
    return group
    
    
    
    
    
    
    
        elseif dmType == "CrewRTG" then   --If rifle squad
      local group = {
        ["visible"] = false,
        ["route"] =
        {
          ["spans"] =
          {
          }, -- end of ["spans"]
          ["points"] =
          {
            [1] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = dmVec2.y,
              ["x"] = dmVec2.x,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [1]
            [2] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = carrierPos.p.z + carrierPos.x.z * 100,
              ["x"] = carrierPos.p.x + carrierPos.x.x * 100,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [2]
          }, -- end of ["points"]
        }, -- end of ["route"]
        ["groupId"] = carrierUnitID + 10000,
        ["tasks"] =
        {
        }, -- end of ["tasks"]
        ["hidden"] = true,
        ["units"] = UpdateUnitCoordinates(carrierUnits, dmVec2), -- end of ["units"]
        ["y"] = dmVec2.y,
        ["x"] = dmVec2.x,
        ["name"] = "Dismounts_" .. carrierUnitID,
        ["start_time"] = 0,
        ["task"] = "Ground Nothing",
      }
    SetRifleWaypoint(CarrierUnitName, "Dismounts_" .. carrierUnitID)  --Launch scheduled function to refresh the wayoint of the dismounted group
    return group






    elseif dmType == "TeamRTGAT" then   --If rifle squad
      local group = {
        ["visible"] = false,
        ["route"] =
        {
          ["spans"] =
          {
          }, -- end of ["spans"]
          ["points"] =
          {
            [1] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = dmVec2.y,
              ["x"] = dmVec2.x,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [1]
            [2] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = carrierPos.p.z + carrierPos.x.z * 100,
              ["x"] = carrierPos.p.x + carrierPos.x.x * 100,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [2]
          }, -- end of ["points"]
        }, -- end of ["route"]
        ["groupId"] = carrierUnitID + 10000,
        ["tasks"] =
        {
        }, -- end of ["tasks"]
        ["hidden"] = true,
        ["units"] = UpdateUnitCoordinates(carrierUnits, dmVec2), -- end of ["units"]
        ["y"] = dmVec2.y,
        ["x"] = dmVec2.x,
        ["name"] = "Dismounts_" .. carrierUnitID,
        ["start_time"] = 0,
        ["task"] = "Ground Nothing",
      }
    SetRifleWaypoint(CarrierUnitName, "Dismounts_" .. carrierUnitID)  --Launch scheduled function to refresh the wayoint of the dismounted group
    return group






    elseif dmType == "TeamRTGAA" then   --If rifle squad
      local group = {
        ["visible"] = false,
        ["route"] =
        {
          ["spans"] =
          {
          }, -- end of ["spans"]
          ["points"] =
          {
            [1] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = dmVec2.y,
              ["x"] = dmVec2.x,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [1]
            [2] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = carrierPos.p.z + carrierPos.x.z * 100,
              ["x"] = carrierPos.p.x + carrierPos.x.x * 100,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [2]
          }, -- end of ["points"]
        }, -- end of ["route"]
        ["groupId"] = carrierUnitID + 10000,
        ["tasks"] =
        {
        }, -- end of ["tasks"]
        ["hidden"] = true,
        ["units"] = UpdateUnitCoordinates(carrierUnits, dmVec2), -- end of ["units"]
        ["y"] = dmVec2.y,
        ["x"] = dmVec2.x,
        ["name"] = "Dismounts_" .. carrierUnitID,
        ["start_time"] = 0,
        ["task"] = "Ground Nothing",
      }
    SetRifleWaypoint(CarrierUnitName, "Dismounts_" .. carrierUnitID)  --Launch scheduled function to refresh the wayoint of the dismounted group
    return group






    elseif dmType == "PlatoonRTG" then   --If rifle squad
      local group = {
        ["visible"] = false,
        ["route"] =
        {
          ["spans"] =
          {
          }, -- end of ["spans"]
          ["points"] =
          {
            [1] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = dmVec2.y,
              ["x"] = dmVec2.x,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [1]
            [2] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = carrierPos.p.z + carrierPos.x.z * 100,
              ["x"] = carrierPos.p.x + carrierPos.x.x * 100,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [2]
          }, -- end of ["points"]
        }, -- end of ["route"]
        ["groupId"] = carrierUnitID + 10000,
        ["tasks"] =
        {
        }, -- end of ["tasks"]
        ["hidden"] = true,
        ["units"] = UpdateUnitCoordinates(carrierUnits, dmVec2), -- end of ["units"]
        ["y"] = dmVec2.y,
        ["x"] = dmVec2.x,
        ["name"] = "Dismounts_" .. carrierUnitID,
        ["start_time"] = 0,
        ["task"] = "Ground Nothing",
      }
    SetRifleWaypoint(CarrierUnitName, "Dismounts_" .. carrierUnitID)  --Launch scheduled function to refresh the wayoint of the dismounted group
    return group





    elseif dmType == "PlatoonRTGAT" then   --If rifle squad
      local group = {
        ["visible"] = false,
        ["route"] =
        {
          ["spans"] =
          {
          }, -- end of ["spans"]
          ["points"] =
          {
            [1] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = dmVec2.y,
              ["x"] = dmVec2.x,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [1]
            [2] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = carrierPos.p.z + carrierPos.x.z * 100,
              ["x"] = carrierPos.p.x + carrierPos.x.x * 100,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [2]
          }, -- end of ["points"]
        }, -- end of ["route"]
        ["groupId"] = carrierUnitID + 10000,
        ["tasks"] =
        {
        }, -- end of ["tasks"]
        ["hidden"] = true,
        ["units"] = UpdateUnitCoordinates(carrierUnits, dmVec2), -- end of ["units"]
        ["y"] = dmVec2.y,
        ["x"] = dmVec2.x,
        ["name"] = "Dismounts_" .. carrierUnitID,
        ["start_time"] = 0,
        ["task"] = "Ground Nothing",
      }
    SetRifleWaypoint(CarrierUnitName, "Dismounts_" .. carrierUnitID)  --Launch scheduled function to refresh the wayoint of the dismounted group
    return group
    
    
    
    
    elseif dmType == "PlatoonRTGAA" then   --If rifle squad
      local group = {
        ["visible"] = false,
        ["route"] =
        {
          ["spans"] =
          {
          }, -- end of ["spans"]
          ["points"] =
          {
            [1] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = dmVec2.y,
              ["x"] = dmVec2.x,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [1]
            [2] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = carrierPos.p.z + carrierPos.x.z * 100,
              ["x"] = carrierPos.p.x + carrierPos.x.x * 100,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [2]
          }, -- end of ["points"]
        }, -- end of ["route"]
        ["groupId"] = carrierUnitID + 10000,
        ["tasks"] =
        {
        }, -- end of ["tasks"]
        ["hidden"] = true,
        ["units"] = UpdateUnitCoordinates(carrierUnits, dmVec2), -- end of ["units"]
        ["y"] = dmVec2.y,
        ["x"] = dmVec2.x,
        ["name"] = "Dismounts_" .. carrierUnitID,
        ["start_time"] = 0,
        ["task"] = "Ground Nothing",
      }
    SetRifleWaypoint(CarrierUnitName, "Dismounts_" .. carrierUnitID)  --Launch scheduled function to refresh the wayoint of the dismounted group
    return group





    elseif dmType == "RifleRTGAT" then   --If rifle squad
      local group = {
        ["visible"] = false,
        ["route"] =
        {
          ["spans"] =
          {
          }, -- end of ["spans"]
          ["points"] =
          {
            [1] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = dmVec2.y,
              ["x"] = dmVec2.x,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [1]
            [2] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = carrierPos.p.z + carrierPos.x.z * 100,
              ["x"] = carrierPos.p.x + carrierPos.x.x * 100,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [2]
          }, -- end of ["points"]
        }, -- end of ["route"]
        ["groupId"] = carrierUnitID + 10000,
        ["tasks"] =
        {
        }, -- end of ["tasks"]
        ["hidden"] = true,
        ["units"] = UpdateUnitCoordinates(carrierUnits, dmVec2), -- end of ["units"]
        ["y"] = dmVec2.y,
        ["x"] = dmVec2.x,
        ["name"] = "Dismounts_" .. carrierUnitID,
        ["start_time"] = 0,
        ["task"] = "Ground Nothing",
      }
    SetRifleWaypoint(CarrierUnitName, "Dismounts_" .. carrierUnitID)  --Launch scheduled function to refresh the wayoint of the dismounted group
    return group







    elseif dmType == "RifleRTGAA" then   --If rifle squad
      local group = {
        ["visible"] = false,
        ["route"] =
        {
          ["spans"] =
          {
          }, -- end of ["spans"]
          ["points"] =
          {
            [1] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = dmVec2.y,
              ["x"] = dmVec2.x,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [1]
            [2] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = carrierPos.p.z + carrierPos.x.z * 100,
              ["x"] = carrierPos.p.x + carrierPos.x.x * 100,
              ["ETA_locked"] = true,
              ["speed"] = 3.8888888888889,
              ["action"] = "Custom",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [2]
          }, -- end of ["points"]
        }, -- end of ["route"]
        ["groupId"] = carrierUnitID + 10000,
        ["tasks"] =
        {
        }, -- end of ["tasks"]
        ["hidden"] = true,
        ["units"] = UpdateUnitCoordinates(carrierUnits, dmVec2), -- end of ["units"]
        ["y"] = dmVec2.y,
        ["x"] = dmVec2.x,
        ["name"] = "Dismounts_" .. carrierUnitID,
        ["start_time"] = 0,
        ["task"] = "Ground Nothing",
      }
    SetRifleWaypoint(CarrierUnitName, "Dismounts_" .. carrierUnitID)  --Launch scheduled function to refresh the wayoint of the dismounted group
    return group









    elseif dmType == "ZU-23" then   --If ZU-23 AAA
      local group = {
        ["visible"] = false,
        ["route"] =
        {
          ["spans"] =
          {
          }, -- end of ["spans"]
          ["points"] =
          {
            [1] =
            {
              ["alt"] = 0,
              ["type"] = "Turning Point",
              ["ETA"] = 0,
              ["alt_type"] = "BARO",
              ["formation_template"] = "",
              ["y"] = dmVec2.y,
              ["x"] = dmVec2.x,
              ["ETA_locked"] = true,
              ["speed"] = 5.5555555555556,
              ["action"] = "Off Road",
              ["task"] =
              {
                ["id"] = "ComboTask",
                ["params"] =
                {
                  ["tasks"] =
                  {
                  }, -- end of ["tasks"]
                }, -- end of ["params"]
              }, -- end of ["task"]
              ["speed_locked"] = true,
            }, -- end of [1]
          }, -- end of ["points"]
        }, -- end of ["route"]
        ["groupId"] = carrierUnitID + 10000,
        ["tasks"] =
        {
        }, -- end of ["tasks"]
        ["hidden"] = true,
        ["units"] = UpdateUnitCoordinates(carrierUnits, dmVec2), -- end of ["units"]
        ["y"] = dmVec2.y,
        ["x"] = dmVec2.x,
        ["name"] = "Dismounts_" .. carrierUnitID,
        ["start_time"] = 0,
        ["task"] = "Ground Nothing",
      }
    return group
    end
    end
  end


  --function to check if the dismounts carriers are moving
  local function CheckMovement()
    for n = 1, #DismountsCarrier do
      local u = Unit.getByName(DismountsCarrier[n].name)
      if u ~= nil then
        local v = u:getVelocity() --Velocity is a Vec3
        if v.x == 0 and v.y == 0 and v.z == 0 then  --Check if speed is zero
          if DismountsCarrier[n].cargo_status == "mounted" then
            local carrierPos = u:getPosition()
            local group = GetDmGroup(DismountsCarrier[n].countryID, DismountsCarrier[n].UnitID, carrierPos, DismountsCarrier[n].cargo, DismountsCarrier[n].name, DismountsCarrier[n].units)
            coalition.addGroup(DismountsCarrier[n].countryID, Group.Category.GROUND, group)
            DismountsCarrier[n].cargo_status = "dismounted"
            if DismountsCarrier[n].flag ~= -1 then
              trigger.action.setUserFlag(DismountsCarrier[n].flag, 1)
            end
        end
        else  --Else carrier is moving
          --Remount rifle squad only when speed bigger than 5.3 m/s (19 kph). Remount everyone else immediately when moving.
          if DismountsCarrier[n].cargo_status == "dismounted" and  math.sqrt(v.x * v.x + v.z * v.z) > 5.3 then
            local g = Group.getByName("Dismounts_" .. DismountsCarrier[n].UnitID)
            if g ~= nil then  --Check if the group is still alive
              -- count how many units are still alive
              local CarrierUnitPool = deepCopyTable(DismountsCarrier[n].units) -- copy existing table
              local currentUnitsCount = #DismountsCarrier[n].units
              local currentIndex = 0
              for m = 1, currentUnitsCount do
                if Unit.getByName(DismountsCarrier[n].units[m].name) == nil then
                  table.remove(CarrierUnitPool, m - currentIndex)
                  currentIndex = currentIndex + 1
                end
              end
              -- update the carrier.units array with alive units
              DismountsCarrier[n].units = CarrierUnitPool

              if #CarrierUnitPool > 0 then
                DismountsCarrier[n].cargo_status = "mounted"
                if DismountsCarrier[n].flag ~= -1 then
                  trigger.action.setUserFlag(DismountsCarrier[n].flag, 2)
                end
              else
                DismountsCarrier[n].cargo_status = "lost"
                if DismountsCarrier[n].flag ~= -1 then
                  trigger.action.setUserFlag(DismountsCarrier[n].flag, 0)
                end
              end

              g:destroy()
            else
              DismountsCarrier[n].cargo_status = "lost"
              if DismountsCarrier[n].flag ~= -1 then
                trigger.action.setUserFlag(DismountsCarrier[n].flag, 0)
              end
            end
        end
        end
      else
        if DismountsCarrier[n].cargo_status ~= "lost" then
          local g = Group.getByName("Dismounts_" .. DismountsCarrier[n].UnitID)
          if g == nil then  --If mounted group is dead as well, raise handlers/flags
            DismountsCarrier[n].cargo_status = "lost"
            if DismountsCarrier[n].flag ~= -1 then
              trigger.action.setUserFlag(DismountsCarrier[n].flag, 0)
            end
          end
        end
      end
    end
    return timer.getTime() + 5
  end
  timer.scheduleFunction(CheckMovement, nil, timer.getTime() + 1)
end
