local state = require 'state'
local Object = require 'classic'

local window_width, window_height = love.window.getMode()
StageClearText = Object:extend()

function StageClearText.load()
    StageClearText.font = love.graphics.newFont(64)
    StageClearText.text = love.graphics.newText(
        StageClearText.font,
        { state.palette[4], 'STAGE CLEARED' }
    )

    StageClearText.x = math.floor(window_width / 2 - StageClearText.text:getWidth() / 2)
    StageClearText.y = math.floor(window_height / 2 - StageClearText.text:getHeight() / 2)
end

function StageClearText:draw()
    if state.stage_cleared then
        love.graphics.draw(
            StageClearText.text,
            StageClearText.x,
            StageClearText.y
        )
    end
end

return StageClearText