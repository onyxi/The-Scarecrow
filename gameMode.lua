--module(..., package.seeall)

local m = {}
local gameMode = function (data)
	local localGroup = display.newGroup()
	--_G.menuIsActive = false
	--_G.mode = true
	local gameFont = "Suplexmentary Comic NC"
	local sure = false
	--[[local mode = false
	local activateMode = function()
		mode = true
		print ("changed")
	end	
	print("addtimer")
	local activateModeTimer = tnt:newTimer(600, activateMode)
	activateMode()]]
	
	local test = function()
	print (mode)
	end	
	--Runtime:addEventListener ("enterFrame", test)
	
	
	local BG = display.newRect(0,0,570,360)
		BG:setReferencePoint(display.CenterReferencePoint)
		BG.x = display.contentCenterX
		BG.y = display.contentCenterY
		BG:setFillColor(0,0,0)
		localGroup:insert(BG)
		
	local background = display.newImage("images/gameModeScreen.png")
		background:setReferencePoint(display.CenterReferencePoint)
		background.x = display.contentCenterX
		background.y = display.contentCenterY-7
		localGroup:insert(background)

	local titleText = display.newText("-Game Mode-", 1, 1,gameFont, 25)
		 titleText:setReferencePoint(display.CenterReferencePoint)
		 titleText.x = display.contentWidth/2
		 titleText.y = display.contentHeight/2 - 145
		 titleText:setTextColor(247, 230, 202)
		localGroup:insert( titleText)
		
	local arcade = display.newText("Arcade", 1, 1,gameFont, 18)
		arcade:setReferencePoint(display.CenterReferencePoint)
		arcade.x = display.contentWidth/2 - 110
		arcade.y = display.contentHeight/2 - 100
		arcade:setTextColor(247, 230, 202)
		localGroup:insert(arcade)
	
	local high1 = display.newText("highscores...", 1, 1,gameFont, 15)
		high1:setReferencePoint(display.CenterReferencePoint)
		high1.x = display.contentWidth/2- 135
		high1.y = display.contentHeight/2-70
		high1:setTextColor(55, 62, 44)
		localGroup:insert(high1)
		
	local birdy = display.newText("birdy count", 1,1, gameFont, 20)
		birdy:setReferencePoint(display.CenterReferencePoint)
		birdy.x = display.contentWidth/2- 105
		birdy.y = display.contentHeight/2-40
		birdy:setTextColor(55, 62, 44)
		localGroup:insert(birdy)
	
	local birdyCounter = display.newText("2346", 1, 1,gameFont, 25)
		birdyCounter:setReferencePoint(display.CenterReferencePoint)
		birdyCounter.x = display.contentWidth/2- 110
		birdyCounter.y = display.contentHeight/2-15
		birdyCounter:setTextColor(230, 18, 18)
		localGroup:insert(birdyCounter)
	
	local accuracy = display.newText("accuracy", 1,1, gameFont, 20)
		accuracy:setReferencePoint(display.CenterReferencePoint)
		accuracy.x = display.contentWidth/2- 110
		accuracy.y = display.contentHeight/2+20
		accuracy:setTextColor(55, 62, 44)
		localGroup:insert(accuracy)
	
	local accuracyCounter = display.newText("86".." %", 1, 1,gameFont, 25)
		accuracyCounter:setReferencePoint(display.CenterReferencePoint)
		accuracyCounter.x = display.contentWidth/2- 110
		accuracyCounter.y = display.contentHeight/2+ 40
		accuracyCounter:setTextColor(230, 18, 18)
		localGroup:insert(accuracyCounter)
		
	local start1 = display.newText("Start", 1,1, gameFont, 20)
		start1:setReferencePoint(display.CenterReferencePoint)
		start1.x = display.contentWidth/2- 111
		start1.y = display.contentHeight/2+79
		start1:setTextColor(247, 230, 202)
		localGroup:insert(start1)
	local start1Btn = display.newRect (display.contentWidth/2-150, display.contentHeight/2 + 65, 90, 30)
		start1Btn:setFillColor (255, 255, 255, 0)
		localGroup:insert(start1Btn)
	local startArcade = function(event)
		if event.phase == "ended"  then
		--and mode == true then
			localGroup:removeSelf()
			localGroup = nil
			data.gameType = "arcade"
			--local gameType = "arcade"
			--mode = false
			local houseReady = houseReady.houseReady
			houseReady(data)
			--director:changeScene ("scripts.house_ready", "fade")
		end
	end
	start1Btn:addEventListener ("touch", startArcade)		
	-------------------------
	local campaign = display.newText("Campaign", 1, 1,gameFont, 18)
		campaign:setReferencePoint(display.CenterReferencePoint)
		campaign.x = display.contentWidth/2 +115
		campaign.y = display.contentHeight/2-100
		campaign:setTextColor(247, 230, 202)
		localGroup:insert(campaign)
	
	local wave = display.newText("wave", 1,1, gameFont, 25)
		wave:setReferencePoint(display.CenterReferencePoint)
		wave.x = display.contentWidth/2+115
		wave.y = display.contentHeight/2-60
		wave:setTextColor(55, 62, 44)
		localGroup:insert(wave)
	
	local waveCounter = display.newText(data.waveNo, 1, 1,gameFont, 40)
		waveCounter:setReferencePoint(display.CenterReferencePoint)
		waveCounter.x = display.contentWidth/2+115
		waveCounter.y = display.contentHeight/2-20
		waveCounter:setTextColor(22, 76, 239)
		localGroup:insert(waveCounter)
	
	local startOver = display.newText ("start again?", 1, 1, gameFont, 14)
		startOver:setReferencePoint (display.CenterReferencePoint)
		startOver.x = display.contentWidth/2+115
		startOver.y = display.contentHeight/2+20
		startOver:setTextColor(18, 161, 0)
		localGroup:insert(startOver)

	local wave = data.waveNo
	local start2
	if wave == 1 then
		start2 = display.newText("Start", 1,1, gameFont, 20)
	end
	
	if data.waveNo > 1 then
		start2 = display.newText("Resume", 1,1, gameFont, 20)
	end
	
		start2:setReferencePoint(display.CenterReferencePoint)
		start2.x = display.contentWidth/2+110
		start2.y = display.contentHeight/2+79
		start2:setTextColor(247, 230, 202)	
		localGroup:insert(start2)
	local start2Btn = display.newRect (display.contentWidth/2+60, display.contentHeight/2 + 65, 108, 30)
		start2Btn:setFillColor (255, 255, 255, 0)
	localGroup:insert(start2Btn)
	
	local resumeCampaign = function(event)
		if event.phase == "ended" then
		--and mode == true then
			localGroup:removeSelf()
			localGroup = nil
			--_G.mode = false
			data.gameType = "campaign"
			--local gameType = "campaign"
			local houseReady = houseReady.houseReady
			houseReady(data)
			--gameType, data)
			--director:changeScene ("scripts.house_ready", "fade")

		end
	end
	start2Btn:addEventListener ("touch", resumeCampaign)
	

	local startOverBtn = display.newRect (display.contentWidth/2+70, display.contentHeight/2+10, 90, 20)
		startOverBtn:setFillColor (2, 255, 25, 0)
		localGroup:insert(startOverBtn)
		
	--local sure = sure.areYouSure
	local areYouSureFunction = function (event)
		if event.phase == "ended" and sure == false then
		sure = true
		--and mode == true then
			--waveCounter.text = "1"
			--local mode = true
			--sure(data, mode)
		--	local new = function(data, mode)
			--	local mode = mode
				local localGroup = display.newGroup()
				--_G.sureScreen = true
			--	local gameFont = "Suplexmentary Comic NC"
				
				local background = display.newRect(0,0,display.contentWidth, display.contentHeight+30)
					background:setFillColor(0,0,0,220)
					localGroup:insert(background)

				local sureText = display.newText("Are you sure?", 1, 1, gameFont, 24)
					sureText:setReferencePoint(centerReferencePoint)
					sureText.x = display.contentWidth/2
					sureText.y = display.contentHeight/2-30
					localGroup:insert(sureText)

				local yes = display.newRect(1, 1, 50, 30)
					yes:setReferencePoint(centerReferencePoint)
					yes.x = display.contentWidth/2-40
					yes.y = display.contentHeight/2 + 10
					yes:setFillColor(0,255, 0,0)
					localGroup:insert(yes)
					
				local yesFunction = function (event)
					if event.phase == "ended" then
					--and _G.sureScreen == true then
						--if mode == true then
						print ("test")
							data.waveNo = 1
							waveCounter.text = data.waveNo
							--_G.start2.text = "Start"
						--else
						--if gameIsActive == true then
						--	_G.goHome = true

						----	pauseGroup:removeSelf()
						--	pauseGroup = nil		
							
					
							localGroup:removeSelf()
							localGroup = nil
							sure = false
						--	_G.sureScreen = false
					end
				end
				yes:addEventListener("touch", yesFunction)
					
				local yesText = display.newText("Yes", 1,1,gameFont, 25)
					yesText:setReferencePoint(centerReferencePoint)
					yesText.x = display.contentWidth/2-40
					yesText.y = display.contentHeight/2 + 10
					localGroup:insert(yesText)

				local no = display.newRect(1, 1, 50, 30)
					no:setReferencePoint(centerReferencePoint)
					no.x = display.contentWidth/2+40
					no.y = display.contentHeight/2 + 10
					no:setFillColor(255, 0, 0, 0)
					localGroup:insert(no)
				local noFunction = function (event)
					if event.phase == "ended" then
					--and _G.sureScreen == true then
						--_G.sureScreen = false
						localGroup:removeSelf()
						localGroup = nil
						sure = false
					end
				end
				no:addEventListener("touch", noFunction)
				
				local noText = display.newText("No", 1,1,gameFont, 25)
					noText:setReferencePoint(centerReferencePoint)
					noText.x = display.contentWidth/2+40
					noText.y = display.contentHeight/2 + 10
					localGroup:insert(noText)
		end
	end
	startOverBtn:addEventListener("touch", areYouSureFunction)
		
	local howToPlay =  display.newImage ("images/grassSign.png")
		howToPlay.x = display.contentWidth/2
		howToPlay.y = display.contentHeight +50
		localGroup:insert(howToPlay)
		howToPlayTransition = tnt:newTransition(howToPlay, {time = 500, y = display.contentHeight-15})
	local howToText = display.newText ("How to play", 1, 1, gameFont, 20)
		howToText:setReferencePoint(display.CenterReferencePoint)
		howToText.x = display.contentWidth/2
		howToText.y = display.contentHeight+45
		localGroup:insert (howToText)
		howToTransition = tnt:newTransition(howToText, {time = 500, y = display.contentHeight-20})
	local howToBtn = display.newRect (display.contentWidth/2-85, display.contentHeight - 30, 175, 25)
		howToBtn:setFillColor(160, 25, 36, 0)
		localGroup:insert(howToBtn)
	

	
	local howToFunction = function (event)
		if event.phase == "ended" then
		--and mode == true then

			tnt:cleanTimersAndTransitions()
			tnt:cancelAllTimers()
			tnt:cancelAllTransitions()
			activateModeTimer = nil
			localGroup:removeSelf()
			localGroup = nil	
			local howTo = howTo.howTo
			howTo(data)
		end
	end
	howToBtn:addEventListener("touch", howToFunction)

return localGroup	
		
end


m.gameMode = gameMode

return m