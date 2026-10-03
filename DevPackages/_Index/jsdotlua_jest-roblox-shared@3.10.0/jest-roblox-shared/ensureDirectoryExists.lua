-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-roblox-shared@3.10.0.jest-roblox-shared.ensureDirectoryExists
-- Decompile time: 0.53 ms

local Error = (require((script.Parent.Parent:WaitForChild("luau-polyfill")))).Error
local getParent = require(script.Parent:WaitForChild("getParent"))
local FileSystemService = require(script.Parent:WaitForChild("getDataModelService"))("FileSystemService")
return function(a1) -- Line: 11 -- upvalues: getParent (val), FileSystemService (val), Error (val) -- types: a1: string
    local u4 = getParent(a1, 1)
    local success, result = pcall(function() -- Line: 14 -- upvalues: FileSystemService (upval), u4 (val)
        if FileSystemService and not FileSystemService:Exists(u4) then
            FileSystemService:CreateDirectories(u4)
        end
    end)
    if not success and result:find("Error%(13%): Access Denied%. Path is outside of sandbox%.") then
        error(Error.new("Provided path is invalid: you likely need to provide a different argument to --fs.readwrite.\nYou may need to pass in `--fs.readwrite=$PWD`"))
    end
end