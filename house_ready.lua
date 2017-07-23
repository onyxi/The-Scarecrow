--module (..., package.seeall)
local m = {}
function houseReady(data)
	local localGroup = display.newGroup()
	local data = data
	--local gameType = data.gameType
	--print(gameType)
	--print (data.gameType)
	-----add images---
	local sky = display.newImage ("images/SS.png")
		sky.x = display.contentWidth/2
		localGroup:insert(sky)
	
	local sun = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex("sun")}} )
	--= display.newImage ("images/sun.png")
		sun.x = display.contentWidth/2 - 180
		sun.y = display.contentHeight/2-62
		localGroup:insert (sun)
	
	---animate sun---
	transition.to(sun, {time=1500, x=display.contentWidth/2-146, y=display.contentHeight/2+10, transition=easing.inQuad})
	
	local house = display.newImage ("images/gameBegin.png")
		house:setReferencePoint(display.BottomCenterReferencePoint)
		house.x = display.contentWidth/2
		house.y = display.contentHeight
		localGroup:insert(house)
	
	-----switch off bedroom light---
	local window = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex("window")}} )
		window.x = display.contentCenterX	+ 31.5
		window.y = display.contentHeight - 193.5
		localGroup:insert (window)
	
	function removeWindow (event)
		window:removeSelf()
		window = nil
	end
	timer.performWithDelay(1000, removeWindow)
	
	local getReady = require ("scripts.get_ready")
	local Ready = getReady.getReady
	------change to get ready scene---
	function getReadyScreen (event)

		Ready(data)
		--director: changeScene ("scripts.get_ready", "fade")	
		tnt:cancelAllTimers()
		tnt:cancelAllTransitions()			
		tnt:cleanTimersAndTransitions()
		sky:removeSelf()
		sky = nil
		sun:removeSelf()
		sun = nil
		house:removeSelf()
		house = nil
		localGroup:removeSelf()
		localGroup = nil
	end	
	timer.performWithDelay (2000, getReadyScreen)
	
	return localGroup
end
m.houseReady = houseReady
return m

