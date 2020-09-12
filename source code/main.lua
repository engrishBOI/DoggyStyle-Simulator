function love.load()

  musicCock=true
  rngM=0
  dog=love.graphics.newImage("dog.png")
  music=love.audio.newSource("music"..rngM..".wav","stream") --"..math.random(0,2).."

  print("dont mind me :)") -- haha i fixed bug so this is useless :)

end

function love.update(dt)

  --if math.random(1,100)==1 then
  rngM=math.random(0,2)
  --  music=love.audio.newSource("music"..rngM..".wav","stream") --"..math.random(0,2).."
  --end

  if mt==1 and musicCock then
    music=love.audio.newSource("music"..rngM..".wav","stream")
    love.audio.setVolume(0.2)
    love.audio.play(music)
    love.audio.setVolume(1.0)
    musicCock=false
  end

  if not musicCock then
    love.audio.setVolume(0.2)
    love.audio.play(music)
    love.audio.setVolume(1.0)
  end

end

function love.draw()

  love.graphics.setColor(0,0.8,0,1)
  love.graphics.rectangle("fill",0,0, love.graphics.getWidth()*2,love.graphics.getHeight()*2)

  dogCool()

end

time=0
dogr=0
dogScale=1
function dogCool()

  if love.mouse.isDown(1) then
    mt=mt+1
  else
    mt=0
  end

  local mx=love.mouse.getX()
  local my=love.mouse.getY()

  local hw=love.graphics.getWidth()/2
  local hh=love.graphics.getHeight()/2
  --dogScale=dogScale+0.01
  dogr=rotate(hw,hh,hw+(math.cos(time)*6),hh-80,dogr)
  time=time+0.06

  --top left
  local tlx=hw-50*dogScale
  local tly=hh-50*dogScale
  --top right
  local trx=hw+50*dogScale
  local try=hh-50*dogScale
  --bottom left
  local blx=hw-50*dogScale
  local bly=hh+50*dogScale
  --bottom right
  local brx=hw+50*dogScale
  local bry=hh+50*dogScale

  if love.keyboard.isDown("1") then dogScale=dogScale-0.01 end
  if love.keyboard.isDown("2") then dogScale=dogScale+0.01 end

  love.graphics.setColor(1,1,1,1)

  --love.graphics.circle("fill",hw+(math.cos(time)*6),hh-80,4)--rotation circle
  --love.graphics.circle("fill",hw*dogScale,hh-80*dogScale,4)

  --love.graphics.circle("fill",tlx,tly,4)--top left
  --love.graphics.circle("fill",trx,try,4)--top right
  --love.graphics.circle("fill",blx,bly,4)--bottom left
  --love.graphics.circle("fill",brx,bry,4)--bottom right

  love.graphics.draw(dog,hw,hh,dogr,dogScale,dogScale,50,50)

  if mx>=tlx and mx<=brx and my>=tly and my<=bry then
    if mt==1 then
      coolSound()
    end
  end

end

function rotate(x,y,tx,ty,r)

  if r>6.2 or r<-6.2 then r=0 end

  r=math.atan2(ty-y,tx-x)+1.6

  return r

end--end of rotate

function love.keypressed(key)

  if key=="space" then
    love.graphics.print("cum is worker")
  end

end

function coolSound()

  local randomName=math.random(1,5)
  local name="none"
  local rngN=math.random(0,10)

  if randomName==1 then
    name="bark"
  elseif randomName==2 then
    name="growl"
  elseif randomName==3 then
    name="grrr"
  elseif randomName==4 then
    name="rawr"
  elseif randomName==5 then
    name="woof"
  end

  if name=="bark" then
    doggy=love.audio.newSource("sfx/"..name..rngN..".wav","static")
  end
  if name=="growl" then
    if rngN>4 then rngN=4 end
    doggy=love.audio.newSource("sfx/"..name..rngN..".wav","static")
  end
  if name=="grrr" then
    if rngN>5 then rngN=5 end
    doggy=love.audio.newSource("sfx/"..name..rngN..".wav","static")
  end
  if name=="rawr" then
    if rngN>8 then rngN=8 end
    doggy=love.audio.newSource("sfx/"..name..rngN..".wav","static")
  end
  if name=="woof" then
    if rngN>6 then rngN=6 end
    doggy=love.audio.newSource("sfx/"..name..rngN..".wav","static")
  end

  love.audio.play(doggy)

end
