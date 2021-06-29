local Boundary = require 'entities/boundary'
local state = require 'state'

BoundaryContact = Boundary:extend()

function BoundaryContact:new(x, y, width, height)
    BoundaryContact.super.new(self, x, y, width, height)
end

function BoundaryContact:endContact()
    state.lives = state.lives - 1
    state.gameOver = state.lives < 1
end

return BoundaryContact