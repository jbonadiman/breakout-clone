
local entities = require('entities')
local world = require('world')
local input = require('input')

love.draw = function()
    for _, entity in ipairs(entities) do
        if entity.draw then entity:draw() end
    end
end

love.update = function(dt)
    if not input.paused then
        local index = 1
        while index <= #entities do
            local entity = entities[index]
            if entity.update then entity:update(dt) end

            if entity.health == 0 then
                table.remove(entities, index)
                entity.fixture:destroy()
            else
                index = index + 1
            end

        end
        world:update(dt)
    end
end

love.focus = function(focused)
    input.toggle_focus(focused)
end

love.keypressed = function(pressed_key)
    input.press(pressed_key)
end

love.keyreleased = function(pressed_key)
    input.release(pressed_key)
end