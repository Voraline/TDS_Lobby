-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Components.NavbarButton
-- Decompile time: 0.87 ms

local Elements = require(script.Parent.Elements)
local Fusion = require(game.ReplicatedStorage.Shared.UI.Fusion)
local Hydrate = Fusion.Hydrate
local Children = Fusion.Children
local OnEvent = Fusion.OnEvent
return function(a1) -- Line: 7 -- upvalues: Elements (val), Hydrate (val), OnEvent (val), Children (val)
    local v1 = Elements.NavbarButton:Clone()
    local v2 = Hydrate(v1)
    local v3 = {
        Size = a1.Size,
        Position = a1.Position,
        AnchorPoint = a1.AnchorPoint,
        LayoutOrder = a1.LayoutOrder,
        Selectable = true,
    }
    local Activated = OnEvent("Activated")
    v3[Activated] = a1.Clicked
    local v4 = Children
    local v5 = {}
    local v6 = Hydrate(v1.Content)
    local v7 = {BackgroundColor3 = a1.Color, BackgroundTransparency = a1.Transparency}
    v7[Children] = {
        Hydrate(v1.Content.UIStroke)({Color = a1.StrokeColor}),
        Hydrate(v1.Content.Icon)({Image = a1.Icon, Position = a1.IconPosition, Size = a1.IconSize}),
        (Hydrate(v1.Content.Title)({Text = a1.Text})),
    }
    v5[1] = v6(v7)
    v3[v4] = v5
    return v2(v3)
end