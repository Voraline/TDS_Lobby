-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.TabButton
-- Decompile time: 2.35 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local memo = React.memo
local createElement = React.createElement
local useSpring = ReactFlow.useSpring
return memo(function(a1) -- Line: 9 -- upvalues: useSpring (val), createElement (val), React (val) -- types: a1: table
    local v1, u4 = useSpring({target = 0, start = 0, damper = 0.8, speed = 40})
    local v2 = a1.icon or 6053788679
    local v3 = a1.selectable or false
    local v4 = {
        Text = "",
        TextScaled = true,
        TextWrapped = true,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        LayoutOrder = a1.layoutOrder,
        Position = UDim2.fromScale(0.0338, 0.5),
        Selectable = v3,
        Size = UDim2.fromScale(0.7, 0.7),
    }

    v4[React.Event.MouseEnter] = function() -- Line: 39 -- upvalues: u4 (val)
        u4({target = 1})
    end

    v4[React.Event.MouseLeave] = function() -- Line: 44 -- upvalues: u4 (val)
        u4({target = 0})
    end

    v4[React.Event.MouseButton1Down] = function() -- Line: 50 -- upvalues: u4 (val)
        u4({target = -1})
    end

    v4[React.Event.MouseButton1Up] = function() -- Line: 56 -- upvalues: a1 (val), u4 (val)
        if a1.clicked then
            a1.clicked()
        end
        u4({target = 1})
    end

    local v5 = {}
    local v6 = {
        BackgroundTransparency = 0.2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = v1:map(function(a1) -- Line: 67
            return (Color3.fromRGB(38, 38, 38)):Lerp(Color3.new(), a1 * 0.2)
        end),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }
    local v7 = {
        uIScale = createElement("UIScale", {
            Scale = v1:map(function(a1) -- Line: 76
                return 1 + a1 * 0.06
            end),
        }),
    }
    v7.uICorner = createElement("UICorner", {CornerRadius = UDim.new(0.15, 0)})
    local v8 = {Thickness = 2, ApplyStrokeMode = Enum.ApplyStrokeMode.Border}
    local v9 = a1.selected and Color3.new(1, 1, 1) or Color3.fromRGB(117, 117, 117)
    v8.Color = v9
    v7.uIStroke = createElement("UIStroke", v8)
    v7.title = createElement("TextLabel", {
        TextScaled = true,
        TextSize = 20,
        TextWrapped = true,
        BackgroundTransparency = 1,
        ZIndex = 2,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Text = a1.title,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        Position = UDim2.fromScale(0.5, 0.95),
        Size = UDim2.fromScale(0.8, 0.5),
    }, {
        uIStroke1 = createElement("UIStroke", {Thickness = 2, Transparency = 0.5, LineJoinMode = Enum.LineJoinMode.Miter}),
        uITextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 20}),
    })
    v7.icon = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = not (typeof(v2) ~= "number") and ("rbxassetid://%*"):format(v2) or v2,
        ScaleType = Enum.ScaleType.Fit,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        Position = v1:map(function(a1) -- Line: 128
            return UDim2.fromScale(0.5, 0.4 - a1 * 0.1)
        end),
        Size = UDim2.fromScale(0.519, 1.45),
    }, {uIAspectRatioConstraint = createElement("UIAspectRatioConstraint")})
    v5.content = createElement("Frame", v6, v7)
    v5.uITextSizeConstraint1 = createElement("UITextSizeConstraint", {MaxTextSize = 8})
    v5.uIAspectRatioConstraint1 = createElement("UIAspectRatioConstraint", {AspectRatio = 3.11, DominantAxis = Enum.DominantAxis.Height})
    return createElement("TextButton", v4, v5)
end)