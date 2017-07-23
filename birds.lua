local m = {}

----------------------------birds-----------------------

local birdSequenceData = {
	{name = "birdFlying",start = 4,count = 7,time = 350,loopDirection = "bounce"},
	{name ="deadBird",start = 33,count = 2}
}
	
local redBirdSequenceData = {
	{name = "redFlying",start = 39,count = 7,time = 500,loopDirection = "bounce"},
	{name ="deadRed",start = 46,count = 2,time = 500}
}

local yellowBirdSequenceData = {
	{name = "yellowFlying",start = 61,count = 7,time = 400,loopDirection = "bounce"},
	{name ="deadYellow",start = 68,count = 2}
}

-------spawn new bird---------------------
function newBird (self)
	----end midwave
		if _G.paused == false and spawnBirds == true then
			_G.newTime = os.time()
			if _G.newTime > (_G.markTime + 25) then
				if _G.midWave == true then 
					_G.midWave = false
					_G.spawnBirdMidTimer:cancel()
				end	
			end
	----end high wave
			if _G.newTime > (_G.markTime + 34) then
				if _G.highWave == true then 
					_G.highWave = false
					_G.spawnBirdHighTimer:cancel()
				end
			end
	----at end of wave in campaign/phase in arcade
			if _G.newTime > (_G.markTime + 40) then
				_G.spawnBirdsBaseTimer:cancel()
				if _G.gameType == "campaign" then
					-----end wave
					_G.lastBird = true
					_G.spawnBirds = false
					local endWaveTimer = tnt:newTimer (3000, launchEndWave)
				end
				if _G.gameType == "arcade" then
					-----restart wave increments
					_G.spawnInterval = _G.spawnInterval - (_G.spawnInterval*0.4)
					_G.spawnFunction()
				end
			end
			
			---pick bird colour
			local birdType = math.random (1, 20)
			local indexCount = 0
			
			if birdType > 6 then
				bird = display.newSprite (imageSheet, birdSequenceData)
				bird.type = 1
			else
			if birdType == 1 then 
				bird = display.newSprite (imageSheet, redBirdSequenceData)
				bird.type = 3
			else
				bird = display.newSprite (imageSheet, yellowBirdSequenceData)
				bird.type = 2
			end
		end
			
		bird:setFillColor (math.random(220, 250), math.random(220, 250), math.random(220, 250))

		bird:play()
		bird.x = 450
		bird.y = 30 + math.random (200)
		physics.addBody (bird, "kinematic" ,{filter = birdCollisionFilter} )
		
	-----audio--
			
		local playSoundFunction = function()
		local birdNoise = math.random (1,2)
				if birdNoise == 1 then
					local availableChannel = audio.findFreeChannel()
					audio.setVolume ((math.random (3, 10)/10), {channel = availableChannel})
					audio.play( _G.birdSound1, { channel=availableChannel } )
				else
					local availableChannel = audio.findFreeChannel()
					audio.setVolume ((math.random (3, 10)/10), {channel = availableChannel})
					audio.play( _G.birdSound2, { channel=availableChannel } )
				end
			end
			bird.birdNoiseTimer = tnt:newTimer (math.random(2000, 3000), playSoundFunction, math.random(1,2))
			
			if bird.type == 1 then 
				bird.newTransition =  tnt:newTransition(bird, {time = math.random(4500, 5200), x = 10})
			else 
			if bird.type == 2 then
				bird.newTransition =  tnt:newTransition(bird, {time = math.random(6500, 7200), x = 10})
			else
				bird.newTransition =  tnt:newTransition(bird, {time = math.random(2900, 3200), x = 10})
			end			
			end
			bird.isSensor = true
			bird.obj = "bird"
			bird.index = indexCount + 1
			birdsTable[#birdsTable + 1] = bird
			bird.collided = false
			bird.hitWith = nil
			bird:addEventListener("collision", collisionFunction,{angle})
	--		bird:addEventListener("collision", collisionFunction)
			--hitBird)
			--_G.birdsGroup:insert(bird)

		end
	return bird
end

m.newBird = newBird

--------flag bird when hit & get position for dead bird---
function hitBird (event)
if event.phase == "began" then
	
	-----register awards-up
	if _G.gameType == "arcade" then
		_G.arcadeEx = _G.arcadeEx + 1 
		if event.other.dragon == true then
			_G.arcadeDragon = _G.arcadeDragon+1
		end
		if event.other.double == true then
			_G.arcadeDouble = _G.arcadeDouble +1
		end
		if event.other.rain == true then
			_G.arcadeRain = _G.arcadeRain +1
		end
		if event.other.rocket == true then
			_G.arcadeRocket = _G.arcadeRocket +1
		end
	end	
	
	---change body type & set dead bird animation frame---
	local changeBodyType = function()
		--event.target.parent:remove( event.target )
		--physics.addBody (bird, "kinematic" ,{filter = birdCollisionFilter} )
		event.target.bodyType = "dynamic"
		event.target.isSensor = true
		--,{filter = _G.deadCollisionFilter})
		--print(event.target.filter)
		--event.target.filter = _G.deadCollisionFilter
		
		event.target:pause()
		if event.target.type == 1 then
			event.target:setSequence("deadBird")
			event.target.rotation = -10
		elseif event.target.type == 3 then
			event.target:setSequence("deadRed")
		elseif event.target.type == 2 then
			event.target:setSequence("deadYellow")
		end
		if event.other.Type == 2 then
			event.target:setFrame(2)
		end
		
		
		event.target.angularVelocity = math.random (-event.other.axv, event.other.axv)		---spin dead bird
			-----set direction of dead bird
		if event.other.Type == 1 then
			if event.other.rotation or _G.ar > 0 then
			--_G.ar > 0 then
				---arrow facing down---
				event.target:setLinearVelocity (event.other.axv-(event.other.axv/2), event.other.ayv-event.other.ayv/1.5)
			else
				---arrow facing up---
				event.target:setLinearVelocity (event.other.axv -(event.other.axv/2), event.other.ayv + 50)
			end
		end
		
		
	end
	
	tnt:newTimer(10,changeBodyType)	
	event.target.newTransition:cancel()
	_G.hitWith = event.other.Type
	_G.birdHit = event.target.type
	
	-----spawn feathers
	--if event.other.Type == 1 then
		--local weapon = 
		local feathers = feathers.feathers
		feathers(event.target.x, event.target.y, event.other.axv,  event.other.Type)
	--end
	-----spawn coin for yellow bird
	if _G.birdHit == 2 then
		timer.performWithDelay (2, newCoin(event.target.x, event.target.y))
	end
			
end
end

return m