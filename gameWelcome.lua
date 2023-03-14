function welcome()
    love.graphics.setFont(font100)
    love.graphics.print("Star    Dodge", 210, 100)
    love.graphics.setFont(font32)
    if parpadear > 0.5 then
        love.graphics.print("Press    SPACE   to   play", 340, 300)
    end
    love.graphics.setFont(font16)
    love.graphics.print("by  mikel  apesteguia", 20, 750)
    if love.keyboard.isDown("space") then
        gameStart = true
    elseif love.keyboard.isDown("escape") then
        love.event.quit()
    end
end

function generateWelcomeAsteroids(num)
    welcomeAsteroids = {}
    for i = 1, num do
        local a = {}
        a.x = math.random(100, 1000)
        a.y = math.random(0, 800)
        a.w = math.random(100, 200)
        a.h = a.w
        table.insert(welcomeAsteroids, a)
    end
end

function createWelcomeAsteroids()
    for i, v in ipairs(welcomeAsteroids) do
        love.graphics.draw(asteroide, v.x, v.y, rotateWelcome,
                           v.w / asteroide:getWidth(),
                           v.h / asteroide:getWidth())
    end
end

function moveWelcomeAsteroid(dt)
    for i, v in ipairs(welcomeAsteroids) do
        if v.x + v.w < 0 or v.y + v.w < 800 then
            v.x = v.x - 50 * dt
            v.y = v.y + 50 * dt
        else
            v.x = math.random(400, 1000)
            v.y = math.random(0, 400)
        end
    end
end

function deleteWelcomeAsteroids()
    deleteWelcomeAs = false
    if gameStart == true and deleteWelcomeAs == false then
        for i, v in ipairs(welcomeAsteroids) do
            table.remove(welcomeAsteroids, i)
        end
        deleteWelcomeAs = true
    end
end
