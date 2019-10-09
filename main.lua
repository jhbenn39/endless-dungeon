love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'

function love.load()
  map = Map:new(12, 12)
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
  floor = love.graphics.newImage('assets-1/dark_floor.png')
flour = {
          {floor, floor, floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
          {floor, floor, floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
          {floor, floor, floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
          {floor, floor, floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
          {floor, floor, floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
          {floor, floor, floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
          {floor, floor, floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
          {floor, floor, floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
          {floor, floor, floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
          {floor, floor, floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
          {floor, floor, floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
          {floor, floor, floor, floor, floor, floor, floor, floor, floor, floor, floor, floor}
        }
map = Map:new(flour)
end
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
  if love.keyboard.isDown('right') then
    x = x + 1
  end
end

function love.draw()
  map:draw()
  love.graphics.draw(playerImg, x, y)
end
