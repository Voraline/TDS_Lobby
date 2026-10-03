-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-roblox-shared@3.10.0.jest-roblox-shared.nodeUtils
-- Decompile time: 0.47 ms

local Writeable = require(script.Parent:WaitForChild("Writeable")).Writeable
local v1 = {stdout = Writeable.new(), stderr = Writeable.new()}
local HttpService = game:GetService("HttpService")
local v2 = {
    stringify = function(a1, ...) -- Line: 31 -- upvalues: HttpService (val)
        if 0 < (select("#", ...)) then
            warn("JSON.stringify doesn't currently support more than 1 argument. All additional arguments will be ignored.")
        end
        return HttpService:JSONEncode(a1)
    end,
    parse = function(a1, ...) -- Line: 39 -- upvalues: HttpService (val) -- types: a1: string
        if 0 < (select("#", ...)) then
            warn("JSON.parse doesn't currently support more than 1 argument. All additional arguments will be ignored.")
        end
        return HttpService:JSONDecode(a1)
    end,
}
return {
    process = v1,
    exit = function(a1) -- Line: 24 -- types: a1: number
        error(("Exited with code: %d"):format(a1))
    end,
    JSON = v2,
}