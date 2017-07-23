--
-- created with TexturePacker (http://www.texturepacker.com)
--
-- $TexturePacker:SmartUpdate:c6eb4d3fd3dbe0362c0632e17911aa7c$
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
            -- chalkArrow
            x=75,
            y=2,
            width=44,
            height=29,

        },
        {
            -- chalkbird1
            x=75,
            y=53,
            width=40,
            height=22,

            sourceX = 7,
            sourceY = 14,
            sourceWidth = 54,
            sourceHeight = 46
        },
        {
            -- chalkbird2
            x=75,
            y=33,
            width=44,
            height=18,

            sourceX = 5,
            sourceY = 15,
            sourceWidth = 54,
            sourceHeight = 46
        },
        {
            -- chalkbird3
            x=71,
            y=77,
            width=38,
            height=24,

            sourceX = 8,
            sourceY = 9,
            sourceWidth = 54,
            sourceHeight = 46
        },
        {
            -- chalkbird4
            x=71,
            y=103,
            width=36,
            height=30,

            sourceX = 10,
            sourceY = 3,
            sourceWidth = 54,
            sourceHeight = 46
        },
        {
            -- chalkbow1
            x=2,
            y=122,
            width=61,
            height=64,

            sourceX = 20,
            sourceY = 2,
            sourceWidth = 87,
            sourceHeight = 74
        },
        {
            -- chalkbow2
            x=2,
            y=60,
            width=67,
            height=60,

            sourceX = 13,
            sourceY = 3,
            sourceWidth = 87,
            sourceHeight = 74
        },
        {
            -- chalkbow3
            x=2,
            y=2,
            width=71,
            height=56,

            sourceX = 6,
            sourceY = 7,
            sourceWidth = 87,
            sourceHeight = 74
        },
    },
    
    sheetContentWidth = 128,
    sheetContentHeight = 256
}

SheetInfo.frameIndex =
{

    ["chalkArrow"] = 1,
    ["chalkbird1"] = 2,
    ["chalkbird2"] = 3,
    ["chalkbird3"] = 4,
    ["chalkbird4"] = 5,
    ["chalkbow1"] = 6,
    ["chalkbow2"] = 7,
    ["chalkbow3"] = 8,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
