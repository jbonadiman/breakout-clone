local end_contact_callback = function(a, b, contact)
    local entity_a = a:getUserData()
    local entity_b = b:getUserData()

    if entity_a.end_contact then
        entity_a:end_contact()
    end
    if entity_b.end_contact then
        entity_b:end_contact()
    end
end

local world = love.physics.newWorld(0, 0)

world:setCallbacks(nil, end_contact_callback, nil, nil)

return world