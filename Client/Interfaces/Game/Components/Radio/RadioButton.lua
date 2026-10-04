-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Radio.RadioButton
-- Decompile time: 7.36 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useSpring = (require(ReplicatedStorage.Packages.ReactFlow)).useSpring

local function multiplyColor(a1, a2) -- Line: 19 -- types: a1: userdata, a2: number
    local v1, v2, v3 = a1:ToHSV()
    return Color3.fromHSV(v1, v2, v3 * a2)
end

return function(a1) -- Line: 24 -- upvalues: React (val), useSpring (val) -- types: a1: table
    local idle, idle_2 = React.useState("idle")
    if a1.disabled then
        idle = "disabled"
    end
    local u12 = Color3.fromRGB(84, 255, 84)
    local u17 = Color3.fromRGB(23, 107, 33)
    local u22 = Color3.fromRGB(255, 255, 255)
    local u29 = if not a1.disabled then if idle ~= "pressed" then if idle ~= "hover" then 0 else -0.02 else 0.04 else 0
    local u36 = if not a1.disabled then if idle ~= "pressed" then if idle ~= "hover" then 1 else 1.2 else 0.8 else 0.8
    local v1, u40 = useSpring({start = 0, damper = 0.8, speed = 80})
    local v2, u44 = useSpring({start = 1, damper = 1, speed = 80})
    local v3 = {idle}
    React.useEffect(function() -- Line: 47 -- upvalues: u40 (val), u29 (val), u44 (val), u36 (val), idle (ref), idle_2 (val)
        u40({target = u29})
        u44({target = u36})
        if idle == "disabled" then
            idle_2("idle")
        end
    end, v3)
    local v4 = v2:map(function(a1_2) -- Line: 55 -- upvalues: a1 (val), u12 (val)
        if a1.disabled then
            return (Color3.fromRGB(200, 200, 200))
        end
        local v1, v2, v3 = u12:ToHSV()
        return (Color3.fromHSV(v1, v2, v3 * a1_2))
    end)
    local v5 = v2:map(function(a1_2) -- Line: 61 -- upvalues: a1 (val), u17 (val)
        if a1.disabled then
            return (Color3.fromRGB(70, 70, 70))
        end
        local v1, v2, v3 = u17:ToHSV()
        return (Color3.fromHSV(v1, v2, v3 * 1))
    end)
    v3 = v2:map(function(a1_2) -- Line: 67 -- upvalues: a1 (val), u22 (val)
        if a1.disabled then
            return (Color3.fromRGB(200, 200, 200))
        end
        local v1, v2, v3 = u22:ToHSV()
        return (Color3.fromHSV(v1, v2, v3 * a1_2))
    end)
    local v6 = {idle}
    React.useEffect(function() -- Line: 73 -- upvalues: a1 (val), idle (ref)
        if a1.onStateChanged then
            a1.onStateChanged(idle)
        end
    end, v6)
    local createElement = React.createElement
    v6 = {}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    v6.AnchorPoint = AnchorPoint
    v6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v6.BackgroundTransparency = 1
    v6.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v6.BorderSizePixel = 0
    local Position = a1.Position or UDim2.fromScale(0.5, 0.7)
    v6.Position = Position
    v6.ScaleType = Enum.ScaleType.Fit
    local Size = a1.Size or UDim2.fromScale(0.4, 0.1)
    v6.Size = Size
    v6[React.Event.Activated] = a1.onActivated

    v6[React.Event.MouseEnter] = function() -- Line: 90 -- upvalues: a1 (val), idle_2 (val)
        if not a1.disabled then
            idle_2("hover")
        end
    end

    v6[React.Event.MouseLeave] = function() -- Line: 95 -- upvalues: a1 (val), idle_2 (val)
        if not a1.disabled then
            idle_2(nil)
        end
    end

    v6[React.Event.MouseButton1Down] = function() -- Line: 100 -- upvalues: a1 (val), idle_2 (val)
        if not a1.disabled then
            idle_2("pressed")
        end
    end

    v6[React.Event.MouseButton1Up] = function() -- Line: 105 -- upvalues: a1 (val), idle_2 (val)
        if not a1.disabled then
            idle_2("hover")
        end
    end

    return (createElement("ImageButton", v6, {
        scale = React.createElement("UIScale"),
        background = React.createElement("ImageLabel", {
            BackgroundTransparency = 0.999,
            BorderSizePixel = 0,
            Image = "rbxassetid://96843563037785",
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            ImageColor3 = v4,
            Position = v1:map(function(a1) -- Line: 121
                return UDim2.fromScale(0.5, 0.5 + a1)
            end),
            Size = UDim2.fromScale(1.21, 1.68),
        }),
        content = React.createElement("Frame", {
            BackgroundTransparency = 1,
            ZIndex = 2,
            Size = UDim2.fromScale(1, 1),
            Position = v1:map(function(a1) -- Line: 130
                return UDim2.fromScale(0, a1)
            end),
        }, {
            text = React.createElement("TextLabel", {
                BackgroundTransparency = 0.999,
                BorderSizePixel = 0,
                LayoutOrder = 2,
                Text = "SEND",
                TextScaled = true,
                TextSize = 14,
                TextWrapped = true,
                AnchorPoint = Vector2.new(0.5, 0.5),
                AutomaticSize = Enum.AutomaticSize.X,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
                Position = UDim2.fromScale(0.5, 0.539),
                Size = UDim2.fromScale(0.799, 0.522),
                TextColor3 = v3,
            }, {uIStroke = React.createElement("UIStroke", {Thickness = 4, Color = v5})}),
            layout = React.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                Padding = UDim.new(0.01, 0),
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
            }),
        }),
    }))
end