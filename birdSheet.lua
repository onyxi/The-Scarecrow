--
-- created with TexturePacker (http://www.texturepacker.com)
--
-- $TexturePacker:SmartUpdate:a4140993622fe3136bdb04d33e0e1e9f$
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
            -- bird1
            x=2,
            y=31,
            width=43,
            height=33,

            sourceX = 4,
            sourceY = 0,
            sourceWidth = 47,
            sourceHeight = 33
        },
        {
            -- bird2
            x=47,
            y=31,
            width=43,
            height=29,

            sourceX = 4,
            sourceY = 4,
            sourceWidth = 47,
            sourceHeight = 33
        },
        {
            -- bird3
            x=47,
            y=91,
            width=43,
            height=27,

            sourceX = 4,
            sourceY = 6,
            sourceWidth = 47,
            sourceHeight = 33
        },
        {
            -- bird4
            x=2,
            y=66,
            width=43,
            height=27,

            sourceX = 4,
            sourceY = 6,
            sourceWidth = 47,
            sourceHeight = 33
        },
        {
            -- bird5
            x=47,
            y=62,
            width=43,
            height=27,

            sourceX = 4,
            sourceY = 6,
            sourceWidth = 47,
            sourceHeight = 33
        },
        {
            -- bird6
            x=51,
            y=2,
            width=45,
            height=27,

            sourceX = 2,
            sourceY = 6,
            sourceWidth = 47,
            sourceHeight = 33
        },
        {
            -- bird7
            x=2,
            y=2,
            width=47,
            height=27,

            sourceX = 0,
            sourceY = 6,
            sourceWidth = 47,
            sourceHeight = 33
        },
        {
            -- redBird1
            x=98,
            y=2,
            width=28,
            height=24,

        },
        {
            -- redBird2
            x=98,
            y=28,
            width=28,
            height=22,

            sourceX = 0,
            sourceY = 2,
            sourceWidth = 28,
            sourceHeight = 24
        },
        {
            -- redBird3
            x=90,
            y=140,
            width=28,
            height=20,

            sourceX = 0,
            sourceY = 4,
            sourceWidth = 28,
            sourceHeight = 24
        },
        {
            -- redBird4
            x=92,
            y=118,
            width=28,
            height=20,

            sourceX = 0,
            sourceY = 4,
            sourceWidth = 28,
            sourceHeight = 24
        },
        {
            -- redBird5
            x=92,
            y=96,
            width=28,
            height=20,

            sourceX = 0,
            sourceY = 4,
            sourceWidth = 28,
            sourceHeight = 24
        },
        {
            -- redBird6
            x=92,
            y=74,
            width=28,
            height=20,

            sourceX = 0,
            sourceY = 4,
            sourceWidth = 28,
            sourceHeight = 24
        },
        {
            -- redBird7
            x=92,
            y=52,
            width=28,
            height=20,

            sourceX = 0,
            sourceY = 4,
            sourceWidth = 28,
            sourceHeight = 24
        },
        {
            -- yellowBird1
            x=2,
            y=122,
            width=40,
            height=31,

            sourceX = 2,
            sourceY = 0,
            sourceWidth = 42,
            sourceHeight = 31
        },
        {
            -- yellowBird2
            x=44,
            y=147,
            width=40,
            height=29,

            sourceX = 2,
            sourceY = 2,
            sourceWidth = 42,
            sourceHeight = 31
        },
        {
            -- yellowBird3
            x=44,
            y=178,
            width=40,
            height=25,

            sourceX = 2,
            sourceY = 6,
            sourceWidth = 42,
            sourceHeight = 31
        },
        {
            -- yellowBird4
            x=2,
            y=155,
            width=40,
            height=25,

            sourceX = 2,
            sourceY = 6,
            sourceWidth = 42,
            sourceHeight = 31
        },
        {
            -- yellowBird5
            x=86,
            y=162,
            width=40,
            height=25,

            sourceX = 2,
            sourceY = 6,
            sourceWidth = 42,
            sourceHeight = 31
        },
        {
            -- yellowBird6
            x=46,
            y=120,
            width=42,
            height=25,

            sourceX = 0,
            sourceY = 6,
            sourceWidth = 42,
            sourceHeight = 31
        },
        {
            -- yellowBird7
            x=2,
            y=95,
            width=42,
            height=25,

            sourceX = 0,
            sourceY = 6,
            sourceWidth = 42,
            sourceHeight = 31
        },
    },
    
    sheetContentWidth = 128,
    sheetContentHeight = 256
}

SheetInfo.frameIndex =
{

    ["bird1"] = 1,
    ["bird2"] = 2,
    ["bird3"] = 3,
    ["bird4"] = 4,
    ["bird5"] = 5,
    ["bird6"] = 6,
    ["bird7"] = 7,
    ["redBird1"] = 8,
    ["redBird2"] = 9,
    ["redBird3"] = 10,
    ["redBird4"] = 11,
    ["redBird5"] = 12,
    ["redBird6"] = 13,
    ["redBird7"] = 14,
    ["yellowBird1"] = 15,
    ["yellowBird2"] = 16,
    ["yellowBird3"] = 17,
    ["yellowBird4"] = 18,
    ["yellowBird5"] = 19,
    ["yellowBird6"] = 20,
    ["yellowBird7"] = 21,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
