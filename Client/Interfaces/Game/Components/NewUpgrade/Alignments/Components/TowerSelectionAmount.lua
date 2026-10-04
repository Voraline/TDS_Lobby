-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.Components.TowerSelectionAmount
-- Decompile time: 6.44 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage.Shared
local Packages = ReplicatedStorage.Packages
local Container = require(ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.BaseComponents.Container)
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.BaseComponents.ImageLabel)
local React = require(Shared.UI.React)
local ReactFlow = require(Packages.ReactFlow)
local createElement = React.createElement
local useEffect = React.useEffect
local useSpring = ReactFlow.useSpring
local u40 = React.memo(function(a1) -- Line: 25
    -- upvalues: useSpring (val), useEffect (val), createElement (val), Container (val), ImageLabel (val)
    local v1, u4 = useSpring({start = 1, speed = 15, damper = 0.8})
    local v2, u8 = useSpring({start = 0, speed = 15, damper = 0.7})
    local v3 = useEffect
    local v4 = {a1.IsUnlocked}
    v3(function() -- Line: 31 -- upvalues: a1 (val), u4 (val), u8 (val)
        if a1.IsUnlocked then
            u4({start = 0, target = 1})
            u8({force = 5})
        end
    end, v4)
    v4 = {
        Size = v2:map(function(a1_2) -- Line: 39 -- upvalues: a1 (val)
            return a1.Size + UDim2.fromScale(a1_2 / 2, a1_2 * 2.5)
        end),
        BackgroundTransparency = if not a1.IsUnlocked then 0.5 else 1,
        BackgroundColor3 = Color3.fromRGB(31, 31, 31),
        LayoutOrder = a1.LayoutOrder,
        Transparency = a1.Transparency,
    }
    local v5 = {}
    local v6 = {
        ZIndex = -1,
        Image = "rbxassetid://18610319939",
        ImageTransparency = 0.5,
        Size = UDim2.new(1, 16, 1, 16),
        ImageColor3 = Color3.fromRGB(255, 68, 68),
    }
    local IsUnlocked = a1.IsUnlocked and a1.CanAfford and a1.IsHovering
    v6.Visible = IsUnlocked
    v6.ScaleType = Enum.ScaleType.Slice
    v6.SliceCenter = Rect.new(7, 12, 54, 50)
    v6.Transparency = a1.Transparency
    v5.dropShadow = createElement(ImageLabel, v6)
    v5.fillFrame = createElement(Container, {
        ZIndex = 2,
        BackgroundColor3 = a1.BackgroundColor3,
        BackgroundTransparency = v1:map(function(a1_2) -- Line: 67 -- upvalues: a1 (val)
            if not a1.IsUnlocked then
                return 1
            end
            return 1 - a1_2
        end),
        CornerRadius = a1.CornerRadius,
        StrokeColor = not a1.IsUnlocked and Color3.fromRGB(177, 177, 177),
        StrokeThickness = not a1.IsUnlocked and 1,
        Transparency = a1.Transparency,
    })
    v5.outlineFrame = createElement(Container, {
        ZIndex = 1,
        StrokeThickness = 3,
        Size = v1:map(function(a1) -- Line: 85
            return UDim2.fromScale(a1 * 1.5, a1 * 1.85)
        end),
        CornerRadius = a1.CornerRadius + 1,
        StrokeColor = Color3.fromRGB(255, 255, 255),
        StrokeTransparency = v2:map(function(a1) -- Line: 95
            return 1 - a1 * 5
        end),
        Visible = v1:map(function(a1) -- Line: 98
            return a1 < 0.99
        end),
        Transparency = a1.Transparency,
    })
    return createElement(Container, v4, v5)
end, function(a1, a2) -- Line: 105
    local v1 = false
    if a1.IsUnlocked == a2.IsUnlocked then
        v1 = false
        if a1.CanAfford == a2.CanAfford then
            v1 = false
            if a1.IsHovering == a2.IsHovering then
                v1 = false
                if a1.Size == a2.Size then
                    v1 = false
                    if a1.LayoutOrder == a2.LayoutOrder then
                        v1 = a1.BackgroundColor3 == a2.BackgroundColor3
                    end
                end
            end
        end
    end
    return v1
end)
return React.memo(function(a1) -- Line: 114 -- upvalues: createElement (val), u40 (val), React (val)
    local Transparency, v1, v2
    local v3 = {}
    local amount = a1.amount
    for i = 1, amount do
        v2 = {
            IsHovering = true,
            CanAfford = true,
            Size = UDim2.new(1 / a1.amount, -8, 1, if a1.IsVertical then -2 else 0),
        }
        v2.CornerRadius = if a1.IsVertical then 3 else 4
        v1 = i <= a1.selected and Color3.fromRGB(255, 101, 101) or Color3.fromRGB(31, 31, 31)
        v2.BackgroundColor3 = v1
        v2.LayoutOrder = i
        v2.IsUnlocked = i <= a1.selected
        Transparency = a1.Transparency or React.useBinding(0)
        v2.Transparency = Transparency
        table.insert(v3, (createElement(u40, v2)))
    end
    local v4 = {BackgroundTransparency = 1}
    local Size = a1.Size or UDim2.fromScale(0.4, 0.2)
    v4.Size = Size
    local Position = a1.Position or UDim2.fromScale(0.5, 0.5)
    v4.Position = Position
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    v4.AnchorPoint = AnchorPoint
    return createElement("Frame", v4, {
        UILayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 10),
        }),
    }, v3)
end)