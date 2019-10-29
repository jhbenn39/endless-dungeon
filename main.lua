love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'
local gamera = require 'core/gamera'
local Util = require 'core/util'
local anim8 = require 'core/anim8'

function love.load()
  map = Map:new(0, 0)
  cam = gamera.new(0, 0, 1600, 1536)
  x = 320
  y = 768
  spritesheet = love.graphics.newImage('mdbyme/spritesheet.png')
  grid = anim8.newGrid(18, 34, spritesheet:getWidth(), spritesheet:getHeight())
  walk1 = anim8.newAnimation(grid('1-3', 1), 0.2)
  walk2 = anim8.newAnimation(grid('1-3', 2), 0.2)
  walk3 = anim8.newAnimation(grid('1-3', 3), 0.2)
  walk4 = anim8.newAnimation(grid('1-3', 4), 0.2)
  idle1 = anim8.newAnimation(grid('1-1', 2), 0.2)
  idle2 = anim8.newAnimation(grid('1-1', 4), 0.2)
  idle3 = anim8.newAnimation(grid('1-1', 1), 0.2)
  idle4 = anim8.newAnimation(grid('1-1', 3), 0.2)
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
  {clw, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', clw},
  {clw, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', clw},
  {clw, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', clw},
  {clw, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', clw},
  {clw, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', bed, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', clw},
  {clw, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', clw},
  {clw, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', clw},
  {clw, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', clw},
  {clw, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', clw},
  {clw, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', clw},
  {clw, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', clw},
  {clm, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', clm},
  {cld, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', cld},
  {cld, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', cld},
  {cld, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', cld},
  {cld, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', cld},
  {cld, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', cld},
  {cld, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', cld},
  {cld, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', cld},
  {cld, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', cld},
  {cld, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', cld},
  {cld, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', cld},
  {cld, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', cld},
  {cld, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', cld},
  {cld, cld, cld, cld, cld, cld, cld, cld, cld, cld, cld, cld, cld, cld, cld, cld, cld, cld, cld, cld, cld, cld, cld, cld},
}
floor = Map:new(floor)
collision = Map:new(collision)
end



function love.update(dt)
  if love.keyboard.isDown('up') or love.keyboard.isDown('w') then
    if collision:cc(x, y - 4, 64, 64) == false then
      y = y - 4
      walk2:update(dt)
    end

  end
  if love.keyboard.isDown('left') or love.keyboard.isDown('a') then
    if collision:cc(x - 4, y, 64, 64) == false then
      x = x - 4
      walk4:update(dt)
    end 
  end
  if love.keyboard.isDown('down') or love.keyboard.isDown('s') then
    if collision:cc(x, y + 4, 64, 64) == false then
      y = y + 4
      walk1:update(dt)
    end
  end
  if love.keyboard.isDown('right') or love.keyboard.isDown('d') then
    if collision:cc(x + 4, y, 64, 64) == false then
      x = x + 4
      walk3:update(dt)
    end
  end
  cam:setPosition(x, y)
end





function love.draw()
  cam:draw(function(l, t, w, h)
  floor:draw()
  collision:draw()
  if love.keyboard.isDown('up') or love.keyboard.isDown('w') then
    walk2:draw(spritesheet, x, y)
  end
  if love.keyreleased('up') or love.keyreleased('w') then
    idle1:draw(spritesheet, x, y)
  end
  if love.keyboard.isDown('left') or love.keyboard.isDown('a') then
    walk4:draw(spritesheet, x, y)
  end
  if love.keyreleased('left') or love.keyreleased('a') then
    idle2:draw(spritesheet, x, y)
  end
  if love.keyboard.isDown('down') or love.keyboard.isDown('s') then
    walk1:draw(spritesheet, x, y)
  end
  if love.keyreleased('down') or love.keyreleased('s') then
    idle3:draw(spritesheet, x, y)
  end
  if love.keyboard.isDown('right') or love.keyboard.isDown('d') then
    walk3:draw(spritesheet, x, y)
  end
  if love.keyreleased('right') or love.keyreleased('d') then
    idle4:draw(spritesheet, x, y)
  end
  end)
  
end
