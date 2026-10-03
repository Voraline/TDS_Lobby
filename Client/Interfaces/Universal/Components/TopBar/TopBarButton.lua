-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.TopBar.TopBarButton
-- Decompile time: 2.45 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local useViewportSize = require(ReplicatedStorage.Client.Interfaces.Hooks.useViewportSize)
local createElement = React.createElement
return function(a1) -- Line: 24
    -- upvalues: useViewportSize (val), createElement (val), React (val), Sound (val), TextLabel (val)
    local v1 = useViewportSize(true):map(function(a1) -- Line: 26
        return (math.min(1, (math.min(a1.X, a1.Y)) / 1157))
    end)
    local v2 = {
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        Text = "",
        TextColor3 = Color3.fromRGB(0, 0, 0),
        TextSize = 14,
        AnchorPoint = a1.AnchorPoint,
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 0.2,
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        LayoutOrder = a1.LayoutOrder,
        Position = a1.Position,
        Size = UDim2.fromScale(0, 0.9),
        Visible = a1.Visible,
    }

    v2[React.Event.MouseButton1Click] = function() -- Line: 44 -- upvalues: Sound (upval), a1 (val)
        Sound("Click"):Play(true)
        if a1.clicked then
            a1.clicked()
        end
    end

    local v3 = {uiSizeConstraint = createElement("UISizeConstraint", {MinSize = Vector2.new(0, 36)})}
    v3.uICorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)})
    v3.uIPadding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 12), PaddingRight = UDim.new(0, 12)})
    v3.Keybind = if not a1.bind then nil else createElement("Frame", {
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        ZIndex = 3,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromOffset(0, 0),
        Size = UDim2.fromOffset(18, 18),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }, {
        corner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
        text = createElement(TextLabel, {
            TextScaled = true,
            FontWeight = "Medium",
            Visible = true,
            StrokeThickness = 1,
            Text = a1.bind:map(function(a1) -- Line: 81
                return a1 or ""
            end),
            TextColor3 = Color3.fromRGB(156, 156, 156),
            Position = UDim2.fromScale(0, 0),
            AnchorPoint = Vector2.zero,
            Size = UDim2.fromScale(1, 1),
            StrokeColor = Color3.fromRGB(156, 156, 156),
        }),
    })
    local v4 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}
    local v5 = {}
    local v6 = createElement
    local v7 = {
        Padding = UDim.new(0, 4),
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center,
    }
    v5.uIListLayout = v6("UIListLayout", v7)
    local text = a1.text and createElement("TextLabel", {
        TextSize = 17,
        BackgroundTransparency = 1,
        LayoutOrder = 1,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Text = a1.text,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        AnchorPoint = Vector2.new(0, 0.5),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        Position = UDim2.fromScale(0, 0.5),
        Size = UDim2.fromScale(0, 1),
        Visible = v1:map(function(a1) -- Line: 126
            return a1 > 0.65
        end),
    })
    v5.textLabel = text
    local icon = a1.icon
    if icon then
        v7 = {BackgroundTransparency = 1}
        local icon_4 = typeof(a1.icon) == "number" and ("rbxassetid://%*"):format(a1.icon) or a1.icon
        v7.Image = icon_4
        v7.AnchorPoint = Vector2.new(0, 0.5)
        v7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        v7.BorderColor3 = Color3.fromRGB(27, 42, 53)
        v7.Position = UDim2.fromScale(0, 0.5)
        v7.Size = UDim2.fromOffset(24, 24)
        icon = createElement("ImageLabel", v7)
    end
    v5.icon = icon
    v5.children = React.createElement(React.Fragment, {}, a1.children or {})
    v3.container = createElement("Frame", v4, v5)
    return createElement("TextButton", v2, v3)
end