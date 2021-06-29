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

local Object = require 'classic'

Entities = Object:extend()

Entities.classes = {
    Boundary,
    BoundaryContact,
    Paddle,
    Brick,
    Ball,
    Lives,
    Score,
    PauseOverlay,
    GameOverText,
    StageClearText,
}

Entities.instances = {}
Entities.ui = {}

function Entities.load()
    for _, cls in ipairs(Entities.classes) do
        if cls.load then
            cls.load()
        end
    end
end

function Entities.new()
    Entities.instances = {
        Boundary(-6, 300, 10, 600),         -- left
        Boundary(806, 300, 10, 600),        -- right
        Boundary(400, -6, 800, 10),         -- top
        BoundaryContact(400, 606, 800, 10), -- bottom
        Paddle(300, 500),
        Ball(200, 200),
    }

    local windowWidth = love.window.getMode()
    local brickCount = 40
    local columns = 10

    local horizontalPadding = (windowWidth - (columns * Brick.width)) / 2
    local verticalPadding = Brick.height * 2
    local betweenPadding = 2

    for i = 0, (brickCount - 1) do
        local x = horizontalPadding + (i % columns) * (Brick.width + betweenPadding)
        local y = verticalPadding + math.floor(i / columns) * (Brick.height + betweenPadding)

        Entities.instances[#Entities.instances + 1] = Brick(x, y)
    end

    Entities.ui = {
        Lives(8, 16),
        Score(),
        PauseOverlay(),
        GameOverText(),
        StageClearText(),
    }
end

function Entities.draw()
    for _, instance in ipairs(Entities.instances) do
        if instance.draw then
            instance:draw()
        end
    end

    for _, uiEntity in ipairs(Entities.ui) do
        if uiEntity.draw then
            uiEntity:draw()
        end
    end

end

return Entities