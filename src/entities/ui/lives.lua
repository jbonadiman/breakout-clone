local state = require('state')
local Object = require 'classic'

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

Lives = Object:extend()

function Lives:load()
    Heart.load()

    for i, entity in ipairs(self.lives) do
        entity.x = Heart.width * (i - 1) + self.x
        entity.y = self.y
    end
end

function Lives:new(x, y)
    self.x = x or 0
    self.y = y or 0

    self.lives = {}
    for i = 1, state.lives do
        self.lives[i] = Heart()
    end
end

function Lives:draw()
    for _, heart in ipairs(self.lives) do
        heart:draw()
    end
end

function Lives:update()
    local lives_diff = #self.lives - state.lives

    for _ = 1, lives_diff do
        table.remove(self.lives, #self.lives)
    end
end

return Lives