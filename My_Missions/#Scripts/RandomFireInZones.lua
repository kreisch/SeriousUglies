function RandomFire(zonetable,Tstart,dT,Duration,minimumDurationFire,maximumDurationFire)
    local zonetable = zonetable
    local Tstart = Tstart or 0
    local dt = dt or nil
    local Duration = Duration or nil
    local minimumDurationFire = minimumDurationFire or 600
    local maximumDurationFire = maximumDurationFire or 3600
   
        function SelectZone()
            local varZone = math.random(1,#zonetable)
            local FireZone = zonetable[varZone]
            local FireZone = ZONE:New(FireZone)
            
            StartAFire(FireZone)
        end
    local firecoord = nil 
   
       function StartAFire(FireZone)
           local rnd = math.random(1,8) -- Smoke size 1 = small smoke and fire; 8 = huge smoke
           firecoord = FireZone:GetRandomCoordinate() -- Core.Point#COORDINATE
           firecoord:BigSmokeAndFire(rnd, nil, nil)
           
   
           local fireDuration = math.random(minimumDurationFire,maximumDurationFire)
           local endFire=TIMER:New(EndAFire,firecoord)
           endFire:Start(fireDuration)
           
       end
   
       function EndAFire(firecoord)
         firecoord:StopBigSmokeAndFire()
       end
   
   local startFire = TIMER:New(SelectZone,zonetable,minimumDurationFire,maximumDurationFire)
       startFire:Start(Tstart,dT,Duration)
   
   end
   -- RandomFire({Table with zones},start first fire,delta between fire,end all fires, minimumDurationFire , maximumDurationFire)
   
   --RandomFire({"Firezone1","Firezone2","Firezone3"},20,20,600)
   RandomFire({"RF1","RF2"},20,60,600,120,300)