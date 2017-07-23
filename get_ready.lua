--module(..., package.seeall)
local m = {}
function getReady(data)
	local data = data
	local localGroup = display.newGroup()
	local gameFont = native.systemFont
	--"PTSans-Bold"
	--"Suplexmentary Comic NC"
	local getReady = display.newText ("Get ready!", 1, 1, gameFont, 55)
		getReady:setReferencePoint(centerReferencePoint)
		getReady.x = display.contentWidth/2
		getReady.y = display.contentHeight/2
		getReady.rotation = -10
		getReady:setTextColor(223, 63, 0)
		localGroup:insert(getReady)
		
		local heartBeat = audio.loadSound("audio/HBeat.wav")
	 	local availableChannel = audio.findFreeChannel()
		audio.play( heartBeat, { channel=availableChannel } )
		
	function begin (event)
		tnt:cancelAllTimers()
		tnt:cancelAllTransitions()			
		tnt:cleanTimersAndTransitions()
		local game = game.game
		game (data)
		--[[game(
			"arcade", 		----gameType
			3, 				----fire ammo
			5, 				----rapid ammo
			5, 				----x2 ammo
			6, 				----strong ammo
			10,				----dragon
			2, 				----dragonlevel
			15, 			----rain
			8, 				----rainlevel
			5, 				----double
			4, 				----doublelevel
			7, 				----rocket
			6, 				----rocketlevel
			85, 			----accuracy
			126, 			----birdycount
			25				----coins
		)]]
		--director:changeScene ("scripts.game", "fade")
		getReady:removeSelf()
		getReady = nil
		localGroup:removeSelf()
		localGroup = nil
	end
	timer.performWithDelay (1500, begin)
	
	return localGroup
end

m.getReady = getReady

return m


