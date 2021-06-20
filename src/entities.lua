local BoundaryBottom = require 'entities/boundary_bottom'
local boundary_vertical = require('entities/boundary_vertical')
local boundary_top = require('entities/boundary_top')
local paddle = require('entities/paddle')
local Ball = require 'entities/ball'
local brick = require('entities/brick')
local pause_overlay = require('entities/pause_overlay')
local game_over_text = require('entities/game_over_text')
local stage_clear_text = require('entities/stage_clear_text')
local heart = require('entities/ui/heart')

local entities = {
    BoundaryBottom(400, 606),
    boundary_vertical(-6, 300),
    boundary_vertical(806, 300),
    boundary_top(400, -6),
    paddle(300, 500),
    Ball(200, 200),
    pause_overlay(),
    game_over_text(),
    stage_clear_text(),
    heart()
}

local row_width = love.window.getMode() - 20
for number = 0, 38 do
    local brick_x = ((number * 60) % row_width) + 40
    local brick_y = (math.floor((number * 60) / row_width) * 40) + 80
    entities[#entities + 1] = brick(brick_x, brick_y)
end

return entities