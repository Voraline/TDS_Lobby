-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-util@3.10.0.jest-util.createDirectory
-- Decompile time: 1.03 ms

local v1 = {}
local Error = (require((script.Parent.Parent:WaitForChild("luau-polyfill")))).Error
local getFileSystemService = require(script.Parent:WaitForChild("getFileSystemService"))
require(script.Parent.Parent:WaitForChild("jest-types"))

function v1.default(a1) -- Line: 20 -- upvalues: getFileSystemService (val), Error (val)
    local u2 = getFileSystemService()
    local success, result, v1 = pcall(function() -- Line: 23 -- upvalues: u2 (val), a1 (val)
        u2:CreateDirectories(a1)
    end)
    if not success then
        if result:find("Error%(13%): Access Denied%. Path is outside of sandbox%.") then
            error(Error.new("Provided path is invalid: you likely need to provide a different argument to --fs.readwrite.\nYou may need to pass in `--fs.readwrite=$PWD`"))
        end
        if result.code ~= "EEXIST" then
            error(result)
        end
    end
    if v1 then
        return result
    end
end

return v1