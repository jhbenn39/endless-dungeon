love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'

function love.load()
  map = Map:new(0, 0)
  x = 400
  y = 300
  playerImg = love.graphics.newImage('mdbyme/player.png')
  wv = love.graphics.newImage('mdbyme/white_void.png')
  bed = love.graphics.newImage('mdbyme/bed.png')
  mv = love.graphics.newImage('mdbyme/mid_void.png')
  dv = love.graphics.newImage('mdbyme/dark_floor.png')
floor = {
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv}
        }
map = Map:new(floor)
end
function love.update(dt)
 if love.keyboard.isDown('W')then
    y = y - 1
  end
  if love.keyboard.isDown('A')then
    x = x - 1
  end
  if love.keyboard.isDown('S')then
    y = y + 1
  end
  if love.keyboard.isDown('D')then
    x = x + 1
  end
end

function love.update(dt)
  if love.keyboard.isDown('up')then
    y = y - 1
  end
  if love.keyboard.isDown('left')then
    x = x - 1
  end
  if love.keyboard.isDown('down')then
    y = y + 1
  end
  if love.keyboard.isDown('right')then
    x = x + 1
  end
end

function love.draw()
  map:draw()
  love.graphics.draw(playerImg, x, y)
end
