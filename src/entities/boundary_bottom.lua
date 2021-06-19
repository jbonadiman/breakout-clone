local state = require('state')
local world = require('world')

return function(x, y)
    local entity = {}
    entity.body = love.physics.newBody(world, x, y, 'static')
    entity.shape = love.physics.newRectangleShape(800, 10)
    entity.fixture = love.physics.newFixture(entity.body, entity.shape)
    entity.fixture:setUserData(entity)

    entity.end_contact = function(self)
        state.lives = state.lives - 1

        if state.lives < 1 then state.game_over = true end
    end

    return entity
end