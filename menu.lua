--module(..., package.seeall)
local m = {}

function menu(data)
local data = data
local score = data.high

print (score)

local json = require("json")



function saveTable (t, filename)
	local path = system.pathForFile (filename, system.DocumentsDirectory)
	local file = io.open (path, "w")
	if file then
		local contents = json.encode (t)
		file:write (contents)
		io.close (file)
		return true
	else
		return false
	end
end
saveTable(data, "gameData.json")

function loadTable (filename)
	local path = system.pathForFile (filename, system.DocumentsDirectory)
	local contents = ""
	local myTable = {}
	local file = io.open (path, "r")
	if file then
		local contents = file:read ("*a")
		myTable = json.decode(contents);
		io.close (file)
		return myTable
	end
	return nil
end
local data = loadTable("gameData.json")

--[[
data.coins = 0
data.high = 0
data.FAammo = 3
data.RFammo = 3
data.X2ammo = 3
data.SAammo = 3
data.coins = 5
saveTable(data, "gameData.json")
]]

--[[
print("coins ="..data.coins)
print("gameBirdyHits ="..data.gameBirdyHits)
print("gameAccuracy ="..data.gameAccuracy)
print("FAammo ="..data.FAammo)
print("gameArrowShots ="..data.gameArrowShots)
]]

--birdPerc, birdGot, birdNext, firePerc, fireGot, fireNext, x2Perc, x2Got, x2Next, RFPerc, RFGot, RFNext, FAPerc, FAGot, FANext, exterminator, dragonsBreath, rainmaker, doubleTrouble, rocketman)
--[[
local birdPerc = birdPerc
local birdGot = birdGot
local birdext = birdNext
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
local rocketman = rocketman
]]
--print (data.birdGot)
--[[local data = {
birdPerc = birdPerc,
birdGot = birdGot,
birdNext = birdNext,
firePerc = firePerc,
fireGot = fireGot,
fireNext = fireNext,
x2Perc = x2Perc,
x2Got = x2Got,
x2Next = x2Next,
RFPerc = RFPerc,
RFGot = RFGot,
RFNext = RFNext,
FAPerc = FAPerc,
FAGot = FAGot,
FANext = FANext,
exterminator = exterminator,
dragonsBreath = dragonsBreath,
rainmaker = rainmaker,
doubleTrouble = doubleTrouble,
rocketman = rocketman
}]]


	local localGroup = display.newGroup()
	--local menuOn = menuOn
	--print (menuOn)
	local menuActive = false
	local gameFont = native.systemFont
	--"PTSans-Bold"
	--native.systemFont
	--"Suplexmentary Comic NC"
	local activateMenu = function()
		menuActive = true
	end
	tnt:newTimer(500, activateMenu)
	--print (menuOn)
	----variables---
	-----active screens---
	--_G.menuIsActive = true	
	--_G.mode = false
	--local canBegin = false
	--_G.goHome = false
	
	local background = display.newImage ("images/menu.jpg")
		background:setReferencePoint(display.BottomCenterReferencePoint)
		background.x = display.contentWidth/2
		background.y = display.contentHeight
		localGroup:insert(background)

	--_G.addTitleFunction = function()
	----	if _G.initialised == false then
			--localGroup:insert(_G.titleText)
			--canBegin = true
	--	else
	local title = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex("scarecrowText")}} )
			localGroup:insert(title)
			title.x = display.contentWidth/2+20
			title.y = display.contentHeight - 270
			--canBegin = true
	--	end
--	end

	timer.performWithDelay(450, addTitleFunction)

	---------highscore display
	local high = data.high
	local highScore = display.newText (high, 1, 1, gameFont,20)
		highScore:setReferencePoint(display.CenterReferencePoint)
		highScore.x = display.contentCenterX + 127
		highScore.y = display.contentHeight-220
		highScore:setTextColor(240, 80, 52)
		highScore.rotation = -10
		localGroup:insert(highScore)
	local high = display.newText ("High", 1, 1, gameFont,18)
		high:setReferencePoint(display.CenterReferencePoint)
		high.x = display.contentCenterX +17
		high.y = display.contentHeight-194
		high:setTextColor(240, 80, 52)
		high.rotation = -11
		localGroup:insert(high)

