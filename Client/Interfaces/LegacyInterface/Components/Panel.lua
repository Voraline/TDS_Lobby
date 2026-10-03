-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Components.Panel
-- Decompile time: 0.27 ms

local Fusion = require(game.ReplicatedStorage.Shared.UI.Fusion)
local Elements = require(script.Parent.Elements)
local Hydrate = Fusion.Hydrate
local Panel = Elements.Panel
return function(a1) -- Line: 7 -- upvalues: Panel (val), Hydrate (val)
    return Hydrate((Panel:Clone()))(a1)
end