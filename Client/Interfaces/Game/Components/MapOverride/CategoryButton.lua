-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.MapOverride.CategoryButton
-- Decompile time: 0.99 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useEffect = React.useEffect
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
return function(a1) -- Line: 9 -- upvalues: useSpring (val), useEffect (val), createElement (val), React (val)
    local v1, u11 = useSpring(if not a1.Selected then 1 else 0, 1, 20, true)
    local v2 = useEffect
    local v3 = {a1.Selected}
    v2(function() -- Line: 13 -- upvalues: u11 (val), a1 (val)
        u11(if not a1.Selected then 1 else 0)
    end, v3)
    v3 = {
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Text = a1.CatagoryName,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14,
        AutomaticSize = Enum.AutomaticSize.X,
    }
    local v4 = if not a1.Selected then Color3.fromRGB(189, 189, 189) else Color3.fromRGB(0, 170, 255)
    v3.BackgroundColor3 = v4
    v3.LayoutOrder = a1.LayoutOrder
    v3.Size = UDim2.fromScale(0, 1)
    v3[React.Event.Activated] = a1.OnClick
    return createElement("TextButton", v3, {
        corner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
        stroke = createElement("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            Color = Color3.fromRGB(255, 255, 255),
            Transparency = v1,
        }),
        padding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 8)}),
    })
end