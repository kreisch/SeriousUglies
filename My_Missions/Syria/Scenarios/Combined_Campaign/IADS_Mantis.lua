


local myredmantis = MANTIS:New("Damascus","Red_SAM_Damascus","Red_EWR",nil,"red",false, nil, true, nil)
myredmantis.verbose = true
myredmantis:Start()

function myredmantis:onafterRedState(From,Event,To,Group) 
    local m = MESSAGE:New("A sam site is powering up!",15,"Mantis"):ToAll() 
end

--MANTIS:SetEWRGrouping(radius)
--MANTIS:SetEWRRange(radius)
--MANTIS:SetSAMRadius(radius)
--MANTIS:SetDetectInterval(interval)
--MANTIS:SetAutoRelocate(hq, ewr)