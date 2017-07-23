local m = {}
local new = function(data)
--birdPerc, birdGot, birdNext, firePerc, fireGot, fireNext, x2Perc, x2Got, x2Next, RFPerc, RFGot, RFNext, FAPerc, FAGot, FANext, exterminator, dragonsBreath, rainmaker, doubleTrouble, rocketman)
	local data = data
--	local birdPerc = data.birdPerc
--	local birdGot = data.birdGot
--	local birdNext = data.birdNext
--	local firePerc = data.firePerc
--	local fireGot = data.fireGot
--	local fireNext = data.fireNext
--	local x2Perc = data.x2Perc
--	local x2Got = data.x2Got
--	local x2Next = data.x2Next
--	local RFPerc = data.RFPerc
--	local RFGot = data.RFGot
--	local RFNext = data.RFNext
--	local FAPerc = data.FAPerc
--	local FAGot = data.FAGot
--	local FANext = data.FANext
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
	
	
	
	
	----background images
	local BG = display.newRect(0,0,570,360)
		BG:setReferencePoint (display.CenterReferencePoint)
		BG.x = display.contentCenterX
		BG.y = display.contentCenterY
		BG:setFillColor(0,0,0,210)
		localGroup:insert(BG)
	
	local background = display.newImage ("images/awardScreen.png")
		background.x = display.contentWidth/2
		background.y = display.contentHeight/2
		localGroup:insert(background)
	
	----menu text
	local titleText = display.newText ("Awards", 1, 1, gameFont, 20)
		titleText:setReferencePoint(display.CenterReferencePoint)
		titleText.x = display.contentWidth/2
		titleText.y = display.contentHeight/2 - 127
		titleText:setTextColor(55, 62, 44)
		localGroup:insert(titleText)
		
	local adviceText = display.newText ("Play Arcade to increase levels", 1, 1, gameFont, 16)
		adviceText:setReferencePoint(display.CenterReferencePoint)
		adviceText.x = display.contentWidth/2
		adviceText.y = display.contentHeight/2 - 87
		adviceText:setTextColor(55, 62, 44)
		localGroup:insert(adviceText)
	
	local birdBG = display.newRoundedRect(display.contentWidth/2-150, display.contentHeight/2-58, 270, 20, 6)
		birdBG:setFillColor(91, 71, 61, 80)
		localGroup:insert(birdBG)
	
	local birdBar = display.newRect (display.contentWidth/2-145, display.contentHeight/2-55, birdGot, 14)
		birdBar:setFillColor (49,169, 0)
		birdBar.xScale = 0.01
		birdBar:setReferencePoint(display.CenterLeftReferencePoint)
		birdBarTransition = tnt:newTransition (birdBar,{time = 1000, xScale = 1})	
		localGroup:insert(birdBar)	
	
	local birdText = display.newText ("Exterminator", display.contentWidth/2- 140, display.contentHeight/2 - 56, gameFont, 14)
		birdText:setTextColor(55, 62, 44)
		localGroup:insert (birdText)
	
	local birdCounter = display.newText ("Level  "..exterminator, 1, 1, gameFont, 19)
		birdCounter:setReferencePoint(display.CenterReferencePoint)
		birdCounter.x =display.contentWidth/2+175
		birdCounter.y =display.contentHeight/2 -49
		birdCounter:setTextColor(55, 62, 44)
		localGroup:insert(birdCounter)
	
	local birdLevel = display.newText (birdNext, 1, 1, gameFont, 14)
		birdLevel:setReferencePoint(display.CenterReferencePoint)
		birdLevel.x = display.contentWidth/2 +80
		birdLevel.y = display.contentHeight/2 -49
		birdLevel:setTextColor(55, 62, 44)
		localGroup:insert(birdLevel)
		
-----awards:
---fire arrow
	local fireBG = display.newRoundedRect(display.contentWidth/2-150, display.contentHeight/2-17, 270, 20, 6)
		fireBG:setFillColor(91, 71, 61, 80)
		localGroup:insert(fireBG)
	local fireBar = display.newRect (display.contentWidth/2-145, display.contentHeight/2-14, fireGot, 14)
		fireBar:setFillColor (49,169, 0)
		fireBar.xScale = 0.01
		fireBar:setReferencePoint(display.CenterLeftReferencePoint)
		fireBarTransition = tnt:newTransition (fireBar,{time = 1000, xScale = 1})	
		localGroup:insert(fireBar)
	local fireText  = display.newText ("Dragon's breath", display.contentWidth/2- 140, display.contentHeight/2 - 15, gameFont, 14)
		fireText:setTextColor(55, 62, 44)
		localGroup:insert (fireText)
	local fireCounter = display.newText ("Level  "..dragonsBreath, 1, 1, gameFont, 19)
		fireCounter:setReferencePoint(display.CenterReferencePoint)
		fireCounter.x =display.contentWidth/2+175
		fireCounter.y =display.contentHeight/2 -8
		fireCounter:setTextColor(55, 62, 44)
		localGroup:insert(fireCounter)
	local fireLevel = display.newText (fireNext, 1, 1, gameFont, 14)
		fireLevel:setReferencePoint(display.CenterReferencePoint)
		fireLevel.x = display.contentWidth/2 +80
		fireLevel.y = display.contentHeight/2 -8
		fireLevel:setTextColor(55, 62, 44)
		localGroup:insert(fireLevel)		

