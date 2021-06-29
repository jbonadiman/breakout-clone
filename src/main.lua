local Entities = require 'entities'
local input = require 'input'
local state = require 'state'
local world = require 'world'

love.load = function()
    Entities.load()
    Entities.new()
end

love.draw = function()
    Entities.draw()
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

love.update = function(dt)
    if state.gameOver or state.paused or state.stage_cleared then
        return
    end

    local have_bricks = false

    local index = 1
    while index <= #Entities.instances do
        local entity = Entities.instances[index]

        if entity.type == 'brick' then have_bricks = true end
        if entity.update then entity:update(dt) end

        if entity.health and entity.health < 1 then
            table.remove(Entities.instances, index)
            entity.fixture:destroy()
            state.score = state.score + entity.score
        else
            index = index + 1
        end
    end

    state.stage_cleared = not have_bricks

    for _, uiEntity in ipairs(Entities.ui) do
        if uiEntity.update then
            uiEntity:update()
        end
    end

    world:update(dt)
end