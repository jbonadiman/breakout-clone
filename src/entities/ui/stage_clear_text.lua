local state = require 'state'
local Object = require 'classic'

local window_width, window_height = love.window.getMode()
StageClearText = Object:extend()

function StageClearText:draw()
    if state.stage_cleared then
        love.graphics.print(
            { state.palette[4], 'STAGE CLEARED' },
            math.floor(window_width / 2) - 110,
            math.floor(window_height / 2),
            0,
            2,
            2
        )
    end
end

return StageClearText