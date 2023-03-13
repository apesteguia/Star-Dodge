-- modules
require("gameWelcome")
require("/game/game")
require("/game/player")
require("background")
require("/game/asteroids")

function love.load()
    windowWidth = 1000
    windowHeight = 800
    love.window.setMode(windowWidth, windowHeight, {
        resizable = false,
        vsync = true,
        fullscreen = false,
        centered = true
    })
    love.graphics.setDefaultFilter("nearest", "nearest")
    asteroide = love.graphics.newImage("/img/asteroide.png")
    ufo = love.graphics.newImage("/img/ufo.png")

    font16 = love.graphics.newFont("/Font/arcade.TTF", 16)
    font32 = love.graphics.newFont("/Font/arcade.TTF", 32)
    font100 = love.graphics.newFont("/Font/arcade.TTF", 100)

    randomPoints()
    generateWelcomeAsteroids(10)
    createPlayer()
    asteroids = {}
    gameStart = false
    parpadear = 0
    timer = 0
end

function love.update(dt)
    if gameStart == false then
        if parpadear < 1 then
            parpadear = parpadear + dt
        else
            parpadear = 0
        end
        moveWelcomeAsteroid(dt)
    end
    if gameStart == true then
        timer = timer + dt
        movePlayer(dt)
        if timer > 1 then
            createAsteroid()
            moveAsteroid(dt)
        end
    end
end

function love.draw(dt)
    setBackground()
    love.graphics.setFont(font16)
    love.graphics.print("Press    EXC   to   exit", 800, 750)
    --[[
    love.graphics.draw(asteroide, 0, 0, 0, 100 / asteroide:getWidth(),
                       100 / asteroide:getWidth())
    love.graphics.draw(ufo, 100, 100, 0, 40 / ufo:getWidth(),
                       40 / ufo:getWidth())
                       --]]
    if gameStart == false then
        createWelcomeAsteroids()
        welcome()
    elseif gameStart == true then
        game()
        drawAsteroid()
    end
end
