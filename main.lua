display.setStatusBar (display.HiddenStatusBar)
--> Hides the status bar

--[[local sysFonts = native.getFontNames()
for k,v in pairs(sysFonts) do print(v) end
]]
local mainGroup = display.newGroup()
--> Creates a main group

------initialize ads----------
--[[ads = require( "ads" )

local function adListener(event)
local msg = event.response
if event.isError then
-- Failed to receive an ad, we print the error message returned from the library.
print(msg)
end
end
ads.init( "iads", "com.yourcompany.yourappid", adListener )
ads.show( "banner" )]]

 ------- require scripts -------
director = require ("director")
pauseScreen = require("scripts.pauseScreen")
menu = require ("scripts.menu")
game = require ("scripts.game")
houseReady = require ("scripts.house_ready")
--getReady = require ("scripts.get_ready")
arrows = require ("scripts.arrows")
--birds = require ("scripts.birds")

--coins = require ("scripts.coins")
physics = require ("physics")
_G.tnt = require ("scripts.tnt")
about = require ("scripts.about")
more = require("scripts.more")
gameMode = require ("scripts.gameMode")
awardScreen = require("scripts.awardScreen")
howTo = require ("scripts.howToScreen")
gameOver = require ("scripts.gameOver")
sure = require ("scripts.sure")
--feathers = require ("scripts.feathers")
mainImages = require ("scripts.mainImageSheet")
imageSheet = graphics.newImageSheet( "images/mainImageSheet.png", mainImages:getSheet() ) 


--physics.setDrawMode("hybrid")

----------------------------------

------------declare global variables-------
local gameVariables = {
menuOn = false
}

local initialised = false
local gameFont = native.systemFont
--"Suplexmentary Comic NC"
_G.mySaveData = {}
mySaveData.highScore = 5
local exterminator = 1 --level
local birdNext = 0   ----until next level
local arcadeEx = 28   ---so far this level
local dragonsBreath = 6
local fireNext = 0
local arcadeDragon = 42
local doubleTrouble = 44
local x2Next = 0
local arcadeDouble = 245
local rainmaker = 95
local RFNext = 0
local arcadeRain = 150
local rocketman = 55
local FANext = 0
local arcadeRocket = 76
local waveNo = 11



--_G.doubleArrows = false


--_G.gameIsActive = true
--_G.pauseMenuOn = false
--_G.waveOver = false
--_G.lastBird = false
--_G.birdyHits = 0
--_G.arrowShots = 0
--_G.gameBirdyHits = 0
--_G.gameArrowShots = 0
_G.accuracy = 0
_G.gameAccuracy = 0
--_G.birdDying = false
_G.arrowHitting = false
_G.spawnBirds = true

_G.weaponType = 1
_G.arrowSpeed = 10
_G.currentWeapon = "arrow"
_G.score = 0
_G.GOCount = 0
_G.hitWith = nil
_G.birdHit = nil
_G.ammoFA = 3
_G.ammox2A = 3
_G.ammoRF = 3
_G.ammoSA = 3

_G.spawnInterval = 3000	
_G.markTime = os.time()
_G.newTime = os.time()

_G.arrowCollisionFilter = {categoryBits = 1, maskBits = 2}
_G.birdCollisionFilter = {categoryBits = 2, maskBits = 1}
_G.deadCollisionFilter = {categoryBits = 4, maskBits = 0}
_G.coinCollisionFilter = {categoryBits = 8, maskBits = 0}

-----load sounds------
audio.reserveChannels( 2 )
_G.clickSound = audio.loadSound ("audio/Click.wav")
_G.startSound = audio.loadSound("audio/NewGame.wav")
_G.heartSound = audio.loadSound("audio/HBeat.wav")
_G.birdSound1 = audio.loadSound ("audio/Crow1.wav")
_G.birdSound2 = audio.loadSound ("audio/Crow2.wav")
_G.arrowSound = audio.loadSound("audio/Arrow.wav")
_G.arrowHitSound = audio.loadSound("audio/Twang.wav")
_G.arrowFireSound = audio.loadSound("audio/Fire.wav")
_G.weaponSelectSound = audio.loadSound("audio/Scrape.wav")

	

--local function main()
--> Adds main function

	--mainGroup:insert(director.directorView)
	--> Adds the group from director
	
	--director:changeScene("scripts.menu","fade")
	--> Change the scene
	
	--return true
--end


local menu = menu.menu

