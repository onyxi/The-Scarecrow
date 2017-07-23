local m = {}
local new = function(data, mode)
print ("test")
	local mode = mode
	local localGroup = display.newGroup()
	--_G.sureScreen = true
	local gameFont = "Suplexmentary Comic NC"
	
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
		yes:setFillColor(0,255, 0, 0)
		localGroup:insert(yes)
		
	local yesFunction = function (event)
		if event.phase == "ended" then
		--and _G.sureScreen == true then
			if mode == true then
				data.waveNo = 1
				--_G.waveCounter.text = "1"
				--_G.start2.text = "Start"
			else
			--if gameIsActive == true then
				_G.goHome = true

				pauseGroup:removeSelf()
				pauseGroup = nil		
				
			end
				localGroup:removeSelf()
				localGroup = nil
				_G.sureScreen = false
		end
	end
	yes:addEventListener("touch", yesFunction)
		
	local yesText = display.newText("Yes", 1,1,_G.gameFont, 25)
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
		if event.phase == "ended" and _G.sureScreen == true then
			_G.sureScreen = false
			localGroup:removeSelf()
			localGroup = nil
		end
	end
	no:addEventListener("touch", noFunction)
	
	local noText = display.newText("No", 1,1,_G.gameFont, 25)
		noText:setReferencePoint(centerReferencePoint)
		noText.x = display.contentWidth/2+40
		noText.y = display.contentHeight/2 + 10
		localGroup:insert(noText)
end

m.areYouSure = new

return m