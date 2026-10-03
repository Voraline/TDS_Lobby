-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption
-- Decompile time: 1.80 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local React = require(ReplicatedStorage.Shared.UI.React)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local createElement = React.createElement
return function(a1) -- Line: 19 -- upvalues: createElement (val), TextLabel (val), ImageLabel (val) -- types: a1: table
    local v1 = {BackgroundTransparency = 1}
    local Size = a1.Size or UDim2.new(0.919, 0, 0, 0)
    v1.Size = Size
    v1.Position = a1.Position
    v1.AnchorPoint = a1.AnchorPoint
    v1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    v1.LayoutOrder = a1.LayoutOrder
    v1.AutomaticSize = Enum.AutomaticSize.Y
    local v2 = {
        uiList = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 8),
        }),
    }
    local Text = a1.Text and createElement(TextLabel, {
        TextSize = 20,
        TextWrapped = true,
        TextScaled = false,
        FontWeight = "SemiBold",
        LayoutOrder = 1,
        RichText = true,
        Size = UDim2.fromScale(1, 0),
        Text = a1.Text,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Center,
        TextYAlignment = Enum.TextYAlignment.Top,
        TextTransparency = a1.Transparency,
        AutomaticSize = Enum.AutomaticSize.Y,
    }, {
        uiPadding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 8)}),
    })
    v2.text = Text
    v2.holder = not a1.Text and createElement("Frame", {
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        LayoutOrder = 1,
        Size = UDim2.new(1, 0, 0, 1),
    })
    v2.icon = createElement(ImageLabel, {
        BackgroundTransparency = 1,
        LayoutOrder = 0,
        Size = UDim2.new(1, 0, 0, 242),
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.fromScale(1, 0.5),
        Image = "rbxassetid://" .. a1.Image,
        ImageTransparency = a1.Transparency,
        ScaleType = Enum.ScaleType.Crop,
    }, {
        uiCorner = createElement("UICorner", {CornerRadius = UDim.new(0, 8)}),
        dropShadow = createElement(ImageLabel, {
            BackgroundTransparency = 1,
            Image = "rbxassetid://9239716855",
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(1, 14, 1, 14),
            ImageTransparency = if not a1.Transparency then 0.2 else a1.Transparency:map(function(a1) -- Line: 85
                return math.map(a1, 0, 1, 0.2, 1)
            end),
            ScaleType = Enum.ScaleType.Slice,
            SliceCenter = Rect.new(14, 14, 64, 24),
        }),
    })
    v2.divider = createElement("Frame", {
        LayoutOrder = 2,
        BackgroundTransparency = if not a1.Transparency then 0.4 else a1.Transparency:map(function(a1) -- Line: 96
            return math.map(a1, 0, 1, 0.4, 1)
        end),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Size = UDim2.new(1, 0, 0, 1),
        AutomaticSize = Enum.AutomaticSize.Y,
    }, {
        gradient = createElement("UIGradient", {
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.2, 0),
                NumberSequenceKeypoint.new(0.8, 0),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
        }),
    })
    return createElement("Frame", v1, v2)
end