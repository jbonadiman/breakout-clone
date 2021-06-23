local state = require 'state'
local Object = require 'classic'

PauseOverlay = Object:extend()
local window_width, window_height = love.window.getMode()

function PauseOverlay.load()
    PauseOverlay.font = love.graphics.newFont(64)
    PauseOverlay.text = love.graphics.newText(
        PauseOverlay.font,
        { state.palette[3], 'PAUSED' }
    )

    PauseOverlay.x = math.floor(window_width / 2 - PauseOverlay.text:getWidth() / 2)
    PauseOverlay.y = math.floor(window_height / 2 - PauseOverlay.text:getHeight() / 2)
end

function PauseOverlay:draw()
    if state.paused then
        love.graphics.setColor({ 1, 1, 1, 0.2 })
        love.graphics.rectangle('fill', 0, 0, window_width, window_height)

        love.graphics.setColor({ 1, 1, 1, 1 })
        love.graphics.draw(
            PauseOverlay.text,
            PauseOverlay.x,
            PauseOverlay.y
        )
    end
end

return PauseOverlay