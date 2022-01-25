-- Fortschrittsvariablen

TrainbridgeDestroyed   = false
Trainbridge13Destroyed = false
TraindepotDestroyed    = false
Traindepot1Destroyed   = false
Traindepot2Destroyed   = false

-- Zones
TrainbridgeZone   = ZONE:New("Trainbridge")
Trainbridge13Zone = ZONE:New("Trainbridge-13")
TraindepotZone    = ZONE:New("Traindepot")
Traindepot1Zone   = ZONE:New("Traindepot-1")
Traindepot2Zone   = ZONE:New("Traindepot-2")

-- Vec3 of Zones
TrainbridgeV3     = TrainbridgeZone:GetVec3()


-- trigger.action.markToAll(number id , string text , table vec3 , boolean readOnly, string message)
-- trigger.action.removeMark(Lz_1_id[NewGroupNumber])
function StartHomsTrainStrike ()
  trigger.action.markToAll(Trainbridge_id , "Bridge 1" , TrainbridgeV3 , true, "Mission: Homs Train Strike activated.")
end