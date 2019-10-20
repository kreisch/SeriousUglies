Stennis = UNIT:FindByName("Stennis")
Arco = GROUP:FindByName("Arco")







--TestScheduler = SCHEDULER:New( nil, 
--  function()
--    Stennis_Position = Stennis:GetPointVec2()
--    Stennis:MessageToAll("Stennis Position x: " .. Stennis_Position.x,10)
--    Stennis:MessageToAll("Stennis Position y: " .. Stennis_Position.y,10)
--    Stennis:MessageToAll("Stennis Position z: " .. Stennis_Position.z,10)
--    
----    Arco:EnRouteTaskTanker()
----    Arco:RouteToVec3(Stennis:GetPointVec3(),250)
--    RefuelTask = Arco:TaskOrbitCircleAtVec2(Stennis_Position,2000,320)
--    Arco:SetTask(RefuelTask,0)
--    
--    
--  end, {}, 1, 90, 0)

