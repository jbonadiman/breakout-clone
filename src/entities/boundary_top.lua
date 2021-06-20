local world = require 'world'
local Object = require 'classic'

BoundaryTop = Object:extend()

function BoundaryTop:new(x, y)
    self.x = x or 0
    self.y = y or 0
    self.width = 800
    self.height = 10

    self.body = love.physics.newBody(world, self.x, self.y, 'static')
    self.shape = love.physics.newRectangleShape(self.width, self.height)
    self.fixture = love.physics.newFixture(self.body, self.shape)
    self.fixture:setUserData(self)
end

return BoundaryTop