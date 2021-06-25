local world = require 'world'
local Object = require 'classic'

Ball = Object:extend()
Ball.max_speed = 880

function Ball.load()
    Ball.sprite = love.graphics.newImage("spr/ball.png")
    Ball.width = Ball.sprite:getWidth()
    Ball.height = Ball.sprite:getHeight()
end

function Ball:new(x, y)
    self.x = x or 0
    self.y = y or 0
    self.sprite = Ball.sprite
    self.width = Ball.width
    self.height = Ball.height

    self.body = love.physics.newBody(world, self.x, self.y, 'dynamic')
    self.body:setMass(32)
    self.body:setLinearVelocity(300, 300)
    self.shape = love.physics.newCircleShape(0, 0, self.width / 2)
    self.fixture = love.physics.newFixture(self.body, self.shape)
    self.fixture:setRestitution(1)
    self.fixture:setFriction(0)
    self.fixture:setUserData(self)
end

function Ball:draw()
    local x, y = self.body:getPosition()

    love.graphics.draw(
        Ball.sprite,
        x - math.floor(self.width / 2),
        y - math.floor(self.height / 2)
    )
end

function Ball:update()
    local vel_x, vel_y = self.body:getLinearVelocity()
    local speed = math.abs(vel_x) + math.abs(vel_y)

    local vel_x_is_critical = math.abs(vel_x) > Ball.max_speed * 2
    local vel_y_is_critical = math.abs(vel_y) > Ball.max_speed * 2

    if vel_x_is_critical or vel_y_is_critical then
        self.body:setLinearVelocity(vel_x * .75, vel_y * .75)
    end

    if speed > Ball.max_speed then
        self.body:setLinearDamping(0.1)
    else
        self.body:setLinearDamping(0)
    end
end

return Ball