local world = require 'world'
local Object = require 'classic'

Brick = Object:extend()

function Brick.load()
    Brick.sprite = love.graphics.newImage("spr/brick.png")
    Brick.width = Brick.sprite:getWidth()
    Brick.height = Brick.sprite:getHeight()
end

function Brick:new(x, y)
    self.x = x or 0
    self.y = y or 0
    self.sprite = Brick.sprite
    self.width = Brick.width
    self.height = Brick.height

    self.score = 50
    self.max_health = 2
    self.health = self.max_health
    self.type = 'brick'

    self.body = love.physics.newBody(world, x, y, 'static')
    self.shape = love.physics.newRectangleShape(self.width, self.height)
    self.fixture = love.physics.newFixture(self.body, self.shape)
    self.fixture:setUserData(self)
end

function Brick:draw()
    local x, y = self.body:getPosition()

    love.graphics.draw(
        Brick.sprite,
        x - math.floor(self.width / 2),
        y - math.floor(self.height / 2)
    )
end

function Brick:endContact()
    self.health = self.health - 1
end

return Brick