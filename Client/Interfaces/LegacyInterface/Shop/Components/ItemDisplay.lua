-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Components.ItemDisplay
-- Decompile time: 2.49 ms

local Fusion = require(game.ReplicatedStorage.Shared.UI.Fusion)
local New = Fusion.New
local Children = Fusion.Children
SharedComponents = script.Parent.Parent.Parent.Components
Panel = require(SharedComponents.Panel)
PanelHeader = require(SharedComponents.PanelHeader)
return function(a1) -- Line: 9 -- upvalues: Children (val), New (val)
    local v1 = Panel
    local v2 = {}
    local Size = a1.Size or UDim2.fromScale(0.443, 0.743)
    v2.Size = Size
    local Position = a1.Position or UDim2.fromScale(1, 0.254)
    v2.Position = Position
    local AnchorPoint = a1.AnchorPoint or Vector2.new(1, 0)
    v2.AnchorPoint = AnchorPoint
    v2.ZIndex = 1
    local v3 = Children
    local v4 = {}
    local v5 = PanelHeader({
        ZIndex = 2,
        TextScaled = true,
        Text = "Featured Items",
        Size = UDim2.fromScale(1.03, 0.107),
        Position = UDim2.fromScale(0.5, -0.089),
        AnchorPoint = Vector2.new(0.5, 0),
    })
    local Frame = New("Frame")
    local v6 = {
        BackgroundTransparency = 1,
        Position = UDim2.fromScale(0.5, 0.51),
        Size = UDim2.fromScale(0.944, 0.944),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    v6[Children] = {
        New("UIGridLayout")({
            CellPadding = UDim2.new(),
            CellSize = UDim2.fromScale(0.5, 0.5),
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
        a1[Children],
    }
    v4[1] = v5
    v4[2] = Frame(v6)
    v2[v3] = v4
    return v1(v2)
end