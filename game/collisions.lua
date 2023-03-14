function checkCollision(dt)
    for i, v in ipairs(asteroids) do
        if player.x < v.x + v.w / 1.3 and v.x < player.x + player.w and player.y <
            v.y + v.w / 1.7 and v.y < player.y + player.h then
            love.event.quit()
        end
    end
end
