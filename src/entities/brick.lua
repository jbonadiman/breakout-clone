local world = require('world')

return function(x, y)
    local entity = {}
    entity.body = love.physics.newBody(world, x, y, 'static')
    entity.shape = love.physics.newRectangleShape(50, 20)
    entity.fixture = love.physics.newFixture(entity.body, entity.shape)
    entity.fixture:setUserData(entity)

    entity.health = 2

    entity.draw = function(self)
        if self.health < 2 then
            love.graphics.setColor({1, 1, 1, 0.5})
        end
        love.graphics.polygon('fill', self.body:getWorldPoints(self.shape:getPoints()))
        love.graphics.setColor({1, 1, 1, 1})
    end

    entity.end_contact = function(self)
        self.health = self.health - 1
    end

    return entity
end