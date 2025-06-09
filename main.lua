push = require 'push'

Class = require 'class'

require 'Bird'

LARGURA_JANELA = 1280
ALTURA_JANELA = 720

LARGURA_VIRTUAL = 512
ALTURA_VIRTUAL = 288

--Import Image
local background = love.graphics.newImage('background.png') 
local ground = love.graphics.newImage('ground.png')

--Instance Bird
local bird = Bird()

local backgroundScroll = 0
local groundScroll = 0

--Paralax effect
local GROUND_SPEED = 60
local BACKGROUND_SPEED = 30

--LOOP 
local BACKGROUND_LOOP = 413
local GROUND_LOOP = 413

function love.load()
    love.window.setTitle("Flappy Bird") -- Name Window
    love.graphics.setDefaultFilter('nearest' , 'nearest') --Retro Filtro
    push:setupScreen(LARGURA_VIRTUAL,ALTURA_VIRTUAL,LARGURA_JANELA,ALTURA_JANELA)

    vsync = true
    fullscreen = false
    resizable = true

    love.keyboard.keyspressed = {}
end

function love.resize(l,a)
    push:resize(l,a)
end

function love.keypressed(tecla)
    love.keyboard.keyspressed[tecla] = true

    if tecla == 'escape' then
        love.event.quit()
    end
end

function love.keyboard.wasPressed(tecla)
    if love.keyboard.keyspressed[tecla] then
        return true
    else
        return false
    end
end
function love.update(dt)
    backgroundScroll = (backgroundScroll + BACKGROUND_SPEED * dt) % BACKGROUND_LOOP
    groundScroll = (groundScroll + GROUND_SPEED * dt) % GROUND_LOOP
    bird:update(dt)
    love.keyboard.keyspressed = {}
end

function love.draw()
    push:start()
    love.graphics.scale (1,1)
    love.graphics.draw(background,-backgroundScroll,0)
    love.graphics.draw(ground, -groundScroll, ALTURA_VIRTUAL - 16)
    love.graphics.scale (0.2,0.2)
    
    bird:render()
    
    push:finish()
end
