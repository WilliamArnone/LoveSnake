GameObject = Object:extend()

function GameObject:new(x, y, color)
    self.x = x
    self.y = y
    self.color = color
end

function GameObject:draw()
    love.graphics.setColor(self.color[1], self.color[2], self.color[3])
    love.graphics.rectangle("fill", self.x*cellWidth+1, self.y*cellHeight+1, cellHeight-1, cellHeight-1)
end