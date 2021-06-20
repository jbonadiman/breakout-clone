local state = require 'state'
local Object = require 'classic'

local window_width, window_height = love.window.getMode()

GameOverText = Object:extend()

function GameOverText:draw()
    if state.game_over then
        love.graphics.print(
            { state.palette[5], 'GAME OVER' },
            math.floor(window_width / 2) - 100,
            math.floor(window_height / 2),
            0,
            2,
            2
        )
    end
end

return GameOverText