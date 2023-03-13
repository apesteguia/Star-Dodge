function game(dt)
    if love.keyboard.isDown("escape") then
        love.event.quit()
    end
    drawPlayer()
end
