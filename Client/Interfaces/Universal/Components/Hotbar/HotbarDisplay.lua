-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Hotbar.HotbarDisplay
-- Decompile time: 1.97 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CircularProgressBar = require(ReplicatedStorage.Client.Interfaces.Universal.Components.CircularProgressBar)
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local createElement = React.createElement
return function(a1) -- Line: 21 -- upvalues: createElement (val), CircularProgressBar (val) -- types: a1: table
    local v1 = a1.Alpha ~= nil
    local v2 = {
        AnchorPoint = Vector2.new(0, 0.5),
        AutomaticSize = Enum.AutomaticSize.X,
        Size = UDim2.fromOffset(0, 24),
        BackgroundColor3 = a1.Color,
        LayoutOrder = a1.LayoutOrder,
    }
    local v3 = {
        gradient = createElement("UIGradient", {
            Rotation = 0,
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.25, 0.18),
                NumberSequenceKeypoint.new(0.5, 0.7),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
        }),
        corner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
    }
    local v4 = {BackgroundTransparency = 1}
    local v5 = if not v1 then UDim2.fromOffset(40, 40) else UDim2.fromOffset(20, 20)
    v4.Size = v5
    v4.Position = UDim2.new(0, 10, 0.5, 0)
    v4.AnchorPoint = Vector2.new(0.5, 0.5)
    v4.Image = a1.Icon
    v4.ScaleType = Enum.ScaleType.Fit
    local Color = if not a1.UseIconColor then Color3.new(1, 1, 1) else a1.Color
    v4.ImageColor3 = Color
    v3.icon = createElement("ImageLabel", v4)
    v3.alpha = if not v1 then nil else createElement("Frame", {
        BackgroundTransparency = 0.4,
        BorderSizePixel = 0,
        ZIndex = -1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.new(),
        Position = UDim2.new(0, 10, 0.5, 0),
        Size = UDim2.fromOffset(28, 28),
    }, {
        corner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
        stroke = createElement("UIStroke", {Thickness = 3}),
        progress = CircularProgressBar({Alpha = a1.Alpha}),
    })
    v3.amount = createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextSize = 18,
        Size = UDim2.new(1, 0, 0, 24),
        AutomaticSize = Enum.AutomaticSize.X,
        Position = UDim2.fromScale(0, 0.5),
        AnchorPoint = Vector2.new(0, 0.5),
        Text = a1.Value,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Font = Enum.Font.SourceSansBold,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, {
        padding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 40), PaddingRight = UDim.new(0, 10)}),
        stroke = createElement("UIStroke", {
            Thickness = 2,
            Color = Color3.fromRGB(34, 34, 34),
            LineJoinMode = Enum.LineJoinMode.Round,
        }),
    })
    return createElement("Frame", v2, v3)
end