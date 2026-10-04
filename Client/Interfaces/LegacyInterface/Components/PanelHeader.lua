-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Components.PanelHeader
-- Decompile time: 1.24 ms

local Fusion = require(game.ReplicatedStorage.Shared.UI.Fusion)
local Elements = require(script.Parent.Elements)
local Hydrate = Fusion.Hydrate
local Children = Fusion.Children
local PanelHeader = Elements.PanelHeader
return function(a1) -- Line: 8 -- upvalues: PanelHeader (val), Hydrate (val), Children (val)
    local v1 = PanelHeader:Clone()
    local v2 = Hydrate(v1)
    local v3 = {Size = a1.Size, Position = a1.Position, AnchorPoint = a1.AnchorPoint}
    v3[Children] = {
        Hydrate(v1.Title)({
            Text = a1.Text,
            TextScaled = a1.TextScaled,
            Position = a1.TextPosition,
            AnchorPoint = a1.TextAnchorPoint,
        }),
        Hydrate(v1.Owned)({Text = a1.Owned, Visible = a1.Owned ~= nil}),
        a1[Children],
    }
    return v2(v3)
end