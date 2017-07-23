local m = {}
------campaign Game Over screen----
local campaign = function (data)
local data = data
--_G.paused = true
--print(_G.paused)
	local gameFont = "Suplexmentary Comic NC"
	local localGroup = display.newGroup()
	local background = display.newRect(0,0,display.contentWidth, display.contentHeight)
		background:setFillColor (0,0,0,150)
		localGroup:insert(background)

	local campaignOverPage = display.newImage ("images/gameOverCamp.png")
		campaignOverPage:setReferencePoint(centerReferencePoint)
		campaignOverPage.x = display.contentWidth/2
		campaignOverPage.y = display.contentHeight/2
		localGroup:insert(campaignOverPage)
	
	local gameOverText = display.newText("GameOver", 1, 1, gameFont, 26)
		gameOverText:setReferencePoint(centerReferencePoint)
		gameOverText.x = display.contentWidth/2
		gameOverText.y = display.contentHeight/2-90
		gameOverText:setTextColor(191, 62, 25)
		localGroup:insert(gameOverText)
	
	local homeButton = display.newRect (display.contentWidth/2 - 151,display.contentHeight/2 - 13,117,60)
		homeButton:setFillColor(255, 0, 255, 0)
		localGroup:insert(homeButton)
	local homeText = display.newText ("Quit", 1,1,gameFont, 20)
		homeText:setReferencePoint(centerReferencePoint)
		homeText.x = display.contentWidth/2 - 93
		homeText.y = display.contentHeight/2 +18
		localGroup:insert(homeText)
	local function home (event)
		if event.phase == "ended" then
			--_G.menuIsActive = true
			goHome = true
			localGroup:removeSelf()
			localGroup = nil
			
		end
	end
	homeButton:addEventListener ("touch", home)
	
	local retryButton = display.newRect (display.contentWidth/2 + 34,display.contentHeight/2 -13,117,60)
		retryButton:setFillColor(255, 0, 255, 0)
		localGroup:insert(retryButton)
	local retryText = display.newText ("Retry", 1,1,gameFont, 20)
		retryText:setReferencePoint(centerReferencePoint)
		retryText.x = display.contentWidth/2 + 96
		retryText.y = display.contentHeight/2+18
		localGroup:insert(retryText)
--[[	local function home (event)
		if event.phase == "ended" then
			_G.menuIsActive = true
			localGroup:removeSelf()
			localGroup = nil
			director:changeScene("scripts.menu","fade")
		end
	end
	homeButton:addEventListener ("touch", home)]]


end
m.campaign = campaign

-----------arcade game over screen----
local arcade = function(data)
local data = data
local exterminator = data.exterminator
	local dragonsBreath = data.dragonsBreath
	local rainmaker = data.rainmaker
	local doubleTrouble = data.doubleTrouble
	local rocketman = data.rocketman
	local arcadeEx = data.arcadeEx
	local arcadeDragon = data.arcadeDragon
	local arcadeRain = data.arcadeRain
	local arcadeDouble = data.arcadeDouble
	local arcadeRocket = data.arcadeRocket
	
	
print (exterminator)
	--_G.menuIsActive = false
	--_G.arcadeLevels()
	local localGroup = display.newGroup()
	local gameFont = "Suplexmentary Comic NC"
	
			



local birdPerc = 0
local birdGot = 0
local firePerc = 0
local fireGot = 0
local x2Perc = 0
local x2Got = 0
local RFPerc = 0
local RFGot = 0
local FAPerc = 0
local FAGot = 0

------levels/awards------
local arcadeLevels = function()

	local birdUp = exterminator
	if birdUp > 9 then
		birdNext = 100
		if birdUp > 19 then
			birdNext = 150
			if birdUp > 29 then
				birdNext = 250
				if birdUp > 39 then
					birdNext = 350
					if birdUp > 49 then
						birdNext = 500
						if birdUp > 74 then
							birdNext = 750
								if birdUp >99 then
								birdNext = 1000
							end
						end
					end
				end
			end
		end
	else birdNext = 50
	end
	birdPerc = arcadeEx/birdNext * 100
	birdGot = birdPerc/100*260
