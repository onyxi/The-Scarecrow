-----------initialize screen------
--module (...,package.seeall)
local m = {}

print ("test")

function game(data)
	local data = data
	--local exterminator = data.exterminator
	local gameType = data.gameType
	local waveNo = data.waveNo
	local coins = data.coins
	local FAammo = data.FAammo
	local RFammo = data.RFammo
	local X2ammo = data.X2ammo
	local SAammo = data.SAammo
	local gameArrowShots = data.gameArrowShots
	local gameBirdyHits = data.gameBirdyHits
	local gameAccuracy = data.gameAccuracy
	local lives = data.lives
	local arcadeEx = data.arcadeEx
	local arcadeDragon = data.arcadeDragon
	local arcadeRain = data.arcadeRain
	local arcadeDouble = data.arcadeDouble
	local arcadeRocket = data.arcadeRocket

	---------declare variables------
local goHome = false
local rocketCount = data.rocketCount
local rocketLevel = data.rocketman
local coins = coins
local birdyHits = 0
local arrowShots = 0
local accuracy = 0
local isAiming = false
local canFire = true
local canReload = true
local reloadTime = 500
local bird
local fire = false
local powerUpTime = 20000
local gameIsActive = true
local paused = false
local score = 0
local weaponType = 1
local currentWeapon = "arrow"
local dragon = false
local rain = false
local double = false
local rocket = false
local arrowSpeed = 10
local spawnInterval = 3000
--local waveNo = 0
local midWave = false
local highWave = false
local waveOver = false
local menuReturn = false
local gameFont = native.systemFont
-- "PTSans-Regular"
--"Suplexmentary Comic NC"


---------layers (groups)-------




--physics.setDrawMode("hybrid")


--local ad = display.newRect(0, 288, 480, 32)

---show ads
--[[local adY = display.contentHeight - 66

if  system.getInfo("model") == iPad then
	adY = display.contentHeight - 50
 else
	adY = display.contentHeight - 32
end
ads.show( "banner", { x=0, y=adY } )

]]



local localGroup = display.newGroup()
local gameGroup = display.newGroup()
local atmosGroup = display.newGroup()
local HUDGroup = display.newGroup()

localGroup:insert(gameGroup)
localGroup:insert(atmosGroup)
localGroup:insert(HUDGroup)

local arrowsTable = {}
local birdsTable = {}
local atmosTable = {}
local objTable = {}

local arrowCollisionFilter = {categoryBits = 1, maskBits = 2}
local birdCollisionFilter = {categoryBits = 2, maskBits = 1}
local deadCollisionFilter = {categoryBits = 4, maskBits = 0}
local coinCollisionFilter = {categoryBits = 8, maskBits = 0}

------sounds
local arrowHitSound = audio.loadSound("audio/Twang.wav")

-----set up game screen-----
local background = display.newImage ("images/BG.jpg")
background:setReferencePoint(display.BottomLeftReferencePoint)
background.y = display.contentHeight
gameGroup:insert(background)
local banner = display.newImage ("images/gameBanner.png")
banner:setReferencePoint(display.TopLeftReferencePoint)
gameGroup:insert(banner)
banner.x = -3
banner.y = -5

------describe torso animation sequence------
local torsoSequenceData = {
	name = "aiming",
	start = 51,
	count = 7,
	}
	
--Background Scene images-----
torso = display.newSprite(imageSheet, torsoSequenceData)
--movieclip.newAnim ({"images/torso1.png", "images/torso3.png"})
torso.x = 87
torso.y = display.contentHeight - 107
torso.xReference = -6
torso.yReference = 0
gameGroup:insert(torso)

local aimer = display.newRect (0, display.contentHeight-150, 120,150)
aimer:setFillColor (0,150,75,0)
gameGroup:insert(aimer)



----------start physics ----
physics.start()

--------start music----
	local music = audio.loadSound("audio/Song4.wav")
	 	local availableChannel = audio.findFreeChannel()
		audio.play( music, { channel=availableChannel } )



----------------HUD--------------------------------------------------------------------------------------------

-----------------pause button-------------------
local pauseBtn = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex("menuButton")}} )

pauseBtn.x = display.contentWidth-20
pauseBtn.y = 13
HUDGroup:insert(pauseBtn)

local pauseBtnText = display.newText("menu", display.contentWidth - 75, 3, gameFont, 15)
pauseBtnText:setTextColor (242, 230, 210)
HUDGroup:insert(pauseBtnText)

-------------birdy count - score----------------
birdyCountText = display.newText ("birdy count  ".. score, display.contentWidth/2, 2, gameFont, 17)
birdyCountText:setReferencePoint(display.TopCenterReferencePoint)
birdyCountText.x = display.contentWidth/2 +55
birdyCountText:setTextColor (242, 230, 210)
HUDGroup:insert(birdyCountText)

--------scoring & currency------------

-----update score--------------------
function updateScore ()
		birdyCountText.text = ("birdy count  ".. score)
end 

---------------livesHUD

local campaign = gameOver.campaign
local arcade = gameOver.arcade



local gameOver = function()
	
	local endWaveScreen = require ("scripts.endWaveScreen")
	local gameFinished = endWaveScreen.endWave
	--local game = gameType
	paused = true
	
		tnt:cancelAllTimers()
		tnt:cancelAllTransitions()			
		tnt:cleanTimersAndTransitions()
	--if game == "campaign" then
		--data.accuracy = accuracy
		--data.birdyHits = birdyHits
		data.coins = coins
		data.birdyHits = birdyHits
		data.arrowShots = arrowShots
		data.accuracy = accuracy	
	--	data.lives = lives
		data.coins = coins
		--data.waveNo = waveNo
		data.FAammo = FAammo
		data.RFammo = RFammo
		data.X2ammo = X2ammo
		data.SAammo = SAammo
		--data.gameType = gameType
		goHome = true
		gameFinished(data) ----------------pass variables
	--[[elseif game == "arcade" then
		data.arcadeEx = arcadeEx
		data.arcadeDragon = arcadeDragon
		data.arcadeRain = arcadeRain
		data.arcadeDouble = arcadeDouble
		data.arcadeRocket = arcadeRocket
		data.accuracy = accuracy
		data.birdyHits = birdyHits
		data.coins = coins
		data.birdyHits = birdyHits
		data.arrowShots = arrowShots
		data.accuracy = accuracy	
	--	data.lives = lives
		data.coins = coins
		data.waveNo = waveNo
		data.FAammo = FAammo
		data.RFammo = RFammo
		data.X2ammo = X2ammo
		data.SAammo = SAammo
		data.gameType = gameType
		goHome = true
		arcade(data) -------------pass variables]]
	--end	
end


local lifeUp = true

local life1
local life1Yes = false
local life2
local life2Yes = false
local life3
local life3Yes = false
local life4
local life4Yes = false
local life5
local life5Yes = false
local life6
local life6Yes = false
local life7
local life7Yes = false
local life8
local life8Yes = false
local life9
local life9Yes = false
local life10
local life10Yes = false


local checkLivesFunction = function (event)
		if lives == 0 then
			life1:removeSelf()
			life1 = nil	
			gameOver()
		end
		
		if lives > 0 then 
				if lifeUp == true and life1Yes == false then
					local life1Function = function()
						life1 = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex("lifePic")}} )
						life1.x = 10
						life1.y = 11
						life1.xScale = 0.01
						life1.yScale = 0.01
						life1Yes = true
						local life1scale = tnt:newTransition(life1, {time = 100, xScale = 1, yScale = 1})
						HUDGroup:insert(life1)
					end
					local life1Timer = tnt:newTimer (300, life1Function)
				else 
					if lives == 1 then
						life2:removeSelf()
						life2 = nil
						life2Yes = false
					end
				end
		end
		if  lives > 1 then
				if lifeUp == true and life2Yes == false then
					local life2Function = function()
						life2 = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex("lifePic")}} )
						life2.x = 27
						life2.y = 11
						life2.xScale = 0.01
						life2.yScale = 0.01
						life2Yes = true
						local life2scale = tnt:newTransition(life2, {time = 100, xScale = 1, yScale = 1})
						HUDGroup:insert(life2)
					end
					local life2Timer = tnt:newTimer (350, life2Function)
				else 
					if lives == 2 then
						life3:removeSelf()
						life3 = nil		
						life3Yes = false
					end
				end
		end
		if  lives > 2 then
				if lifeUp == true and life3Yes == false then
					local life3Function = function()
						life3 = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex("lifePic")}} )
						life3.x = 44
						life3.y = 11
						life3.xScale = 0.01
						life3.yScale = 0.01
						life3Yes = true
						local life3scale = tnt:newTransition(life3, {time = 100, xScale = 1, yScale = 1})
						HUDGroup:insert(life3)
					end
					local life3Timer = tnt:newTimer (400, life3Function)
				else 
					if lives == 3 then
						life4:removeSelf()
						life4 = nil		
						life4Yes = false
					end
				end
		end
		if  lives > 3 then
				if lifeUp == true and life4Yes == false then
					local life4Function = function()
						life4 = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex("lifePic")}} )
						life4.x = 61
						life4.y = 11
						life4.xScale = 0.01
						life4.yScale = 0.01
						life4Yes = true
						local life4scale = tnt:newTransition(life4, {time = 100, xScale = 1, yScale = 1})
						HUDGroup:insert(life4)
					end
					local life4Timer = tnt:newTimer (450, life4Function)
				else 
					if lives == 4 then
						life5:removeSelf()
						life5 = nil		
						life5Yes = false
					end
				end
		end
		if  lives > 4 then
				if lifeUp == true and life5Yes == false then
					local life5Function = function()
						life5 = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex("lifePic")}} )
						life5.x = 78
						life5.y = 11
						life5.xScale = 0.01
						life5.yScale = 0.01
						life5Yes = true
						local life5scale = tnt:newTransition(life5, {time = 100, xScale = 1, yScale = 1})
						HUDGroup:insert(life5)
					end
					local life5Timer = tnt:newTimer (500, life5Function)
				else 
					if lives == 5 then
						life6:removeSelf()
						life6 = nil	
						life6Yes = false						
					end
				end
		end
		if  lives > 5 then
				if lifeUp == true and life6Yes == false then
					local life6Function = function()
						life6 = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex("lifePic")}} )
						life6.x = 95
						life6.y = 11
						life6.xScale = 0.01
						life6.yScale = 0.01
						life6Yes = true
						local life6scale = tnt:newTransition(life6, {time = 100, xScale = 1, yScale = 1})
						HUDGroup:insert(life6)
					end
					local life6Timer = tnt:newTimer (550, life6Function)
				else 
					if lives == 6 then
						life7:removeSelf()
						life7 = nil		
						life7Yes = false
					end
				end
		end
		if  lives > 6 then
				if lifeUp == true and life7Yes == false then
					local life7Function = function()
						life7 = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex("lifePic")}} )
						life7.x = 112
						life7.y = 11
						life7.xScale = 0.01
						life7.yScale = 0.01
						life7Yes = true
						local life7scale = tnt:newTransition(life7, {time = 100, xScale = 1, yScale = 1})
						HUDGroup:insert(life7)
					end
					local life7Timer = tnt:newTimer (600, life7Function)
				else 
					if lives == 7 then
						life8:removeSelf()
						life8 = nil		
						life8Yes = false
					end
				end
		end
		if  lives > 7 then
				if lifeUp == true and life8Yes == false then
					local life8Function = function()
						life8 = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex("lifePic")}} ) 
						life8.x = 129
						life8.y = 11
						life8.xScale = 0.01
						life8.yScale = 0.01
						life8Yes = true
						local life8scale = tnt:newTransition(life8, {time = 100, xScale = 1, yScale = 1})
						HUDGroup:insert(life8)
					end
					local life8Timer = tnt:newTimer (650, life8Function)
				else 
					if lives == 8 then
						life9:removeSelf()
						life9 = nil		
						life9Yes = false
					end
				end
		end
		if  lives > 8 then
				if lifeUp == true and life9Yes == false then
					local life9Function = function()
						life9 = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex("lifePic")}} )
						life9.x = 146
						life9.y = 11
						life9.xScale = 0.01
						life9.yScale = 0.01
						life9Yes = true
						local life9scale = tnt:newTransition(life9, {time = 100, xScale = 1, yScale = 1})
						HUDGroup:insert(life9)
					end
					local life9Timer = tnt:newTimer (700, life9Function)
				else 
					if lives == 9 then
						life10:removeSelf()
						life10 = nil	
						life10Yes = false
					end
				end
		end
		if  lives > 9 then
				if lifeUp == true and life10Yes == false then
					local life10Function = function()
						life10 = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex("lifePic")}} )
						life10.x = 164
						life10.y = 11
						life10.xScale = 0.01
						life10.yScale = 0.01
						life10Yes = true
						local life10scale = tnt:newTransition(life10, {time = 100, xScale = 1, yScale = 1})
						HUDGroup:insert(life10)
					end
					local life10Timer = tnt:newTimer (750, life10Function)
				end
		end
	end
