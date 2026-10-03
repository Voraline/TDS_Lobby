-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.NewNavbar
-- Decompile time: 1.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local memo = React.memo
local createElement = React.createElement
return memo(function(a1) -- Line: 7 -- upvalues: createElement (val)
    local v1 = {
        BackgroundTransparency = 1,
        ZIndex = 2,
        AnchorPoint = Vector2.new(0.5, 1),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
    }
    local Position = a1.Position or UDim2.fromScale(0.5, -0.0115)
    v1.Position = Position
    v1.Size = UDim2.fromScale(0, 0.1)
    return createElement("Frame", v1, {
        buttons = createElement("Frame", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0, 0.5),
            AutomaticSize = Enum.AutomaticSize.X,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            Position = UDim2.fromScale(0, 0.5),
            Size = UDim2.fromScale(0, 1),
        }, {
            uIListLayout = createElement("UIListLayout", {
                Padding = UDim.new(0, 12),
                SortOrder = Enum.SortOrder.LayoutOrder,
                FillDirection = Enum.FillDirection.Horizontal,
                ItemLineAlignment = Enum.ItemLineAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
            }),
            uIPadding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 12), PaddingRight = UDim.new(0, 12)}),
        }, a1.children),
        dropShadow = createElement("ImageLabel", {
            Image = "http://www.roblox.com/asset/?id=9239716855",
            ImageTransparency = 0.2,
            BackgroundTransparency = 1,
            ZIndex = -1,
            ScaleType = Enum.ScaleType.Slice,
            SliceCenter = Rect.new(14, 14, 64, 24),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(1, 16, 1, 16),
        }),
        background = createElement("Frame", {
            BackgroundTransparency = 0.4,
            ZIndex = 0,
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            Size = UDim2.fromScale(1, 1),
        }, {uICorner = createElement("UICorner", {CornerRadius = UDim.new(0.12, 0)})}),
        uISizeConstraint = createElement("UISizeConstraint", {MaxSize = Vector2.new((1 / 0), 65)}),
    })
end)