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
