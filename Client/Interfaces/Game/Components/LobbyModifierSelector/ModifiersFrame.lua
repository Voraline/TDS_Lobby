-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.LobbyModifierSelector.ModifiersFrame
-- Decompile time: 1.90 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ModifierButton = require(script.Parent.ModifierButton)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local useMediaQuery = require(ReplicatedStorage.Client.Interfaces.Hooks.useMediaQuery)
local useTransparencyModifier = require(ReplicatedStorage.Client.Interfaces.Hooks.useTransparencyModifier)
local memo = React.memo
local createElement = React.createElement
return memo(function(a1) -- Line: 18
    -- upvalues: ReactFlow (val), useMediaQuery (val), useTransparencyModifier (val), React (val), createElement (val)
    -- upvalues: ModifierButton (val)
    local v1, u5 = ReactFlow.useSpring({target = 0, start = 0, damper = 0.7, speed = 14})
    local v2, u10 = ReactFlow.useSpring({target = 1, start = 1, damper = 0.8, speed = 7})
    local v3 = not useMediaQuery("large") and UDim2.fromOffset(60, 60) or UDim2.fromOffset(100, 100)
    local v4 = useTransparencyModifier(v2)
    local useEffect = React.useEffect
    local v5 = {a1.visible}
    useEffect(function() -- Line: 38 -- upvalues: a1 (val), u5 (val), u10 (val)
        if a1.visible then
            u5({target = 1})
            u10({target = 0})
            return
        end
        u5({target = 0})
        u10({target = 1})
    end, v5)
    local v6 = {}
    for i, j in a1.modifiers do
        v6[j.name] = (createElement(ModifierButton, j))
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0.164034),
        Size = UDim2.fromScale(0.956381, 0.456865),
    }, {
        UIScale = createElement("UIScale", {Scale = v1}),
        uICorner = React.createElement("UICorner", {CornerRadius = UDim.new(0.02, 0)}),
        uIStroke = React.createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(53, 53, 53), Transparency = v4(0)}),
        scrollingFrame = React.createElement("ScrollingFrame", {
            Active = true,
            BackgroundTransparency = 1,
            BottomImage = "rbxassetid://3062505976",
            MidImage = "rbxassetid://3062506202",
            ScrollBarThickness = 10,
            TopImage = "rbxassetid://3062506445",
            ZIndex = 4,
            BorderSizePixel = 0,
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            ScrollBarImageColor3 = Color3.fromRGB(90, 90, 90),
            Size = UDim2.fromScale(0.983108, 0.973404),
            VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left,
            ref = a1.holderRef,
            CanvasSize = UDim2.new(),
        }, {
            uIGridLayout = React.createElement("UIGridLayout", {
                CellPadding = UDim2.fromOffset(12, 12),
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                CellSize = v3,
            }),
            frames = createElement(React.Fragment, nil, v6),
        }),
        uIPadding = React.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 5),
            PaddingLeft = UDim.new(0, 5),
            PaddingRight = UDim.new(0, 5),
            PaddingTop = UDim.new(0, 5),
        }),
    })
end)