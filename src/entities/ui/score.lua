local state = require 'state'
local Object = require 'classic'

Score = Object:extend()
local windowWidth = love.window.getMode()

function Score.load()
    Score.font = love.graphics.newFont(16)
    Score.text = love.graphics.newText(Score.font, '')
end

function Score:new()
    state.score = 0
end

function Score:draw()
    Score.text:set('Score: ' .. state.score)

    love.graphics.draw(
        Score.text,
        windowWidth - Score.text:getWidth() - 16,
        16
    )
end

return Score
