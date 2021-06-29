local state = require 'state'
local Object = require 'classic'

local windowWidth, windowHeight = love.window.getMode()

GameOverText = Object:extend()

function GameOverText.load()
    GameOverText.font = love.graphics.newFont(64)
    GameOverText.text = love.graphics.newText(
        GameOverText.font,
        { state.palette[5], 'GAME OVER' }
    )

    GameOverText.x = math.floor(windowWidth / 2 - GameOverText.text:getWidth() / 2)
    GameOverText.y = math.floor(windowHeight / 2 - GameOverText.text:getHeight() / 2)
end

function GameOverText:draw()
    if state.gameOver then
        love.graphics.draw(
            GameOverText.text,
            GameOverText.x,
            GameOverText.y
        )
    end
end

return GameOverText