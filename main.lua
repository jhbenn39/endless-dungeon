local Map = require 'core/map'

function love.load()
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')

function love.update(dt)
 if love.keyboard.isDown('w')then
    y = y - 1
  end
  if love.keyboard.isDown('a')then
    x = x - 1
  end
  if love.keyboard.isDown('s')then
    y = y + 1
  end
  if love.keyboard.isDown('d')then
    x = x + 1
  end
end

function love.update(dt)
  -- Nothing to update yet
end

function love.draw()
  love.graphics.print('Hello, world!', 0, 0)
  map:draw()
  love.graphics.draw(playerImg, x, y)
end

