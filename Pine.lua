Pine = Class{}

local PINE_IMAGE = love.graphics.newImage('pine.png')
local PINE_SCROLL = -60
function Pine:init()
    self.x = LARGURA_VIRTUAL 
    self.y = math.random(ALTURA_VIRTUAL / 4 , ALTURA_VIRTUAL - 10)
    self.width = PINE_IMAGE:getWidth()
end
function Pine:update(dt)
    self.x = self.x + PINE_SCROLL *dt
end
function Pine:render()
    love.graphics.draw(PINE_IMAGE,math.floor(self.x + 0.5), math.floor(self.y))
end