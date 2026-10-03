-- Script path: ReplicatedStorage.Packages._Index.outofbears_react-flow@0.4.0.react-flow.Animations.Symbols
-- Decompile time: 0.29 ms

local function symbol(a1) -- Line: 1 -- types: a1: string
    local v1 = {}
    local v2 = {__tostring = ("Symbol(%*)"):format(a1)}
    setmetatable(v1, v2)
    return v1
end

local v1 = {}
setmetatable(v1, {__tostring = "Symbol(Spring)"})
local v2 = {}
setmetatable(v2, {__tostring = "Symbol(Tween)"})
return {Spring = v1, Tween = v2, [v1] = "Spring", [v2] = "Tween"}