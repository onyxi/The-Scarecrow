local m = {}

--[[feathers = function (feathersX, feathersY, feathersVX, feathersVY, arrowType)
if arrowType == 1 then 
featherType = "images/feather.png"
else
featherType = "images/fireball.png"
end


end]]


fireball = function(eventX, eventY)
	local fireball = display.newCircle (eventX, eventY, 2)
	--newImage("images/fireball.png")
	--fireball.x = eventX
	--fireball.y = eventY
	--fireball.rotation = math.random (0, 360)
	objTable[#objTable+1] = fireball
	local destroyFireball = function()
		fireball.burn = true
	end
	tnt:newTransition(fireball, {time = 1000, alpha = 0, onEnd = destroyFireball})
end

feathers = function(feathersX, feathersY, feathersVX, feathersVY, arrowType)
--print (feathersVY)
--local weapon = arrowType
	if arrowType == 1 then 
	featherType = "images/feather.png"
	else
	featherType = "images/fireball.png"
	print (weapon)
	end

local feather1 = display.newImage (featherType)
feather1.x = feathersX
feather1.y = feathersY
feather1.rotation = math.random(1,360)
birdsGroup:insert(feather1)

local feather2 = display.newImage (featherType)
feather2.x = feathersX
feather2.y = feathersY
feather2.rotation = math.random(1,360)
birdsGroup:insert(feather2)

local feather3 = display.newImage (featherType)
feather3.x = feathersX
feather3.y = feathersY
feather3.rotation = math.random(1,360)
birdsGroup:insert(feather3)

local feather4 = display.newImage (featherType)
feather4.x = feathersX
feather4.y = feathersY
feather4.rotation = math.random(1,360)
birdsGroup:insert(feather4)

local feather5 = display.newImage (featherType)
feather5.x = feathersX
feather5.y = feathersY
feather5.rotation = math.random(1,360)
birdsGroup:insert(feather5)

local feather6 = display.newImage (featherType)
feather6.x = feathersX
feather6.y = feathersY
feather6.rotation = math.random(1,360)
birdsGroup:insert(feather6)

local feather7= display.newImage (featherType)
feather7.x = feathersX
feather7.y = feathersY
feather7.rotation = math.random(1,360)
birdsGroup:insert(feather7)

local feather8 = display.newImage (featherType)
feather8.x = feathersX
feather8.y = feathersY
feather8.rotation = math.random(1,360)
birdsGroup:insert(feather8)

local feather9 = display.newImage (featherType)
feather9.x = feathersX
feather9.y = feathersY
feather9.rotation = math.random(1,360)
birdsGroup:insert(feather9)

--feathersAddBody = function ()	
--indexCount = 0	
	--	indexCount = indexCount + 1
	
	local deadFilter = deadCollisionFilter
	
	physics.addBody (feather1, "dynamic", {filter = deadFilter})
	feather1.obj = "atmos"
	feather1:setLinearVelocity (math.random( feathersVX/2-20,feathersVX/2+20 ), math.random(feathersVY/2-20,feathersVY/2+20 ))
	objTable[#objTable+1] = feather1
	feather1.angularVelocity = math.random(200, 500)
	local feather1Scale = math.random(0.6,1.3)
	feather1.xScale = feather1Scale
	feather1.yScale = feather1Scale
	feather1:setFillColor(math.random(150, 255),math.random(150, 255),math.random(150, 255))
	feather1.burn = false
	if arrowType == 1 then
		feather1.linearDamping = 1
	else
		feather1.linearDamping = 3
	end
	if arrowType == 2 then
		local burn1 = function()
			feather1.burn = true
		end
		tnt:newTransition(feather1, {time = 800, alpha = 0})
		tnt:newTimer(math.random(50,1000), burn1)
	end	
	
	physics.addBody (feather2, "dynamic", {filter = deadFilter})
	feather2.obj = "atmos"
	feather2:setLinearVelocity(math.random( feathersVX/2-20,feathersVX/2+20 ), math.random(feathersVY/2-20,feathersVY/2+20 ))
	objTable[#objTable+1] = feather2
	feather2.angularVelocity = math.random(200, 500)
	local feather2Scale = math.random(0.6,1.3)
	feather2.xScale = feather2Scale
	feather2.yScale = feather2Scale
	feather2:setFillColor(math.random(200, 255),math.random(200, 255),math.random(200, 255))
	feather2.burn = false
	if arrowType == 1 then
		feather2.linearDamping = 8
	else
		feather2.linearDamping = 16
	end
	if arrowType == 2 then
		local burn2 = function()
			feather2.burn = true
		end
		tnt:newTransition(feather2, {time = 800, alpha = 0})
		tnt:newTimer(math.random(50,1000), burn2)
	end	
	
	physics.addBody (feather3, "dynamic", {filter = deadFilter})
	feather3.obj = "atmos"
	feather3:setLinearVelocity(math.random( feathersVX/2-20,feathersVX/2+20 ), math.random(feathersVY/2-20,feathersVY/2+20 ))
	objTable[#objTable+1] = feather3
	feather3.angularVelocity = math.random(200, 500)
	local feather3Scale = math.random(0.6,1.3)
	feather3.xScale = feather3Scale
	feather3yScale = feather3Scale
	feather3:setFillColor(math.random(200, 255),math.random(200, 255),math.random(200, 255))
	feather3.burn = false
	if arrowType == 1 then
		feather3.linearDamping = 1
	else
		feather3.linearDamping = 3
	end
	if arrowType == 2 then
		local burn3 = function()
			feather3.burn = true
		end
		tnt:newTransition(feather3, {time = 800, alpha = 0})
		tnt:newTimer(math.random(50,1000), burn3)
	end	
	
	physics.addBody (feather4, "dynamic", {filter = deadFilter})
	feather4.obj = "atmos"
	feather4:setLinearVelocity(math.random( feathersVX/2-20,feathersVX/2+20 ), math.random(feathersVY/2-20,feathersVY/2+20 ))
	objTable[#objTable+1] = feather4
	feather4.angularVelocity = math.random(200, 500)
	local feather4Scale = math.random(0.6,1.3)
	feather4.xScale = feather4Scale
	feather4.yScale = feather4Scale
	feather4:setFillColor(math.random(200, 255),math.random(200, 255),math.random(200, 255))
	feather4.burn = false
	if arrowType == 1 then
		feather4.linearDamping = 2
	else
		feather4.linearDamping = 5
	end
	if arrowType == 2 then
		local burn4 = function()
			feather4.burn = true
		end
		tnt:newTransition(feather4, {time = 800, alpha = 0})
		tnt:newTimer(math.random(50,1000), burn4)
	end	
	
	physics.addBody (feather5, "dynamic", {filter = deadFilter})
	feather5.obj = "atmos"
	feather5:setLinearVelocity(math.random( feathersVX/2-20,feathersVX/2+20 ), math.random(feathersVY/2-20,feathersVY/2+20 ))
	objTable[#objTable+1] = feather5
	feather5.angularVelocity = math.random(200, 500)
	local feather5Scale = math.random(0.6,1.3)
	feather5.xScale = feather5Scale
	feather5.yScale = feather5Scale
	feather5:setFillColor(math.random(200, 255),math.random(200, 255),math.random(200, 255))
	feather5.burn = false
	if arrowType == 1 then
		feather5.linearDamping = 2
	else
		feather5.linearDamping = 4
	end
	if arrowType == 2 then
		local burn5 = function()
			feather5.burn = true
		end
		tnt:newTransition(feather5, {time = 800, alpha = 0})
		tnt:newTimer(math.random(50,1000), burn5)
	end	
	
	
	physics.addBody (feather6, "dynamic", {filter = deadFilter})
	feather6.obj = "atmos"
	feather6:setLinearVelocity(math.random( feathersVX/2-20,feathersVX/2+20 ), math.random(feathersVY/2-20,feathersVY/2+20 ))
	objTable[#objTable+1] = feather6
	feather6.angularVelocity = math.random(200, 500)
	local feather5Scale = math.random(0.6,1.3)
	feather6.xScale = feather5Scale
	feather6.yScale = feather5Scale
	feather6:setFillColor(math.random(200, 255),math.random(200, 255),math.random(200, 255))
	feather6.burn = false
	if arrowType == 1 then
		feather6.linearDamping = 2.5
	else
		feather6.linearDamping = 7
	end
	if arrowType == 2 then
		local burn6= function()
			feather6.burn = true
		end
		tnt:newTransition(feather6, {time = 800, alpha = 0})
		tnt:newTimer(math.random(50,1000), burn6)
	end	
	
	physics.addBody (feather7, "dynamic", {filter = deadFilter})
	feather7.obj = "atmos"
	feather7:setLinearVelocity(math.random( feathersVX/2-20,feathersVX/2+20 ), math.random(feathersVY/2-20,feathersVY/2+20 ))
	objTable[#objTable+1] = feather7
	feather7.angularVelocity = math.random(200, 500)
	local feather7Scale = math.random(0.6,1.3)
	feather7.xScale = feather5Scale
	feather7.yScale = feather5Scale
	feather7:setFillColor(math.random(200, 255),math.random(200, 255),math.random(200, 255))
	feather7.burn = false
	if arrowType == 1 then
		feather7.linearDamping = 3
	else
		feather7.linearDamping = 8
	end
	if arrowType == 2 then
		local burn7 = function()
			feather7.burn = true
		end
		tnt:newTransition(feather7, {time = 800, alpha = 0})
		tnt:newTimer(math.random(50,1000), burn7)
	end	
	
	physics.addBody (feather8, "dynamic", {filter = deadFilter})
	feather8.obj = "atmos"
	feather8:setLinearVelocity(math.random( feathersVX/2-20,feathersVX/2+20 ), math.random(feathersVY/2-20,feathersVY/2+20 ))
	objTable[#objTable+1] = feather8
	feather8.angularVelocity = math.random(200, 500)
	local feather8Scale = math.random(0.6,1.3)
	feather8.xScale = feather5Scale
	feather8.yScale = feather5Scale
	feather8:setFillColor(math.random(200, 255),math.random(200, 255),math.random(200, 255))
	feather8.burn = false
	if arrowType == 1 then
		feather8.linearDamping = 4
	else
		feather8.linearDamping = 6
	end
	if arrowType == 2 then
		local burn8 = function()
			feather8.burn = true
		end
		tnt:newTransition(feather8, {time = 800, alpha = 0})
		tnt:newTimer(math.random(50,1000), burn8)
	end	
	
	physics.addBody (feather9, "dynamic", {filter = deadFilter})
	feather9.obj = "atmos"
	objTable[#objTable+1] = feather9
	local feather9Scale = math.random(0.6,1.3)
	feather9.xScale = feather5Scale
	feather9.yScale = feather5Scale
	feather9:setFillColor(math.random(200, 255),math.random(200, 255),math.random(200, 255))
	feather9:setLinearVelocity(math.random( feathersVX/2-20,feathersVX/2+20 ), math.random(feathersVY/2-20,feathersVY/2+20 ))
	feather9.angularVelocity = math.random(200, 500)
	feather9.burn = false
	if arrowType == 1 then
		feather9.linearDamping = 5
	else
		feather9.linearDamping = 7
	end
	if arrowType == 2 then
		local burn9 = function()
			feather9.burn = true
		end
		tnt:newTransition(feather9, {time = 800, alpha = 0})
		tnt:newTimer(math.random(50,1000), burn9)
	end
end
--[[
if _G.gameIsActive == true then
	timer.performWithDelay (2, feathersAddBody)
end]]

--end

m.feathers = feathers

return m