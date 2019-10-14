love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'

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
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv},
          {wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv, wv},
          {mv, mv, mv, mv, mv, mv, mv, mv, mv, mv, mv, mv, mv, mv, mv, mv, mv, mv, mv, mv, mv, mv, mv, mv},
          {dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv},
          {dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv},
          {dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv},
          {dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv},
          {dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv},
          {dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv},
          {dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv},
          {dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv},
          {dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv},
          {dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv},
          {dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv},
          {dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv, dv}
        }


clw = love.graphics.newImage('mdbyme/white_voidcl.png')
clm = love.graphics.newImage('mdbyme/mid_voidcl.png')
cld = love.graphics.newImage('mdbyme/dark_voidcl.png')

collision = {
  {clw, clw, clw, clw, clw, clw, clw, clw, clw, clw, clw, clw, clw, clw, clw, clw, clw, clw, clw, clw, clw, clw, clw, clw},
  {clw, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, clw},
  {clw, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, clw},
  {clw, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, clw},
  {clw, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, clw},
  {clw, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, clw},
  {clw, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, clw},
  {clw, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, clw},
  {clw, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, clw},
  {clw, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, clw},
  {clw, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, clw},
  {clw, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, clw},
  {clw, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, clw},
  {clw, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, clw},
  {clm, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, clm},
  {cld, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, cld},
  {cld, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, cld},
  {cld, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, cld},
  {cld, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, cld},
  {cld, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, cld},
  {cld, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, cld},
  {cld, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, cld},
  {cld, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, cld},
  {cld, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, cld},
  {cld, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, cld},
  {cld, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, cld},
  {cld, cld, cld, cld, cld, cld, cld, cld, cld, cld, cld, cld, cld, cld, cld, cld, cld, cld, cld, cld, cld, cld, cld, cld},
}
collision = Map:new(collision)
floor = Map:new(floor)
end



function love.update(dt)
  if love.keyboard.isDown('up')then
    if collision:cc(x, y, 64, 64) == false then
      y = y - 1
    end
  end
  if love.keyboard.isDown('left')then
    if collision:cc(x, y, 64, 64) == false then
      x = x - 1
    end
  end
  if love.keyboard.isDown('down')then
    if collision:cc(x, y, 64, 64) == false then
      y = y + 1
    end
  end
  if love.keyboard.isDown('right')then
    if collision:cc(x, y, 64, 64) == false then
      x = x + 1
    end
  end
  if love.keyboard.isDown('w')then
    if collision:cc(x, y, 64, 64) == false then
      y = y - 1
    end
  end
  if love.keyboard.isDown('a')then
    if collision:cc(x, y, 64, 64) == false then
      x = x - 1
    end
  end
  if love.keyboard.isDown('s')then
    if collision:cc(x, y, 64, 64) == false then
      y = y + 1
    end
  end
  if love.keyboard.isDown('d')then
    if collision:cc(x, y, 64, 64) == false then
      x = x + 1
    end
  end
  cam:setPosition(x, y)
end





function love.draw()
  cam:draw(function(l, t, w, h)
  floor:draw()
  collision:draw()
  love.graphics.draw(playerImg, x, y)
  end)
  
end
