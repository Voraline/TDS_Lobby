-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-util@3.10.0.jest-util.getFileSystemService
-- Decompile time: 0.36 ms

local Error = (require((script.Parent.Parent:WaitForChild("luau-polyfill")))).Error
local getDataModelService = require(script.Parent.Parent:WaitForChild("jest-roblox-shared")).getDataModelService
return function() -- Line: 23 -- upvalues: getDataModelService (val), Error (val)
    local success, result = pcall(function() -- Line: 24 -- upvalues: getDataModelService (upval)
        return _G.__MOCK_FILE_SYSTEM__ or getDataModelService("FileSystemService")
    end)
    if not success then
        error(Error.new("Attempting to save snapshots in an environment where FileSystemService is inaccessible."))
    end
    return result
end