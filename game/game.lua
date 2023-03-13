function game()
    love.graphics.setFont(font32)
    love.graphics.print("todavia  en  desarrollo  gilipollas", 100, 100)
    if love.keyboard.isDown("escape") then
        love.event.quit()
    end
end
