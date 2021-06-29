local endContactCallback = function(a, b, contact)
    local entityA = a:getUserData()
    local entityB = b:getUserData()

    if entityA.endContact then
        entityA:endContact()
    end
    if entityB.endContact then
        entityB:endContact()
    end
end

local world = love.physics.newWorld(0, 0)

world:setCallbacks(nil, endContactCallback, nil, nil)

return world