--------
	local fireUp = dragonsBreath
	if fireUp > 9 then
		fireNext = 100
		if fireUp > 19 then
			fireNext = 150
			if fireUp > 29 then
				fireNext = 250
				if fireUp > 39 then
					fireNext = 350
					if fireUp > 49 then
						fireNext = 500
						if fireUp > 74 then
							fireNext = 750
								if fireUp >99 then
								fireNext = 1000
							end
						end
					end
				end
			end
		end
	else fireNext = 50
	end
	firePerc = arcadeDragon/fireNext * 100
	fireGot = firePerc/100*260	
	-----------
	local x2Up = doubleTrouble
	if x2Up > 9 then
		x2Next = 100
		if x2Up > 19 then
			x2Next = 150
			if x2Up > 29 then
				x2Next = 250
				if x2Up > 39 then
					x2Next = 350
					if x2Up > 49 then
						x2Next = 500
						if x2Up > 74 then
							x2Next = 750
								if x2Up >99 then
								x2Next = 1000
							end
						end
					end
				end
			end
		end
	else
	x2Next = 50
	end
	x2Perc = arcadeDouble/x2Next * 100
	x2Got = x2Perc/100*260	
	
	
	RFUp = rainmaker
	if RFUp > 9 then
		RFNext = 100
		if RFUp > 19 then
			RFNext = 150
			if RFUp > 29 then
				RFNext = 250
				if RFUp > 39 then
					RFNext = 350
					if RFUp > 49 then
						RFNext = 500
						if RFUp > 74 then
							RFNext = 750
								if RFUp >99 then
								RFNext = 1000
							end
						end
					end
				end
			end
		end
	else
	RFNext = 50
	end
	RFPerc = arcadeRain/RFNext * 100
	RFGot = RFPerc/100*260		

	FAUp = rocketman
	if FAUp > 9 then
		FANext = 100
		if FAUp > 19 then
			FANext = 150
			if FAUp > 29 then
				FANext = 250
				if FAUp > 39 then
					FANext = 350
					if FAUp > 49 then
						FANext = 500
						if FAUp > 74 then
							FANext = 750
								if FAUp >99 then
								FANext = 1000
							end
						end
					end
				end
			end
		end
	else
	FANext = 50
	end
	FAPerc = arcadeRocket/FANext * 100
	FAGot = FAPerc/100*260	
end	
arcadeLevels()
	--------------------------


	menuIsActive = false
	paused = true
	local localGroup = display.newGroup()
	
	local background = display.newRect(0,0,display.contentWidth, display.contentHeight)
	background:setFillColor (0,0,0,220)
	localGroup:insert(background)
	
	local gameOverPage = display.newImage ("images/gameOverArcade.png")
		gameOverPage.x = display.contentWidth/2
		gameOverPage.y = display.contentHeight/2
		localGroup:insert(gameOverPage)
	
	local titleText = display.newText ("Game Over", 1, 1, gameFont, 22)
		titleText:setReferencePoint(centerReferencePoint)
		titleText.x = display.contentWidth/2 - 133
		titleText.y = display.contentHeight/2 - 116
		titleText.rotation = -17
		titleText:setTextColor(191, 62, 25)
		localGroup:insert(titleText)
	
	local scoresText = display.newText ("Scores", 1, 1, gameFont, 17)
		scoresText:setReferencePoint(centerReferencePoint)
		scoresText.x = display.contentWidth/2
		scoresText.y = display.contentHeight/2 - 103
		scoresText:setTextColor (55, 62, 44)
		localGroup:insert(scoresText)
	
	local awardsText = display.newText("Awards", 1, 1, gameFont, 17)
		awardsText:setReferencePoint(centerReferencePoint)
		awardsText.x = display.contentWidth/2
		awardsText.y = display.contentHeight/2 - 30
		awardsText:setTextColor (55, 62, 44)
		localGroup:insert(awardsText)
	
	local bCounter = display.newText("65", display.contentWidth/2-90, display.contentHeight/2 - 82, gameFont, 30)
		bCounter:setTextColor (22, 76, 239)
		localGroup:insert(bCounter)
	
	local aCounter = display.newText("76".." %", 1, 1, gameFont, 30)
		aCounter:setReferencePoint(centerReferencePoint)
		aCounter.x = display.contentWidth/2+145
		aCounter.y = display.contentHeight/2 - 65
		aCounter:setTextColor (22, 76, 239)
		localGroup:insert(aCounter)
	
