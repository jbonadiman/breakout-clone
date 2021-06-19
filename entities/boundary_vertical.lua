local world = require('world')

return function(x, y)
    local entity = {}
    entity.body = love.physics.newBody(world, x, y, 'static')
    entity.shape = love.physics.newRectangleShape(10, 600)
    entity.fixture = love.physics.newFixture(entity.body, entity.shape)
    entity.fixture:setUserData(entity)

    return entity
end