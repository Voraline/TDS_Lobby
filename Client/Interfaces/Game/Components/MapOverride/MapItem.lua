-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.MapOverride.MapItem
-- Decompile time: 2.39 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
return function(a1) -- Line: 8 -- upvalues: useSpring (val), createElement (val), React (val)
    local v1, u7 = useSpring(Vector2.yAxis, 1, 20, true)
    local v2, u17 = useSpring(UDim2.fromScale(0.5, 1.5), 1, 20, true)
    local v3, u27 = useSpring(UDim2.fromScale(1, 1), 1, 20, true)
    local v4, u37 = useSpring(UDim.new(0, 4), 1, 20, true)
    local v5 = createElement
    local v6 = {
        Image = "rbxassetid://11125481434",
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(85, 170, 255),
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Size = UDim2.fromOffset(96, 96),
        LayoutOrder = a1.LayoutOrder,
    }

    v6[React.Event.MouseEnter] = function() -- Line: 24 -- upvalues: u7 (val), u17 (val), u27 (val), u37 (val)
        u7(-Vector2.yAxis)
        u17(UDim2.fromScale(0.5, 0.5))
        u27(UDim2.new(1, 10, 1, 10))
        u37(UDim.new(0, 13))
    end

    v6[React.Event.MouseLeave] = function() -- Line: 31 -- upvalues: u7 (val), u17 (val), u27 (val), u37 (val)
        u7(Vector2.yAxis)
        u17(UDim2.fromScale(0.5, 1.5))
        u27(UDim2.fromScale(1, 1))
        u37(UDim.new(0, 4))
    end

    local v7 = {
        icon = createElement("ImageButton", {
            BorderSizePixel = 0,
            ClipsDescendants = true,
            Image = a1.Icon,
            ScaleType = Enum.ScaleType.Fit,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(85, 170, 255),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = v3,
        }, {corner = createElement("UICorner", {CornerRadius = v4})}),
        stroke = createElement("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            Color = Color3.fromRGB(255, 255, 255),
        }),
        bG = createElement("Frame", {
            BackgroundTransparency = 0.3,
            ZIndex = 3,
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            Size = UDim2.fromOffset(100, 100),
        }, {
            createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
            createElement("UIGradient", {
                Rotation = 90,
                Offset = v1,
                Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), (NumberSequenceKeypoint.new(1, 0))}),
            }),
            mapName = createElement("TextLabel", {
                TextSize = 14,
                TextWrapped = true,
                BackgroundTransparency = 1,
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                Text = a1.Title,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = v2,
                Size = UDim2.new(1, -10, 1, -10),
            }, {mapStroke = createElement("UIStroke")}),
        }),
        corner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
    }
    local v8 = createElement
    local v9 = {
        ImageTransparency = 1,
        BackgroundColor3 = Color3.fromRGB(85, 170, 255),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Size = UDim2.fromScale(1, 1),
        ZIndex = 10000000,
    }
    v9[React.Event.MouseButton1Click] = a1.OnClick
    v7.inputSink = v8("ImageButton", v9)
    v7.difficulty = createElement("TextLabel", {
        TextSize = 14,
        BorderSizePixel = 0,
        ZIndex = 2,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal),
        Text = a1.Difficulty,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Right,
        AnchorPoint = Vector2.new(1, 0),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = a1.DifficultyColor,
        Position = UDim2.new(1, -4, 0, 4),
        Size = UDim2.fromOffset(0, 16),
    }, {
        difficultyPadding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 4), PaddingRight = UDim.new(0, 4)}),
        difficultyCorner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
    })
    return v5("ImageButton", v6, v7)
end