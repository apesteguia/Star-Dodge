function createPlayer()
    player = {}
    player.w = 40
    player.h = 40
    player.x = (windowWidth / 2) - player.w
    player.y = (windowHeight / 2) - player.h
    player.speed = 180
end

function drawPlayer()
    love.graphics.draw(ufo, player.x, player.y, 0, player.w / ufo:getWidth(),
        player.h / ufo:getWidth())
end

function drawPlayer()

end
