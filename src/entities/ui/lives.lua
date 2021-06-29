local state = require 'state'
local Object = require 'classic'

Heart = Object:extend()

function Heart.load()
    Heart.sprite = love.graphics.newImage("img/heart.png")
    Heart.width = Heart.sprite:getWidth()
    Heart.height = Heart.sprite:getHeight()
end

function Heart:new(x, y)
    self.x = x or 0
    self.y = y or 0
    self.width = Heart.width
    self.height = Heart.height
end

function Heart:draw()
    love.graphics.draw(
        Heart.sprite,
        self.x,
        self.y
    )
end

Lives = Object:extend()

function Lives.load()
    Heart.load()
end

function Lives:new(x, y)
    self.x = x or 0
    self.y = y or 0
    self.lives = {}

    local padding = 2

    for i = 1, state.lives do
        self.lives[i] = Heart(
            self.x + (Heart.width + padding) * (i - 1),
            self.y)
    end
end

function Lives:draw()
    for _, heart in ipairs(self.lives) do
        heart:draw()
    end
end

function Lives:update()
    local livesDifference = #self.lives - state.lives

    for _ = 1, livesDifference do
        table.remove(self.lives, #self.lives)
    end
end

return Lives