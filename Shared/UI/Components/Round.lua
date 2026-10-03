-- Script path: ReplicatedStorage.Shared.UI.Components.Round
-- Decompile time: 0.30 ms

local Computed = require(game.ReplicatedStorage.Shared.UI.Fusion).Computed
return function(a1, a2) -- Line: 4 -- upvalues: Computed (val)
    local u4 = 10 ^ (a2 or 0)
    return Computed(function() -- Line: 6 -- upvalues: a1 (val), u4 (val)
        return (math.floor((a1:get()) * u4)) / u4
    end)
end