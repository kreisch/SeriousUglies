-- File to define the F10 menu structure

-- Menustructur
-- 1st Level!
MenuCoalitionBlueA2G                    = MENU_COALITION:New( coalition.side.BLUE, "Mission Setup A2G" )
MenuCoalitionBlueTransport              = MENU_COALITION:New( coalition.side.BLUE, "Mission Setup Transport" )


-- 2nd Level!
MenuCoalitionBlueA2GMissions                        = MENU_COALITION:New( coalition.side.BLUE, "CAS Missions"               , MenuCoalitionBlueA2G)
MenuCoalitionBlueTrainingsRanges                    = MENU_COALITION:New( coalition.side.BLUE, "Trainingsranges"            , MenuCoalitionBlueA2G)

MenuCoalitionBlueA2GMissionSetupA2GFixedWing        = MENU_COALITION:New( coalition.side.BLUE, "Fixed Wing Training Ranges" , MenuCoalitionBlueTrainingsRanges)
MenuCoalitionBlueMissionSetupA2GHeliRange           = MENU_COALITION:New( coalition.side.BLUE, "Helicopter Training Ranges" , MenuCoalitionBlueTrainingsRanges) 
MenuCoalitionBlueMissionSetupA2GGeneralRange        = MENU_COALITION:New( coalition.side.BLUE, "General Training Ranges"    , MenuCoalitionBlueTrainingsRanges) 
