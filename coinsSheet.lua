--
-- created with TexturePacker (http://www.texturepacker.com)
--
-- $TexturePacker:SmartUpdate:967b2d504dca04c1ae60c2e9c55503ae$
--
-- local sheetInfo = require("myExportedImageSheet") -- lua file that Texture packer published
--
-- local myImageSheet = graphics.newImageSheet( "ImageSheet.png", sheetInfo:getSheet() ) -- ImageSheet.png is the image Texture packer published
--
-- local myImage1 = display.newImage( myImageSheet , sheetInfo:getFrameIndex("image_name1"))
-- local myImage2 = display.newImage( myImageSheet , sheetInfo:getFrameIndex("image_name2"))
--

local SheetInfo = {}

SheetInfo.sheet =
{
    frames = {
    
        {
            -- coin1
            x=2,
            y=98,
            width=4,
            height=22,

            sourceX = 13,
            sourceY = 4,
            sourceWidth = 30,
            sourceHeight = 30
        },
        {
            -- coin10
            x=50,
            y=26,
            width=10,
            height=22,

            sourceX = 10,
            sourceY = 4,
            sourceWidth = 30,
            sourceHeight = 30
        },
        {
            -- coin12
            x=2,
            y=74,
            width=6,
            height=22,

            sourceX = 12,
            sourceY = 4,
            sourceWidth = 30,
            sourceHeight = 30
        },
        {
            -- coin3
            x=2,
            y=50,
            width=8,
            height=22,

            sourceX = 11,
            sourceY = 4,
            sourceWidth = 30,
            sourceHeight = 30
        },
        {
            -- coin4
            x=38,
            y=26,
            width=10,
            height=22,

            sourceX = 10,
            sourceY = 4,
            sourceWidth = 30,
            sourceHeight = 30
        },
        {
            -- coin5
            x=22,
            y=26,
            width=14,
            height=22,

            sourceX = 8,
            sourceY = 4,
            sourceWidth = 30,
            sourceHeight = 30
        },
        {
            -- coin6
            x=2,
            y=26,
            width=18,
            height=22,

            sourceX = 6,
            sourceY = 4,
            sourceWidth = 30,
            sourceHeight = 30
        },
        {
            -- coin7
            x=2,
            y=2,
            width=24,
            height=22,

            sourceX = 3,
            sourceY = 4,
            sourceWidth = 30,
            sourceHeight = 30
        },
        {
            -- coin8
            x=28,
            y=2,
            width=18,
            height=22,

            sourceX = 6,
            sourceY = 4,
            sourceWidth = 30,
            sourceHeight = 30
        },
        {
            -- coin9
            x=48,
            y=2,
            width=14,
            height=22,

            sourceX = 8,
            sourceY = 4,
            sourceWidth = 30,
            sourceHeight = 30
        },
    },
    
    sheetContentWidth = 64,
    sheetContentHeight = 128
}

SheetInfo.frameIndex =
{

    ["coin1"] = 1,
    ["coin10"] = 2,
    ["coin12"] = 3,
    ["coin3"] = 4,
    ["coin4"] = 5,
    ["coin5"] = 6,
    ["coin6"] = 7,
    ["coin7"] = 8,
    ["coin8"] = 9,
    ["coin9"] = 10,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
