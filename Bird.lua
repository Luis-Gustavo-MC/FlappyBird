Bird = Class{}
local GRAVITY = 10

function Bird:init()
    self.imagem = love.graphics.newImage('R.png')
    self.largura = self.imagem:getWidth()
    self.altura = self.imagem:getHeight()
    self.dy = 1

    self.x = LARGURA_VIRTUAL / 2 +700 - (self.largura / 2)
    self.y = ALTURA_VIRTUAL / 2  +500 - (self.largura / 2)
end

function Bird:update(dt)
    self.dy = self.dy + GRAVITY *dt
    self.y = self.y + self.dy

    if love.keyboard.wasPressed('space') then
        self.dy = -7
    end
end

function Bird:render()
    love.graphics.draw(self.imagem, self.x, self.y)
end