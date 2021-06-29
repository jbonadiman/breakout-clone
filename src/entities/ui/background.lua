local state = require 'state'
local Object = require 'classic'

Background = Object:extend()

windowWidth, windowHeight = love.window.getMode()

function Background:draw()
    love.graphics.setColor({ 0.68, 0.85, 0.88, 1 })
    love.graphics.rectangle('fill', 0, 0, windowWidth, windowHeight)
    love.graphics.setColor(state.palette['white'])
end

return Background