--[[	local birdUp = _G.exterminator
	local birdNext = 0
	if birdUp > 9 then
		birdNext = 100
		if birdUp > 19 then
			birdNext = 150
			if birdUp > 29 then
				birdNext = 250
				if birdUp > 39 then
					birdNext = 350
					if birdUp > 49 then
						birdNext = 500
						if birdUp > 74 then
							birdNext = 750
								if birdUp >99 then
								birdNext = 1000
							end
						end
					end
				end
			end
		end
	else birdNext = 50
	end]]
	local birdCounter = display.newText ("Level Up", 1, 1, gameFont, 12)
		birdCounter:setReferencePoint(centerReferencePoint)
		birdCounter.x =display.contentWidth/2+165
		birdCounter.y =display.contentHeight/2 -1
		birdCounter:setTextColor(55, 62, 44)
		birdCounter.alpha = 0
		localGroup:insert(birdCounter)

	local birdPerc = arcadeEx/birdNext * 100
	local birdGot = birdPerc/100*260
			if birdGot>260 then
				birdGot = 260
			end
			if arcadeEx >= birdNext then
				arcadeEx = 0
				exterminator =exterminator +1
			end	
	local birdUpApp = function ()
		if birdGot== 260 then
			birdCounter.alpha = 1
		end
	end	
	local birdBG = display.newRoundedRect(display.contentWidth/2-145, display.contentHeight/2-5, 270, 10, 4)
		birdBG:setFillColor(91, 71, 61, 80)
		localGroup:insert(birdBG)
	local birdBar = display.newRect (display.contentWidth/2-140, display.contentHeight/2-2, birdGot, 4)
		birdBar:setFillColor (49,169, 0)
		birdBar.xScale = 0.01
		birdBar:setReferencePoint(display.CenterLeftReferencePoint)
		birdBarTransition = tnt:newTransition (birdBar,{time = 1000, xScale = 1, onEnd = birdUpApp})	
		localGroup:insert(birdBar)	
	--local birdText = display.newText ("Exterminator", display.contentWidth/2- 140, display.contentHeight/2 - 97, _G.gameFont, 14)
		--birdText:setReferencePoint(centerReferencepoint)
		--birdText.x = display.contentWidth/2- 95 
		--birdText.y = display.contentHeight/2 - 90
	--	birdText:setTextColor(55, 62, 44)
	--	localGroup:insert (birdText)

--[[	local birdLevel = display.newText (birdNext, 1, 1, _G.gameFont, 14)
		birdLevel:setReferencePoint(centerReferencePoint)
		birdLevel.x = display.contentWidth/2 +80
		birdLevel.y = display.contentHeight/2 -90
		birdLevel:setTextColor(55, 62, 44)
		localGroup:insert(birdLevel)]]
		
		-----
--[[	local accuracyUp = _G.hawkEye
	local accuracyNext = 0
	if accuracyUp > 9 then
		accuracyNext = 100
		if accuracyUp > 19 then
			accuracyNext = 150
			if accuracyUp > 29 then
				accuracyNext = 250
				if accuracyUp > 39 then
					accuracyNext = 350
					if accuracyUp > 49 then
						accuracyNext = 500
						if accuracyUp > 74 then
							accuracyNext = 750
								if accuracyUp >99 then
								accuracyNext = 1000
							end
						end
					end
				end
			end
		end
	else accuracyNext = 50
	end
	local accuracyPerc = _G.arcadeHawk/accuracyNext * 100
	local accuracyGot = accuracyPerc/100*260	
	--if accuracyGot<1 then
	--	accuracyGot = 1
	--end
	print (accuracyGot)]]
	
--[[	local accuracyBG = display.newRoundedRect(display.contentWidth/2-145, display.contentHeight/2+10, 270, 10, 4)
		accuracyBG:setFillColor(91, 71, 61, 80)
		localGroup:insert(accuracyBG)
	local accuracyBar = display.newRect (display.contentWidth/2-140, display.contentHeight/2+13, accuracyGot, 4)
		accuracyBar:setFillColor (49,169, 0)
		accuracyBar.xScale = 0.01
		accuracyBar:setReferencePoint(display.CenterLeftReferencePoint)
		accuracyBarTransition = tnt:newTransition (accuracyBar,{time = 1000, xScale = 1})	
		localGroup:insert(accuracyBar)
	--local accuracyText = display.newText ("Hawk eye", display.contentWidth/2- 140, display.contentHeight/2 - 56, _G.gameFont, 14)
		--accuracyText:setReferencePoint(centerReferencepoint)
		--accuracyText.x = display.contentWidth/2- 95 
		--accuracyText.y = display.contentHeight/2 - 49
	--	accuracyText:setTextColor(55, 62, 44)
	--	localGroup:insert (accuracyText)
	local accuracyCounter = display.newText ("Level Up", 1, 1, _G.gameFont, 12)
		accuracyCounter:setReferencePoint(centerReferencePoint)
		accuracyCounter.x =display.contentWidth/2+165
		accuracyCounter.y =display.contentHeight/2 +14
		accuracyCounter:setTextColor(55, 62, 44)
		accuracyCounter.alpha = 0
		localGroup:insert(accuracyCounter)]]
