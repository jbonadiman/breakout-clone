local state = require 'state'
local Object = require 'classic'

local window_width, window_height = love.window.getMode()

GameOverText = Object:extend()

function GameOverText.load()
    GameOverText.font = love.graphics.newFont(64)
    GameOverText.text = love.graphics.newText(
        GameOverText.font,
        { state.palette[5], 'GAME OVER' }
    )

    GameOverText.x = math.floor(window_width / 2 - GameOverText.text:getWidth() / 2)
    GameOverText.y = math.floor(window_height / 2 - GameOverText.text:getHeight() / 2)
end

function GameOverText:draw()
    if state.game_over then
        love.graphics.draw(
            GameOverText.text,
            GameOverText.x,
            GameOverText.y
        )
    end
end

return GameOverText