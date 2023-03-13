function randomPoints()
    local starsNum = 200
    local x, y = 0, 0
    stars = {}
    for i = 1, starsNum do
        if i % 2 == 0 then
            stars[i] = math.random(0, 800)
        else
            stars[i] = math.random(0, 1000)
        end
    end
end

function setBackground() love.graphics.points(stars) end
