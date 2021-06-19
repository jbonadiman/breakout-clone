local state = require('state')

return function()
    local window_width, window_height = love.window.getMode()

    local entity = {}

    entity.draw = function(self)
        if state.paused then
            love.graphics.setColor({ 1, 1, 1, 0.2 })
            love.graphics.rectangle('fill', 0, 0, window_width, window_height)
            love.graphics.setColor(state.palette[5])
            love.graphics.print(
                { state.palette[3], 'PAUSED' },
                math.floor(window_width / 2) - 54,
                math.floor(window_height / 2),
                0,
                2,
                2
            )
        end
    end

    return entity
end