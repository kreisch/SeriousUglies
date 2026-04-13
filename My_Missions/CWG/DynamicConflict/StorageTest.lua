local warehouse=AIRBASE:FindByName("Grosse Wiese")
local storage=warehouse:GetStorage()


local TestScheduler = SCHEDULER:New( nil, 
            function()
                    storage:AddItem(ENUMS.Storage.weapons.missiles.OH58D_FIM_92, 10)
                    local N=storage:GetItemAmount(ENUMS.Storage.weapons.missiles.OH58D_FIM_92)
                    env.info(string.format("We currently have %d AIM92 available", N))
            end, {}, 10, 20
            )


