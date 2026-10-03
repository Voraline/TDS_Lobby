-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.Components.InformationButton
-- Decompile time: 2.73 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Interfaces = ReplicatedStorage.Client.Interfaces
local Shared = ReplicatedStorage.Shared
local Packages = ReplicatedStorage.Packages
local BaseComponents = script.Parent.Parent.BaseComponents
local Hooks = Interfaces.Hooks
local React = require(Shared.UI.React)
local ReactFlow = require(Packages.ReactFlow)
local useTransparencyModifier = require(ReplicatedStorage.Client.Interfaces.Hooks.useTransparencyModifier)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 23 -- upvalues: useTransparencyModifier (val), ReactFlow (val), React (val), createElement (val)
    local v1 = useTransparencyModifier(a1.Transparency)
    local v2, u8 = ReactFlow.useSpring({start = 1, target = 1, damper = 0.7, speed = 55})
    local v3, u13 = ReactFlow.useSpring({start = 0, target = 0, damper = 0.6, speed = 34})
    local v4, u18 = ReactFlow.useSpring({start = 0, target = 0, damper = 0.7, speed = 8})
    local v5, u23 = ReactFlow.useSpring({start = 0, target = 0, damper = 0.5, speed = 15})
    local useEffect = React.useEffect
    local v6 = {a1.Visible}
    useEffect(function() -- Line: 54 -- upvalues: a1 (val), u8 (val), u18 (val), u23 (val)
        if not a1.Visible then
            return
        end
        u8({start = 0, target = 1})
        u18({start = -720, target = 0})
        u23({start = -520, target = 0})
    end, v6)
    v6 = {
        ZIndex = 9999,
        Size = UDim2.fromScale(0.15, 0.15),
        Position = v5:map(function(a1_2) -- Line: 75 -- upvalues: a1 (val)
            local Position = a1.Position or UDim2.fromScale(0.5, 0.5)
            return Position + UDim2.fromScale(0, -a1_2 / 1200)
        end),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = v3:map(function(a1) -- Line: 79
            return (Color3.fromRGB(37, 94, 128)):Lerp(Color3.new(0, 0, 0), a1)
        end),
        BackgroundTransparency = v1(0),
        Rotation = v4,
    }
    local v7 = {
        InformationLabel = createElement("TextLabel", {
            Text = "?",
            TextScaled = true,
            TextWrapped = true,
            BackgroundTransparency = 1,
            FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Size = UDim2.fromScale(1, 1),
            TextTransparency = v1(0),
        }, {
            uIStroke = React.createElement("UIStroke", {Thickness = 3, Transparency = v1(0.72)}),
        }),
    }
    local v8 = createElement
    local v9 = {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Text = ""}

    v9[React.Event.MouseEnter] = function() -- Line: 110 -- upvalues: u8 (val), u13 (val)
        u8({target = 1.15})
        u13({target = 0.3})
    end

    v9[React.Event.MouseLeave] = function() -- Line: 114 -- upvalues: u8 (val), u13 (val)
        u8({target = 1})
        u13({target = 0})
    end

    v9[React.Event.MouseButton1Down] = function() -- Line: 119 -- upvalues: u8 (val), u13 (val)
        u8({target = 0.8})
        u13({target = 0.5})
    end

    v9[React.Event.MouseButton1Up] = function() -- Line: 124 -- upvalues: u8 (val), u13 (val), a1 (val)
        u8({target = 1.15})
        u13({target = 0.3})
        if a1.OnToggle then
            a1.OnToggle()
        end
    end

    v7.Button = v8("TextButton", v9)
    v9 = {Thickness = 3}
    local Color = a1.Color or Color3.fromRGB(65, 179, 255)
    v9.Color = Color
    v9.Transparency = v1(0)
    v7.UIStroke = createElement("UIStroke", v9)
    v7.UIScale = createElement("UIScale", {Scale = v2})
    v7.UICorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)})
    v7.AspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 1})
    return createElement("Frame", v6, v7)
end)