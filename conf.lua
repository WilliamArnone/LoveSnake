gridWidth = 16
gridHeight = 16

cellWidth = 32
cellHeight = 32

function love.conf(t)
    t.window.width = gridWidth*cellWidth
    t.window.height =  gridHeight*cellHeight+50
    t.window.title = "An Object-Oriented Snake"
end