-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.LobbyModifierSelector.SelectedModifiers
-- Decompile time: 2.57 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local useMediaQuery = require(ReplicatedStorage.Client.Interfaces.Hooks.useMediaQuery)
local useTransparencyModifier = require(ReplicatedStorage.Client.Interfaces.Hooks.useTransparencyModifier)
local memo = React.memo
local createElement = React.createElement
return memo(function(a1) -- Line: 18
    -- upvalues: ReactFlow (val), useTransparencyModifier (val), React (val), useMediaQuery (val), createElement (val)
    -- upvalues: table (val)
    local v1, u5 = ReactFlow.useSpring({target = 0, start = 0, damper = 0.7, speed = 12})
    local v2, u10 = ReactFlow.useSpring({target = 1, start = 1, damper = 0.8, speed = 13})
    local v3, u15 = ReactFlow.useSpring({target = 1, start = 1, damper = 0.8, speed = 7})
    local v4 = useTransparencyModifier(v3)
    local useEffect = React.useEffect
    local v5 = {a1.visible}
    useEffect(function() -- Line: 42 -- upvalues: a1 (val), u5 (val), u15 (val), u10 (val)
        if a1.visible then
            u5({target = 1})
            u15({target = 0})
            u10({target = -1})
            return
        end
        u5({target = 0})
        u15({target = 1})
        u10({target = 1})
    end, v5)
    return createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(158, 158, 158),
        Position = v2:map(function(a1) -- Line: 60
            return UDim2.fromScale(0.5, 0.64 + a1 + 1)
        end),
        Size = UDim2.fromScale(0.956381, 0.257594),
        BackgroundTransparency = v4(0),
    }, {
        uICorner = React.createElement("UICorner", {CornerRadius = UDim.new(0.02, 0)}),
        uIScale = React.createElement("UIScale", {Scale = v1}),
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
            Position = UDim2.fromScale(0.00349683, 0.209858),
            ScrollBarImageColor3 = Color3.fromRGB(90, 90, 90),
            Size = UDim2.fromScale(0.977096, 0.752871),
            VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left,
            CanvasSize = UDim2.new(),
        }, {
            uIPadding = React.createElement("UIPadding", {PaddingLeft = UDim.new(0, 12)}),
            icons = createElement(React.Fragment, nil, a1.modifiers),
            uIGridLayout = React.createElement("UIGridLayout", {
                CellPadding = UDim2.fromOffset(12, 12),
                CellSize = not useMediaQuery("large") and UDim2.fromOffset(40, 40) or UDim2.fromOffset(70, 70),
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
        }),
        uIPadding = React.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 5),
            PaddingLeft = UDim.new(0, 5),
            PaddingRight = UDim.new(0, 5),
            PaddingTop = UDim.new(0, 5),
        }),
        uIGradient = React.createElement("UIGradient", {
            Rotation = 90,
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0.76875),
                NumberSequenceKeypoint.new(0.275498, 0.86875),
                NumberSequenceKeypoint.new(0.499414, 0.75625),
                NumberSequenceKeypoint.new(0.780188, 0.91875),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
        }),
        title = React.createElement("TextLabel", {
            BackgroundTransparency = 1,
            RichText = true,
            TextScaled = true,
            AnchorPoint = Vector2.new(0.5, 0.5),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
            Position = UDim2.fromScale(0.516884, 0.0898614),
            Size = UDim2.fromScale(0.802365, 0.169811),
            Text = ("<b>Selected Modifiers</b> (%*/%*)"):format(table.count(a1.modifiers), a1.total),
            TextColor3 = Color3.new(1, 1, 1),
            TextTransparency = v4(0),
        }),
    })
end)