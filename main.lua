push = require 'push'

LARGURA_JANELA = 1280
ALTURA_JANELA = 720

LARGURA_VIRTUAL = 512
ALTURA_VIRTUAL = 288

--Import Image
local background = love.graphics.newImage('background.png') 
local ground = love.graphics.newImage('ground.png')

function love.load()
    --love.graphics.setDefaultFilter('near' , 'nearest') --Retro Filter
    love.graphics.setDefaultFilter('nearest' , 'nearest')
    push:setupScreen(LARGURA_VIRTUAL,ALTURA_VIRTUAL,LARGURA_JANELA,ALTURA_JANELA)

    vsync = true
    fullscreen = false
    resizable = true
end

function love.resize(l,a)
    push:resize(l,a)
end

function love.keypressed(tecla)
    --Close game
    if tecla == 'escape' then
        love.event.quit()
    end
end

function love.draw()
    push:start()

    love.graphics.draw(background,0,0)
    love.graphics.draw(ground, 0 , ALTURA_VIRTUAL - 16)
    
    push:finish()
end