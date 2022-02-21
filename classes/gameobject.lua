GameObject = Object:extend()

function GameObject:new(x, y)
    self.x = x
    self.y = y
end

function GameObject:draw()
    love.graphics.setColor(0, 1, 0)
    love.graphics.rectangle("fill", self.x*cellWidth, self.y*cellHeight, cellHeight, cellHeight)
end