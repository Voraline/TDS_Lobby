-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.PropMarkers.Change
-- Decompile time: 0.35 ms

local u8 = require(script.Parent.Parent:WaitForChild("Type.roblox"))
local u9 = {}
local u10 = {}

function u10.__tostring(a1) -- Line: 33
    return string.format("RoactHostChangeEvent(%s)", a1.name)
end

local v1 = {
    __index = function(a1, a2) -- Line: 39 -- upvalues: u8 (val), u10 (val), u9 (val)
        local v1 = {}
        v1[u8] = u8.HostChangeEvent
        v1.name = a2
        setmetatable(v1, u10)
        u9[a2] = v1
        return v1
    end,
}
setmetatable(u9, v1)
return u9