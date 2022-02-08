local jtac2 = Unit.getByName('JTACBOB')  --UNIT name of your thing that shines the IR beam
local target2 = Unit.getByName('TARGET') --UNIT name of the ship you want your IR beam to hit
local ray2 = Spot.createInfraRed(jtac2, {x = 0, y = 1, z = 0}, target2:getPoint(), 1688)
local function updateRay2()
    if Object.isExist(target2) then
        ray2:setPoint(target2:getPoint())
        timer.scheduleFunction(updateRay2, {}, timer.getTime() + 0.5)
    else
        ray2:destroy()
    end
end
timer.scheduleFunction(updateRay2, {}, timer.getTime() + 0.5)