checkLivesFunction()

---------------HUD layer--------------------
-------------weapon select buttons---------
local FAText = display.newText(FAammo, display.contentWidth - 255 , display.contentHeight - 56, gameFont, 12)
local RFText = display.newText(RFammo, display.contentWidth - 178.5, display.contentHeight - 56, gameFont, 12)
local x2AText = display.newText(X2ammo, display.contentWidth - 105.5,display.contentHeight-56, gameFont, 12)
local SAText = display.newText(SAammo, display.contentWidth - 34.5,display.contentHeight-56, gameFont, 12)

local updateAmmo = function ()
		FAText.text = FAammo
		x2AText.text = X2ammo
		RFText.text = RFammo	
		SAText.text = SAammo

	end
	
	
local fireArrowsSelect = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex("fireArrowPic")}} )
fireArrowsSelect.x = display.contentWidth - 225
fireArrowsSelect.y = display.contentHeight - 63
local fireArrowsSelectBG = display.newRect (display.contentWidth -248, display.contentHeight - 76, 47, 28)
fireArrowsSelectBG:setFillColor  (185,147,113, 255)
local fireArrowsSelectBG2 = display.newRect (display.contentWidth - 248,display.contentHeight - 76, 47, 10)
fireArrowsSelectBG2:setFillColor  (190,167,134)


local FAPic = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex("ammoPic")}} )
FAPic.x =  display.contentWidth - 251 
FAPic.y = display.contentHeight - 47


	local faSelect = function(event)
		if paused == false then
			if event.phase == "ended" and FAammo > 0 and paused == false then
				audio.play (weaponSelectSound,{channel = 2})
				local fireArrowsBar = display.newRect (display.contentWidth- 248, display.contentHeight - 76, 47, 28)
				fireArrowsBar:setFillColor(66, 120, 156, 255)
				HUDGroup:insert(fireArrowsBar)
				HUDGroup:insert(fireArrowsSelect)
				HUDGroup:insert(FAPic)
				HUDGroup:insert(FAText)
				fireArrowsBar:setReferencePoint(display.BottomCenterReferencePoint)
				FAammo = FAammo - 1
				updateAmmo()
				weaponType = 2
				currentWeapon = "FireArrow"
				dragon = true			
				
				local resetWeapon = function()
					weaponType = 1
					currentWeapon = "arrow"
					dragon = false
				end
				
				local fABarTransition = tnt:newTransition (fireArrowsBar,{time = powerUpTime, yScale = 0.01, onEnd = resetWeapon})

			end
		end
	end
fireArrowsSelect:addEventListener ("touch", faSelect)

local rapidFireSelect = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex("rapidArrowPic")}} )
rapidFireSelect.x =  display.contentWidth-160
rapidFireSelect.y = display.contentHeight - 63
local RFPic= display.newSprite( imageSheet , {frames={mainImages:getFrameIndex("ammoPic")}} )
RFPic.x =  display.contentWidth - 174
RFPic.y = display.contentHeight - 47

local rapidFireSelectBG = display.newRect (display.contentWidth -184,display.contentHeight-78, 47, 28)
rapidFireSelectBG:setFillColor  (185,147,113, 255)
local rapidFireSelectBG2 = display.newRect (display.contentWidth - 184,display.contentHeight -78, 47, 10)
rapidFireSelectBG2:setFillColor  (190,167,134)

	function rfSelect (event)
		if paused == false then
			if event.phase == "ended" and RFammo > 0 and paused == false then
				audio.play (weaponSelectSound,{channel = 2})
				local rapidFireBar = display.newRect (display.contentWidth - 184,display.contentHeight-78, 47, 28)
				rapidFireBar:setFillColor(66, 120, 156, 255)
				HUDGroup:insert(rapidFireBar)
				HUDGroup:insert(rapidFireSelect)
				HUDGroup:insert(RFPic)
				HUDGroup:insert(RFText)
				rapidFireBar:setReferencePoint(display.BottomCenterReferencePoint)
				RFammo = RFammo - 1
				updateAmmo()
				reloadTime = 140
				rain = true				

				local resetWeapon = function()
					reloadTime = 500
				rain = false			
				end
				
				local rfBarTransition = tnt:newTransition (rapidFireBar,{time = powerUpTime, yScale = 0.01, onEnd = resetWeapon})
			end
		end
	end
rapidFireSelect:addEventListener ("touch", rfSelect)

local doubleArrowsSelect = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex("x2ArrowPic")}} )
doubleArrowsSelect.x = display.contentWidth - 98
doubleArrowsSelect.y = display.contentHeight - 63
local x2Pic = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex("ammoPic")}} )
x2Pic.x = display.contentWidth-101
x2Pic.y = display.contentHeight - 47

local doubleArrowsSelectBG = display.newRect (display.contentWidth - 119,display.contentHeight-76, 46, 28)
doubleArrowsSelectBG:setFillColor  (185,147,113, 255)
local doubleArrowsSelectBG2 = display.newRect (display.contentWidth - 119,display.contentHeight-76, 46, 10)
doubleArrowsSelectBG2:setFillColor  (190,167,134)

	function daSelect (event)
		if paused == false then
			if event.phase == "ended" and X2ammo > 0 and paused == false then
				audio.play (weaponSelectSound,{channel = 2})
				local doubleArrowsBar = display.newRect (display.contentWidth-119,display.contentHeight-76, 46, 28)
				doubleArrowsBar:setFillColor(66, 120, 156,255)
				HUDGroup:insert(doubleArrowsBar)
				HUDGroup:insert(doubleArrowsSelect)
				HUDGroup:insert(x2Pic)
				HUDGroup:insert(x2AText)
				doubleArrowsBar:setReferencePoint(display.BottomCenterReferencePoint)
				double = true
				X2ammo = X2ammo - 1
				updateAmmo()
				local resetWeapon = function()
					double = false
				end
				local daBarTransition = tnt:newTransition (doubleArrowsBar,{time = powerUpTime, yScale = 0.01, onEnd = resetWeapon})
			end
		end
	end
doubleArrowsSelect:addEventListener ("touch", daSelect)


local strongArrowsSelect = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex("sArrowPic")}} )
strongArrowsSelect.x = display.contentWidth - 35
strongArrowsSelect.y = display.contentHeight - 63	
local SAPic = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex("ammoPic")}} )
SAPic.x = display.contentWidth - 30
SAPic.y = display.contentHeight - 47

local strongArrowsSelectBG = display.newRect (display.contentWidth - 58,display.contentHeight-76, 46, 28)
strongArrowsSelectBG:setFillColor  (185,147,113, 255)
local strongArrowsSelectBG2 = display.newRect (display.contentWidth - 58,display.contentHeight - 76, 46, 10)
strongArrowsSelectBG2:setFillColor  (190,167,134)
	function saSelect (event)
		if paused == false then
			if event.phase == "ended" and SAammo > 0 and paused == false then
				audio.play (weaponSelectSound,{channel = 2})
				local strongArrowsBar = display.newRect (display.contentWidth - 58, display.contentHeight - 76, 46, 28)
				strongArrowsBar:setFillColor(66, 120, 156,255)
				HUDGroup:insert(strongArrowsBar)
				HUDGroup:insert(strongArrowsSelect)
				HUDGroup:insert(SAPic)
				HUDGroup:insert(SAText)
				strongArrowsBar:setReferencePoint(display.BottomCenterReferencePoint)

				if resetReloadTimer then
					resetReloadTimer:cancel()
				end
				SAammo = SAammo - 1
				updateAmmo()
				arrowSpeed = 20
				rocket = true
				local resetWeapon = function()
					arrowSpeed = 10
					rocket = false
					
				end				
				local saBarTransition = tnt:newTransition (strongArrowsBar,{time = powerUpTime, yScale = 0.01, onEnd = resetWeapon})
			end
		end
	end
strongArrowsSelect:addEventListener ("touch", saSelect)

HUDGroup:insert(fireArrowsSelectBG)
HUDGroup:insert(fireArrowsSelectBG2)
HUDGroup:insert(fireArrowsSelect)
HUDGroup:insert(FAPic)
HUDGroup:insert(FAText)
HUDGroup:insert(rapidFireSelectBG)
HUDGroup:insert(rapidFireSelectBG2)
HUDGroup:insert(rapidFireSelect)
HUDGroup:insert(RFPic)
HUDGroup:insert(RFText)
HUDGroup:insert(doubleArrowsSelectBG)
HUDGroup:insert(doubleArrowsSelectBG2)
HUDGroup:insert(doubleArrowsSelect)
HUDGroup:insert(x2Pic)
HUDGroup:insert(x2AText)
HUDGroup:insert(strongArrowsSelectBG)
HUDGroup:insert(strongArrowsSelectBG2)
HUDGroup:insert(strongArrowsSelect)
HUDGroup:insert(SAPic)
HUDGroup:insert(SAText)
HUDGroup:insert(pauseBtn)


