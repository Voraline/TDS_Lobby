-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Inventory.RemainingAmount
-- Decompile time: 2.08 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local createElement = React.createElement
return (React.memo(function(a1) -- Line: 14 -- upvalues: useScale (val), createElement (val) -- types: a1: table
    local v1 = useScale(1, nil, true, nil, false, true)
    local v2 = {
        BackgroundTransparency = 0.4,
        ZIndex = 2,
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = Color3.new(),
    }
    local position = a1.position or UDim2.fromScale(1.21584e-07, 0.603488)
    v2.Position = position
    v2.Size = UDim2.fromOffset(0, 40)
    return createElement("Frame", v2, {
        uIScale = createElement("UIScale", {Scale = v1}),
        archetype = createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextSize = 25,
            AnchorPoint = Vector2.new(0, 0.5),
            AutomaticSize = Enum.AutomaticSize.X,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Position = UDim2.fromScale(0, 0.5),
            Size = UDim2.fromScale(0, 0.65),
            Text = ("%* Remaining"):format(a1.amount),
            TextColor3 = Color3.new(1, 1, 1),
            TextXAlignment = Enum.TextXAlignment.Left,
        }, {uIStroke = createElement("UIStroke", {Thickness = 2})}),
        uIStroke = createElement("UIStroke", {Thickness = 2, Color = Color3.new(1, 1, 1)}),
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(0.2, 0)}),
        uIPadding = createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 12),
            PaddingLeft = UDim.new(0, 12),
            PaddingRight = UDim.new(0, 12),
            PaddingTop = UDim.new(0, 12),
        }),
    })
end))