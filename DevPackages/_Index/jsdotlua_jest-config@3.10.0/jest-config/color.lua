-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-config@3.10.0.jest-config.color
-- Decompile time: 0.69 ms

require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local v1 = {}
local u10 = {"red", "green", "yellow", "blue", "magenta", "cyan", "white"}

function v1.getDisplayNameColor(a1) -- Line: 39 -- upvalues: u10 (val) -- types: a1: string?
    if a1 == nil then
        return "white"
    end
    return u10[(math.random(#u10))]
end

return v1