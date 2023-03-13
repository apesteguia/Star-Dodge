function createAsteroid()
    local a = {}
    local x = math.random(0, 1)
    if x == 0 then
        a.x = player.x
        a.y = player.y + 600
    elseif x == 1 then
        a.x = player.x + 600
        a.y = player.y
    end
    a.w = math.random(100, 200)
    a.speed = math.random(50, 200)
    table.insert(asteroids, a)
end

function drawAsteroid()
    for i, v in ipairs(asteroids) do
        love.graphics.draw(asteroide, v.x, v.y, 0, v.w / asteroide:getWidth(),
            v.h / asteroide:getWidth())
    end
end

function moveAsteroid(dt)
    for i, v in ipairs(asteroids) do
        v.x = v.x + v.speed * dt
        v.y = v.y + v.speed * dt
    end
end
