local entities = require 'entities'
local input = require 'input'
local state = require 'state'
local world = require 'world'

love.load = function()
    for _, uiEntity in ipairs(entities.ui) do
        if uiEntity.load then
            uiEntity:load()
        end
    end

    for _, entity in ipairs(entities.instances) do
        if entity.load then
            entity:load()
        end
    end
end

love.draw = function()
    for _, entity in ipairs(entities.instances) do
        if entity.draw then
            entity:draw()
        end
    end

    for _, uiEntity in ipairs(entities.ui) do
        if uiEntity.draw then
            uiEntity:draw()
        end
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

love.update = function(dt)
    if state.game_over or state.paused or state.stage_cleared then
        return
    end

    local have_bricks = false

    local index = 1
    while index <= #entities.instances do
        local entity = entities.instances[index]

        if entity.type == 'brick' then have_bricks = true end
        if entity.update then entity:update(dt) end

        if entity.health and entity.health < 1 then
            table.remove(entities.instances, index)
            entity.fixture:destroy()
            state.score = state.score + entity.score
        else
            index = index + 1
        end
    end

    state.stage_cleared = not have_bricks

    for _, uiEntity in ipairs(entities.ui) do
        if uiEntity.update then
            uiEntity:update()
        end
    end

    world:update(dt)
end