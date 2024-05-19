--[[
    Linux steps:
    - zip -9qr loverspades.zip src/
    - cat /path/to/lovr loverspades.zip > loverspades

    Windows steps:
    - 7z a loverspades.zip src/
    - copy /b lovr.exe+loverspades.zip loverspades.exe
]]

local process = require("@lune/process")
local fs = require("@lune/fs")

local source_path = process.cwd .. "src/"
local zip_path = process.cwd .. "loverspades.zip"

-- TODO: The fucking rest, goodluck VilotStar.