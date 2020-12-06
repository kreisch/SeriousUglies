-- This file contains a little play with autoGFT

-- (example mission script)




local switch = math.random (1,2)

if switch == 1 then
  -- BLUE UNITS
  autogft_Setup:new()
    :addBaseZone("BLUE_BASE")
    :startUsingRoads()
    :addControlZone("Objective_ZedaLia")
    :addControlZone("Objective_Dzhvari")
    :scanUnits("TaskForce")
    

  
  -- RED UNITS
  autogft_Setup:new()
    :addBaseZone("RED_BASE")
    :startUsingRoads()
    :addControlZone("Objective_ZedaLia")
    :addControlZone("Objective_Dzhvari")
    
end