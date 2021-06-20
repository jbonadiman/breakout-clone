local world = require 'world'
local Object = require 'classic'

Boundary = Object:extend()

function Boundary:new(x, y, width, height)
    self.x = x or 0
    self.y = y or 0
    self.width = width or 1
    self.height = height or 1

    self.body = love.physics.newBody(world, self.x, self.y, 'static')
    self.shape = love.physics.newRectangleShape(self.width, self.height)
    self.fixture = love.physics.newFixture(self.body, self.shape)
    self.fixture:setUserData(self)
end

return Boundary