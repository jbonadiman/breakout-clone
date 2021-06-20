local state = require 'state'
local world = require 'world'
local Object = require 'classic'

Brick = Object:extend()

function Brick:new(x, y)
    self.x = x or 0
    self.y = y or 0
    self.width = 50
    self.height = 20
    self.max_health = 2
    self.health = self.max_health
    self.type = 'brick'

    self.body = love.physics.newBody(world, x, y, 'static')
    self.shape = love.physics.newRectangleShape(self.width, self.height)
    self.fixture = love.physics.newFixture(self.body, self.shape)
    self.fixture:setUserData(self)
end

function Brick:draw()
    love.graphics.setColor(state.palette[self.health] or state.palette[5])
    love.graphics.polygon('fill', self.body:getWorldPoints(self.shape:getPoints()))
    love.graphics.setColor(state.palette[5])
end

function Brick:endContact()
    self.health = self.health - 1
end

return Brick