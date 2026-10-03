-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.LogBook.InfoFrame
-- Decompile time: 2.78 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local useTransparencyModifier = require(ReplicatedStorage.Client.Interfaces.Hooks.useTransparencyModifier)
local memo = React.memo
local createElement = React.createElement
local useSpring = ReactFlow.useSpring
local useEffect = React.useEffect
local useBinding = React.useBinding
local u32 = memo(function(a1) -- Line: 29 -- upvalues: createElement (val) -- types: a1: table
    return createElement("TextLabel", {
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Text = a1.text,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = a1.size,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.new(1, 0, 0, 0),
        TextTransparency = a1.transparency(0),
    })
end)
return memo(function(a1) -- Line: 52
    -- upvalues: useBinding (val), useSpring (val), useEffect (val), useTransparencyModifier (val), createElement (val)
    -- upvalues: u32 (val), React (val)
    local v1, v2, v3
    local v4, u4 = useBinding(32)
    local v5, u8 = useSpring({start = 0, target = 0, speed = 15, damper = 0.6})
    local v6 = {a1}
    useEffect(function() -- Line: 62 -- upvalues: u8 (val)
        u8({start = 1, target = 0})
    end, v6)
    local v7 = useTransparencyModifier(v5)
    local v8 = {}
    for i, j in a1.info do
        v1 = createElement
        v2 = u32
        v3 = {
            text = i .. j,
            size = a1.viewportSize:map(function(a1) -- Line: 76
                return a1.Y / 35
            end),
            transparency = v7,
        }
        v8[i] = (v1(v2, v3))
    end
    v6 = createElement
    local v9 = {
        BackgroundTransparency = 1,
        Size = v4:map(function(a1) -- Line: 84
            return UDim2.new(1, 0, 0, a1)
        end),
        AnchorPoint = Vector2.new(0.5, 0.5),
        LayoutOrder = a1.layoutOrder,
    }
    local v10 = {}
    local v11 = createElement
    v2 = {
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(54, 69, 77),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = v4:map(function(a1) -- Line: 95
            return UDim2.new(1, 0, 0, a1)
        end),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = v5:map(function(a1) -- Line: 99
            return UDim2.fromScale(0.5, a1 + 0.5)
        end),
        BackgroundTransparency = v7(0),
    }
    v3 = {
        uIScale = createElement("UIScale", {
            Scale = v5:map(function(a1) -- Line: 105
                return 0 + (1 - a1 * 0.1)
            end),
        }),
        uIStroke = createElement("UIStroke", {Thickness = 2, LineJoinMode = Enum.LineJoinMode.Miter, Transparency = v7(0.9)}),
    }
    local v12 = createElement
    local v13 = {
        Padding = UDim.new(0, 8),
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
    }

    v13[React.Change.AbsoluteContentSize] = function(a1) -- Line: 120 -- upvalues: u4 (val)
        u4((math.ceil(a1.AbsoluteContentSize.Y + 32)))
    end

    v3.uIListLayout = v12("UIListLayout", v13)
    v3.title = createElement("TextLabel", {
        TextWrapped = true,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
        Text = a1.title,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = a1.viewportSize:map(function(a1) -- Line: 133
            return a1.Y / 30
        end),
        TextXAlignment = Enum.TextXAlignment.Left,
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        TextTransparency = v7(0),
        BackgroundTransparency = v7(0.8),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.new(1, 0, 0, 0),
    }, {
        iStroke1 = createElement("UIStroke", {Thickness = 0, Color = Color3.fromRGB(16, 16, 16), Transparency = v7(0.71)}),
        uIPadding = createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 6),
            PaddingLeft = UDim.new(0, 16),
            PaddingRight = UDim.new(0, 16),
            PaddingTop = UDim.new(0, 6),
        }),
    })
    v3.list = createElement(React.Fragment, nil, v8)
    v3.uIPadding1 = createElement("UIPadding", {
        PaddingBottom = UDim.new(0, 16),
        PaddingLeft = UDim.new(0, 16),
        PaddingRight = UDim.new(0, 16),
        PaddingTop = UDim.new(0, 16),
    })
    v10.main = v11("Frame", v2, v3)
    return v6("Frame", v9, v10)
end)