--------------------------------------------------------------------------------------
		local pauseFunction = function()

			local pauseGroup = display.newGroup()
			pauseMenuOn = true
			local sure = false
			-----background images-----------------------------------------
			local BG = display.newRect(0,0, display.contentWidth, display.contentHeight)
			BG:setFillColor(0,0,0,210)
			pauseGroup:insert(BG)
			
			local PMenuScreenBG = display.newImage("images/pauseMenu.png")
				PMenuScreenBG.x = display.contentCenterX
				PMenuScreenBG.y = display.contentCenterY+2

			-----text display objects------
			local gameStatsText = display.newText ("game", display.contentCenterX -117,display.contentCenterY - 129, gameFont, 14)
			local shopText = display.newText ("shop", display.contentCenterX + 101, display.contentCenterY - 92, gameFont, 14)
			local waveNoText = display.newText ("Wave", display.contentCenterX -88,display.contentCenterY-95, gameFont, 18)
				waveNoText:setTextColor (55,62,44)
			local waveNoCounter = display.newText (waveNo, display.contentCenterX -35,display.contentCenterY-95, gameFont, 18)
				waveNoCounter:setTextColor (55,62,44)
			local goldText = display.newText ("Gold",display.contentCenterX+57,display.contentCenterY-127, gameFont, 15)
				goldText:setTextColor (55,62,44)
			local coinsCount = display.newText (coins,display.contentCenterX+150,display.contentCenterY - 130, gameFont, 19)
				coinsCount:setTextColor (55,62,44)
				coinsCount:setReferencePoint(display.TopCenterReferencePoint)
				coinsCount.x = display.contentCenterX + 140
			local livesText = display.newText ("lives",display.contentCenterX-174,display.contentCenterY-95, gameFont, 18)
				livesText:setTextColor (55,62,44)
			local livesCounter = display.newText (lives,display.contentCenterX -130,display.contentCenterY-95, gameFont, 18)
				livesCounter:setTextColor (55,62,44)
				livesCounter:setReferencePoint(display.TopCenterReferencePoint)
			local accuracyText = display.newText ("Accuracy", display.contentCenterX - 171,display.contentCenterY - 2, gameFont,17)
				accuracyText:setTextColor (55,62,44)
	--		local waveAccuracyText = display.newText ("this wave",display.contentCenterX - 142,display.contentCenterY -32, gameFont, 15)
	--			waveAccuracyText:setTextColor (55,62,44)
		--	local accuracyCounter = display.newText (gameAccuracy.." %",display.contentCenterX-140,display.contentCenterY+24, gameFont, 18 )
		--		accuracyCounter:setTextColor (55,62,44)
		--		accuracyCounter:setReferencePoint(display.TopCenterReferencePoint)
		--		accuracyCounter.x = display.contentCenterX -30
			local waveAccuracyCounter = display.newText (accuracy.." %",display.contentCenterX-76, display.contentCenterY + 8, gameFont, 25 )
				waveAccuracyCounter:setTextColor (55,62,44)
				waveAccuracyCounter:setReferencePoint(display.TopCenterReferencePoint)
				waveAccuracyCounter.x = display.contentCenterX - 32
			local birdyCountText = display.newText ("Birdy count", display.contentCenterX - 174,display.contentCenterY -63, gameFont, 17)
				birdyCountText:setTextColor (55,62,44)
		--	local waveBirdyCountText = display.newText("this wave", display.contentCenterX - 142,display.contentCenterY+27, gameFont, 15)
		--		waveBirdyCountText:setTextColor (55,62,44)
			local birdyCountCounter = display.newText (birdyHits, display.contentCenterX , display.contentCenterY - 47, gameFont, 25)
				birdyCountCounter:setTextColor (55,62,44)
				birdyCountCounter:setReferencePoint(display.TopCenterReferencePoint)
				birdyCountCounter.x = display.contentCenterX -40
		--	local waveBirdyCounter = display.newText (gameBirdyHits,display.contentCenterX - 120, display.contentCenterY -64, gameFont, 18)
		--		waveBirdyCounter:setTextColor (55,62,44)
		--		waveBirdyCounter:setReferencePoint(display.TopCenterReferencePoint)
		--		waveBirdyCounter.x = display.contentCenterX -33

			local quitBtn = display.newRect (display.contentCenterX -128,display.contentCenterY+72, 63, 27)	
				quitBtn:setFillColor (255, 255, 255, 0)
			local quitBtnText = display.newText ("quit",display.contentCenterX -105,display.contentCenterY+76, gameFont, 15)
			
							local areYouSureFunction = function (event)
								if event.phase == "ended" and sure == false then
								sure = true
										local localGroup = display.newGroup()
								
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
											goHome = true
											sure = false
											paused = false
											menuReturn = true
													pauseGroup:removeSelf()
													pauseGroup = nil		
													localGroup:removeSelf()
													localGroup = nil
												
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
		
			quitBtn:addEventListener("touch", areYouSureFunction)
				
			-----update currency with purchased items------------------------
			local updateCoins = function ()
				coinsCount.text = (coins)
			end
			
			------------------buttons----------------------------------------

			-------buy extra life----
			local extraLifeText = display.newText ("extra life",display.contentCenterX+82,display.contentCenterY-70, gameFont, 15)
				extraLifeText:setTextColor (55,62,44)
			
			local extraLife = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex("buyBtnWhite")}} )
				extraLife.x = display.contentCenterX + 191
				extraLife.y = display.contentCenterY-62
				extraLife.alpha = 0.01
				local extraLifeFunction = function (event)
					if event.phase == "ended" and coins > 0 and sure == false and lives < 10 then
						audio.play(weaponSelectSound)
						coins = coins - 1
						updateCoins()
						extraLife.alpha = 1
						extraLifeTransition = tnt:newTransition (extraLife, {time = 1000, alpha = 0.01})
						lives = lives+1
						lifeUp = true
						checkLivesFunction()
						livesCounter.text = lives
					end
				end
			extraLife:addEventListener ("touch", extraLifeFunction)
			local extraLifePrice = display.newText ("5",display.contentCenterX+169,display.contentCenterY-71, gameFont, 15)
			extraLifePrice:setReferencePoint(display.TopCenterReferencePoint)
			extraLifePrice.x = display.contentCenterX + 193
			
			
			------buy fire arrows------
			local buyFireAText = display.newText ("fire arrows",display.contentCenterX + 74,display.contentCenterY-42, gameFont, 15)
				buyFireAText:setTextColor (55,62,44)
			local buyFireA = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex("buyBtnWhite")}} )
			buyFireA.x = display.contentCenterX + 191
			buyFireA.y = display.contentCenterY -34 
			buyFireA.alpha = 0.01
				local buyFireAFunction = function (event)
					if event.phase == "ended" and coins > 4 and sure == false then
						audio.play(weaponSelectSound)
						coins = coins - 5
						updateCoins()
						FAammo = FAammo + 1
						updateAmmo()
						buyFireA.alpha = 1
						buyFireATransition = tnt:newTransition (buyFireA, {time = 1000, alpha = 0.01})
					end
				end
			buyFireA:addEventListener("touch", buyFireAFunction)
			local buyFireAPrice = display.newText ("5", display.contentCenterX +169,display.contentCenterY-43, gameFont, 15)
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
						if event.phase == "ended" and coins > 2 and sure == false then
							audio.play(weaponSelectSound)
							coins = coins - 3
							updateCoins()
							RFammo = RFammo + 1
							updateAmmo()
							buyRF.alpha = 1
							buyRFTransition = tnt:newTransition (buyRF, {time = 1000, alpha = 0.01})
						end
					end
				buyRF:addEventListener ("touch", buyRFFunction)
				local buyRFPrice = display.newText ("5",display.contentCenterX + 169,display.contentCenterY-15, gameFont, 15)
				buyRFPrice:setReferencePoint(display.TopCenterReferencePoint)
				buyRFPrice.x = display.contentCenterX + 193
			
			--------buy 2 Arrows-----
			local buyx2AText = display.newText ("double arrows", display.contentCenterX + 67,display.contentCenterY+11, gameFont, 15)
				buyx2AText:setTextColor (55,62,44)
			local buyx2A = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex("buyBtnWhite")}} )
				buyx2A.x = display.contentCenterX +191
				buyx2A.y = display.contentCenterY+20 
				buyx2A.alpha = 0.01
					local buyx2AFunction = function(event)
						if event.phase == "ended" and coins > 1 and sure == false then
							audio.play(weaponSelectSound)
							coins = coins - 2
							updateCoins()
							X2ammo = X2ammo + 1
							updateAmmo()
							buyx2A.alpha = 1
							buyx2ATransition = tnt:newTransition (buyx2A, {time = 1000, alpha = 0.01})
						end
					end
				buyx2A:addEventListener ("touch", buyx2AFunction)	
				local buyx2APrice = display.newText ("5",display.contentCenterX + 169,display.contentCenterY+11 , gameFont, 15)		
				buyx2APrice:setReferencePoint(display.TopCenterReferencePoint)
				buyx2APrice.x = display.contentCenterX + 193
			
			-----buy Fast Arrows---
			local buyFAText = display.newText ("power arrows",display.contentCenterX+68,display.contentCenterY+37, gameFont, 15)	
				buyFAText:setTextColor (55,62,44)
			local buyFA = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex("buyBtnWhite")}} )
				buyFA.x = display.contentCenterX +191 
				buyFA.y = display.contentCenterY+46
				buyFA.alpha = 0.01
					local buyFAFunction = function (event)
						if event.phase == "ended" and coins > 3 and sure == false then
							audio.play(weaponSelectSound)
							coins = coins - 4
							updateCoins()
							SAammo = SAammo + 1
							updateAmmo()
							buyFA.alpha = 1
							buyFATransition = tnt:newTransition (buyFA, {time = 1000, alpha = 0.01})
						end
					end
				buyFA:addEventListener ("touch", buyFAFunction)
				local buyFAPrice = display.newText ("5",display.contentCenterX+169,display.contentCenterY+36, gameFont, 15)
				buyFAPrice:setReferencePoint(display.TopCenterReferencePoint)
				buyFAPrice.x = display.contentCenterX + 193
			
				-----buy unlimited quick reloads----
			local buyARFText = display.newText ("always rapid fire",display.contentCenterX+42,display.contentCenterY+74, gameFont, 14)
				buyARFText:setTextColor (55,62,44)
			local buyARF = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex("buyBtnWhite2")}} )
				buyARF.x = display.contentCenterX + 184
				buyARF.y = display.contentCenterY +79
				buyARF.alpha = 0.01
					local buyARFFunction = function(event)
						if event.phase == "ended" and sure == false and coins > 1999 then
							audio.play(weaponSelectSound)
							buyARF.alpha = 1
							buyARFTransition = tnt:newTransition (buyARF, {time = 1000, alpha = 0.01})
						end
					end
				buyARF:addEventListener("touch", buyARFFunction)
				local buyARFPrice = display.newText ("2000",display.contentCenterX + 160,display.contentCenterY+71, gameFont, 11)		
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
	--		pauseGroup:insert(accuracyCounter)
			pauseGroup:insert(waveAccuracyCounter)
			pauseGroup:insert(birdyCountText)
			pauseGroup:insert(birdyCountCounter)
	--		pauseGroup:insert(waveBirdyCountText)
	--		pauseGroup:insert(waveBirdyCounter)
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
			pauseGroup:insert(coinsCount)
			pauseGroup:insert(livesCounter)
			pauseGroup:insert(livesText)
			pauseGroup:insert(birdyCountText)
			pauseGroup:insert(accuracyText)
		--	pauseGroup:insert(waveAccuracyText)

			--------remove pause menu and unpause the game--
			local function unPauseGame (event)
				if event.phase == "ended" then
					----remove objects -----
					pauseGroup:removeSelf()
					pauseGroup = nil			
					----resume game---
					audio.play(clickSound)
					paused = false
					pauseMenuOn = false
					if waveOver == false then
						physics.start()
						tnt:resumeAllTransitions()
						tnt:resumeAllTimers()
					end
				end
			end
			unPauseBtn:addEventListener("touch", unPauseGame)

		end
-------- game code ---------------------------------------------------------------------------------------------------

