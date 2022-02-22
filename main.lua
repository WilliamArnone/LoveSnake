local timer = 0
local timeStep = 1/8

local gameFont
local starting
local score

function love.load()
    --include libraries-----------------------------------------------
    local o_ten_one = require "libraries.o-ten-one"
    Object = require "libraries.classic"
    require "classes.gameobject"
    require "classes.snake"
    require "classes.apple"
    ------------------------------------------------------------------
    --for the splash screen-------------------------------------------
    splash = o_ten_one()
    splash.onDone = function() --what to do once the splash screen ends
        starting = false
        snake = Snake(6, 15)
        apple = Apple(4, 4)
        score = 0

        --for a non blurry bigger font
        gameFont = love.graphics.newFont(40)
    end
    -------------------------------------------------------------------
    --when false starts the game once the splash screen ends-----------
    starting = true
    -------------------------------------------------------------------
end

function love.update(dt)
    if starting then
        splash:update(dt)
        return
    end

    timer = timer + dt

    if timer >= timeStep then
        --Reset the timer
        timer = 0

        local collide, ate_apple = snake.update(snake, dt)

        if ate_apple then
            score = score + 1
        end

        if collide then
            love.load()
        end
    end
end

function love.draw()
    if starting then
        splash:draw()
        return
    end

    snake:draw()
    apple:draw()

    
    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(gameFont)
    love.graphics.print(score, love.graphics.getWidth()/2, 10)

end

function love.keypressed(key)
    snake:KeyPressed(key)
end