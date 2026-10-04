-- Script path: ReplicatedStorage.Packages._Index.outofbears_react-flow@0.4.0.react-flow.Animations
-- Decompile time: 0.23 ms

local Symbols = require(script.Symbols)
local u4 = {}
u4.Spring = require(script.Types.Spring)
u4.Tween = require(script.Types.Tween)

function u4.fromDefinition(a1) -- Line: 8 -- upvalues: Symbols (val), u4 (val)
    return u4[Symbols[a1[1]]].new(a1[2])
end

return u4