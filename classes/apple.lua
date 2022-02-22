Apple = GameObject:extend()

function Apple:new(x, y)
    self.super:new(x, y, {1, 0, 0})
end

function Apple:MoveToNewPosition()
    local overlaps = false

    repeat
        self.x = love.math.random(gridWidth - 1)
        self.y = love.math.random(gridHeight - 1)

        overlaps = self.x == snake.head.x and self.y == snake.head.y
        for i, body in ipairs(snake.bodies) do
            if self.x == body.x and self.y == body.y then
                overlaps = true
                break
            end
        end
    until not overlaps
end