-- Script path: ReplicatedStorage.Shared.UI.Components.Scale
-- Decompile time: 0.27 ms

local Fusion = require(game.ReplicatedStorage.Shared.UI.Fusion)
local Round = require(script.Parent.Round)
local New = Fusion.New
local Value = Fusion.Value
return function(a1) -- Line: 8 -- upvalues: Round (val), Value (val), New (val)
    a1.Scale = Round(a1.Scale or Value(0), 3)
    return New("UIScale")(a1)
end