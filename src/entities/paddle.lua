local state = require 'state'
local world = require 'world'
local Object = require 'classic'

local window_width = love.window.getMode()

Paddle = Object:extend()

function Paddle.load()
    Paddle.sprite = love.graphics.newImage("spr/paddle.png")
    Paddle.width = Paddle.sprite:getWidth()
    Paddle.height = Paddle.sprite:getHeight()
end

function Paddle:new(x, y)
    self.x = x or 0
    self.y = y or 0
    self.width = Paddle.width
    self.height = Paddle.height
    self.speed = 600
    self.sprite = Paddle.sprite

    self.left_boundary = (self.width / 2) + 2
    self.right_boundary = window_width - (self.width / 2) - 2

    self.body = love.physics.newBody(world, self.x, self.y, 'kinematic')
    self.shape = love.physics.newRectangleShape(self.width, self.height)
    self.fixture = love.physics.newFixture(self.body, self.shape)
    self.fixture:setUserData(self)
end

function Paddle:draw()
    local x, y = self.body:getPosition()

    love.graphics.draw(
        Paddle.sprite,
        x - math.floor(self.width / 2),
        y - math.floor(self.height / 2)
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