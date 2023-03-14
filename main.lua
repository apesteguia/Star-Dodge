-- modules
require("gameWelcome")
require("/game/game")
require("/game/player")
require("background")
require("/game/asteroids")
require("/game/collisions")
require("/game/gameOver")

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
    rotateWelcome = 0
    timer = 0
    score = 0
    gameOver = false
end

function love.update(dt)
    if gameStart == false and gameOver == false then
        if rotateWelcome > 100 then rotateWelcome = 0 end
        if parpadear < 1 then
            parpadear = parpadear + dt
        else
            parpadear = 0
        end
        moveWelcomeAsteroid(dt)
    end
    if gameStart == true and gameOver == false then
        timer = timer + dt
        if timer > 1 then
            createAsteroid(dt)
            timer = 0
            score = score + 1
        end
        movePlayer(dt)
        moveAsteroid(dt)
        deleteAsteorid(dt)
        checkCollision(dt)
    end
end

function love.draw(dt)
    setBackground()
    love.graphics.setFont(font16)
    love.graphics.print("Press    EXC   to   exit", 800, 750)
    if gameStart == false and gameOver == false then
        createWelcomeAsteroids()
        welcome()
    elseif gameStart == true then
        game()
        drawAsteroid()
    elseif gameOver == true and gameStart == false then
        gameOverScreen()
    end
end
