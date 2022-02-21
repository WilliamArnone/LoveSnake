Snake = Object:extend()

function Snake:IsColliding()
    for i, body in ipairs(self.bodies) do
        if self.head.x == body.x and self.head.y == body.y then
            return true
        end
    end

    return self.head.x < 0 or self.head.x >= gridWidth or self.head.y < 0 or self.head.y >= gridHeight
end

function Snake:new(x, y)
    self.head = GameObject(x, y)
    self.bodies = {}
    --snake direction---------------------------------------------------------
    self.mx = 0
    self.my = -1
    --------------------------------------------------------------------------
    --last movement made (to avoid situations like: moving up -> moving down)
    self.px = 0
    self.py = 0
    --------------------------------------------------------------------------
end

function Snake:update(dt)
    table.insert(self.bodies, 1, self.head)
    local ate_apple = false

    self.head = GameObject(self.head.x + self.mx, self.head.y + self.my)

    self.px = self.mx
    self.py = self.my

    if self.head.x == apple.x and self.head.y == apple.y then
        ate_apple = true
        apple:MoveToNewPosition()
    else
        table.remove(self.bodies, #self.bodies)
    end

    return self:IsColliding(), ate_apple
end

function Snake:draw()
    self.head:draw()

    for i, body in ipairs(self.bodies) do
        body:draw()
    end
end

function Snake:KeyPressed(key)
    if key == "up" and self.py == 0 then
        self.mx = 0
        self.my = -1
    end

    if key == "down" and self.py == 0 then
        self.mx = 0
        self.my = 1
    end

    if key == "right" and self.px == 0 then
        self.mx = 1
        self.my = 0
    end

    if key == "left" and self.px == 0 then
        self.mx = -1
        self.my = 0
    end
end