local state = require('state')

return function()
    local entity = {}

    entity.load = function(self)
        self.sprite = love.graphics.newImage("spr/heart.png")
        self.width = self.sprite:getWidth()
        self.height = self.sprite:getHeight()
    end

    entity.draw = function(self)
        for i = 1, state.lives do
            love.graphics.draw(
                self.sprite,
                self.width * (i - 1) + 8,
                16
            )
        end
    end

    return entity
end