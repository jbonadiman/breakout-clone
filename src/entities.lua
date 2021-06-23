local Boundary = require 'entities/boundary'
local BoundaryContact = require 'entities/boundary_contact'
local Paddle = require 'entities/paddle'
local Ball = require 'entities/ball'
local Brick = require 'entities/brick'

local PauseOverlay = require 'entities/ui/pause_overlay'
local GameOverText = require 'entities/ui/game_over_text'
local StageClearText = require 'entities/ui/stage_clear_text'
local Lives = require 'entities/ui/lives'
local Score = require 'entities/ui/score'

local instances = {
    Boundary(-6, 300, 10, 600), -- left
    Boundary(806, 300, 10, 600), -- right
    Boundary(400, -6, 800, 10), -- top
    BoundaryContact(400, 606, 800, 10), -- bottom
    Paddle(300, 500),
    Ball(200, 200),
}

local ui = {
    Lives(8, 16),
    Score(),
    PauseOverlay(),
    GameOverText(),
    StageClearText(),
}

local row_width = love.window.getMode() - 20
for number = 0, 38 do
    local brick_x = ((number * 60) % row_width) + 40
    local brick_y = (math.floor((number * 60) / row_width) * 40) + 80
    instances[#instances + 1] = Brick(brick_x, brick_y)
end

local entities = {}
entities.instances = instances
entities.ui = ui

return entities