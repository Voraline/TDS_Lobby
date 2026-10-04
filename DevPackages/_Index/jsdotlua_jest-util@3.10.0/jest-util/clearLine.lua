-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-util@3.10.0.jest-util.clearLine
-- Decompile time: 0.60 ms

local Boolean = (require((script.Parent.Parent:WaitForChild("luau-polyfill")))).Boolean
require(script.Parent.Parent:WaitForChild("jest-roblox-shared"))
return {
    default = function(a1) -- Line: 16 -- upvalues: Boolean (val)
        if Boolean.toJSBoolean(a1.isTTY) then
            a1:write("\027[999D\027[K")
        end
    end,
}