--local testText = display.newText ("test", display.contentCenterX, display.contentCenterY, gameFont, 50)


		------levels/awards------
--[[local arcadeLevels = function()

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
	--print (birdNext)
	--print (arcadeEx)
--------

	-----------
	--local fireUp = dragonsBreath
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
arcadeLevels()]]
	--------------------------
	----sound----
		local menuMusic = audio.loadSound("audio/Title.wav")
			local availableChannel = audio.findFreeChannel()
			audio.setVolume (0.3, {channel = availableChannel})
			audio.play( menuMusic, { channel=availableChannel } )
	
	
		
		
	-----------------create buttons: clickable areas over background image-----------------------------------------------
	local newgameButton = display.newRect(display.contentCenterX + 77,display.contentHeight-167,152,58)
		newgameButton:setFillColor(200,0,0,0)
		newgameButton.rotation = -10
		localGroup:insert(newgameButton)
	local gameText = display.newText ("Play", 1, 1, gameFont, 25)
		gameText.xScale = 1.3
		gameText.x = display.contentCenterX + 140
		gameText.y = display.contentHeight - 138
		gameText.rotation = -10
		gameText:setTextColor (247, 230, 202)
		localGroup:insert(gameText)


	local coinSequenceData = {
		name = "coinsSpin",
		start = 23,
		count = 10,
		time = 750
		--loopDirection = "bounce"
		}
	
	local coin = display.newSprite (imageSheet, coinSequenceData)
		coin.x =display.contentCenterX + 102
		coin.y =display.contentHeight - 91
		coin.rotation = -5
		coin:play()
		localGroup:insert (coin)

	local coinDisplay = display.newText (data.coins, 1,1,gameFont, 23)
		coinDisplay:setReferencePoint(display.CenterReferencePoint)
		coinDisplay.x = display.contentCenterX + 150
		coinDisplay.y = display.contentHeight -91
		coinDisplay.rotation = -3
		coinDisplay:setTextColor (242, 205, 92)
		localGroup:insert (coinDisplay)

	--[[local awardText = display.newText ("Awards", 1, 1, gameFont, 15)
		awardText:setReferencePoint (centerReferencePoint)
		awardText.x = display.contentCenterX + 152
		awardText.y = display.contentHeight - 50
		awardText.rotation = -7
		awardText:setTextColor (247, 230, 202)
		localGroup:insert(awardText)]]
		local helpText = display.newText ("Help", 1, 1, gameFont, 22)
		helpText:setReferencePoint (centerReferencePoint)
		helpText.x = display.contentCenterX + 144
		helpText.y = display.contentHeight - 49
		helpText.rotation = -7
		helpText:setTextColor (247, 230, 202)
		localGroup:insert(helpText)
		
	local helpBtn = display.newRect (display.contentCenterX + 98, display.contentHeight - 66, 94, 33)
		helpBtn:setFillColor(50, 50, 190, 0)
		helpBtn.rotation = -8
		localGroup:insert(helpBtn)

	-- about screen button
	local aboutText = display.newText ("About", 1, 1, gameFont, 17)
		aboutText:setReferencePoint(display.CenterReferencePoint)
		aboutText.x =display.contentCenterX - 191
		aboutText.y =display.contentHeight - 47
		aboutText.rotation = 2
		aboutText:setTextColor(247, 230, 202)
		localGroup:insert(aboutText)
		
	local aboutButton = display.newRect(display.contentCenterX - 220,display.contentHeight - 60,66,28)
		aboutButton:setFillColor(0,0,170,0)
		localGroup:insert(aboutButton)


	-- more screen button
	local moreText = display.newText ("More!", 1, 1, gameFont, 23)
		moreText:setReferencePoint(display.CenterReferencePoint)
		moreText.x = display.contentCenterX - 191
		moreText.y = display.contentHeight -89 
		moreText.rotation = -5
		moreText:setTextColor(247, 230, 202)
		localGroup:insert(moreText)
		
	local moreButton = display.newRect(display.contentCenterX -235,display.contentHeight -107,87,42)
		moreButton:setFillColor(0,200,200,0)
		localGroup:insert(moreButton)

