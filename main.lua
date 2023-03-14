local backgroundScroll = 0
local BACKGROUND_SCROLL_SPEED = 60
local BACKGROUND_LOOP_POINT = 864

local foregroundScroll = 0
local FOREGROUND_SCROLL_SPEED = 20
local FOREGROUND_LOOP_POINT = 800

timer = 0

function love.load()
    --love.window.setMode(1200, 400)
    love.window.setTitle('Chloe\'s Darius')
    -- w70 h30
    silverHawks = love.graphics.newImage('img/silver_hawk_sheet.png')
    baseHawk = love.graphics.newQuad(180, 0, 60, 30, silverHawks)
    downHawk = love.graphics.newQuad(240, 0, 60, 30, silverHawks)
    background = love.graphics.newImage('img/zone_h_shave.png')
    foreground = love.graphics.newImage('img/foreground.png')
    ex = 100
    why = 100
end

function love.update(dt)

    backgroundScroll = (backgroundScroll + BACKGROUND_SCROLL_SPEED * dt) % BACKGROUND_LOOP_POINT
    foregroundScroll = (foregroundScroll + FOREGROUND_SCROLL_SPEED * dt) % FOREGROUND_LOOP_POINT

    if love.keyboard.isDown('d') then
        ex = ex + 1
    end 
    if love.keyboard.isDown('a') then
        ex = ex - 1
    end 
    if love.keyboard.isDown('w') then
        why = why - 1
    end 
    if love.keyboard.isDown('s') then
        why = why + 1
    end

    timer = timer + dt
end

function love.draw() 
    -- 397h
    love.graphics.draw(background, -backgroundScroll, 0)

    if timer > 0.25 then 
        love.graphics.draw(silverHawks, downHawk, ex, why)
        timer = 0
    else 
        love.graphics.draw(silverHawks, baseHawk, ex, why) 
    end
    -- foreground 1172w 132h
    -- 265
    love.graphics.draw(foreground, -foregroundScroll, 250)
    love.graphics.print(ex, 50, 50)

end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end