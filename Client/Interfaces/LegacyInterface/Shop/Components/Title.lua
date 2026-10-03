-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Components.Title
-- Decompile time: 1.06 ms

local Elements = require(script.Parent.Elements)
local Fusion = require(game.ReplicatedStorage.Shared.UI.Fusion)
local Hydrate = Fusion.Hydrate
local OnEvent = Fusion.OnEvent
local Children = Fusion.Children
local New = Fusion.New
local Title = Elements.Title
return function(a1) -- Line: 10 -- upvalues: Title (val), Hydrate (val), Children (val), New (val)
    local v1 = Title:Clone()
    local v2 = Hydrate(v1)
    local v3 = {
        Size = a1.Size,
        Position = a1.Position,
        AnchorPoint = a1.AnchorPoint,
        LayoutOrder = a1.LayoutOrder,
        Visible = a1.Visible,
    }
    local v4 = {}
    local v5 = New("UIListLayout")({
        Padding = UDim.new(0, 5),
        FillDirection = Enum.FillDirection.Horizontal,
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center,
    })
    local v6 = New("UIPadding")({PaddingLeft = UDim.new(0, 10), PaddingRight = UDim.new(0, 10)})
    local v7 = Hydrate(v1.TextLabel)
    local v8 = {
        Text = a1.Text,
        Font = a1.Font,
        TextSize = a1.TextSize,
        TextScaled = a1.TextScaled,
    }
    local TextXAlignment = a1.TextXAlignment or Enum.TextXAlignment.Left
    v8.TextXAlignment = TextXAlignment
    v7 = v7(v8)
    v8 = Hydrate(v1.ImageLabel)
    local v9 = {Image = a1.Icon, Size = a1.IconSize}
    v4[1] = v5
    v4[2] = v6
    v4[3] = v7
    v4[4] = v8(v9)
    v3[Children] = v4
    return v2(v3)
end