--[[	local accuracyLevel = display.newText (accuracyNext, 1, 1, _G.gameFont, 14)
		accuracyLevel:setReferencePoint(centerReferencePoint)
		accuracyLevel.x = display.contentWidth/2 +80
		accuracyLevel.y = display.contentHeight/2 -49
		accuracyLevel:setTextColor(55, 62, 44)
		localGroup:insert(accuracyLevel)]]
		---
--[[	local fireUp = _G.dragonsBreath
	local fireNext = 0
	if fireUp > 9 then
		fireNext = 100
		if fireUp > 19 then
			fireNext = 150
			if fireUp > 29 then
				fireNext = 250
				if fireUp > 39 then
					fireNext = 350
					if fireUp > 49 then
						fireNext = 500
						if fireUp > 74 then
							fireNext = 750
								if fireUp >99 then
								fireNext = 1000
							end
						end
					end
				end
			end
		end
	else fireNext = 50
	end]]
	
	local fireCounter = display.newText ("Level Up", 1, 1, gameFont, 12)
		fireCounter:setReferencePoint(centerReferencePoint)
		fireCounter.x =display.contentWidth/2+165
		fireCounter.y =display.contentHeight/2 +22
		fireCounter:setTextColor(55, 62, 44)
		fireCounter.alpha = 0
		localGroup:insert(fireCounter)

	local firePerc = arcadeDragon/fireNext * 100
	local fireGot = firePerc/100*260
			if fireGot>260 then
				fireGot = 260
			end
			if arcadeDragon >= fireNext then
				arcadeDragon = 0
				dragonsBreath = dragonsBreath + 1
			end
	local fireUpApp = function ()
		if fireGot == 260 then
			fireCounter.alpha = 1
		end
	end
	local fireBG = display.newRoundedRect(display.contentWidth/2-145, display.contentHeight/2+18, 270, 10, 4)
		fireBG:setFillColor(91, 71, 61, 80)
		localGroup:insert(fireBG)
	local fireBar = display.newRect (display.contentWidth/2-140, display.contentHeight/2+21, fireGot, 4)
		fireBar:setFillColor (49,169, 0)
		fireBar.xScale = 0.01
		fireBar:setReferencePoint(display.CenterLeftReferencePoint)
		fireBarTransition = tnt:newTransition (fireBar,{time = 1000, xScale = 1, onEnd = fireUpApp})	
		localGroup:insert(fireBar)
	--local fireText  = display.newText ("Dragon's breath", display.contentWidth/2- 140, display.contentHeight/2 - 15, _G.gameFont, 14)
		--fireText:setReferencePoint(centerReferencepoint)
		--fireText.x = display.contentWidth/2- 95 
		--fireText.y = display.contentHeight/2 - 8
	--	fireText:setTextColor(55, 62, 44)
	--	localGroup:insert (fireText)

	--[[local fireLevel = display.newText (fireNext, 1, 1, _G.gameFont, 14)
		fireLevel:setReferencePoint(centerReferencePoint)
		fireLevel.x = display.contentWidth/2 +80
		fireLevel.y = display.contentHeight/2 -8
		fireLevel:setTextColor(55, 62, 44)
		localGroup:insert(fireLevel)	]]	
