function gameOverScreen()
    love.graphics.setFont(font100)
    love.graphics.print("game   over", 250, 100)
    love.graphics.setFont(font32)
    love.graphics.print("your   score   " .. score, 380, 300)
    love.graphics.setFont(font16)
    if parpadear > 0.5 then
        love.graphics.print("press   space   to   play   again", 380, 400)
    end

    if love.keyboard.isDown("escape") then
        love.event.quit()
    elseif love.keyboard.isDown("space") then
        gameOver = false
        gameStart = false
    end
    for i, v in ipairs(asteroids) do table.remove(asteroids, i) end
    for i, v in ipairs(welcomeAsteroids) do table.remove(welcomeAsteroids, i) end
end
