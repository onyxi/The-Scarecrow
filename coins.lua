local m = {}

newCoin = function(coinInstanceX, coinInstanceY)

-----coins--------

	local coinSequenceData = {
		name = "coinsSpin",
		start = 23,
		count = 10,
		time = 750,
		}
		
	---bring forward coordinates to spwan coin
	coinX = coinInstanceX
	coinY = coinInstanceY

	----spawn coin
	coin = display.newSprite (imageSheet, coinSequenceData)
	coin.x = coinX
	coin.y = coinY
	coin:play()

	-----rotate coin for menu
	if _G.gameIsActive == false then
		coin.rotation = -8
	end
	
	objTable[#objTable+1] = coin

	-----make coin physics body if in game mode
	coinAddBody = function ()	
	coin.xScale = 0.7
	coin.yScale = 0.7
	coin.obj = "atmos"
	local coinFilter = _G.coinCollisionFilter
	physics.addBody (coin, "dynamic", {filter = coinFilter})
	coin:setLinearVelocity( math.random(-100, 200), math.random (-300,-100))
	end

	if _G.gameIsActive == true then
		timer.performWithDelay (2, coinAddBody)
	end


end

m.newCoin = newCoin


return m