----
--[[	local x2Up = _G.doubleTrouble
	local x2Next = 0
	if x2Up > 9 then
		x2Next = 100
		if x2Up > 19 then
			x2Next = 150
			if x2Up > 29 then
				x2Next = 250
				if x2Up > 39 then
					x2Next = 350
					if x2Up > 49 then
						x2Next = 500
						if x2Up > 74 then
							x2Next = 750
								if x2Up >99 then
								x2Next = 1000
							end
						end
					end
				end
			end
		end
	else
	x2Next = 50
	end]]
	
	local x2Counter = display.newText ("Level Up", 1, 1, gameFont, 12)
		x2Counter:setReferencePoint(centerReferencePoint)
		x2Counter.x =display.contentWidth/2+165
		x2Counter.y =display.contentHeight/2 +45
		x2Counter:setTextColor(55, 62, 44)
		x2Counter.alpha = 0
		localGroup:insert(x2Counter)
	
	local x2Perc = arcadeDouble/x2Next * 100
	local x2Got = x2Perc/100*260	
			if x2Got>260 then
				x2Got = 260
			end	
			if arcadeDouble >= x2Next then
				arcadeDouble = 0
				doubleTrouble = doubleTrouble + 1
			end	
	local x2UpApp = function ()
		if x2Got == 260 then
			x2Counter.alpha = 1
		end
	end	
	local x2BG = display.newRoundedRect(display.contentWidth/2-145, display.contentHeight/2+40, 270, 10, 4)
		x2BG:setFillColor(91, 71, 61, 80)
		localGroup:insert(x2BG)
	local x2Bar = display.newRect (display.contentWidth/2-140, display.contentHeight/2+43, x2Got, 4)
		x2Bar:setFillColor (49,169, 0)	
		x2Bar.xScale = 0.01
		x2Bar:setReferencePoint(display.CenterLeftReferencePoint)
		x2BarTransition = tnt:newTransition (x2Bar,{time = 1000, xScale = 1, onEnd = x2UpApp})	
		localGroup:insert(x2Bar)
	--local x2Text = display.newText ("Double trouble", display.contentWidth/2- 140, display.contentHeight/2 + 28, _G.gameFont, 14)
		--x2Text:setReferencePoint(centerReferencepoint)
		--x2Text.x = display.contentWidth/2- 95 
		--x2Text.y = display.contentHeight/2 +35
	--	x2Text:setTextColor(55, 62, 44)
	--	localGroup:insert (x2Text)

	--[[local x2Level = display.newText (x2Next, 1, 1, _G.gameFont, 14)
		x2Level:setReferencePoint(centerReferencePoint)
		x2Level.x = display.contentWidth/2 +80
		x2Level.y = display.contentHeight/2 +35
		x2Level:setTextColor(55, 62, 44)
		localGroup:insert(x2Level)		]]
---
--[[	local RFUp = _G.rainmaker
	local RFNext = 0
	if RFUp > 9 then
		RFNext = 100
		if RFUp > 19 then
			RFNext = 150
			if RFUp > 29 then
				RFNext = 250
				if RFUp > 39 then
					RFNext = 350
					if RFUp > 49 then
						RFNext = 500
						if RFUp > 74 then
							RFNext = 750
								if RFUp >99 then
								RFNext = 1000
							end
						end
					end
				end
			end
		end
	else
	RFNext = 50
	end]]
	
	local RFCounter = display.newText ("Level Up", 1, 1, gameFont, 12)
		RFCounter:setReferencePoint(centerReferencePoint)
		RFCounter.x =display.contentWidth/2+165
		RFCounter.y =display.contentHeight/2 +67
		RFCounter:setTextColor(55, 62, 44)
		RFCounter.alpha = 0
		localGroup:insert(RFCounter)
	
	local RFPerc = arcadeRain/RFNext * 100
	local RFGot = RFPerc/100*260
			if RFGot>260 then
				RFGot = 260
			end
			if arcadeRain >= RFNext then
				arcadeRain = 0
				rainmaker = rainmaker+1
			end
	local RFUpApp = function ()
		if RFGot == 260 then
			RFCounter.alpha = 1
		end
	end		
	local RFBG = display.newRoundedRect(display.contentWidth/2-145, display.contentHeight/2+62, 270, 10,4)
		RFBG:setFillColor(91, 71, 61, 80)
		localGroup:insert(RFBG)
	local RFBar = display.newRect (display.contentWidth/2-140, display.contentHeight/2+65,RFGot, 4)
		RFBar:setFillColor (49,169, 0)
		RFBar.xScale = 0.01
		RFBar:setReferencePoint(display.CenterLeftReferencePoint)
		RFBarTransition = tnt:newTransition (RFBar,{time = 1000, xScale = 1, onEnd = RFUpApp})
		localGroup:insert(RFBar)
	--local RFText  = display.newText ("Rainmaker", display.contentWidth/2- 140, display.contentHeight/2 +69, _G.gameFont, 14)
		--RFText:setReferencePoint(centerReferencepoint)
		--RFText.x = display.contentWidth/2- 95 
		--RFText.y = display.contentHeight/2 +76
	--	RFText:setTextColor(55, 62, 44)
	--	localGroup:insert (RFText)