local data2 = {
birdPerc = birdPerc,
birdGot = birdGot,
birdNext = birdNext,
firePerc = firePerc,
fireGot = fireGot,
fireNext = fireNext,
x2Perc = x2Perc,
x2Next = x2Next,
x2Got = x2Got,
RFPerc = RFPerc,
RFGot = RFGot,
RFNext = RFNext,
FAPerc = FAPerc,
FAGot = FAGot,
FANext = FANext,
exterminator = exterminator,
dragonsBreath = dragonsBreath,
dragonCount = 0,
rainmaker = rainmaker,
rainCount = 0,
doubleTrouble = doubleTrouble,
doubleCount = 0,
rocketman = rocketman,
rocketCount = 0,
waveNo = waveNo,
gameType = "arcade",
coins = 25,
FAammo = 5,
RFammo = 5,
X2ammo = 5,
SAammo = 5,
gameBirdyHits = 0,
birdyHits = birdyHits,
gameArrowShots = 0,
accuracy = accuracy,
gameAccuracy = 0,
lives = 10,
arcadeEx = arcadeEx,
arcadeDragon = arcadeDragon,
arcadeRain = arcadeRain,
arcadeDouble = arcadeDouble,
arcadeRocket = arcadeRocket
}

local data3 = {
lives = 1,
coins = 10,
waveNo = 1,
gameType = "campaign",

FAammo = 5,
RFammo = 5,
X2ammo = 5,
SAammo = 5,

gameBirdyHits = 0,
gameArrowShots = 0,
gameAccuracy = 0,
birdyHits = 0,
arrowShots = 0,
accuracy = 0,

arcadeEx = 46,
arcadeDragon = 29,
arcadeRain = 78,
arcadeDouble = 112,
arcadeRocket =  87,

exterminator = 21,
dragonsBreath = 15,
doubleTrouble = 24,
rainmaker = 30,
rocketman = 23

}

--[[
local data = {
gameType = "arcade",
score = 0,
coins = 200,
lives = 10,
waveNo = 1,
FAammo = 5,
RFammo = 5,
X2ammo = 5,
SAammo = 5,
high = 0

}
]]

local json = require("json")

local intitialized = true

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
	else
		initialized = false
	end
	return nil
end

local data = loadTable("gameData.json")

if  initialized == false  then  
   -- //There are no settings. This is first time the user launch your game
   -- //Create the default settings
   data = {
			gameType = "arcade",
			score = 0,
			coins = 0,
			lives = 10,
			waveNo = 1,
			FAammo = 5,
			RFammo = 5,
			X2ammo = 5,
			SAammo = 5,
			high = 0
		}
   -- saveTable(data, "gameData.json")
    print("Default settings created")

end

--print (data.birdGot)
menu(data)
	
	local BG = display.newRect(0,0,display.contentWidth+80, display.contentHeight)
	BG:setFillColor(0,0,0)

local titleText = display.newSprite( imageSheet , {frames={mainImages:getFrameIndex("scarecrowText")}} )
--images/scarecrowText.png")
titleText:setReferencePoint(display.CenterReferencePoint)
titleText.x = display.contentWidth/2+20
titleText.y = display.contentHeight-270
--titleText.xScale = 1.2
--titleText.yScale = 1.2

local BGFade = function ()
	local killBG = function()
		BG:removeSelf()
		BG = nil
		titleText:removeSelf()
		titleText = nil
	end
	local fadeTrans = function()
		tnt:newTransition (BG, {time = 400, alpha = 0, onEnd = killBG})
	end
	tnt:newTimer(1000, fadeTrans)
end
BGFade()
--main()
--[[local beginFunc = function()
timer.performWithDelay (2, main)
end
titleTransitionFunction = function()
	titleTransition = tnt:newTransition (titleText, {time =800, xScale = 1, yScale = 1, y = display.contentHeight-270, onEnd = beginFunc})
end]]

--timer.performWithDelay (2, titleTransitionFunction)
--> Starts our app

-- Code to have Corona display the font names found
--
local fonts = native.getFontNames()

count = 0

-- Count the number of total fonts
for i,fontname in ipairs(fonts) do
    count = count+1
end

print( "\rFont count = " .. count )

local name = "pt"     -- part of the Font name we are looking for

name = string.lower( name )

-- Display each font in the terminal console
for i, fontname in ipairs(fonts) do
    j, k = string.find( string.lower( fontname ), name )

    if( j ~= nil ) then

        print( "fontname = " .. tostring( fontname ) )
    
    end
end



--------		
--------------------memory monitor----------------------------------------
local monitorMem = function()



    collectgarbage()

    print( "MemUsage: " .. collectgarbage("count") )



    local textMem = system.getInfo( "textureMemoryUsed" ) / 1000000

    print( "TexMem:   " .. textMem )
end



--Runtime:addEventListener( "enterFrame", monitorMem )
---------------------------------------------------------------------------------