-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Components.Timer
-- Decompile time: 0.47 ms

local Elements = require(script.Parent.Elements)
local Fusion = require(game.ReplicatedStorage.Shared.UI.Fusion)
local Hydrate = Fusion.Hydrate
local Children = Fusion.Children
local OnEvent = Fusion.OnEvent
local Computed = Fusion.Computed
local Timer = Elements.Timer
return function(a1) -- Line: 10 -- upvalues: Timer (val), Hydrate (val), Children (val)
    local v1 = Hydrate((Timer:Clone()))
    local v2 = {Size = a1.Size, Position = a1.Position, AnchorPoint = a1.AnchorPoint}
    v2[Children] = {Hydrate(a1.TextLabel)({Text = a1.text})}
    return v1(v2)
end