--------------------------button functions-------------------------------
-- start new game

	local function pressNewGame (event)
		if event.phase == "ended" and menuActive == true then
		--and canBegin == true then
		--	director:changeScene ("scripts.gameMode")
			--local gameMode = gameMode.gameMode
			tnt:cancelAllTimers()
			tnt:cancelAllTransitions()			
			tnt:cleanTimersAndTransitions()
			audio.stop()
			audio.play (startSound,{channel = 2})
			local houseReady = houseReady.houseReady
			houseReady(data)
			--gameMode (data)
			--houseReady()
			localGroup:removeSelf()
			localGroup = nil
		end
	end
	newgameButton:addEventListener ("touch", pressNewGame)

	-- show more screen--

	local function pressMore (event)
		if event.phase == "ended" and menuActive == true then
			local moreScreen = more.moreScreen
			moreScreen(data)
			audio.play(clickSound)
			--birdPerc, birdGot, birdext, firePerc, fireGot, fireNext, x2Perc, x2Got, x2Next, RFPerc, RFGot, RFNext, FAPerc, FAGot, FANext, exterminator, dragonsBreath, rainmaker, doubleTrouble, rocketman)
			localGroup:removeSelf()
			localGroup = nil
			--menuActive=false	
			
		end
	end
	moreButton:addEventListener ("touch", pressMore)

	-- show about screen

	local function pressAbout (event)
		if event.phase == "ended" and menuActive == true then
			local aboutScreen = about.aboutScreen
			aboutScreen(data)
			audio.play(clickSound)
			--birdPerc, birdGot, birdext, firePerc, fireGot, fireNext, x2Perc, x2Got, x2Next, RFPerc, RFGot, RFNext, FAPerc, FAGot, FANext, exterminator, dragonsBreath, rainmaker, doubleTrouble, rocketman)
			localGroup:removeSelf()
			localGroup = nil
			--menuActive = false
			
		end
	end
	aboutButton:addEventListener ("touch", pressAbout)

	--[[local awardFunction = function (event)
		if event.phase == "ended" and menuActive == true then
			local awardScreen = awardScreen.awardScreen
			awardScreen(data)
			--birdPerc, birdGot, birdext, firePerc, fireGot, fireNext, x2Perc, x2Got, x2Next, RFPerc, RFGot, RFNext, FAPerc, FAGot, FANext, exterminator, dragonsBreath, rainmaker, doubleTrouble, rocketman)	
			localGroup:removeSelf()
			localGroup = nil
			--menuActive = false
		end
	end
	awardBtn:addEventListener("touch", awardFunction)]]
	local helpFunction = function (event)
			if event.phase == "ended" and menuActive == true then
				local howTo = howTo.howTo
				howTo(data)
				audio.play(clickSound)
				--birdPerc, birdGot, birdext, firePerc, fireGot, fireNext, x2Perc, x2Got, x2Next, RFPerc, RFGot, RFNext, FAPerc, FAGot, FANext, exterminator, dragonsBreath, rainmaker, doubleTrouble, rocketman)	
				localGroup:removeSelf()
				localGroup = nil
				--menuActive = false
			end
		end
		helpBtn:addEventListener("touch", helpFunction)

	
	
return localGroup
end

m.menu = menu
return m