----------Firing arrows-----------------------
----------Aiming------------------------------
---------------rotate arrow in direction of travel--------------
local arrowPath = function()
 	--print("1")
	local arrowsTable = arrowsTable
	if (#arrowsTable >= 1) then
		for i = #arrowsTable, 1, -1  do
								
					--[[local fireball = display.newImage("images/fireball.png")
						fireball.x = _G.arrowsTable[i].x+math.random(-2, 2)
						fireball.y = _G.arrowsTable[i].y+math.random(-2, 2)
						fireballTable[#fireballTable + 1] = fireball
						fireball.xScale = 0.3
						fireball.yScale = 0.3
						tnt:newTransition(fireball, {time = 400, alpha = 0})
						local fireballDestroy = function ()
							if fireball then
								fireball:removeSelf()
								fireball = nil
								--fireballTimer:cancel()
								destroyTimer:cancel()
							end
						end
					destroyTimer = tnt:newTimer(400, fireballDestroy,0)]]
							
				if arrowsTable[i].hasCollided == false then
				----calculate arrow velocity
				vx, vy = arrowsTable[i]:getLinearVelocity()
				velocityAngle = math.atan2( vy, vx)
				velocityAngle = math.deg(velocityAngle)
				arrowsTable[i].angle = velocityAngle
				offset = 90
				arrowsTable[i].rotation = velocityAngle
				arrowsTable[i].axv, arrowsTable[i].ayv = arrowsTable[i]:getLinearVelocity()
			end
		end
	end
end

local touchX = 0
local touchY = 0
function aiming (event)
	if paused == false then
		local isAiming = true


		if isAiming == true then
			torso.rotation = math.ceil(math.atan2( (event.y - torso.y), (event.x -torso.x) ) * 180 / math.pi) + 180	
			if torso.rotation < 122.5 then
				if torso.rotation > 6 then
					torso.rotation =6
				end
			elseif torso.rotation <290 then
			torso.rotation = 290
			end
			
			if event.x > 50 and event.y < 235 then
				if weaponType == 1 then
					torso:setFrame (2)
				else 
					torso:setFrame (5)
				end
			end
			
			if event.x < 51 or event.y > 234 then	
				if weaponType == 1 then
					torso:setFrame (3)
				else
					torso:setFrame (6)
				end
			end
			
			if event.x < 35 or event.y > 245 then
				if weaponType == 1 then
					torso:setFrame (4)
				else
					torso:setFrame (7)
				end
			end
		end
		
		
		local fire
		if event.phase == "ended" then
			isAiming = false
			fire = true

		end 

		if isAiming == false then
			torso:setFrame (1)
		end
	----------Fire an arrow------------------------------
			----spawn arrows-----
			local spawnArrow = function(double, rotate, touchX, touchY, arrowSpeed, currentWeapon)
				
				local double = double
				local rotate = rotate
				local touchX = touchX
				local touchY = touchY
				local arrowSpeed = arrowSpeed
				local currentWeapon = currentWeapon
			
				--, rotate, touchX, touchY, arrowSpeed, currentWeapon)
				arrowShots = arrowShots + 1	---up shot count for wave accuracy
		--		gameArrowShots = gameArrowShots + 1	---up shot count for whole game accuracy
				accuracy = (birdyHits / arrowShots) * 100	---calculate wave accuracy
		--		gameAccuracy = (gameBirdyHits / gameArrowShots) * 100	--- calculate whole game accuracy
				accuracy = math.floor (accuracy)	---round wave accuracy to whole number
		--		gameAccuracy = math.floor (gameAccuracy) ---round game accuracy to whole number
				indexCount = 0	
				indexCount = indexCount + 1
				local arrow = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex(currentWeapon)}} )	--- create arrow sprite
				--------assign power up signature
				if dragon == true then
					arrow.dragon = true 
					else
					arrow.dragon = false
				end
				if rain == true then
					arrow.rain = true
					else
					arrow.rain = false
				end
				if double == true then
					arrow.double = true
				else
					arrow.double = false
				end
				if rocket == true then
					arrow.rocket = true
				else
					arrow.rocket = false
				end
					--print("yes")
				audio.play(arrowSound, {channel = 2})	---play sound
				
				arrowShape = {16,-2, 20,-2, 20,2, 16,-2}		---create arrowhead physics shape
				local arrowFilter = arrowCollisionFilter
				physics.addBody (arrow, "dynamic",{filter = arrowFilter, shape = arrowShape})
				arrow.isBullet = true
				--arrow.isSensor = true
				if double == false then
				--local torso = torso
					arrow: setLinearVelocity((87 - touchX)* arrowSpeed , (display.contentHeight - 107 - touchY)* arrowSpeed)--, arrow.x-200, arrow.y)
				else
					arrow: setLinearVelocity((87 - touchX + rotate)* arrowSpeed , (display.contentHeight - 107 - touchY + rotate)* arrowSpeed)
				end
				
				
				arrow.hitCounter = false ---has arrow collided? variable
				arrow.index = indexCount + 1
				arrow.x = torso.x
				arrow.y = torso.y
				arrow.rotation = torso.rotation
				---assert velocity variables
				arrow.axv = 1	
				arrow.ayv = 1
				arrow.obj = "arrow"
				arrow.Type = weaponType	---fire or regular?
				if arrow.Type == 2 then 
					arrow.linearDamping = 1
				end

				arrow.hasCollided = false   ---has arrow collided? variable
				arrowsTable[#arrowsTable + 1] = arrow		---add to arrow table		
				
			--	arrow:addEventListener ("collision", _G.arrowHit)
				--arrowsGroup:insert(arrow)
				
			return arrow
			end
		
		
		if fire == true then 
			fire = false
			if canFire == true and canReload == true then 
				touchX = event.x
					if touchX > 68 then
						touchX = 68
					end
				touchY = event.y
					if touchY < display.contentHeight-110 then
						touchY = display.contentHeight - 110
					elseif touchY > display.contentHeight -34 then
						touchY = display.contentHeight - 34
					end				
				if double == true then
				--_G.doubleArrows == true then
					spawnArrow(double, -5, touchX, touchY, arrowSpeed, currentWeapon)
					spawnArrow(double, 5, touchX, touchY, arrowSpeed, currentWeapon)
				else
					spawnArrow(double,0,touchX, touchY, arrowSpeed, currentWeapon)
				end
				
				--[[if _G.bomb == true then
					_G.arrowSpeed = 4.5
					spawnArrow()
				end]]
				
				canFire = false
				canReload = false
				aiming = false
				
			end
		end
	end	
end
aimer:addEventListener ("touch", aiming)

----reloading------------------
local reload = function(event)
	canFire = true
end 
		-----delay reload
local fireCheck = function()
--print ("1")
--print("2")
		if canFire == false and canReload == false then
			timer.performWithDelay (reloadTime, reload, 1)
			canReload = true
		end	
end				





-----------Collision handling------------------------------------------------------
--------------------------------------------------------------------------
		-----coins--------
			newCoin = function(coinInstanceX, coinInstanceY)
			local coinSequenceData = {
				name = "coinsSpin",
				start = 23,
				count = 10,
				time = 750,
				}
				
			---bring forward coordinates to spwan coin
			coinX = coinInstanceX
			coinY = coinInstanceY

			----spawn coin
			coin = display.newSprite (imageSheet, coinSequenceData)
			coin.x = coinX
			coin.y = coinY
			coin:play()

			-----rotate coin for menu
	--		if _G.gameIsActive == false then
	--			coin.rotation = -8
	--		end
			
			objTable[#objTable+1] = coin
			
			coins = coins + 1 ----------add player coin
			
			-----make coin physics body if in game mode
		--	coinAddBody = function ()	
			coin.xScale = 0.7
			coin.yScale = 0.7
			coin.obj = "atmos"
			local coinFilter = _G.coinCollisionFilter
			physics.addBody (coin, "dynamic", {filter = coinFilter})
			coin:setLinearVelocity( math.random(-100, 200), math.random (-300,-100))
		--	end

	--		if gameIsActive == true then
		--		timer.performWithDelay (2, coinAddBody)
	--		end


		end
			------feathers
			feathers = function(feathersX, feathersY, feathersVX, feathersVY, arrowType)
			--print (feathersVY)
			--local weapon = arrowType
				if arrowType == 1 then 
				featherType = "images/feather.png"
					local availableChannel = audio.findFreeChannel()
					audio.play( arrowHitSound, { channel=availableChannel } )
				else
				featherType = "images/fireball.png"
					local availableChannel = audio.findFreeChannel()
					audio.play( arrowFireSound, { channel=availableChannel } )
				end

			local feather1 = display.newImage (featherType)
			feather1.x = feathersX
			feather1.y = feathersY
			feather1.rotation = math.random(1,360)
			gameGroup:insert(feather1)

			local feather2 = display.newImage (featherType)
			feather2.x = feathersX
			feather2.y = feathersY
			feather2.rotation = math.random(1,360)
			gameGroup:insert(feather2)

			local feather3 = display.newImage (featherType)
			feather3.x = feathersX
			feather3.y = feathersY
			feather3.rotation = math.random(1,360)
			gameGroup:insert(feather3)

			local feather4 = display.newImage (featherType)
			feather4.x = feathersX
			feather4.y = feathersY
			feather4.rotation = math.random(1,360)
			gameGroup:insert(feather4)

			local feather5 = display.newImage (featherType)
			feather5.x = feathersX
			feather5.y = feathersY
			feather5.rotation = math.random(1,360)
			gameGroup:insert(feather5)

			local feather6 = display.newImage (featherType)
			feather6.x = feathersX
			feather6.y = feathersY
			feather6.rotation = math.random(1,360)
			gameGroup:insert(feather6)

			local feather7= display.newImage (featherType)
			feather7.x = feathersX
			feather7.y = feathersY
			feather7.rotation = math.random(1,360)
			gameGroup:insert(feather7)

			local feather8 = display.newImage (featherType)
			feather8.x = feathersX
			feather8.y = feathersY
			feather8.rotation = math.random(1,360)
			gameGroup:insert(feather8)

			local feather9 = display.newImage (featherType)
			feather9.x = feathersX
			feather9.y = feathersY
			feather9.rotation = math.random(1,360)
			gameGroup:insert(feather9)

			--feathersAddBody = function ()	
			--indexCount = 0	
				--	indexCount = indexCount + 1
				
				local deadFilter = deadCollisionFilter
				
				physics.addBody (feather1, "dynamic", {filter = deadFilter})
				feather1.obj = "atmos"
				feather1:setLinearVelocity (math.random( feathersVX/2-20,feathersVX/2+20 ), math.random(feathersVY/2-20,feathersVY/2+20 ))
				objTable[#objTable+1] = feather1
				feather1.angularVelocity = math.random(200, 500)
				local feather1Scale = math.random(0.6,1.3)
				feather1.xScale = feather1Scale
				feather1.yScale = feather1Scale
				feather1:setFillColor(math.random(150, 255),math.random(150, 255),math.random(150, 255))
				feather1.burn = false
				if arrowType == 1 then
					feather1.linearDamping = 1
				else
					feather1.linearDamping = 3
				end
				if arrowType == 2 then
					local burn1 = function()
						feather1.burn = true
					end
					tnt:newTransition(feather1, {time = 800, alpha = 0})
					tnt:newTimer(math.random(50,1000), burn1)
				end	
				
				physics.addBody (feather2, "dynamic", {filter = deadFilter})
				feather2.obj = "atmos"
				feather2:setLinearVelocity(math.random( feathersVX/2-20,feathersVX/2+20 ), math.random(feathersVY/2-20,feathersVY/2+20 ))
				objTable[#objTable+1] = feather2
				feather2.angularVelocity = math.random(200, 500)
				local feather2Scale = math.random(0.6,1.3)
				feather2.xScale = feather2Scale
				feather2.yScale = feather2Scale
				feather2:setFillColor(math.random(200, 255),math.random(200, 255),math.random(200, 255))
				feather2.burn = false
				if arrowType == 1 then
					feather2.linearDamping = 8
				else
					feather2.linearDamping = 16
				end
				if arrowType == 2 then
					local burn2 = function()
						feather2.burn = true
					end
					tnt:newTransition(feather2, {time = 800, alpha = 0})
					tnt:newTimer(math.random(50,1000), burn2)
				end	
				
				physics.addBody (feather3, "dynamic", {filter = deadFilter})
				feather3.obj = "atmos"
				feather3:setLinearVelocity(math.random( feathersVX/2-20,feathersVX/2+20 ), math.random(feathersVY/2-20,feathersVY/2+20 ))
				objTable[#objTable+1] = feather3
				feather3.angularVelocity = math.random(200, 500)
				local feather3Scale = math.random(0.6,1.3)
				feather3.xScale = feather3Scale
				feather3yScale = feather3Scale
				feather3:setFillColor(math.random(200, 255),math.random(200, 255),math.random(200, 255))
				feather3.burn = false
				if arrowType == 1 then
					feather3.linearDamping = 1
				else
					feather3.linearDamping = 3
				end
				if arrowType == 2 then
					local burn3 = function()
						feather3.burn = true
					end
					tnt:newTransition(feather3, {time = 800, alpha = 0})
					tnt:newTimer(math.random(50,1000), burn3)
				end	
				
				physics.addBody (feather4, "dynamic", {filter = deadFilter})
				feather4.obj = "atmos"
				feather4:setLinearVelocity(math.random( feathersVX/2-20,feathersVX/2+20 ), math.random(feathersVY/2-20,feathersVY/2+20 ))
				objTable[#objTable+1] = feather4
				feather4.angularVelocity = math.random(200, 500)
				local feather4Scale = math.random(0.6,1.3)
				feather4.xScale = feather4Scale
				feather4.yScale = feather4Scale
				feather4:setFillColor(math.random(200, 255),math.random(200, 255),math.random(200, 255))
				feather4.burn = false
				if arrowType == 1 then
					feather4.linearDamping = 2
				else
					feather4.linearDamping = 5
				end
				if arrowType == 2 then
					local burn4 = function()
						feather4.burn = true
					end
					tnt:newTransition(feather4, {time = 800, alpha = 0})
					tnt:newTimer(math.random(50,1000), burn4)
				end	
				
				physics.addBody (feather5, "dynamic", {filter = deadFilter})
				feather5.obj = "atmos"
				feather5:setLinearVelocity(math.random( feathersVX/2-20,feathersVX/2+20 ), math.random(feathersVY/2-20,feathersVY/2+20 ))
				objTable[#objTable+1] = feather5
				feather5.angularVelocity = math.random(200, 500)
				local feather5Scale = math.random(0.6,1.3)
				feather5.xScale = feather5Scale
				feather5.yScale = feather5Scale
				feather5:setFillColor(math.random(200, 255),math.random(200, 255),math.random(200, 255))
				feather5.burn = false
				if arrowType == 1 then
					feather5.linearDamping = 2
				else
					feather5.linearDamping = 4
				end
				if arrowType == 2 then
					local burn5 = function()
						feather5.burn = true
					end
					tnt:newTransition(feather5, {time = 800, alpha = 0})
					tnt:newTimer(math.random(50,1000), burn5)
				end	
				
				
				physics.addBody (feather6, "dynamic", {filter = deadFilter})
				feather6.obj = "atmos"
				feather6:setLinearVelocity(math.random( feathersVX/2-20,feathersVX/2+20 ), math.random(feathersVY/2-20,feathersVY/2+20 ))
				objTable[#objTable+1] = feather6
				feather6.angularVelocity = math.random(200, 500)
				local feather5Scale = math.random(0.6,1.3)
				feather6.xScale = feather5Scale
				feather6.yScale = feather5Scale
				feather6:setFillColor(math.random(200, 255),math.random(200, 255),math.random(200, 255))
				feather6.burn = false
				if arrowType == 1 then
					feather6.linearDamping = 2.5
				else
					feather6.linearDamping = 7
				end
				if arrowType == 2 then
					local burn6= function()
						feather6.burn = true
					end
					tnt:newTransition(feather6, {time = 800, alpha = 0})
					tnt:newTimer(math.random(50,1000), burn6)
				end	
				
				physics.addBody (feather7, "dynamic", {filter = deadFilter})
				feather7.obj = "atmos"
				feather7:setLinearVelocity(math.random( feathersVX/2-20,feathersVX/2+20 ), math.random(feathersVY/2-20,feathersVY/2+20 ))
				objTable[#objTable+1] = feather7
				feather7.angularVelocity = math.random(200, 500)
				local feather7Scale = math.random(0.6,1.3)
				feather7.xScale = feather5Scale
				feather7.yScale = feather5Scale
				feather7:setFillColor(math.random(200, 255),math.random(200, 255),math.random(200, 255))
				feather7.burn = false
				if arrowType == 1 then
					feather7.linearDamping = 3
				else
					feather7.linearDamping = 8
				end
				if arrowType == 2 then
					local burn7 = function()
						feather7.burn = true
					end
					tnt:newTransition(feather7, {time = 800, alpha = 0})
					tnt:newTimer(math.random(50,1000), burn7)
				end	
				
				physics.addBody (feather8, "dynamic", {filter = deadFilter})
				feather8.obj = "atmos"
				feather8:setLinearVelocity(math.random( feathersVX/2-20,feathersVX/2+20 ), math.random(feathersVY/2-20,feathersVY/2+20 ))
				objTable[#objTable+1] = feather8
				feather8.angularVelocity = math.random(200, 500)
				local feather8Scale = math.random(0.6,1.3)
				feather8.xScale = feather5Scale
				feather8.yScale = feather5Scale
				feather8:setFillColor(math.random(200, 255),math.random(200, 255),math.random(200, 255))
				feather8.burn = false
				if arrowType == 1 then
					feather8.linearDamping = 4
				else
					feather8.linearDamping = 6
				end
				if arrowType == 2 then
					local burn8 = function()
						feather8.burn = true
					end
					tnt:newTransition(feather8, {time = 800, alpha = 0})
					tnt:newTimer(math.random(50,1000), burn8)
				end	
				
				physics.addBody (feather9, "dynamic", {filter = deadFilter})
				feather9.obj = "atmos"
				objTable[#objTable+1] = feather9
				local feather9Scale = math.random(0.6,1.3)
				feather9.xScale = feather5Scale
				feather9.yScale = feather5Scale
				feather9:setFillColor(math.random(200, 255),math.random(200, 255),math.random(200, 255))
				feather9:setLinearVelocity(math.random( feathersVX/2-20,feathersVX/2+20 ), math.random(feathersVY/2-20,feathersVY/2+20 ))
				feather9.angularVelocity = math.random(200, 500)
				feather9.burn = false
				if arrowType == 1 then
					feather9.linearDamping = 5
				else
					feather9.linearDamping = 7
				end
				if arrowType == 2 then
					local burn9 = function()
						feather9.burn = true
					end
					tnt:newTransition(feather9, {time = 800, alpha = 0})
					tnt:newTimer(math.random(50,1000), burn9)
				end
			end

local collisionFunction = function(event)
	--local rotate = event.params.rotate
	if event.phase == "began" then
	local doCollision = function(rotate)
		
		-----------register arrow hit & accuracy etc
		if event.other.Type == 1 then
			event.other.hasCollided = true
		end
		if event.other.hitCounter == false then

		--	gameBirdyHits = gameBirdyHits + 1
			accuracy = (birdyHits / arrowShots) * 100
		--	gameAccuracy = (gameBirdyHits / gameArrowShots) * 100
			accuracy = math.floor (accuracy)
		--	gameAccuracy = math.floor (gameAccuracy)
		end
		event.other.hitCounter = true
			
			birdyHits = birdyHits + 1
			score = score + 1
			updateScore()
	--[[
		if gameType == "arcade" then
		arcadeEx = arcadeEx + 1 
			if event.other.dragon == true then
				arcadeDragon = arcadeDragon+1
			end
			if event.other.double == true then
				arcadeDouble = arcadeDouble +1
			end
			if event.other.rain == true then
				arcadeRain = arcadeRain +1
			end
			if event.other.rocket == true then
				arcadeRocket = arcadeRocket +1
			end
		end	
		]]
		
		--print ("test")
		--local changeBodyType = function()
		event.target.bodyType = "dynamic"
		event.target.collided = true
		event.target.isSensor = true			
		--event.target:pause()
		if event.target.type == 1 then
			event.target:setSequence("deadBird")
			event.target.rotation = -10
		elseif event.target.type == 3 then
			event.target:setSequence("deadRed")
		elseif event.target.type == 2 then
			event.target:setSequence("deadYellow")
		end
		if event.other.Type == 2 then
			event.target:setFrame(2)
			event.target.burn = true
		end
		
		event.target.angularVelocity = math.random (-event.other.axv, event.other.axv)		---spin dead bird
		
		if event.other.Type == 1 then
			if event.target.newTransition ~= nil then
				event.target.newTransition:cancel()  ----cancel screen transition
			end
			if event.other.rotation or event.other.angle > 0 then
			--_G.ar > 0 then
				---arrow facing down---
				if event.target ~= nil then
					event.target:setLinearVelocity (event.other.axv-(event.other.axv/2), event.other.ayv-event.other.ayv/1.5)
				end
			else
				---arrow facing up---
				if event.target ~= nil then
					event.target:setLinearVelocity (event.other.axv -(event.other.axv/2), event.other.ayv + 50)
				end
			end
		--else
		
		end
		

		-----spawn feathers
		--if event.other.Type == 1 then
			--local feathers = feathers.feathers
			feathers(event.target.x, event.target.y, event.other.axv, event.other.ayv, event.other.Type)
		--end
		-----spawn coin for yellow bird
		--if _G.birdHit == 2 then
		if event.target.type == 2 then
			timer.performWithDelay (2, newCoin(event.target.x, event.target.y))
		end
	end	
	local collisionTimer = tnt:newTimer(1,doCollision) 
	end
end

--------------end wave screen---------


			------- spawn birds-------------------------------------
						local birdSequenceData = {
							{name = "birdFlying",start = 4,count = 7,time = 350,loopDirection = "bounce"},
							{name ="deadBird",start = 33,count = 2}
						}
							
						local redBirdSequenceData = {
							{name = "redFlying",start = 39,count = 7,time = 500,loopDirection = "bounce"},
							{name ="deadRed",start = 46,count = 2,time = 500}
						}

						local yellowBirdSequenceData = {
							{name = "yellowFlying",start = 61,count = 7,time = 400,loopDirection = "bounce"},
							{name ="deadYellow",start = 68,count = 2}
						}

						-------spawn new bird---------------------
						local midWave = false
						local highWave = false
						function newBird (self)
							------end midwave
								if paused == false and spawnBirds == true then
									--[[
									newTime = os.time()
									if newTime > (markTime + 25) then
										if midWave == true then 
											midWave = false
											spawnBirdMidTimer:cancel()
										end	
									end
							----end high wave
									if newTime > (markTime + 34) then
										if highWave == true then 
											highWave = false
											spawnBirdHighTimer:cancel()
										end
									end
							----at end of wave in campaign/phase in arcade
									if newTime > (markTime + 40) then
										spawnBirdsBaseTimer:cancel()
										if gameType == "campaign" then
											-----end wave
											lastBird = true
											spawnBirds = false
											local endWaveScreen = require("scripts.endWaveScreen")
											local endWave = endWaveScreen.endWave
											local endWaveTimer = tnt:newTimer (3000, endWave)
										end
										if gameType == "arcade" then
											-----restart wave increments
											spawnInterval = spawnInterval - (spawnInterval*0.4)
											spawnFunction()
										end
									end
									]]
									
									---pick bird colour
									local birdType = math.random (1, 20)
									local indexCount = 0
									
									if birdType > 6 then
										bird = display.newSprite (imageSheet, birdSequenceData)
										bird.type = 1
									else
									if birdType == 1 then 
										bird = display.newSprite (imageSheet, redBirdSequenceData)
										bird.type = 3
									else
										bird = display.newSprite (imageSheet, yellowBirdSequenceData)
										bird.type = 2
									end
								end
									
								bird:setFillColor (math.random(220, 250), math.random(220, 250), math.random(220, 250))

								bird:play()
								bird.x = display.contentWidth + 20
								bird.y = 30 + math.random (200)
								physics.addBody (bird, "kinematic" ,{filter = birdCollisionFilter} )
								
							-----audio--
									
								local playSoundFunction = function()
								local birdNoise = math.random (1,2)
										if birdNoise == 1 then
											local availableChannel = audio.findFreeChannel()
											audio.setVolume ((math.random (3, 10)/10), {channel = availableChannel})
											audio.play( birdSound1, { channel=availableChannel } )
										else
											local availableChannel = audio.findFreeChannel()
											audio.setVolume ((math.random (3, 10)/10), {channel = availableChannel})
											audio.play( birdSound2, { channel=availableChannel } )
										end
									end
									bird.birdNoiseTimer = tnt:newTimer (math.random(2000, 3000), playSoundFunction, math.random(1,2))
									
									if bird.type == 1 then 
										bird.newTransition =  tnt:newTransition(bird, {time = math.random(4500, 5200), x = 10})
									else 
									if bird.type == 2 then
										bird.newTransition =  tnt:newTransition(bird, {time = math.random(6500, 7200), x = 10})
									else
										bird.newTransition =  tnt:newTransition(bird, {time = math.random(2900, 3200), x = 10})
									end			
									end
									bird.isSensor = true
									bird.obj = "bird"
									bird.index = indexCount + 1
									birdsTable[#birdsTable + 1] = bird
									bird.collided = false
									bird.hitWith = nil
									bird:addEventListener("collision", collisionFunction)
									--,{angle})
							--		bird:addEventListener("collision", collisionFunction)
									--hitBird)
									--_G.birdsGroup:insert(bird)

								end
							return bird
						end

				--		m.newBird = newBird

						--------flag bird when hit & get position for dead bird---
--[[						function hitBird (event)
						if event.phase == "began" then
							
							-----register awards-up
							if gameType == "arcade" then
								arcadeEx = arcadeEx + 1 
								if event.other.dragon == true then
									arcadeDragon = arcadeDragon+1
								end
								if event.other.double == true then
									arcadeDouble = arcadeDouble +1
								end
								if event.other.rain == true then
									arcadeRain = arcadeRain +1
								end
								if event.other.rocket == true then
									arcadeRocket = arcadeRocket +1
								end
							end	
							
							---change body type & set dead bird animation frame---
							local changeBodyType = function()
								--event.target.parent:remove( event.target )
								--physics.addBody (bird, "kinematic" ,{filter = birdCollisionFilter} )
								event.target.bodyType = "dynamic"
								event.target.isSensor = true
								--,{filter = _G.deadCollisionFilter})
								--print(event.target.filter)
								--event.target.filter = _G.deadCollisionFilter
								
								event.target:pause()
								if event.target.type == 1 then
									event.target:setSequence("deadBird")
									event.target.rotation = -10
								elseif event.target.type == 3 then
									event.target:setSequence("deadRed")
								elseif event.target.type == 2 then
									event.target:setSequence("deadYellow")
								end
								if event.other.Type == 2 then
									event.target:setFrame(2)
								end
								
								
								event.target.angularVelocity = math.random (-event.other.axv, event.other.axv)		---spin dead bird
									-----set direction of dead bird
								if event.other.Type == 1 then
									if event.other.rotation or _G.ar > 0 then
									--_G.ar > 0 then
										---arrow facing down---
										event.target:setLinearVelocity (event.other.axv-(event.other.axv/2), event.other.ayv-event.other.ayv/1.5)
									else
										---arrow facing up---
										event.target:setLinearVelocity (event.other.axv -(event.other.axv/2), event.other.ayv + 50)
									end
								end
								
								
							end
							
							tnt:newTimer(10,changeBodyType)	
							event.target.newTransition:cancel()
							hitWith = event.other.Type
							birdHit = event.target.type
							
							-----spawn feathers
							--if event.other.Type == 1 then
								--local weapon = 
								local feathers = feathers.feathers
								feathers(event.target.x, event.target.y, event.other.axv,  event.other.Type)
							--end
							-----spawn coin for yellow bird
							if birdHit == 2 then
								timer.performWithDelay (2, newCoin(event.target.x, event.target.y))
							end
									
						end
						end
]]


			---spawning--------------
			local spawn = function()
			local spawnInterval = 2000
				
			local spawnBirdFunction
				
				local spawnBird = function()
					spawnInterval = spawnInterval - (spawnInterval*0.2)
					newBird()
					spawnBirdFunction()
				end
				
				local spawnBirdFunction = function()
				print ("ok")
					local spawnTimer = tnt:newTimer (spawnInterval, spawnBird)
				end
				
				--local reduceTimer = tnt:newTimer (1000, reduceSpawnInterval, 0)
				spawnBirdFunction()
			end
			--spawn()
			
			
			
			
			local spawnFunction = function ()
				local markTime = os.time()
				
			--	if _G.gameType == "arcade" then
					
			--	end
				if gameType == "arcade" then
					local arcadeInterval = spawnInterval						
					local intervalReduce = function()
					local arcadeBirdTimer = tnt:newTimer (math.random(spawnInterval - 100,spawnInterval + 100), newBird)
						arcadeInterval = arcadeInterval - 50
						print(arcadeInterval)
					end
					local arcadeIntervalTimer = tnt:newTimer (1000, intervalReduce, 0)
				end
				
				if gameType == "campaign" then
				--	spawnInterval = 3000
					--local increaseSpawn = function()	
						spawnInterval = spawnInterval - (3*waveNo)
						--print (spawnInterval)
				--end
				
				
				--local increaseSpawnTimer = tnt:newTimer (1, increaseSpawn, waveNo)
				--end
				
				--local spawnBirds1 = tnt:newTimer (math.random(spawnInterval-(spawnInterval*0.2), spawnInterval+(spawnInterval*0.2)), newBird, 0)
				
				--if _G.gameType == "campaign" then
				-------------black birds----
				--testTime = display.newText (markTime, 100, 100, display.nativeSystemFont, 20)
				spawnBirdsBaseTimer = tnt:newTimer (math.random(spawnInterval-(spawnInterval*0.2), spawnInterval+(spawnInterval*0.2)), newBird, 0) 
					local spawnMid = function()
						midWave = true
						spawnBirdMidTimer = tnt:newTimer (math.random(spawnInterval-(spawnInterval*0.2), spawnInterval+(spawnInterval*0.2)), newBird, 0)
						print ("spawnMid")
						--midCheck = display.newText ("mid Check", 200, 200, display.nativeSystemFont, 20)
						--spawnInterval - spawnInterval*0.5, newBird,0)
					end
					
					local spawnHigh = function ()
						highWave = true
						spawnBirdHighTimer = tnt:newTimer(math.random(spawnInterval-(spawnInterval*0.2), spawnInterval+(spawnInterval*0.2)), newBird, 0)
						--highCheck = display.newText ("high Check", 200, 250, display.nativeSystemFont, 20)
						--spawnInterval- spawnInterval*0.5, newBird, 0)
						print ("spawnHigh")
					end
					
					local beginMidTimer = tnt:newTimer (18300, spawnMid)
					local beginHighTimer = tnt:newTimer (26600, spawnHigh)

				--end
				end
			end



			spawnFunction()



----register birds that get past player-------


------------------give extra lives to player-----
--[[_G.removeGOCount = function ()
		if _G.GOCount == 3 then 
		GO4:removeSelf()
		GO4 = nil
		end
		
		if _G.GOCount == 2 then
		GO3:removeSelf()
		GO3 = nil
		end
		
		if _G.GOCount == 1 then
		GO2:removeSelf()
		GO2 = nil
		end
		
		if _G.GOCount == 0 then
		GO1:removeSelf()
		GO1 = nil
		end
end]]
------atmosphere - background elemeents---

local newFog = function ()
		fog = display.newImage("images/fog.png")
		local indexCount = 0
		fog.x = -30
		fog.alpha = 0.8
		fog.y = math.random (display.contentHeight - 120, display.contentHeight-70)
		fog.obj = "atmos"
		fog.index = indexCount +1
		atmosTable[#atmosTable +1] = fog
		tnt:newTransition (fog, {time = 5000, x = display.contentWidth})
		--print("newFog")
		atmosGroup:insert(fog)
end
local fogTimerFunc = function()
	if paused == false then
	--print(newFog)
		newFog()
	end
end
--tnt:newTimer(200, fogTimerFunc,0)

local newGrass = function ()
	if paused == false then
		grass = display.newImage("images/grass.png")
		local indexCount = 0
		grass.x = -30
		grass.rotation = math.random(0,360)
		grass.obj = "atmos"
		grass.scale = math.random(0.2,1)
		physics.addBody (grass, "kinematic", {filter = deadCollisionFilter})
		grass.angularVelocity = math.random(200, 1000)
		grass:setLinearVelocity(0, math.random(-10,30))
		grass.y = math.random (display.contentHeight-140, display.contentHeight-70)
		grass.index = indexCount+1
		atmosTable[#atmosTable +1] = grass
		tnt:newTransition (grass, {time = math.random(2500,3500), x = display.contentWidth})
		atmosGroup:insert(grass)
	end
end
--tnt:newTimer(math.random(1500, 2500), newGrass, 0)

--local lamp1 = display.newCircle(80,160,1.5)
--lamp1:setFillColor(255,221,0)
--physics.addBody(lamp1, "kinematic",{filter = deadCollisionFilter})


local glow1 = display.newImage("images/glow.png")
glow1:setReferencePoint(display.CenterLeftReferencePoint)
glow1.x = 28
glow1.y = display.contentHeight - 260
local g1 = 36
glow1.rotation = g1
glow1.alpha = 0.6
glow1.blendMode = "screen"
gameGroup:insert(glow1)
local glow1Move = function ()
	local glow1Return = function ()
		tnt:newTransition (glow1, {time = 8000, rotation = g1,alpha = math.random (0.5,1),transition = easing.inOutQuad})
	end
	--transition.to(glow1, {time=3000, y=460, })
	tnt:newTransition (glow1, {time = 6000, rotation = g1+30, transition = easing.inOutQuad, alpha = math.random (0.8,1),onEnd = glow1Return })
end
glow1Move()
local glow1Timer = tnt:newTimer (10000, glow1Move,0)

local glow2 = display.newImage("images/glow.png")
glow2:setReferencePoint(display.CenterLeftReferencePoint)
glow2.x = 28
glow2.y = display.contentHeight - 260
local g2 = 72
glow2.rotation = g2
glow2.alpha = 0.6
glow2.blendMode = "screen"
gameGroup:insert(glow2)
local glow2Move = function ()
	local glow2Return = function ()
		tnt:newTransition (glow2, {time = 8000, rotation = g2,alpha = math.random (0.5,1),transition = easing.inOutQuad})
	end
	--transition.to(glow1, {time=3000, y=460, })
	tnt:newTransition (glow2, {time = 4000, rotation = g2+30, transition = easing.inOutQuad, alpha = math.random (0.5,1),onEnd = glow2Return })
end
glow2Move()
local glow2Timer = tnt:newTimer (11000, glow2Move,0)

local glow3 = display.newImage("images/glow.png")
glow3:setReferencePoint(display.CenterLeftReferencePoint)
glow3.x = 28
glow3.y = display.contentHeight - 260
local g3= 108
glow3.rotation = g3
glow3.alpha = 0.6
glow3.blendMode = "screen"
gameGroup:insert(glow3)
local glow3Move = function ()
	local glow3Return = function ()
		tnt:newTransition (glow3, {time = 7000, rotation = g3,alpha = math.random (0.8,1),transition = easing.inOutQuad})
	end
	--transition.to(glow1, {time=3000, y=460, })
	tnt:newTransition (glow3, {time = 3000, rotation = g3+30, transition = easing.inOutQuad, alpha = math.random (0.5,1),onEnd = glow3Return })
end
glow3Move()
local glow3Timer = tnt:newTimer (13000, glow3Move,0)

local glow4 = display.newImage("images/glow.png")
glow4:setReferencePoint(display.CenterLeftReferencePoint)
glow4.x = 28
glow4.y = display.contentHeight - 260
local g4= 144
glow4.rotation = g4
glow4.alpha = 0.6
glow4.blendMode = "screen"
gameGroup:insert(glow4)
local glow4Move = function ()
	local glow4Return = function ()
		tnt:newTransition (glow4, {time = 4000, rotation = g4,alpha = math.random (0.5,1),transition = easing.inOutQuad})
	end
	--transition.to(glow1, {time=3000, y=460, })
	tnt:newTransition (glow4, {time = 6000, rotation = g4+30, transition = easing.inOutQuad, alpha = math.random (0.5,1),onEnd = glow4Return })
end
glow4Move()
local glow4Timer = tnt:newTimer (8000, glow4Move,0)

local glow5 = display.newImage("images/glow.png")
glow5:setReferencePoint(display.CenterLeftReferencePoint)
glow5.x = 28
glow5.y = display.contentHeight - 260
local g5=340
glow5.rotation = g5
glow5.alpha = 0.6
glow5.blendMode = "screen"
gameGroup:insert(glow5)
local glow5Move = function ()
	local glow5Return = function ()
		tnt:newTransition (glow5 {time = 9000, rotation = g5,alpha = math.random (0.8,1),transition = easing.inOutQuad})
	end
	--transition.to(glow1, {time=3000, y=460, })
	tnt:newTransition (glow5, {time = 5000, rotation = g5+30, transition = easing.inOutQuad, alpha = math.random (0.5,1),onEnd = glow4Return })
end
glow5Move()
local glow5Timer = tnt:newTimer (12000, glow5Move,0)

local glow6 = display.newImage("images/glow.png")
glow6:setReferencePoint(display.CenterLeftReferencePoint)
glow6.x = 28
glow6.y = display.contentHeight - 260
local g6 =216
glow6.rotation = g6
glow6.alpha = 0.6
glow6.blendMode = "screen"
gameGroup:insert(glow6)
local glow6Move = function ()
	local glow6Return = function ()
		tnt:newTransition (glow6, {time = 10000, rotation = g6,alpha = math.random (0.5,1),transition = easing.inOutQuad})
	end
	--transition.to(glow1, {time=3000, y=460, })
	tnt:newTransition (glow6, {time = 11000, rotation = g6+30, transition = easing.inOutQuad, alpha = math.random (0.5,1),onEnd = glow6Return })
end
glow6Move()
local glow6Timer = tnt:newTimer (11000, glow6Move,0)

local glow7 = display.newImage("images/glow.png")
glow7:setReferencePoint(display.CenterLeftReferencePoint)
glow7.x = 28
glow7.y = display.contentHeight - 260
local g7= 252
glow7.rotation = g7
glow7.blendMode = "screen"
gameGroup:insert(glow7)
local glow7Move = function ()
	local glow7Return = function ()
		tnt:newTransition (glow7, {time = 6000, rotation = g7,alpha = math.random (0.5,1),transition = easing.inOutQuad})
	end
	--transition.to(glow1, {time=3000, y=460, })
	tnt:newTransition (glow7, {time = 8000, rotation = g7+30, transition = easing.inOutQuad, alpha = math.random (0.5,1),onEnd = glow7Return })
end
glow7Move()
local glow7Timer = tnt:newTimer (9000, glow7Move,0)

local glow8 = display.newImage("images/glow.png")
glow8:setReferencePoint(display.CenterLeftReferencePoint)
glow8.x = 28
glow8.y = display.contentHeight - 260
local g8= 288
glow8.rotation = g8
glow8.blendMode = "screen"
gameGroup:insert(glow8)
local glow8Move = function ()
	local glow8Return = function ()
		tnt:newTransition (glow8, {time = 8000, rotation = g8,alpha = math.random (0.6,1),transition = easing.inOutQuad})
	end
	--transition.to(glow1, {time=3000, y=460, })
	tnt:newTransition (glow8, {time = 10000, rotation = g8+30, transition = easing.inOutQuad, alpha = math.random (0.5,1),onEnd = glow8Return })
end
glow8Move()
local glow8Timer = tnt:newTimer (15000, glow8Move,0)

local glow9 = display.newImage("images/glow.png")
glow9:setReferencePoint(display.CenterLeftReferencePoint)
glow9.x = 28
glow9.y = display.contentHeight - 260
local g9= 324
glow9.rotation = g9
glow9.blendMode = "screen"
gameGroup:insert(glow9)
local glow9Move = function ()
	local glow9Return = function ()
		tnt:newTransition (glow9, {time = 8000, rotation = g9,alpha = math.random (0.4,1),transition = easing.inOutQuad})
	end
	--transition.to(glow1, {time=3000, y=460, })
	tnt:newTransition (glow9, {time = 7000, rotation = g9+30, transition = easing.inOutQuad, alpha = math.random (0.5,1),onEnd = glow9Return })
end
glow9Move()
local glow9Timer = tnt:newTimer (13000, glow9Move,0)

local glow10 = display.newImage("images/glow.png")
glow10:setReferencePoint(display.CenterLeftReferencePoint)
glow10.x = 28
glow10.y = display.contentHeight - 260
local g10= 0
glow10.rotation = g10
glow10.blendMode = "screen"
gameGroup:insert(glow10)
local glow10Move = function ()
	local glow10Return = function ()
		tnt:newTransition (glow10, {time = 8000, rotation = g10,alpha = math.random (0.5,1),transition = easing.inOutQuad})
	end
	--transition.to(glow1, {time=3000, y=460, })
	tnt:newTransition (glow10, {time = 8000, rotation = g10+30, transition = easing.inOutQuad, alpha = math.random (0.6,1),onEnd = glow10Return })
end
glow10Move()
local glow10Timer = tnt:newTimer (12000, glow10Move,0)

local glow11 = display.newImage("images/glow.png")
glow11:setReferencePoint(display.CenterLeftReferencePoint)
glow11.x = 28
glow11.y = display.contentHeight - 260
local g11= 13
glow11.rotation = g11
glow11.blendMode = "screen"
gameGroup:insert(glow11)
local glow11Move = function ()
	local glow11Return = function ()
		tnt:newTransition (glow11, {time = 8000, rotation = math.random(g11-20, g11+20),alpha = math.random (0.6,1),transition = easing.inOutQuad})
	end
	--transition.to(glow1, {time=3000, y=460, })
	tnt:newTransition (glow11, {time = 8000, rotation = math.random(g11-20, g11+20), transition = easing.inOutQuad, alpha = math.random (0.5,1),onEnd = glow11Return })
end
glow11Move()
local glow11Timer = tnt:newTimer (10000, glow11Move,0)

local glow12 = display.newImage("images/glow.png")
glow12:setReferencePoint(display.CenterLeftReferencePoint)
glow12.x = 28
glow12.y = display.contentHeight - 260
local g12= 40
glow12.rotation = g12
glow12.blendMode = "screen"
gameGroup:insert(glow12)
local glow12Move = function ()
	local glow12Return = function ()
		tnt:newTransition (glow12, {time = 8000, rotation = math.random(g12-20, g12+20),alpha = math.random (0.4,1),transition = easing.inOutQuad})
	end
	--transition.to(glow1, {time=3000, y=460, })
	tnt:newTransition (glow12, {time = 8000, rotation = math.random(g12-20, g12+20), transition = easing.inOutQuad, alpha = math.random (0.5,1),onEnd = glow12Return })
end
glow12Move()
local glow12Timer = tnt:newTimer (12000, glow12Move,0)

local glow13 = display.newImage("images/glow.png")
glow13:setReferencePoint(display.CenterLeftReferencePoint)
glow13.x = 28
glow13.y = display.contentHeight - 260
local g13= 60
glow13.rotation = g13
glow13.blendMode = "screen"
gameGroup:insert(glow13)
local glow13Move = function ()
	local glow13Return = function ()
		tnt:newTransition (glow13, {time = 8000, rotation = math.random(g13-20, g13+20),alpha = math.random (0.6,1),transition = easing.inOutQuad})
	end
	--transition.to(glow1, {time=3000, y=460, })
	tnt:newTransition (glow13, {time = 8000, rotation = math.random(g13-20, g13+20), transition = easing.inOutQuad, alpha = math.random (0.7,1),onEnd = glow13Return })
end
glow13Move()
local glow13Timer = tnt:newTimer (20000, glow13Move,0)
--[[
local fog = display.newImage("images/fog.png")
fog.x = display.contentCenterX - 100
fog.y = display.contentCenterY + 30

local fogGo = function()
local returnFog = function()
	tnt:newTransition(fog,{time = 3000, x = display.contentCenterX-100, onEnd = fogGo})
end
	tnt:newTransition (fog, {time = 3000, x = display.contentCenterX + 100, onEnd = returnFog})
end
--fogGo()
--tnt:newTimer(6000, fogGo, 0)]]



-------------------destroying objects that have collided----
---filter collisions---


local goHomeFunction = function()
--print("remove Runtime")
			--local data = {}
			
	data.exterminator = exterminator 
	gameType = gameType
	data.waveNo = waveNo
	data.coins = coins
	data.FAammo = FAammo
	data.RFammo = RFammo
	data.X2ammo = X2ammo
	data.SAammo = SAammo
	data.gameBirdyHits = gameBirdyHits
	data.gameArrowShots = gameArrowShots
	data.gameAccuracy = gameAccuracy
	data.accuracy = accuracy
	data.birdyHits = birdyHits
	
	if birdyHits > data.high then
		data.high = birdyHits
	end
	
	saveTable(data, "gameData.json")
			tnt:cancelAllTimers()
			tnt:cancelAllTransitions()			
			tnt:cleanTimersAndTransitions()
			goHome = false
			 tnt:cleanTimersAndTransitions()
			-- _G.gameGroup:removeSelf()
			--display.remove(fireCheckListener)
			Runtime:removeEventListener("enterFrame", fireCheck)
			fireCheckListener = nil			
			
			--[[
			display.remove(background)
			background = nil
			display.remove(banner)
			banner = nil
			display.remove(torso)
			torso = nil
		--	aimer:removeEventListener ("touch", aiming)
			display.remove(aimer)
			aimer = nil
			display.remove(pauseBtn)
			pauseBtn = nil
			display.remove(pauseBtnText)
			pauseBtnText = nil
			display.remove(birdyCountText)
			birdyCountText = nil
			display.remove(life1)
			life1 = nil
			display.remove(life2)
			life2 = nil
			display.remove(life3)
			life3 = nil
			display.remove(life4)
			life4 = nil
			display.remove(life5)
			life5 = nil	
			display.remove(life6)
			life6 = nil
			display.remove(life7)
			life7 = nil
			display.remove(life8)
			life8 = nil
			display.remove(life9)
			life9 = nil
			display.remove(life10)
			life10 = nil	
		--	fireArrowsSelect:removeEventListener ("touch", faSelect)
			display.remove(fireArrowsSelect)
			fireArrowsSelect = nil
			display.remove(fireArrowsSelectBG)
			fireArrowsSelectBG = nil
			display.remove(fireArrowsSelectBG2)
			fireArrowsSelectBG2 = nil
			display.remove(FAPic)
			FAPic = nil
			display.remove(FAText)
			FAText = nil
			display.remove(fireArrowsBar)
			fireArrowsBar = nil
			display.remove(rapidFireSelect)
			rapidFireSelect = nil
			display.remove(doubleArrowsSelect)
			doubleArrowsSelect = nil
			display.remove(strongArrowsSelect)
			strongArrowsSelect = nil
			]]
			--rapidFireSelect:removeEventListener ("touch", rfSelect)
			--doubleArrowsSelect:removeEventListener ("touch", daSelect)
			--strongArrowsSelect:removeEventListener ("touch", saSelect)

			checkLivesFunction = nil
			aiming = nil
			collisionFunction = nil
			pauseMenu = nil
			
			--local HUDGroup2 = HUDGroup
			--[[for i = #HUDGroup, 1, -1 do
						--local child = table.remove(HUDGroup, i)
							--if child~= nil then
								HUDGroup[i]:removeSelf()
								HUDGroup[i] = nil
							--end	
						return
					
			end]]
			
			--print ("removed")
			
			   collectgarbage()
			display.remove(gameGroup)
			--gameGroup:removeSelf()
			gameGroup = nil
			--background = nil
			--banner = nil
			--torso = nil
			--aimer = nil
		--	_G.arrowsGroup:removeSelf()
			--display.remove(arrowsGroup)
		--	_G.arrowsGroup = nil
					--	print("goHome")
			--_G.birdsGroup:removeSelf()
			--display.remove(birdsGroup)
			--_G.birdsGroup = nil
			--HUDGroup:removeSelf()
			display.remove(HUDGroup)
			HUDGroup = nil	
			--atmosGroup:removeSelf()
			display.remove(atmosGroup)
			atmosGroup = nil
			
		--	_G.localGroup:removeSelf()
			display.remove(localGroup)
			localGroup = nil
			gameIsActive = false
			--collectgarbage()
			--local homeScreenFunc = function()	
		--		director:changeScene("scripts.menu","fade")	
		if menuReturn == true then
			audio.stop()
			local menu = menu.menu
			menu(data)
		end
		--		_G.addTitleFunction()	
			--end
			--timer.performWithDelay (100, homeScreenFunc)
			-- or (goHome == true)  or (goHome == true)or (goHome == true) 
end

local destroyFunction = function()

		if (#arrowsTable >= 1) then 
			for i = #arrowsTable,1,-1 do
				
				--if _G.arrowsTable[i].obj == "arrow" then
					if arrowsTable[i].hasCollided == true then
						--if _G.objTable[i].hasCollided == false then
							----calculate arrow velocity
							vx, vy = arrowsTable[i]:getLinearVelocity()
							velocityAngle = math.atan2( vy, vx)
							velocityAngle = math.deg(velocityAngle)
							offset = 90
							arrowsTable[i].rotation = velocityAngle
							arrowsTable[i].axv, arrowsTable[i].ayv = arrowsTable[i]:getLinearVelocity()
						--end
					end
					if (arrowsTable[i].y > display.contentHeight - 70) or (arrowsTable[i].hasCollided == true) or goHome == true   then 						
						local child = table.remove(arrowsTable, i)
							if child~= nil then
								child:removeSelf()
								child = nil									
							end	
						return 
					end	
			end
		end
		
		if (#birdsTable >= 1) then 
	
			for i = #birdsTable,1,-1 do				
					if birdsTable[i].burn == true then
						--if fire == true then
			--				fireball = feathers.fireball 
			--				fireball(birdsTable[i].x, birdsTable[i].y)
						--end
					end
				--if _G.birdsTable[i].obj == "bird" then
					if (birdsTable[i].x < 50)or (birdsTable[i].y > display.contentHeight - 70)or goHome == true  then		
						--[[_G.birdsTable[i].newTransition:cancel()
						_G.birdsTable[i].newTransition = nil
						_G.birdsTable[i].birdNoiseTimer = nil]]
						if birdsTable[i].x < 51 and birdsTable[i].collided == false then
							lives = lives-1
							lifeUp = false
							checkLivesFunction()
						end
						local child = table.remove(birdsTable, i)
							if child~= nil then
								child:removeSelf()
								child = nil
							end	
						return
					end
			end
		end
					
		if (#atmosTable >= 1) then
			for i = #atmosTable, 1, -1 do
				--elseif _G.objTable[i].obj == "atmos" then
				--print ("test")
					if (atmosTable[i].x > display.contentWidth-30) or (atmosTable[i].y > display.contentHeight - 70) or goHome == true then
						local child = table.remove(atmosTable, i)
							if child~= nil then
								child:removeSelf()
								child = nil
							end	
						return
					end
			end
		end
		
		if (#objTable >= 1) then

			for i = #objTable, 1, -1 do		
			--print ("test")
				if objTable[i].x > display.contentWidth or objTable[i].x < 0 or objTable[i].y > display.contentHeight - 70 or goHome == true or objTable[i].burn == true then
					local child = table.remove(objTable, i)
					if child~= nil then
						child:removeSelf()
						child = nil
					end	
				return												
					--end
					
				end
			end
		end
		if goHome == true then
		--	_G.destroyListener = nil	
			goHomeFunction()		
		end
		
end



---------------------------------------------------------------------------------------
---------------pause game------------------------------

--local pauseMenu = pauseScreen.pauseMenu

function pauseGame (event)
	if event.phase == "ended" then
		if paused == false then
			physics.pause()
			paused = true
			tnt:pauseAllTransitions()
			tnt:pauseAllTimers()
			--pauseMenu()
			pauseFunction()
			audio.play(clickSound)
		end
	end
end
pauseBtn:addEventListener ("touch", pauseGame)


------------save data ----------------------
local json = require ("json")

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

mySaveData = loadTable ("HighScoreData.json")
local saveHighFunction = function()
		if score > mySaveData.highScore then
		mySaveData.highScore = score
		end
		saveTable(mySaveData,"highScoreData.json")
end

--------------------------------------------------------------------------------
--------clean-up runtime--------------

-----free memory used by tnt transition & timr manager
clearTransitions = function()
	tnt:cleanTimersAndTransitions()
end
timer.performWithDelay(2000, clearTransitions, 0)





launchEndWave = function(event)
	if event.phase == "ended" then
		--[[if _G.gameType == "arcade" then
			arcade()
			_G.paused = true
		end
		if _G.gameType == "campaign" then
			campaign()
			_G.paused = true
		end]]
		--endWaveTimer = tnt:newTimer (2000, endWave)
	--	local endWave = endWaveScreen.endWave
		--endWave()
	--print("test")
			display.remove(background)
			background = nil
			display.remove(banner)
			banner = nil
			display.remove(torso)
			torso = nil
		--	aimer:removeEventListener ("touch", aiming)
			display.remove(aimer)
			aimer = nil
			display.remove(pauseBtn)
			pauseBtn = nil
			display.remove(pauseBtnText)
			pauseBtnText = nil
			display.remove(birdyCountText)
			birdyCountText = nil
				life1 = nil
			display.remove(life2)
			life2 = nil
			display.remove(life3)
			life3 = nil
			display.remove(life4)
			life4 = nil
			display.remove(life5)
			life5 = nil	
			display.remove(life6)
			life6 = nil
			display.remove(life7)
			life7 = nil
			display.remove(life8)
			life8 = nil
			display.remove(life9)
			life9 = nil
			display.remove(life10)
			life10 = nil	
			display.remove(fireArrowsSelect)
			fireArrowsSelect = nil
			display.remove(fireArrowsSelectBG)
			fireArrowsSelectBG = nil
			display.remove(fireArrowsSelectBG2)
			fireArrowsSelectBG2 = nil
			display.remove(FAPic)
			FAPic = nil
			display.remove(_G.FAText)
			_G.FAText = nil
			display.remove(fireArrowsBar)
			fireArrowsBar = nil
			display.remove(rapidFireSelect)
			rapidFireSelect = nil
			display.remove(doubleArrowsSelect)
			doubleArrowsSelect = nil
			display.remove(strongArrowsSelect)
			strongArrowsSelect = nil
			localGroup:removeSelf()
			localGroup = nil
			pauseMenu = nil
			isAiming  = nil
			canFire = nil
			canReload = nil
			reloadTime = nil
			bird = nil
			fire = nil
			updateGOCount = nil
			powerUpTime = nil
			gameIsActive = nil
			paused = nil
			pauseMenuOn = nil
			torsoSequenceData = nil
			torso = nil
			campaign = nil
			arcade = nil
			lives = nil
			lifeUp = nil
			game = nil
			gameOver = nil
			checkLivesFunction = nil
			destroyFunction = nil
			goHomeFunction = nil
			launchEndWave = nil
			collectgarbage()
	end
end

local endWaveFunc = function(event)
	if event.phase == "ended" then
		local endWaveScreen = require("scripts.endWaveScreen")
		local endWave = endWaveScreen.endWave
		paused = true
		if gameType == "arcade" then
			data.arcadeEx = arcadeEx
			data.arcadeDragon = arcadeDragon
			data.arcadeRain = arcadeRain
			data.arcadeDouble = arcadeDouble
			data.arcadeRocket = arcadeRocket
		end
		data.accuracy = accuracy
		data.birdyHits = birdyHits
		data.coins = coins
		data.birdyHits = birdyHits
		data.arrowShots = arrowShots
		data.accuracy = accuracy	
		data.lives = lives
		data.coins = coins
		data.waveNo = waveNo
		data.FAammo = FAammo
		data.RFammo = RFammo
		data.X2ammo = X2ammo
		data.SAammo = SAammo
		data.gameType = gameType
		goHome = true
		endWave(data)
	end
end

--[[local testButton = display.newRect (440, 285, 30, 30)
testButton:setReferencePoint (display.CenterLeftReferencePoint)
HUDGroup:insert(testButton)
--local testAd = display.newRect (0, display.contentHeight - 66, 1024,66)
local endWaveScreen = require("scripts.endWaveScreen")
local endWave = endWaveScreen.endWave
testButton:addEventListener ("touch", endWaveFunc)]]

--------Runtime listeners---------
--if	_G.initialised == false then
	Runtime:addEventListener("enterFrame", destroyFunction)
	Runtime:addEventListener("enterFrame",arrowPath)

--	_G.initialised = true
--end
	local fireCheckListener = Runtime:addEventListener("enterFrame", fireCheck)
--local tableNumbers = function()
--	print(#objTable)
---end
--Runtime:addEventListener("enterFrame", tableNumbers)

return localGroup
end

m.game = game

return m
