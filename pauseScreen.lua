local m = {}

local pauseFunction = function()

	pauseGroup = display.newGroup()
	pauseMenuOn = true
	-----background images-----------------------------------------
	local BG = display.newRect(0,0, display.contentWidth, display.contentHeight)
	BG:setFillColor(0,0,0,210)
	pauseGroup:insert(BG)
	
	local PMenuScreenBG = display.newImage("images/pauseMenu.png")
		PMenuScreenBG.x = display.contentCenterX
		PMenuScreenBG.y = display.contentCenterY+2

	-----text display objects------
	local gameStatsText = display.newText ("game", display.contentCenterX -117,display.contentCenterY - 129, _G.gameFont, 14)
	local shopText = display.newText ("shop", display.contentCenterX + 101, display.contentCenterY - 92, _G.gameFont, 14)
	local waveNoText = display.newText ("Wave", display.contentCenterX -88,display.contentCenterY-95, _G.gameFont, 18)
		waveNoText:setTextColor (55,62,44)
	local waveNoCounter = display.newText (waveNo, display.contentCenterX -35,display.contentCenterY-95, _G.gameFont, 18)
		waveNoCounter:setTextColor (55,62,44)
	local goldText = display.newText ("Gold",display.contentCenterX+57,display.contentCenterY-127, _G.gameFont, 15)
		goldText:setTextColor (55,62,44)
	local coins = display.newText (_G.playerCoins,display.contentCenterX+150,display.contentCenterY - 130, _G.gameFont, 19)
		coins:setTextColor (55,62,44)
		coins:setReferencePoint(display.TopCenterReferencePoint)
		coins.x = display.contentCenterX + 140
	local livesText = display.newText ("lives",display.contentCenterX-174,display.contentCenterY-95, _G.gameFont, 18)
		livesText:setTextColor (55,62,44)
	local livesCounter = display.newText (_G.lives,display.contentCenterX -130,display.contentCenterY-95, _G.gameFont, 18)
		livesCounter:setTextColor (55,62,44)
		livesCounter:setReferencePoint(display.TopCenterReferencePoint)
	local accuracyText = display.newText ("Accuracy", display.contentCenterX - 174,display.contentCenterY -63, _G.gameFont, 17)
		accuracyText:setTextColor (55,62,44)
	local waveAccuracyText = display.newText ("this wave",display.contentCenterX - 142,display.contentCenterY -32, _G.gameFont, 15)
		waveAccuracyText:setTextColor (55,62,44)
	local accuracyCounter = display.newText (_G.gameAccuracy.." %",display.contentCenterX - 120, display.contentCenterY -64, _G.gameFont, 18)
		accuracyCounter:setTextColor (55,62,44)
		accuracyCounter:setReferencePoint(display.TopCenterReferencePoint)
		accuracyCounter.x = display.contentCenterX -30
	local waveAccuracyCounter = display.newText (_G.accuracy.." %",display.contentCenterX - 120,display.contentCenterY - 34, _G.gameFont, 16)
		waveAccuracyCounter:setTextColor (55,62,44)
		waveAccuracyCounter:setReferencePoint(display.TopCenterReferencePoint)
		waveAccuracyCounter.x = display.contentCenterX - 32
	local birdyCountText = display.newText ("Birdy count", display.contentCenterX - 171,display.contentCenterY - 2, _G.gameFont,17)
		birdyCountText:setTextColor (55,62,44)
	local waveBirdyCountText = display.newText("this wave", display.contentCenterX - 142,display.contentCenterY+27, _G.gameFont, 15)
		waveBirdyCountText:setTextColor (55,62,44)
	local birdyCountCounter = display.newText (_G.birdyHits,display.contentCenterX-73, display.contentCenterY - 3, _G.gameFont, 20)
		birdyCountCounter:setTextColor (55,62,44)
		birdyCountCounter:setReferencePoint(display.TopCenterReferencePoint)
		birdyCountCounter.x = display.contentCenterX -32
	local waveBirdyCounter = display.newText (_G.gameBirdyHits,display.contentCenterX-140,display.contentCenterY+24, _G.gameFont, 18)
		waveBirdyCounter:setTextColor (55,62,44)
		waveBirdyCounter:setReferencePoint(display.TopCenterReferencePoint)
		waveBirdyCounter.x = display.contentCenterX -33

	local quitBtn = display.newRect (display.contentCenterX -128,display.contentCenterY+72, 63, 27)	
		quitBtn:setFillColor (255, 255, 255, 0)
	local quitBtnText = display.newText ("quit",display.contentCenterX -105,display.contentCenterY+76, _G.gameFont, 15)
	local sure = sure.areYouSure
	local quitFunction = function (event)
		if event.phase == "ended" then
			sure()
		end
	end
	quitBtn:addEventListener("touch", quitFunction)
		
	-----update currency with purchased items------------------------
	local updateCoins = function ()
		coins.text = (_G.playerCoins)
	end
	
	------------------buttons----------------------------------------

	-------buy extra life----
	local extraLifeText = display.newText ("extra life",display.contentCenterX+82,display.contentCenterY-70, _G.gameFont, 15)
		extraLifeText:setTextColor (55,62,44)
	
	local extraLife = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex("buyBtnWhite")}} )
		extraLife.x = display.contentCenterX + 191
		extraLife.y = display.contentCenterY-62
		extraLife.alpha = 0.01
		local extraLifeFunction = function (event)
			if event.phase == "ended" and _G.playerCoins > 0 then
				audio.play(weaponSelectSound)
				_G.playerCoins = _G.playerCoins - 1
				updateCoins()
				_G.GOCount = _G.GOCount - 1
				_G.removeGOCount()
				extraLife.alpha = 1
				extraLifeTransition = tnt:newTransition (extraLife, {time = 1000, alpha = 0.01})
			end
		end
	extraLife:addEventListener ("touch", extraLifeFunction)
	local extraLifePrice = display.newText ("5",display.contentCenterX+169,display.contentCenterY-71, _G.gameFont, 15)
	extraLifePrice:setReferencePoint(display.TopCenterReferencePoint)
	extraLifePrice.x = display.contentCenterX + 193
	
	
	------buy fire arrows------
	local buyFireAText = display.newText ("fire arrows",display.contentCenterX + 74,display.contentCenterY-42, _G.gameFont, 15)
		buyFireAText:setTextColor (55,62,44)
	local buyFireA = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex("buyBtnWhite")}} )
	buyFireA.x = display.contentCenterX + 191
	buyFireA.y = display.contentCenterY -34 
	buyFireA.alpha = 0.01
		local buyFireAFunction = function (event)
			if event.phase == "ended" and _G.playerCoins > 4 then
				audio.play(weaponSelectSound)
				_G.playerCoins = _G.playerCoins - 5
				updateCoins()
				ammoFA = ammoFA + 1
				updateAmmo()
				buyFireA.alpha = 1
				buyFireATransition = tnt:newTransition (buyFireA, {time = 1000, alpha = 0.01})
			end
		end
	buyFireA:addEventListener("touch", buyFireAFunction)
	local buyFireAPrice = display.newText ("5", display.contentCenterX +169,display.contentCenterY-43, _G.gameFont, 15)
	buyFireAPrice:setReferencePoint (display.TopCenterReferencePoint)
	buyFireAPrice.x = display.contentCenterX + 193
	
	
	
	-----buy Rapid Fire---
	local buyRFText = display.newText ("rapid fire",display.contentCenterX+85 ,display.contentCenterY-15, _G.gameFont, 15)	
		buyRFText:setTextColor (55,62,44)
	local buyRF = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex("buyBtnWhite")}} )
		buyRF.x = display.contentCenterX + 191
		buyRF.y = display.contentCenterY - 6
		buyRF.alpha = 0.01
			local buyRFFunction = function(event)
				if event.phase == "ended" and _G.playerCoins > 2 then
					audio.play(weaponSelectSound)
					_G.playerCoins = _G.playerCoins - 3
					updateCoins()
					ammoRF = ammoRF + 1
					updateAmmo()
					buyRF.alpha = 1
					buyRFTransition = tnt:newTransition (buyRF, {time = 1000, alpha = 0.01})
				end
			end
		buyRF:addEventListener ("touch", buyRFFunction)
		local buyRFPrice = display.newText ("5",display.contentCenterX + 169,display.contentCenterY-15, _G.gameFont, 15)
		buyRFPrice:setReferencePoint(display.TopCenterReferencePoint)
		buyRFPrice.x = display.contentCenterX + 193
	
	--------buy 2 Arrows-----
	local buyx2AText = display.newText ("double arrows", display.contentCenterX + 67,display.contentCenterY+11, _G.gameFont, 15)
		buyx2AText:setTextColor (55,62,44)
	local buyx2A = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex("buyBtnWhite")}} )
		buyx2A.x = display.contentCenterX +191
		buyx2A.y = display.contentCenterY+20 
		buyx2A.alpha = 0.01
			local buyx2AFunction = function(event)
				if event.phase == "ended" and _G.playerCoins > 1 then
					audio.play(weaponSelectSound)
					_G.playerCoins = _G.playerCoins - 2
					updateCoins()
					ammox2A = ammox2A + 1
					updateAmmo()
					buyx2A.alpha = 1
					buyx2ATransition = tnt:newTransition (buyx2A, {time = 1000, alpha = 0.01})
				end
			end
		buyx2A:addEventListener ("touch", buyx2AFunction)	
		local buyx2APrice = display.newText ("5",display.contentCenterX + 169,display.contentCenterY+11 , _G.gameFont, 15)		
		buyx2APrice:setReferencePoint(display.TopCenterReferencePoint)
		buyx2APrice.x = display.contentCenterX + 193
	
	-----buy Fast Arrows---
	local buyFAText = display.newText ("power arrows",display.contentCenterX+68,display.contentCenterY+37, _G.gameFont, 15)	
		buyFAText:setTextColor (55,62,44)
	local buyFA = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex("buyBtnWhite")}} )
		buyFA.x = display.contentCenterX +191 
		buyFA.y = display.contentCenterY+46
		buyFA.alpha = 0.01
			local buyFAFunction = function (event)
				if event.phase == "ended" and _G.playerCoins > 3 then
					audio.play(weaponSelectSound)
					_G.playerCoins = _G.playerCoins - 4
					updateCoins()
					ammoFA = ammoFA + 1
					updateAmmo()
					buyFA.alpha = 1
					buyFATransition = tnt:newTransition (buyFA, {time = 1000, alpha = 0.01})
				end
			end
		buyFA:addEventListener ("touch", buyFAFunction)
		local buyFAPrice = display.newText ("5",display.contentCenterX+169,display.contentCenterY+36, _G.gameFont, 15)
		buyFAPrice:setReferencePoint(display.TopCenterReferencePoint)
		buyFAPrice.x = display.contentCenterX + 193
	
		-----buy unlimited quick reloads----
	local buyARFText = display.newText ("always rapid fire",display.contentCenterX+42,display.contentCenterY+74, _G.gameFont, 14)
		buyARFText:setTextColor (55,62,44)
	local buyARF = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex("buyBtnWhite2")}} )
		buyARF.x = display.contentCenterX + 184
		buyARF.y = display.contentCenterY +79
		buyARF.alpha = 0.01
			local buyARFFunction = function(event)
				if event.phase == "ended" then
					audio.play(weaponSelectSound)
					buyARF.alpha = 1
					buyARFTransition = tnt:newTransition (buyARF, {time = 1000, alpha = 0.01})
				end
			end
		buyARF:addEventListener("touch", buyARFFunction)
		local buyARFPrice = display.newText ("2000",display.contentCenterX + 160,display.contentCenterY+71, _G.gameFont, 11)		
		buyARFPrice:setReferencePoint(display.TopCenterReferencePoint)
		buyARFPrice.x = display.contentCenterX+188
	
	local quitBtnFunction = function (event)
		if event.phase == "ended" then
			audio.play(clickSound)
		end
	end
	quitBtn:addEventListener ("touch", quitBtnFunction)
	
	
	-----Un-pause button-----	
	local unPauseBtn = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex("close")}} )
	unPauseBtn.x = 20
	unPauseBtn.y = 20
	
    ----add items to pauseGroup-----
	pauseGroup:insert(PMenuScreenBG)
	pauseGroup:insert(waveNoText)
	pauseGroup:insert(gameStatsText)
	pauseGroup:insert(shopText)
	pauseGroup:insert(unPauseBtn)
	pauseGroup:insert(waveNoCounter)
	pauseGroup:insert(goldText)
	pauseGroup:insert(accuracyCounter)
	pauseGroup:insert(waveAccuracyCounter)
	pauseGroup:insert(birdyCountText)
	pauseGroup:insert(birdyCountCounter)
	pauseGroup:insert(waveBirdyCountText)
	pauseGroup:insert(waveBirdyCounter)
	pauseGroup:insert(quitBtn)
	pauseGroup:insert(quitBtnText)
	pauseGroup:insert(extraLife)
	pauseGroup:insert(extraLifeText)
	pauseGroup:insert(extraLifePrice)
	pauseGroup:insert(buyFireA)
	pauseGroup:insert(buyFireAText)
	pauseGroup:insert(buyFireAPrice)
	pauseGroup:insert(buyx2A)
	pauseGroup:insert(buyx2AText)
	pauseGroup:insert(buyx2APrice)
	pauseGroup:insert(buyRF)
	pauseGroup:insert(buyRFText)
	pauseGroup:insert(buyRFPrice)
	pauseGroup:insert(buyFA)
	pauseGroup:insert(buyFAText)
	pauseGroup:insert(buyFAPrice)
	pauseGroup:insert(buyARF)
	pauseGroup:insert(buyARFText)
	pauseGroup:insert(buyARFPrice)
	
	pauseGroup:insert(waveNoText)
	pauseGroup:insert(coins)
	pauseGroup:insert(livesCounter)
	pauseGroup:insert(livesText)
	pauseGroup:insert(birdyCountText)
	pauseGroup:insert(accuracyText)
	pauseGroup:insert(waveAccuracyText)

	--------remove pause menu and unpause the game--
	local function unPauseGame (event)
		if event.phase == "ended" then
			----remove objects -----
			pauseGroup:removeSelf()
			pauseGroup = nil			
			----resume game---
			audio.play(clickSound)
			_G.paused = false
			pauseMenuOn = false
			if _G.waveOver == false then
				physics.start()
				tnt:resumeAllTransitions()
				tnt:resumeAllTimers()
			end
		end
	end
	unPauseBtn:addEventListener("touch", unPauseGame)

end

m.pauseMenu = pauseFunction

return m