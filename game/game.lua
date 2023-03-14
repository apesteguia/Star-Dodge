function game(dt)
    if love.keyboard.isDown("escape") then love.event.quit() end
    drawPlayer()
    love.graphics.setFont(font32)
    love.graphics.print("Score   " .. score, 20, 20)
end
