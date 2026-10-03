-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Matchmaking.MatchmakingStatus
-- Decompile time: 3.35 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local createElement = React.createElement
local useEffect = React.useEffect
local useTween = ReactFlow.useTween
local u21 = Color3.fromRGB(12, 215, 70)

local function getText(a1) -- Line: 30 -- types: a1: string?
    return a1 or ""
end

return function(a1) -- Line: 34
    -- upvalues: useTween (val), useEffect (val), createElement (val), u21 (val), React (val)
    local u3 = a1.completed == true
    local v1 = a1.canClose ~= false
    local v2, u29 = useTween({
        info = TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        start = if not u3 then 1 else 1.1,
        target = if not u3 then 1 else 1.1,
    })
    local v3 = {u3}
    useEffect(function() -- Line: 44 -- upvalues: u29 (val), u3 (val)
        u29({target = if not u3 then 1 else 1.1})
    end, v3)
    v3 = {Name = "MatchStatus", BackgroundTransparency = 1, ZIndex = 1}
    local anchorPoint = a1.anchorPoint or Vector2.new(0.5, 0)
    v3.AnchorPoint = anchorPoint
    v3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    local position = a1.position or UDim2.new(0.5, 0, 0, 20)
    v3.Position = position
    local size = a1.size or UDim2.new(0, 450, 0, 90)
    v3.Size = size
    v3.SizeConstraint = Enum.SizeConstraint.RelativeXX
    v3.Visible = a1.visible ~= false
    local v4 = {
        UIScale = createElement("UIScale", {Name = "UIScale", Scale = v2}),
        Background = createElement("ImageLabel", {
            Name = "Background",
            BackgroundTransparency = 1,
            ImageTransparency = 0.5,
            ZIndex = 2,
            BackgroundColor3 = Color3.fromRGB(99, 99, 99),
            ImageColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.new(0, 4, 0, 4),
            ScaleType = Enum.ScaleType.Crop,
            Size = UDim2.new(1, -8, 1, -8),
        }, {
            Frame = createElement("Frame", {
                Name = "Frame",
                BackgroundTransparency = 0.4,
                BackgroundColor3 = Color3.new(),
                Size = UDim2.fromScale(1, 1),
            }, {
                UIStroke = createElement("UIStroke", {Name = "UIStroke", Thickness = 3, Transparency = 0.4}),
                UICorner = createElement("UICorner", {Name = "UICorner", CornerRadius = UDim.new(0, 8)}),
            }),
            UICorner = createElement("UICorner", {Name = "UICorner", CornerRadius = UDim.new(0, 8)}),
        }),
    }
    local v5 = {
        Name = "Content",
        BackgroundTransparency = 1,
        ZIndex = 3,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Size = UDim2.fromScale(1, 1),
    }
    local v6 = {
        Icon = createElement("ImageLabel", {
            Name = "Icon",
            BackgroundTransparency = 1,
            ZIndex = 2,
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Image = a1.icon or "",
            Position = UDim2.fromScale(0.03, 0.5),
            Size = UDim2.fromScale(0.7, 0.7),
            SizeConstraint = Enum.SizeConstraint.RelativeYY,
        }),
    }
    local v7 = {
        Name = "Overlay",
        BackgroundColor3 = if not u3 then Color3.new() else u21,
        BackgroundTransparency = if not u3 then 1 else 0.8,
        Size = UDim2.fromScale(1, 1),
    }
    local v8 = {}
    local v9 = {
        Name = "Time",
        BackgroundTransparency = 1,
        LayoutOrder = 1,
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Font = Enum.Font.Code,
    }
    local titlePosition = a1.titlePosition or UDim2.fromScale(0.2, 0.62)
    v9.Position = titlePosition
    v9.Size = UDim2.fromScale(1, 0.4)
    v9.Text = a1.text or ""
    local titleColor = a1.titleColor or u21
    v9.TextColor3 = titleColor
    v9.TextXAlignment = Enum.TextXAlignment.Left
    v8.Time = createElement("TextLabel", v9, {UIStroke = createElement("UIStroke", {Name = "UIStroke", Thickness = 2, Transparency = 0.6})})
    v8.Title = createElement("TextLabel", {
        Name = "Title",
        BackgroundTransparency = 1,
        LayoutOrder = 1,
        TextScaled = true,
        TextSize = 28,
        TextWrapped = true,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Font = Enum.Font.SourceSansBold,
        Position = UDim2.fromScale(0.2, 0.08),
        Size = UDim2.fromScale(1, 0.4),
        Text = a1.title or "",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Left,
    }, {UIStroke = createElement("UIStroke", {Name = "UIStroke", Thickness = 2, Transparency = 0.6})})
    local v10 = createElement
    v9 = {
        Name = "Close",
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(252, 72, 24),
        BackgroundTransparency = 1,
        Position = UDim2.fromScale(0.87, 0.5),
        Size = UDim2.fromScale(0.09, 0.09),
        SizeConstraint = Enum.SizeConstraint.RelativeXX,
        Text = "",
        Visible = not u3 and v1,
    }
    v9[React.Event.Activated] = a1.onClose
    v8.Close = v10("TextButton", v9, {
        ImageLabel = createElement("ImageLabel", {
            Name = "ImageLabel",
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Image = a1.closeIcon or "rbxassetid://6031094678",
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.8, 0.8),
            SizeConstraint = Enum.SizeConstraint.RelativeXX,
        }),
    })
    v8.UICorner = createElement("UICorner", {Name = "UICorner", CornerRadius = UDim.new(0, 12)})
    v6.Overlay = createElement("Frame", v7, v8)
    v4.Content = createElement("Frame", v5, v6)
    v4.DropShadow = createElement("ImageLabel", {
        Name = "DropShadow",
        BackgroundTransparency = 1,
        Image = "rbxassetid://9239716855",
        ImageTransparency = 0.2,
        ZIndex = -1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromScale(0.5, 0.5),
        ScaleType = Enum.ScaleType.Slice,
        Size = UDim2.new(1, 7, 1, 7),
        SliceCenter = Rect.new(14, 14, 64, 24),
    })
    v4.Children = createElement(React.Fragment, {}, a1.children)
    return createElement("Frame", v3, v4)
end