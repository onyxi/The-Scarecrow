local m = {}
local howTo = function(data)

local localGroup = display.newGroup()
	local gameFont = native.systemFont
	--"Suplexmentary Comic NC"
	local torsoSequenceData = {
		name = "torso",
		start = 19,
		count = 3,
		}

	local chalkBirdSequenceData = {
		name = "chalkBird",
		start = 15,
		count = 4,
		time = 350,
		loopDirection = "bounce"
		}
		--howIsActive = true
	
	local BG = display.newRect (0,0,display.contentWidth, display.contentHeight)
		BG:setFillColor(0,0,0)
		localGroup:insert(BG)
	local background = display.newImage("images/howToBG.png")
		background.x = display.contentWidth/2
		background.y = display.contentHeight/2
		localGroup:insert(background)
	
	local instructions = display.newText ("How to play...", 1, 1, gameFont, 22)
		instructions:setReferencePoint(centerReferencePoint)
		instructions.x = display.contentWidth/2
		instructions.y = display.contentHeight/2-137
		instructions:setTextColor(247, 230, 202)
		localGroup:insert(instructions)
	
	local instructionsFunction = function()
						local inst5 = function()
						instructions.text = "Good luck!"
						end
					local inst4 = function()
						instructions.text = "you lose a life"
					local inst5 = tnt:newTimer(2000, inst5)
					end
				local inst3 = function()
				instructions.text = "if a bird gets past"
				local instT4 = tnt:newTimer(2000, inst4)
				end
			local inst2 = function ()
			instructions.text = "collect coins for more weapons"
			local instT3 = tnt:newTimer(2000, inst3)
			end
		local inst1 = function ()
		instructions.text = "let go to fire an arrow"
		local instT2 = tnt:newTimer(2000, inst2)
		end
	instructions.text = "pull back on The Scarecrow"
	local instT1 = tnt:newTimer(2000, inst1)
	
	end
	local instT = tnt:newTimer(1800, instructionsFunction)
	
	local skipText = display.newText ("Skip", 1, 1, gameFont, 30)
		skipText:setReferencePoint(centerReferencePoint)
		skipText.x = display.contentWidth/2
		skipText.y = display.contentHeight/2+137
		skipText:setTextColor(247, 230, 202)
		localGroup:insert(skipText)
	
	local skipTextFunction = function()
		skipText.text = "Play!"
	end
	skipT = tnt:newTimer(11900, skipTextFunction)
	
	local skipBtn = display.newRect (1, 1, 90, 38)
		skipBtn:setFillColor (100, 200, 30, 0)
		skipBtn:setReferencePoint(centerReferencePoint)
		skipBtn.x = display.contentWidth/2 
		skipBtn.y = display.contentHeight/2+138
		localGroup:insert(skipBtn)
	

	
	local torso = display.newSprite (imageSheet, torsoSequenceData)
		torso:setReferencePoint(centerReferencePoint)
		torso.x = display.contentWidth/2-128
		torso.y = display.contentHeight/2+50
		localGroup:insert (torso)
		
	local torsoAnimate = function ()
		local nextFrame = function ()
			local letGo = function ()
				torso:setFrame (1)
			end
			torso:setFrame(3)
			local torsoTimer3 = tnt:newTimer(1500, letGo)
		end
		torso:setFrame(2)
		local torsoTimer2 = tnt:newTimer (500, nextFrame)
	end
	local torsoTimer1 = tnt:newTimer(1800, torsoAnimate)
	
	local arrow = display.newImage( imageSheet , mainImages:getFrameIndex("chalkArrow"))
		arrow:setReferencePoint(centerReferencePoint)
		arrow.x = display.contentWidth/2-113
		arrow.y = display.contentHeight/2+43
		arrow.rotation = 2.5
		localGroup:insert(arrow)
	local arrowFade = function ()
		local arrowTransition = tnt:newTransition (arrow, {time = 500, alpha = 0})
	end
	local arrowTimer = tnt:newTimer (5800, arrowFade)	
	
	local bird = display.newSprite (imageSheet, chalkBirdSequenceData)
		bird:play()
		bird:setReferencePoint(centerReferencePoint)
		bird.x = display.contentWidth/2+110
		bird.y = display.contentHeight/2-71
		localGroup:insert(bird)
	local birdFade = function ()
		local birdTimer = tnt:newTransition (bird, {time = 500, alpha = 0})
	end
	local birdFadeTimer = tnt:newTimer (5800, birdFade)
	
	local birdStop = function ()
		bird:pause()
	end
	
	local arrowFunction = function()
		local arrowBack = function ()	
			local arrowFire = function ()
				local arrowTrans = tnt:newTransition(arrow, {time = 700, x = display.contentWidth/2+110, y = display.contentHeight/2-70, onEnd = birdStop})
			end
			arrow.x = display.contentWidth/2-121
			arrow.y = display.contentHeight/2+48
			local arrowFireTimer = tnt:newTimer (1500, arrowFire)
		end
		arrow.x = display.contentWidth/2-117
		arrow.y = display.contentHeight/2+45
		local arrowBackTimer = tnt:newTimer(500, arrowBack)
	end
	local arrowT = tnt:newTimer (1800, arrowFunction)
	

	
	local bird2 = display.newSprite (imageSheet, chalkBirdSequenceData)
		bird2:play()
		bird2:setReferencePoint(centerReferencePoint)
		bird2.x = display.contentWidth + 30
		bird2.y = display.contentHeight/2-30
		localGroup:insert(bird2)
	local bird2Function = function()
		local bird2Trans = tnt:newTransition(bird2, {time = 2000, x = 0})
	end
	local birdT = tnt:newTimer(7800, bird2Function)
	
	local heart = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex("chalkHeart")}} )
		heart:setReferencePoint(centerReferencePoint)
		heart.x = display.contentWidth/2 - 136
		heart.y = display.contentHeight/2-96
		localGroup:insert(heart)
	local heartFunction = function()
		heart:removeSelf()
		heart = nil
	end
	local heartT = tnt:newTimer(10700, heartFunction)
	
	local thumb1 = display.newImage ("images/thumb1.png")
		thumb1:setReferencePoint(centerReferencePoint)
		thumb1.x =display.contentWidth/2-240
		thumb1.y =display.contentHeight/2+130
		thumb1.rotation =-35
		thumb1:setFillColor(255,255,255, 255)
		thumb1.alpha = 0
		localGroup:insert(thumb1)
	local thumbFunction = function ()
		local thumbDis = function ()
			local thumbDisTrans = tnt:newTransition (thumb1, {time = 1000, alpha = 0})
		end
		local thumb1Move = tnt:newTransition (thumb1, {time = 1000, x = display.contentWidth/2-300, y = display.contentHeight/2 +155})
		local thumbDisTimer = tnt:newTimer (2000, thumbDis)
	end
	local thumb1AppTrans = tnt:newTransition (thumb1, {time = 500, alpha = 1})
	local thumb1Timer = tnt:newTimer(1800, thumbFunction)
		
	local thumb2 = display.newImage ("images/thumb2.png")
		thumb2:setReferencePoint(centerReferencePoint)
		thumb2.x =display.contentWidth/2-285
		thumb2.y =display.contentHeight/2+155
		thumb2.rotation =-35
		thumb2:setFillColor(255,255,255, 255)
		thumb2.alpha = 0
		localGroup:insert(thumb2)
	local thumb2Dis = function()
		local thumbDelay = function ()
			local thumb2DisTrans = tnt:newTransition(thumb2, {time = 1000, alpha = 0})
		end
		local thumbTimer = tnt:newTimer(1000, thumbDelay)
	end
	local thumbApp = function ()
		local thumbAppTrans = tnt:newTransition (thumb2, {time = 1000, alpha = 1, onEnd = thumb2Dis})
	end
	local thumb2Timer = tnt:newTimer (3800, thumbApp)

	local finger = display.newImage ("images/thumb1.png")
		finger:setReferencePoint(centerReferencePoint)
		finger.x =display.contentWidth/2+265
		finger.y =display.contentHeight/2+180
		finger.rotation =220
		finger:setFillColor(255,255,255, 255)
		finger.alpha = 0
		localGroup:insert(finger)		

	local fingerFade = function()
	local fingerTransition = tnt:newTransition(finger, {time = 500, alpha = 0, onEnd = fingerMove})
	end
	local fingerFunction = function ()
		local fingerTrans2 = tnt:newTransition(finger, {time = 1000, alpha = 1})
		local fingerTimer2 = tnt:newTimer(2000, fingerFade)
	end
	local fingerFunctionTimer = tnt:newTimer(5800, fingerFunction)
	
	local whiteArrow = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex("whiteArrow")}} )
		whiteArrow:setReferencePoint(centerReferencePoint)
		whiteArrow.x = display.contentWidth/2 - 133
		whiteArrow.y = display.contentHeight/2 - 135
		whiteArrow.alpha = 0
		localGroup:insert(whiteArrow)
		
	local whiteArrowApp = function()
		local whiteArrowFade = function ()
			local arrowtrans = tnt:newTransition(whiteArrow, {time = 500, alpha = 0})
		end
		local arrowTrans2 = tnt:newTransition(whiteArrow, {time = 500, alpha = 1})
		local arrowTimer = tnt:newTimer(1000, whiteArrowFade)
	end
	local arrowtimer2 = tnt:newTimer (10000, whiteArrowApp)
	
		local skipFunction = function(event)
		if event.phase == "ended" then
			tnt:cancelAllTimers()
			tnt:cancelAllTransitions()			
			tnt:cleanTimersAndTransitions()
			--local gameMode = gameMode.gameMode
			--gameMode(data)
			audio.stop()
			audio.play(clickSound)
			local menu = menu.menu
			menu(data)
			localGroup:removeSelf()
			localGroup = nil
			collectgarbage()
			--local activateMode = function ()
			--	_G.howIsActive = false
			--end
			--tnt:newTimer(500, activateMode)
		end
	end
	skipBtn:addEventListener ("touch", skipFunction)
end

m.howTo = howTo

return m

