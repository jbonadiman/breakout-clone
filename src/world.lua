local end_contact_callback = function(a, b, contact)
    local entity_a = a:getUserData()
    local entity_b = b:getUserData()

    if entity_a.endContact then
        entity_a:endContact()
    end
    if entity_b.endContact then
        entity_b:endContact()
    end
end

local world = love.physics.newWorld(0, 0)

world:setCallbacks(nil, end_contact_callback, nil, nil)

return world