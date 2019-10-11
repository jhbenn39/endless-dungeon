love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'
local gamera = require 'core/gamera'

function love.load()
  map = Map:new(0, 0)
  cam = gamera.new(0, 0, 1600, 1536)
  x = 320
  y = 768
  playerImg = love.graphics.newImage('mdbyme/player.png')
  wv = love.graphics.newImage('mdbyme/white_void.png')
  bed = love.graphics.newImage('mdbyme/bed.png')
  mv = love.graphics.newImage('mdbyme/mid_void.png')
  dv = love.graphics.newImage('mdbyme/dark_floor.png')
floor = {
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, mv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, mv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, mv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, mv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, mv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, mv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, mv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, mv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, mv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, mv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, mv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, mv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv},
          {wv, wv, wv, bed, wv, wv, wv, wv, wv, wv, wv, wv, mv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, mv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, mv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, mv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, mv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, mv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, mv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, mv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, mv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, mv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, mv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, mv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, mv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv},
        }
map = Map:new(floor)
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
  cam:setPosition(320, 768)
end





function love.draw()
  map:draw() 
  cam:draw(function(l, t, w, h)
  love.graphics.draw(playerImg, x, y)
  end)
end
