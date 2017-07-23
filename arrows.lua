local m = {}

----spawn arrows-----
spawnArrow = function(double, rotate, touchX, touchY, arrowSpeed, currentWeapon)
		
		local double = double
		local rotate = rotate
		local touchX = touchX
		local touchY = touchY
		local arrowSpeed = arrowSpeed
		local currentWeapon = currentWeapon
	
		--, rotate, touchX, touchY, arrowSpeed, currentWeapon)
		_G.arrowShots = _G.arrowShots + 1	---up shot count for wave accuracy
		_G.gameArrowShots = _G.gameArrowShots + 1	---up shot count for whole game accuracy
		_G.accuracy = (_G.birdyHits / _G.arrowShots) * 100	---calculate wave accuracy
		_G.gameAccuracy = (_G.gameBirdyHits / _G.gameArrowShots) * 100	--- calculate whole game accuracy
		_G.accuracy = math.floor (_G.accuracy)	---round wave accuracy to whole number
		_G.gameAccuracy = math.floor (_G.gameAccuracy) ---round game accuracy to whole number
		indexCount = 0	
		indexCount = indexCount + 1
		local arrow = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex(currentWeapon)}} )	--- create arrow sprite
		--------assign power up signature
		if _G.dragon == true then
			arrow.dragon = true 
			else
			arrow.dragon = false
		end
		if _G.rain == true then
			arrow.rain = true
			else
			arrow.rain = false
		end
		if _G.double == true then
			arrow.double = true
		else
			arrow.double = false
		end
		if _G.rocket == true then
			arrow.rocket = true
		else
			arrow.rocket = false
		end
			--print("yes")
		audio.play(_G.arrowSound, {channel = 2})	---play sound
		
		arrowShape = {16,-2, 20,-2, 20,2, 16,-2}		---create arrowhead physics shape
		local arrowFilter = _G.arrowCollisionFilter
		physics.addBody (arrow, "dynamic",{filter = arrowFilter, shape = arrowShape})
		arrow.isBullet = true
		--arrow.isSensor = true
		if double == false then
		--local torso = torso
			arrow: setLinearVelocity((87 - touchX)* arrowSpeed , (display.contentHeight - 107 - touchY)* arrowSpeed)--, arrow.x-200, arrow.y)
		else
			arrow: setLinearVelocity((87 - touchX + rotate)* arrowSpeed , (display.contentHeight - 107 - touchY + rotate)* arrowSpeed)
		end
		
		
		arrow.hitCounter = false ---has arrow collided? variable
		arrow.index = indexCount + 1
		arrow.x = torso.x
		arrow.y = torso.y
		arrow.rotation = torso.rotation
		---assert velocity variables
		arrow.axv = 1	
		arrow.ayv = 1
		arrow.obj = "arrow"
		arrow.Type = _G.weaponType	---fire or regular?
		if arrow.Type == 2 then 
			arrow.linearDamping = 1
		end

		arrow.hasCollided = false   ---has arrow collided? variable
		arrowsTable[#arrowsTable + 1] = arrow		---add to arrow table		
		
	--	arrow:addEventListener ("collision", _G.arrowHit)
		--arrowsGroup:insert(arrow)
		
	return arrow
end
m.spawnArrow = spawnArrow


---------------rotate arrow in direction of travel--------------
 arrowPath = function()
 	--print("1")
	if (arrowsTable >= 1) then
		for i = #arrowsTable, 1, -1  do
								
					--[[local fireball = display.newImage("images/fireball.png")
						fireball.x = _G.arrowsTable[i].x+math.random(-2, 2)
						fireball.y = _G.arrowsTable[i].y+math.random(-2, 2)
						fireballTable[#fireballTable + 1] = fireball
						fireball.xScale = 0.3
						fireball.yScale = 0.3
						tnt:newTransition(fireball, {time = 400, alpha = 0})
						local fireballDestroy = function ()
							if fireball then
								fireball:removeSelf()
								fireball = nil
								--fireballTimer:cancel()
								destroyTimer:cancel()
							end
						end
					destroyTimer = tnt:newTimer(400, fireballDestroy,0)]]
							
				if _G.arrowsTable[i].hasCollided == false then
				----calculate arrow velocity
				vx, vy = arrowsTable[i]:getLinearVelocity()
				velocityAngle = math.atan2( vy, vx)
				velocityAngle = math.deg(velocityAngle)
				offset = 90
				arrowsTable[i].rotation = velocityAngle
				arrowsTable[i].axv, arrowsTable[i].ayv = arrowsTable[i]:getLinearVelocity()
			end
		end
	end
end
m.arrowPath = arrowPath


---------flag arrow collision and update score------
_G.arrowHit = function (event)
	if event.target.hitCounter == false then
		_G.birdyHits = _G.birdyHits + 1
		_G.gameBirdyHits = _G.gameBirdyHits + 1
		_G.accuracy = (_G.birdyHits / _G.arrowShots) * 100
		_G.gameAccuracy = (_G.gameBirdyHits / _G.gameArrowShots) * 100
		_G.accuracy = math.floor (_G.accuracy)
		_G.gameAccuracy = math.floor (_G.gameAccuracy)
	end

event.target.hitCounter = true

	if event.phase == "began" then
		local doCollision = function()
			_G.ar = event.target.rotation
			_G.deadx = event.target.axv
			_G.deady = event.target.ayv

			if event.target.Type == 1 then
				event.target.hasCollided = true
			end
		end
		local collisionTimer = timer.performWithDelay (1, doCollision, 1)
	end
end

return m