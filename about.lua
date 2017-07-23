local m = {}

local new = function(data)
--birdPerc, birdGot, birdNext, firePerc, fireGot, fireNext, x2Perc, x2Got, x2Next, RFPerc, RFGot, RFNext, FAPerc, FAGot, FANext, exterminator, dragonsBreath, rainmaker, doubleTrouble, rocketman)
	local data = data
		--[[local birdPerc = birdPerc
	local birdGot = birdGot
	local birdNext = birdNext
	local firePerc = firePerc
	local fireGot = fireGot
	local fireNext = fireNext
	local x2Perc = x2Perc
	local x2Got = x2Got
	local x2Next = x2Next
	local RFPerc = RFPerc
	local RFGot = RFGot
	local RFNext = RFNext
	local FAPerc = FAPerc
	local FAGot = FAGot
	local FANext = FANext
	local exterminator = exterminator
	local dragonsBreath = dragonsBreath
	local rainmaker = rainmaker
	local doubleTrouble = doubleTrouble
	local rocketman = rocketman]]
	print (data.exterminator)
	local localGroup = display.newGroup()
	local gameFont = native.systemFont
	--"Suplexmentary Comic NC"
	print (data.birdGot)
	--data.birdGot = 500
	---black bacground
	local BG = display.newRect(0,0,570, 360)
		BG.x = display.contentCenterX
		BG.y = display.contentCenterY
		BG:setFillColor(0,0,0,210)
		localGroup:insert(BG)
	
	---background/menu image
	local background = display.newImage ("images/aboutScreen.png")
		background.x = display.contentWidth/2
		background.y = display.contentHeight/2
		localGroup:insert (background)
	
	---add title
	local titleText = display.newText("The Scarecrow", 1, 1, gameFont, 20)
		titleText:setReferencePoint(display.CenterReferencePoint)
		titleText.x = display.contentWidth/2
		titleText.y = (display.contentHeight/2) - 60
		titleText:setTextColor(55,62,44)
		localGroup:insert(titleText)

	local infoText = display.newText ("The Scarecrow (C) 2013 was created using Corona SDK", 1, 1, gameFont, 13)
		infoText:setReferencePoint(display.CenterReferencePoint)
		infoText.x = display.contentWidth/2
		infoText.y = (display.contentHeight/2) 
		infoText:setTextColor(55,62,44)
		localGroup:insert(infoText)
		
	local infoText2 = display.newText ("All rights reserved.", 1, 1, gameFont, 11)
		infoText2:setReferencePoint(display.CenterReferencePoint)
		infoText2.x = display.contentWidth/2
		infoText2.y = (display.contentHeight/2) +20
		infoText2:setTextColor(55,62,44)
		localGroup:insert(infoText2)
		
	---add close button
	local closeButton = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex("close")}} )
		closeButton.x = 20
		closeButton.y = 20
		localGroup:insert(closeButton)
	
	---press close button
	local function backMenu (event)
		if event.phase == "ended" then
			--_G.menuIsActive = true
			tnt:cleanTimersAndTransitions()
			local menu = menu.menu
			audio.stop()
			audio.play(clickSound)
			menu(data)
			--birdPerc, birdGot, birdNext, firePerc, fireGot, fireNext, x2Perc, x2Got, x2Next, RFPerc, RFGot, RFNext, FAPerc, FAGot, FANext, exterminator, dragonsBreath, rainmaker, doubleTrouble, rocketman)
			localGroup:removeSelf()
			localGroup = nil
		end
	end
	
	--[[local function backMenu (event)
		if event.phase == "ended" then
			--menuActive = true
			--local activateMenu = menu.activateMenu
			--activateMenu()
			tnt:cleanTimersAndTransitions()
			local menu = menu.menu
			--menu()
			menu(birdPerc, birdGot, birdNext, firePerc, fireGot, fireNext, x2Perc, x2Got, x2Next, RFPerc, RFGot, RFNext, FAPerc, FAGot, FANext, exterminator, dragonsBreath, rainmaker, doubleTrouble, rocketman)
			
				menu(birdPerc,
				birdGot, 
				birdNext,
				firePerc,
				fireGot,
				fireNext,
				x2Perc,
				x2Got,
				x2Next,
				RFPerc,
				RFGot,
				RFNext,
				FAPerc,
				FAGot, 
				FANext,
				exterminator,
				dragonsBreath,
				rainmaker,
				doubleTrouble,
				rocketman
				)
			localGroup:removeSelf()
			localGroup = nil
			

		end
	end]]
	closeButton:addEventListener ("touch", backMenu)
	
		--return localGroup
end

m.aboutScreen = new

return m