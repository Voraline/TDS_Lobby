-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Inventory.otherItemsFrame
-- Decompile time: 2.39 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Button = require(script.Parent.Button)
local React = require(ReplicatedStorage.Shared.UI.React)
local useMediaQuery = require(ReplicatedStorage.Client.Interfaces.Hooks.useMediaQuery)
require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local createElement = React.createElement
return (React.memo(function(a1) -- Line: 18
    -- upvalues: useMediaQuery (val), createElement (val), React (val), Button (val)
    local v1 = not useMediaQuery("medium")
    local v2 = {
        BackgroundTransparency = 1,
        Visible = a1.Visible,
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
    }
    local v3 = {}
    local v4 = {
        BackgroundTransparency = 0.4,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.new(),
        BorderColor3 = Color3.new(),
        Size = UDim2.fromScale(0.57, 0.907106),
    }
    local v5 = {
        uIGradient = createElement("UIGradient", {
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.15, 0.25),
                NumberSequenceKeypoint.new(0.5, 0),
                NumberSequenceKeypoint.new(0.852474, 0.256831),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
        }),
        children = createElement(React.Fragment, nil, a1.children),
    }
    v5.disclaimer = createElement("TextLabel", {
        BackgroundTransparency = 1,
        Text = "Open and receive one of the following",
        TextScaled = true,
        AnchorPoint = Vector2.new(0.5, 0),
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0.5, 0.0220481),
        Size = UDim2.fromScale(0.81, 0.0527991),
        TextColor3 = Color3.new(1, 1, 1),
        TextYAlignment = Enum.TextYAlignment.Top,
    }, {
        uIStroke = createElement("UIStroke", {Thickness = 2}),
        frame = createElement("Frame", {
            BackgroundTransparency = 0.5,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.new(1, 1, 1),
            BorderColor3 = Color3.new(),
            Position = UDim2.fromScale(0.5, 1.1),
            Size = UDim2.fromScale(1, 0.08),
        }),
    })
    v5.uIStroke = createElement("UIStroke", {Thickness = 4, ApplyStrokeMode = Enum.ApplyStrokeMode.Border}, {
        uIGradient = createElement("UIGradient", {
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.15, 0.25),
                NumberSequenceKeypoint.new(0.5, 0),
                NumberSequenceKeypoint.new(0.75, 0.25),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
        }),
    })
    local v6 = {BackgroundTransparency = 1, ZIndex = 999, AnchorPoint = Vector2.new(0.5, 1)}
    local v7 = v1 and UDim2.fromScale(0.5, 1) or UDim2.fromScale(0.5, 1.1)
    v6.Position = v7
    v7 = v1 and UDim2.fromOffset(50, 70) or UDim2.fromScale(0.5, 0.08)
    v6.Size = v7
    v5.buttons = createElement("Frame", v6, {
        uIListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            Padding = UDim.new(0.05, 0),
            SortOrder = Enum.SortOrder.LayoutOrder,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        returnButton = createElement(Button, {
            textSize = 30,
            text = "Return",
            padding = {left = UDim.new(0, 60), right = UDim.new(0, 60)},
            color = Color3.fromRGB(169, 169, 169),
            onClick = function() -- Line: 116 -- upvalues: a1 (val)
                a1.onReturn()
            end,
        }),
    })
    v3.holder = createElement("Frame", v4, v5)
    return createElement("Frame", v2, v3)
end))