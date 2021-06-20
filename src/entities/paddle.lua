local state = require 'state'
local world = require 'world'
local Object = require 'classic'

local window_width = love.window.getMode()

Paddle = Object:extend()

function Paddle:new(x, y)
    self.x = x or 0
    self.y = y or 0
    self.width = 120
    self.height = 20
    self.speed = 600

    self.left_boundary = (self.width / 2) + 2
    self.right_boundary = window_width - (self.width / 2) - 2

    self.body = love.physics.newBody(world, self.x, self.y, 'kinematic')
    self.shape = love.physics.newRectangleShape(self.width, self.height)
    self.fixture = love.physics.newFixture(self.body, self.shape)
    self.fixture:setUserData(self)
end

function Paddle:draw()
    love.graphics.polygon(
        'line', self.body:getWorldPoints(self.shape:getPoints())
    )
end

function Paddle:update()
    if state.button_left and state.button_right then
        return
    end

    local self_x = self.body:getX()
    if state.button_left and self_x > self.left_boundary then
        self.body:setLinearVelocity(-self.speed, 0)
    elseif state.button_right and self_x < self.right_boundary then
        self.body:setLinearVelocity(self.speed, 0)
    else
        self.body:setLinearVelocity(0, 0)
    end
end

return Paddle