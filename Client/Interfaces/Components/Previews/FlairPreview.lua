-- Script path: ReplicatedStorage.Client.Interfaces.Components.Previews.FlairPreview
-- Decompile time: 2.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UI = ReplicatedStorage.Shared.UI
local Flairs = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.Flairs)
local React = require(UI.React)
local createElement = React.createElement
local useMemo = React.useMemo
local memo = React.memo
local Fragment = React.Fragment
return memo(function(a1) -- Line: 30
    -- upvalues: useMemo (val), Flairs (val), createElement (val), Fragment (val)
    local name = a1.name
    local v1 = {name}
    local v2 = useMemo(function() -- Line: 32 -- upvalues: Flairs (upval), name (val)
        return Flairs(name)
    end, v1)
    if not v2 then
        return
    end
    local v3 = {
        BackgroundTransparency = 1,
        TextScaled = true,
        Size = a1.Size,
        Position = a1.Position,
        AnchorPoint = a1.AnchorPoint,
        ZIndex = a1.ZIndex,
        Visible = a1.Visible,
        LayoutOrder = a1.LayoutOrder,
        Text = a1.name,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
    }
    local v4 = {children = createElement(Fragment, nil, a1.children)}
    local v5 = {}
    local color = v2.color or ColorSequence.new(Color3.new(1, 1, 1))
    v5.Color = color
    v5.Rotation = v2.colorRotation or 90
    v4.gradient = createElement("UIGradient", v5)
    v5 = {Thickness = 2, Color = Color3.new(1, 1, 1)}
    local v6 = {}
    local v7 = {}
    local strokeTransparency = v2.strokeTransparency or NumberSequence.new(0.5)
    v7.Transparency = strokeTransparency
    local strokeColor = v2.strokeColor or ColorSequence.new(Color3.new(0, 0, 0))
    v7.Color = strokeColor
    v7.Rotation = v2.strokeColorRotation or 90
    v6.gradient = createElement("UIGradient", v7)
    v4.stroke = createElement("UIStroke", v5, v6)
    return createElement("TextLabel", v3, v4)
end)