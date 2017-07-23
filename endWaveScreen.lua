local m = {}

local endWaveFunction = function(data)
	local data = data
	
	local pauseMenuOn = false
	--local birdPerc = data.birdPerc
	--local birdGot = data.birdGot
	--local birdNext = data.birdNext
	--local firePerc = data.firePerc
	--local fireGot = data.fireGot
	--local fireNext = data.fireNext
	--local x2Perc = data.x2Perc
	--local x2Got = data.x2Got
	--local x2Next = data.x2Next
	--local RFPerc = data.RFPerc
	--local RFGot = data.RFGot
	--local RFNext = data.RFNext
	--local FAPerc = data.FAPerc
	--local FAGot = data.FAGot
	--local FANext = data.FANext
	--local exterminator = data.exterminator
	--local dragonsBreath = data.dragonsBreath
	--local rainmaker = data.rainmaker
	--local doubleTrouble = data.doubleTrouble
	--local rocketman = data.rocketman
	local gameType = data.gameType
	local waveNo = data.waveNo
	local coins = data.coins
	local FAammo = data.FAammo
	local RFammo = data.RFammo
	local X2ammo = data.X2ammo
	local SAammo = data.SAammo
	local gameBirdyHits = data.gameBirdyHits
	local gameArrowShots = data.gameArrowShots
	local gameAccuracy = data.gameAccuracy
	local accuracy = data.accuracy
	local birdyHits = data.birdyHits
	local lives = data.lives
	---set game paused variables set pause mode
	--physics.pause()
	--paused = true
	--waveOver = true		
	--waveHasEnded = true		
	local gameFont = native.systemFont
	--"Suplexmentary Comic NC"
	
	----set up menu images and text:
		local endWaveGroup = display.newGroup()
			local BG = display.newRect(0,0,display.contentWidth, display.contentHeight)
				BG:setFillColor(0,0,0)
				endWaveGroup:insert(BG)
			local endWaveBG = display.newImage ("images/endWavePic.png")
				endWaveBG.x = display.contentWidth/2
				endWaveBG.y = display.contentHeight/2
			
			
			local endWaveText = display.newText ("Game Over!", 45, 60, gameFont, 27)
				endWaveText:setReferencePoint(display.CenterReferencePoint)
				endWaveText.x = display.contentCenterX -122
				endWaveText.y = display.contentCenterY -82
				endWaveText.rotation = -11
				endWaveText:setTextColor (140,70,17)

			local menuButton = display.newRect (display.contentCenterX -167,display.contentCenterY -19, 82, 54)
				menuButton:setFillColor (100,100,100,0)
		
			local menuText = display.newText ("Home", 1,1,gameFont, 14)
				menuText:setReferencePoint(CenterReferencePoint)
				menuText.x = display.contentCenterX - 126
				menuText.y = display.contentCenterY -32
				menuText:setTextColor(55,62,44)

			local nextButton = display. newRoundedRect(1,1,118,38,7)
			--newSprite( imageSheet , {frames={mainImages:getFrameIndex("nextButtonPic")}} )
				nextButton.x = display.contentCenterX +132.5
				nextButton.y = display.contentCenterY +93.5
				nextButton.alpha = 0.01
			local nextBtnText = display.newText ("Restart", 1,1,gameFont, 18)
				nextBtnText:setReferencePoint (centerReferencePoint)
				nextBtnText.x = display.contentCenterX +120
				nextBtnText.y = display.contentCenterY +93
			--[[local homeButton = display.newRoundedRect (1,1,118, 38,7)
				homeButton.x = display.contentCenterX - 130
				homeButton.y = display.contentCenterY+ 93.5
				homeButton.alpha = 0.01
			local homeBtnText = display.newText ("Home", 1,1,gameFont, 18)
				homeBtnText.x = display.contentCenterX -120
				homeBtnText.y = display.contentCenterY +93]]
				
			local birdyHitsCounter = 0 ----set counter to zero, ready to count up
			local bCountText = display.newText (birdyHitsCounter, display.contentCenterX +154,display.contentCenterY-62, gameFont, 20)
				bCountText:setTextColor(55, 62, 44)
			local bCountLabel = display.newText ("birdy count", 1, 1, gameFont, 20)
				bCountLabel:setReferencePoint(CenterReferencepoint)
				bCountLabel.x = display.contentCenterX +80
				bCountLabel.y =display.contentCenterY -50
				bCountLabel:setTextColor(55, 62, 44)

			local accuracyCounter = 0 ----set counter to zero, ready to count up
			local accuracyText = display.newText (accuracyCounter .. " %",display.contentCenterX+150,display.contentCenterY-21, gameFont, 20)
				accuracyText:setTextColor(55, 62, 44)
			local accuracyLabel = display.newText ("accuracy", 1, 1, gameFont, 20)
				accuracyLabel:setReferencePoint(CenterReferencepoint)
				accuracyLabel.x = display.contentCenterX +80
				accuracyLabel.y =display.contentCenterY -10
				accuracyLabel:setTextColor(55, 62, 44)
				
			local goldCounter = coins
			--playerCoins
			local goldText = display.newText (coins,display.contentCenterX+150,display.contentCenterY+20, gameFont, 20)
				goldText:setTextColor(55, 62, 44)
			local goldLabel = display.newText ("gold", 1, 1, gameFont, 20)
				goldLabel:setReferencePoint(CenterReferencePoint)
				goldLabel.x = display.contentCenterX +80
				goldLabel.y = display.contentCenterY +28
				goldLabel:setTextColor(55, 62, 44)
				
		--[[local waveText = display.newText (waveNo, 230, 230, gameFont, 31)
				waveText:setReferencePoint (centerReferencePoint)
				waveText.x = display.contentCenterX -24
				waveText.y = display.contentCenterY +88
				waveText:setTextColor(207, 83, 25)
			local waveLabel = display.newText ("wave",1,1,gameFont, 33)
				waveLabel:setReferencePoint(centerReferencePoint)
				waveLabel.x = display.contentCenterX -108
				waveLabel.y = display.contentCenterY +86
				waveLabel:setTextColor(55, 62, 44)]]
						
			-----add objects to endWave group--
			endWaveGroup:insert(endWaveBG)
			endWaveGroup:insert(endWaveText)			
			endWaveGroup:insert(menuText)
			endWaveGroup:insert(nextButton)
			endWaveGroup:insert(nextBtnText)
			endWaveGroup:insert(bCountText)
			endWaveGroup:insert(bCountLabel)
			endWaveGroup:insert(accuracyText)
			endWaveGroup:insert(accuracyLabel)
			endWaveGroup:insert(goldText)	
			endWaveGroup:insert(goldLabel)
		--	endWaveGroup:insert(homeButton)
		--	endWaveGroup:insert(homeBtnText)
			endWaveGroup:insert(menuButton)
			
			

	----calculate new gold total after bonus from accuracy score
			local goldTotal	= 0
			local newGold = 0
				local goldCalculator = function ()
					if accuracy > 9 then 
						newGold = newGold + 1
					end
					if accuracy > 19 then 
						newGold = newGold + 1
					end
					if accuracy > 29 then 
						newGold = newGold + 1
					end
					if accuracy > 39 then 
						newGold = newGold + 1
					end
					if accuracy > 49 then 
						newGold = newGold + 1
					end
					if accuracy > 59 then 
						newGold = newGold + 1
					end
					if accuracy > 69 then 
						newGold = newGold + 1
					end
					if accuracy > 79 then 
						newGold = newGold + 1
					end
					if accuracy > 89 then 
						newGold = newGold + 1
					end
					if accuracy > 99 then 
						newGold = newGold + 1
					end
					goldTotal = coins + newGold
					coins = coins + newGold
				end
			goldCalculator()
			
			--------increase stats on menu display one by one
			local statsUp = function ()
			print (accuracy)
			print (birdyHits)
			print (newGold)
			
						local goldUp = function ()
							if goldCounter < (coins + newGold) then
								goldCounter = goldCounter + 1
								goldText.text = (goldCounter)
							end
						end
					local accuracyUp = function ()
						if accuracyCounter < accuracy then
							accuracyCounter = accuracyCounter + 1
							accuracyText.text = (accuracyCounter.." %")
						else
							goldUp ()
						end
					end	
				if birdyHitsCounter < birdyHits then
					birdyHitsCounter = birdyHitsCounter + 1
					bCountText.text = (birdyHitsCounter)
				else 
					accuracyUp()
				end
			end
			statsUpTimer = timer.performWithDelay(10, statsUp, (accuracy + birdyHits + newGold))
			
			--------press next wave button
			local nextClicked = false
			local nextButtonFunction = function (event)
			
				if event.phase == "ended" and pauseMenuOn == false then
					if nextClicked == false then
						nextClicked = true
						removeEndWave = function()
							----restart gameplay
							--[[	physics.start()
								--paused = false
								spawnBirds = true

								waveOver = false
								--spawnFunction()
							----reset wave scores
								birdyHits = 0
								arrowShots = 0
								accuracy = 0
								lastBird = false]]
								endWaveGroup:removeSelf()
								endWaveGroup = nil
								data.waveNo = waveNo
								audio.stop()
								local game = game.game
								game (data)
					end
						audio.play (startSound)
						--if statsUpTimer then
						--	statsUpTimer:cancel()
						--end
						bCountText.text = birdyHits
						accuracyText.text = accuracy.." %"
						goldText.text = goldTotal
						--[[waveNo = waveNo + 1
						waveText.text = (waveNo)]]
						nextButton.alpha = 1
						nextButtonTransition = tnt:newTransition (nextButton, {time = 1000, alpha = 0.01})
						removeEndWaveTimer = tnt:newTimer (1400, removeEndWave)
					end
				end
			end
			endWaveGroup:insert(nextButton)	
			nextButton:addEventListener("touch", nextButtonFunction)
			
				--------press next wave button
			--local nextClicked = false
			local homeButtonFunction = function (event)
			
				if event.phase == "ended" and pauseMenuOn == false then
					--if nextClicked == false then
						--nextClicked = true
						removeEndWave = function()
							----restart gameplay
							--[[	physics.start()
								--paused = false
								spawnBirds = true
								endWaveGroup:removeSelf()
								endWaveGroup = nil
								waveOver = false
								--spawnFunction()
							----reset wave scores
								birdyHits = 0
								arrowShots = 0
								accuracy = 0
								lastBird = false]]
								--data.waveNo = waveNo
								endWaveGroup:removeSelf()
								endWaveGroup = nil
								audio.stop()
								local menu = menu.menu
								menu (data)
					end
						audio.play (startSound)
						statsUpTimer:cancel()
						bCountText.text = birdyHits
						accuracyText.text = accuracy.." %"
						goldText.text = goldTotal
						--[[waveNo = waveNo + 1
						waveText.text = (waveNo)]]
						homeButton.alpha = 1
						homeButtonTransition = tnt:newTransition (homeButton, {time = 1000, alpha = 0.01})
						removeEndWaveTimer = tnt:newTimer (1400, removeEndWave)
					end
				--end
			end
			--endWaveGroup:insert(homeButton)	
			--homeButton:addEventListener("touch", homeButtonFunction)
			
			
			------player clicks menu/shop button
			--local pauseMenu = pauseScreen.pauseMenu
			
			local menuButtonFunction = function (event)
				if event.phase =="ended" and pauseMenuOn == false then
					audio.play (clickSound)
					endWaveGroup:removeSelf()
					endWaveGroup = nil
					local menu = menu.menu
					data.coins = coins
					--[[data.FAammo = FAammo
					data.X2ammo = X2ammo
					data.RFammo = RFammo
					data.SAammo = SAammo]]
					menu(data)
			--		pauseFunction()
				end
			end
			menuButton:addEventListener("touch", menuButtonFunction)
end
		


m.endWave = endWaveFunction

return m