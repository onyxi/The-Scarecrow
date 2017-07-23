local m = {}

local moreScreen = function(data)
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
	
local localGroup = display.newGroup()
	local gameFont = native.systemFont
	--"Suplexmentary Comic NC"
	local BG = display.newRect(0,0,570, 360)
		BG:setReferencePoint(display.CenterReferencePoint)
		BG.x = display.contentCenterX
		BG.y = display.contentCenterY
		BG:setFillColor(0,0,0,210)
		localGroup:insert(BG)

	local moreScrn = display.newImage ("images/upgradeScreen.png")
		moreScrn:setReferencePoint(display.CenterReferencePoint)
		moreScrn.x = display.contentWidth/2
		moreScrn.y = display.contentHeight/2
		localGroup:insert(moreScrn)
		
		local closeButton = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex("close")}} )
		closeButton.x = 20
		closeButton.y = 20

		local function backMenu (event)
			if event.phase == "ended" then
--				_G.menuIsActive = true			
				tnt:cleanTimersAndTransitions()	
				audio.stop()			
				audio.play(clickSound)
				local menu = menu.menu
				menu(data)
				--birdPerc, birdGot, birdNext, firePerc, fireGot, fireNext, x2Perc, x2Got, x2Next, RFPerc, RFGot, RFNext, FAPerc, FAGot, FANext, exterminator, dragonsBreath, rainmaker, doubleTrouble, rocketman)
				localGroup:removeSelf()
				localGroup = nil
			end
		end
		localGroup:insert(closeButton)
		closeButton:addEventListener("touch", backMenu)
		
	local titleText = display.newText("Upgrade!", 1, 1, gameFont, 32)
		titleText:setReferencePoint(display.CenterReferencePoint)
		titleText.x = display.contentWidth/2 - 80
		titleText.y= display.contentHeight/2 - 85
		titleText.rotation = -7
		titleText:setTextColor(140,70,17)
		localGroup:insert(titleText)
		
	local toGetText = display.newText ("to get..." , 1, 1,gameFont, 25)
		toGetText:setReferencePoint(display.CenterReferencePoint)
		toGetText.x = display.contentWidth/2 - 95
		toGetText.y = display.contentHeight/2 
		toGetText:setTextColor(22, 76, 239)
		localGroup:insert (toGetText)
		
	local noAds = display.newText("No ads!", 1, 1,gameFont, 18)
		noAds:setReferencePoint(display.CenterReferencePoint)
		noAds.x =  display.contentWidth/2 + 78
		noAds.y = display.contentHeight/2-50
		noAds:setTextColor(55, 62, 44)
		localGroup:insert(noAds)
		
	local weapons = display.newText("Always rapid fire!", 1, 1,gameFont, 18)
		weapons:setReferencePoint(display.CenterReferencePoint)
		weapons.x = display.contentWidth/2+78
		weapons.y =display.contentHeight/2-17
		weapons:setTextColor(55, 62, 44)
		localGroup:insert(weapons)
		
	local freeCoins = display.newText("1000 free coins!", 1, 1,gameFont, 18)
		freeCoins:setReferencePoint(display.CenterReferencePoint)
		freeCoins.x = display.contentWidth/2+78
		freeCoins.y =display.contentHeight/2+16
		freeCoins:setTextColor(55, 62, 44)
		localGroup:insert(freeCoins)
		
	local awards = display.newText("Awards!", 1, 1,gameFont, 18)
		awards:setReferencePoint(display.CenterReferencePoint)
		awards.x = display.contentWidth/2+78
		awards.y =display.contentHeight/2+49
		awards:setTextColor(55, 62, 44)
		localGroup:insert(awards)
	
	local downloadText = display.newText("Coming soon!", 1, 1,gameFont, 15)
		downloadText:setReferencePoint(display.CenterReferencePoint)
		downloadText.x = display.contentWidth/2+63
		downloadText.y =display.contentHeight/2+91
		downloadText:setTextColor(247, 230, 202)
		localGroup:insert(downloadText)
		
	local downloadBtn = display.newRect (display.contentWidth/2+6, display.contentHeight/2+74, 145, 32)
		downloadBtn:setFillColor (2, 255, 255, 0)
		localGroup:insert(downloadBtn)
	local downloadFunction = function(event)
		if event.phase == "began" then
		
		end
	end
	downloadBtn:addEventListener("touch", downloadFunction)
end

m.moreScreen = moreScreen

return m