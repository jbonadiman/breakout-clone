local state = require('state')

local press_functions = {
    left = function()
        state.buttonLeft = true
    end,
    right = function()
        state.buttonRight = true
    end,
    escape = function()
        love.event.quit()
    end,
    space = function()
        if state.gameOver or state.stageCleared then
            return
        end

        state.paused = not state.paused
    end
}
local release_functions = {
    left = function()
        state.buttonLeft = false
    end,
    right = function()
        state.buttonRight = false
    end
}

return {
    press = function(pressed_key)
        if press_functions[pressed_key] then
            press_functions[pressed_key]()
        end
    end,
    release = function(released_key)
        if release_functions[released_key] then
            release_functions[released_key]()
        end
    end,
    toggle_focus = function(focused)
        if not focused then
            state.paused = true
        end
    end
}