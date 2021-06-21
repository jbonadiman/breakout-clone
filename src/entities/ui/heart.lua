local state = require('state')

local Object = require 'classic'

Lives = Object:extend()

function Lives:load()
    Heart.load()
end

function Lives:new(x, y)
    self.x = x or 0
    self.y = y or 0

    for i = 1, state.lives do
        -- spawn hearts
    end
end

function Lives:draw()
    for i = 1, state.lives do
        love.graphics.draw(
            self.sprite,
            self.width * (i - 1) + 8,
            16
        )
    end
end

Heart = Object:extend()

function Heart.load()
    Heart.sprite = love.graphics.newImage("spr/heart.png")
    Heart.width = Heart.sprite:getWidth()
    Heart.height = Heart.sprite:getHeight()
end

function Heart:new(x, y)
    self.x = x or 0
    self.y = y or 0
end

function Heart:draw()
    love.graphics.draw(
        Heart.sprite,
        self.x,
        self.y
    )
end



return function()
    local entity = {}

    entity.load = function(self)
        self.sprite = love.graphics.newImage("spr/heart.png")
        self.width = self.sprite:getWidth()
        self.height = self.sprite:getHeight()
    end

    entity.draw = function(self)
        for i = 1, state.lives do
            love.graphics.draw(
                self.sprite,
                self.width * (i - 1) + 8,
                16
            )
        end
    end

    return entity
end