--[[	local RFLevel = display.newText (RFNext, 1, 1, _G.gameFont, 14)
		RFLevel:setReferencePoint(centerReferencePoint)
		RFLevel.x = display.contentWidth/2 +80
		RFLevel.y = display.contentHeight/2 +76
		RFLevel:setTextColor(55, 62, 44)
		localGroup:insert(RFLevel)			]]
----
	--[[local FAUp = _G.rocketman
	local FANext = 0
	if FAUp > 9 then
		FANext = 100
		if FAUp > 19 then
			FANext = 150
			if FAUp > 29 then
				FANext = 250
				if FAUp > 39 then
					FANext = 350
					if FAUp > 49 then
						FANext = 500
						if FAUp > 74 then
							FANext = 750
								if FAUp >99 then
								FANext = 1000
							end
						end
					end
				end
			end
		end
	else
	FANext = 50
	end]]
	local FACounter = display.newText ("Level Up", 1, 1, gameFont, 12)
		FACounter:setReferencePoint(centerReferencePoint)
		FACounter.x =display.contentWidth/2+165
		FACounter.y =display.contentHeight/2 +90
		FACounter:setTextColor(55, 62, 44)
		FACounter.alpha = 0
		localGroup:insert(FACounter)	

	local FAPerc = arcadeRocket/FANext * 100
	local FAGot = FAPerc/100*260
			if FAGot>260 then
				FAGot = 260
			end
			if arcadeRocket >= FANext then
				arcadeRocket = 0
				rocketman = rocketman + 1
			end
	local FAUpApp = function ()
		if FAGot == 260 then
			FACounter.alpha = 1
		end
	end		
	local FABG = display.newRoundedRect(display.contentWidth/2-145, display.contentHeight/2+84, 270, 10, 4)
		FABG:setFillColor(91, 71, 61, 80)
		localGroup:insert(FABG)
	local FABar = display.newRect (display.contentWidth/2-140, display.contentHeight/2+87, FAGot, 4)
		FABar:setFillColor (49,169, 0)
		FABar.xScale = 0.01
		FABar:setReferencePoint(display.CenterLeftReferencePoint)
		FABarTransition = tnt:newTransition (FABar,{time = 1000, xScale = 1, onEnd = FAUpApp})	
		localGroup:insert(FABar)
	--local FAText = display.newText ("Rocketman", display.contentWidth/2- 140, display.contentHeight/2 + 110, _G.gameFont, 14)
		--FAText:setReferencePoint(centerReferencepoint)
		--FAText.x = display.contentWidth/2- 95 
		--FAText.y = display.contentHeight/2 +117
	--	FAText:setTextColor(55, 62, 44)
	--	localGroup:insert (FAText)

--[[	local FAUp = display.newText (FANext, 1, 1, _G.gameFont, 14)
		FAUp:setReferencePoint(centerReferencePoint)
		FAUp.x = display.contentWidth/2 +80
		FAUp.y = display.contentHeight/2 +117
		FAUp:setTextColor(55, 62, 44)
		localGroup:insert(FAUp)]]

	local homeButton = display.newRect (display.contentWidth/2 - 150,display.contentHeight/2 + 114,98,36)
		homeButton:setFillColor(255, 255, 255, 0)
	localGroup:insert(homeButton)
	local homeText = display.newText ("Quit", 1,1,gameFont, 20)
		homeText:setReferencePoint(centerReferencePoint)
		homeText.x = display.contentWidth/2 - 100
		homeText.y = display.contentHeight/2 +132
		localGroup:insert(homeText)

	local function home (event)
		if event.phase == "ended" then
			--goHome = true
			--menuIsActive = true
			localGroup:removeSelf()
			localGroup = nil
			local menu = menu.menu
			menu(data)
		end
	end
	homeButton:addEventListener ("touch", home)
	
	local retryButton = display.newRect (display.contentWidth/2 + 52,display.contentHeight/2 + 115,97,35)
		retryButton:setFillColor(255, 255, 255, 0)
	localGroup:insert(retryButton)
	local retryText = display.newText ("Retry", 1,1,gameFont, 20)
		retryText:setReferencePoint(centerReferencePoint)
		retryText.x = display.contentWidth/2 + 102
		retryText.y = display.contentHeight/2 +132	
		localGroup:insert(retryText)
		
	local retryFunction = function()
			localGroup:removeSelf()
			localGroup = nil
			local game = game.game
			game (data)
	end
end
m.arcade = arcade

return m