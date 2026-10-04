-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Components.HomeButton
-- Decompile time: 1.80 ms

local Elements = require(script.Parent.Elements)
local Fusion = require(game.ReplicatedStorage.Shared.UI.Fusion)
local Hydrate = Fusion.Hydrate
local Children = Fusion.Children
local OnEvent = Fusion.OnEvent
local HomeButton = Elements.HomeButton
return function(a1) -- Line: 9 -- upvalues: HomeButton (val), Hydrate (val), Children (val), OnEvent (val)
    local v1 = HomeButton:Clone()
    local v2 = Hydrate(v1)
    local v3 = {Size = a1.Size, Position = a1.Position, AnchorPoint = a1.AnchorPoint}
    local v4 = {}
    local v5 = Hydrate(v1.Icon)({Visible = a1.Icon ~= nil, Image = a1.Icon})
    local v6 = Hydrate(v1.Detector)
    local v7 = {}
    local Activated = OnEvent("Activated")
    v7[Activated] = a1.Clicked
    v6 = v6(v7)
    v7 = Hydrate(v1.Title)
    local v8 = {ZIndex = 2, Text = a1.Text or ""}
    v4[1] = v5
    v4[2] = v6
    v4[3] = v7(v8)
    v3[Children] = v4
    return v2(v3)
end