---- double arrows
	local x2BG = display.newRoundedRect(display.contentWidth/2-150, display.contentHeight/2+26, 270, 20, 6)
		x2BG:setFillColor(91, 71, 61, 80)
		localGroup:insert(x2BG)
	local x2Bar = display.newRect (display.contentWidth/2-145, display.contentHeight/2+29, x2Got, 14)
		x2Bar:setFillColor (49,169, 0)	
		x2Bar.xScale = 0.01
		x2Bar:setReferencePoint(display.CenterLeftReferencePoint)
		x2BarTransition = tnt:newTransition (x2Bar,{time = 1000, xScale = 1})	
		localGroup:insert(x2Bar)
	local x2Text = display.newText ("Double trouble", display.contentWidth/2- 140, display.contentHeight/2 + 28, gameFont, 14)
		x2Text:setTextColor(55, 62, 44)
		localGroup:insert (x2Text)
	local x2Counter = display.newText ("Level  "..doubleTrouble, 1, 1, gameFont, 19)
		x2Counter:setReferencePoint(display.CenterReferencePoint)
		x2Counter.x =display.contentWidth/2+175
		x2Counter.y =display.contentHeight/2 +35
		x2Counter:setTextColor(55, 62, 44)
		localGroup:insert(x2Counter)
	local x2Level = display.newText (x2Next, 1, 1, gameFont, 14)
		x2Level:setReferencePoint(display.CenterReferencePoint)
		x2Level.x = display.contentWidth/2 +80
		x2Level.y = display.contentHeight/2 +35
		x2Level:setTextColor(55, 62, 44)
		localGroup:insert(x2Level)		

--- rapid fire
	local RFBG = display.newRoundedRect(display.contentWidth/2-150, display.contentHeight/2+67, 270, 20,6)
		RFBG:setFillColor(91, 71, 61, 80)
		localGroup:insert(RFBG)
	local RFBar = display.newRect (display.contentWidth/2-145, display.contentHeight/2+70,RFGot, 14)
		RFBar:setFillColor (49,169, 0)
		RFBar.xScale = 0.01
		RFBar:setReferencePoint(display.CenterLeftReferencePoint)
		RFBarTransition = tnt:newTransition (RFBar,{time = 1000, xScale = 1})
		localGroup:insert(RFBar)
	local RFText  = display.newText ("Rainmaker", display.contentWidth/2- 140, display.contentHeight/2 +69, gameFont, 14)
		RFText:setTextColor(55, 62, 44)
		localGroup:insert (RFText)
	local RFCounter = display.newText ("Level  "..rainmaker, 1, 1, gameFont, 19)
		RFCounter:setReferencePoint(display.CenterReferencePoint)
		RFCounter.x =display.contentWidth/2+175
		RFCounter.y =display.contentHeight/2 +76
		RFCounter:setTextColor(55, 62, 44)
		localGroup:insert(RFCounter)
	local RFLevel = display.newText (RFNext, 1, 1, gameFont, 14)
		RFLevel:setReferencePoint(display.CenterReferencePoint)
		RFLevel.x = display.contentWidth/2 +80
		RFLevel.y = display.contentHeight/2 +76
		RFLevel:setTextColor(55, 62, 44)
		localGroup:insert(RFLevel)			

---- fast arrows
	local FABG = display.newRoundedRect(display.contentWidth/2-150, display.contentHeight/2+108, 270, 20, 6)
		FABG:setFillColor(91, 71, 61, 80)
		localGroup:insert(FABG)
	local FABar = display.newRect (display.contentWidth/2-145, display.contentHeight/2+111, FAGot, 14)
		FABar:setFillColor (49,169, 0)
		FABar.xScale = 0.01
		FABar:setReferencePoint(display.CenterLeftReferencePoint)
		FABarTransition = tnt:newTransition (FABar,{time = 1000, xScale = 1})	
		localGroup:insert(FABar)
	local FAText = display.newText ("Rocketman", display.contentWidth/2- 140, display.contentHeight/2 + 110, gameFont, 14)
		FAText:setTextColor(55, 62, 44)
		localGroup:insert (FAText)
	local FACounter = display.newText ("Level   "..rocketman, 1, 1, gameFont, 19)
		FACounter:setReferencePoint(display.CenterReferencePoint)
		FACounter.x =display.contentWidth/2+175
		FACounter.y =display.contentHeight/2 +117
		FACounter:setTextColor(55, 62, 44)
		localGroup:insert(FACounter)
	local FAUp = display.newText (FANext, 1, 1, gameFont, 14)
		FAUp:setReferencePoint(display.CenterReferencePoint)
		FAUp.x = display.contentWidth/2 +80
		FAUp.y = display.contentHeight/2 +117
		FAUp:setTextColor(55, 62, 44)
		localGroup:insert(FAUp)

		
		
		

		
-------close button and function
	local closeButton = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex("close")}} )
		closeButton.x = display.contentCenterX - 210
		closeButton.y = 30
		closeButton:setFillColor(30,30,30)
		localGroup:insert(closeButton)

	local function backMenu (event)
		if event.phase == "ended" then
			--_G.menuIsActive = true
			tnt:cleanTimersAndTransitions()
			local menu = menu.menu
			menu(data)
			--birdPerc, birdGot, birdNext, firePerc, fireGot, fireNext, x2Perc, x2Got, x2Next, RFPerc, RFGot, RFNext, FAPerc, FAGot, FANext, exterminator, dragonsBreath, rainmaker, doubleTrouble, rocketman)
			localGroup:removeSelf()
			localGroup = nil
		end
	end
	closeButton:addEventListener ("touch", backMenu)
	
end

m.awardScreen = new
return m