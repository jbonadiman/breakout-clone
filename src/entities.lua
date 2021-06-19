local boundary_bottom = require('entities/boundary_bottom')
local boundary_vertical = require('entities/boundary_vertical')
local boundary_top = require('entities/boundary_top')
local paddle = require('entities/paddle')
local ball = require('entities/ball')
local brick = require('entities/brick')
local pause_overlay = require('entities/pause_overlay')

return {
    boundary_bottom(400, 606),
    boundary_vertical(-6, 300),
    boundary_vertical(806, 300),
    boundary_top(400, -6),
    paddle(300, 500),
    ball(200, 200),
    brick(100, 100),
    brick(200, 100),
    brick(300, 100),
    pause_overlay()
}