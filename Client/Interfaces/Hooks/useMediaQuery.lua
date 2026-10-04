-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useMediaQuery
-- Decompile time: 0.92 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local useViewportSize = require(ReplicatedStorage.Client.Interfaces.Hooks.useViewportSize)
local u11 = {
    small = 640,
    medium = 768,
    large = 1024,
    xlarge = 1280,
    xxlarge = 1536,
}
return function(a1, a2) -- Line: 13 -- upvalues: useViewportSize (val), u11 (val) -- types: a1: string, a2: boolean?
    local v1 = useViewportSize(a2)
    local u6 = u11[a1]
    assert(u6, "Invalid query: " .. a1)
    if a2 then
        return v1:map(function(a1) -- Line: 20 -- upvalues: u6 (val)
            return u6 <= a1.X
        end)
    end
    return u6 <= v1.X
end