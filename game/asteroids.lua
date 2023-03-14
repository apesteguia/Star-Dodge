function createAsteroid(dt)
    local a = {}
    local x = math.random(0, 3)
    if x == 0 then
        a.x = -100
        a.y = player.y
        a.t = 0
    elseif x == 1 then
        a.x = player.x
        a.y = -100
        a.t = 1
    elseif x == 2 then
        a.x = player.x
        a.y = windowHeight
        a.t = 2
    elseif x == 3 then
        a.x = windowWidth
        a.y = player.y
        a.t = 3
    end
    a.w = math.random(100, 200)
    a.speed = math.random(50, 200)
    table.insert(asteroids, a)
end

function drawAsteroid()
    for i, v in ipairs(asteroids) do
        love.graphics.draw(asteroide, v.x, v.y, 0, v.w / asteroide:getWidth(),
                           v.w / asteroide:getWidth())
    end
end

function moveAsteroid(dt)
    for i, v in ipairs(asteroids) do
        if v.t == 0 then
            v.x = v.x + v.speed * dt
        elseif v.t == 1 then
            v.y = v.y + v.speed * dt
        elseif v.t == 2 then
            v.y = v.y - v.speed * dt
        elseif v.t == 3 then
            v.x = v.x - v.speed * dt
        end
    end
end

function deleteAsteorid(dt)
    for i, v in ipairs(asteroids) do
        if v.t == 0 and v.x > windowWidth then
            table.remove(asteroids, i)
        elseif v.t == 1 and v.y > windowHeight then
            table.remove(asteroids, i)
        elseif v.t == 2 and v.y < 0 then
            table.remove(asteroids, i)
        elseif v.t == 3 and v.x < windowWidth then
            table.remove(asteroids, i)
        end
    end
end
