local state = require 'state'
local world = require 'world'
local Object = require 'classic'

BoundaryBottom = Object:extend()

function BoundaryBottom:new(x, y)
    self.x = x or 0
    self.y = y or 0
    self.width = 800
    self.height = 10

    self.body = love.physics.newBody(world, self.x, self.y, 'static')
    self.shape = love.physics.newRectangleShape(self.width, self.height)
    self.fixture = love.physics.newFixture(self.body, self.shape)
    self.fixture:setUserData(self)
end

function BoundaryBottom:endContact()
    state.lives = state.lives - 1
    state.game_over = state.lives < 1
end

return BoundaryBottom