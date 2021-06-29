local state = require 'state'
local world = require 'world'
local Object = require 'classic'

local windowWidth = love.window.getMode()

Paddle = Object:extend()

function Paddle.load()
    Paddle.sprite = love.graphics.newImage("img/paddle.png")
    Paddle.width = Paddle.sprite:getWidth()
    Paddle.height = Paddle.sprite:getHeight()
end

function Paddle:new(x, y)
    self.x = x or 0
    self.y = y or 0
    self.sprite = Paddle.sprite
    self.width = Paddle.width
    self.height = Paddle.height
    self.speed = 600

    self.leftBoundary = (self.width / 2) + 2
    self.rightBoundary = windowWidth - (self.width / 2) - 2

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
    if state.buttonLeft and state.buttonRight then
        return
    end

    local x = self.body:getX()
    if state.buttonLeft and x > self.leftBoundary then
        self.body:setLinearVelocity(-self.speed, 0)
    elseif state.buttonRight and x < self.rightBoundary then
        self.body:setLinearVelocity(self.speed, 0)
    else
        self.body:setLinearVelocity(0, 0)
    end
end

return Paddle