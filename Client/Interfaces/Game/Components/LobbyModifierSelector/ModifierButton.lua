-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.LobbyModifierSelector.ModifierButton
-- Decompile time: 2.42 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 9 -- upvalues: ReactFlow (val), React (val), createElement (val)
    local v1, u5 = ReactFlow.useSpring({target = 1, start = 1, damper = 0.6, speed = 28})
    local v2, u20 = ReactFlow.useSpring({
        damper = 0.6,
        speed = 28,
        target = Color3.fromRGB(0, 0, 0),
        start = Color3.fromRGB(0, 0, 0),
    })
    local useEffect = React.useEffect
    local v3 = {a1.selected, a1.disabled}
    useEffect(function() -- Line: 24 -- upvalues: a1 (val), u20 (val)
        if a1.disabled then
            u20({target = Color3.fromRGB(15, 15, 15)})
            return
        end
        local v1 = {}
        local v2 = a1.selected and Color3.fromRGB(54, 54, 54) or Color3.fromRGB(15, 15, 15)
        v1.target = v2
        u20(v1)
    end, v3)
    v3 = {BackgroundTransparency = 1, Size = UDim2.fromOffset(100, 100)}
    local v4 = {}
    local v5 = {
        BackgroundTransparency = 0.3,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = v2,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.9, 0.9),
    }
    local v6 = {
        UIScale = createElement("UIScale", {
            Scale = React.joinBindings({v1}):map(function(a1) -- Line: 47
                return a1[1]
            end),
        }),
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(0.05, 0)}),
        uIStroke = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(44, 44, 44)}),
        icon = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Image = ("rbxassetid://%*"):format(a1.icon or 0),
            ScaleType = Enum.ScaleType.Fit,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.8, 0.8),
            ImageTransparency = if not a1.disabled then 0 else 0.5,
        }),
    }
    local v7 = createElement
    local v8 = {
        BackgroundTransparency = 1,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        Size = UDim2.fromScale(1, 1),
        Text = "",
        TextColor3 = Color3.new(),
        TextSize = 14,
    }

    v8[React.Event.Activated] = function() -- Line: 79 -- upvalues: a1 (val)
        if a1.disabled then
            return
        end
        a1.onSelect()
    end

    v8[React.Event.MouseButton1Down] = function() -- Line: 87 -- upvalues: a1 (val), u5 (val)
        if a1.disabled then
            return
        end
        u5({target = 0.9})
    end

    v8[React.Event.MouseButton1Up] = function() -- Line: 93 -- upvalues: a1 (val), u5 (val)
        if a1.disabled then
            return
        end
        u5({target = 1.1})
    end

    v8[React.Event.MouseLeave] = function() -- Line: 100 -- upvalues: a1 (val), u5 (val)
        a1.toolTip(nil)
        if not a1.disabled then
            u5({target = 1})
        end
    end

    v8[React.Event.MouseEnter] = function() -- Line: 107 -- upvalues: a1 (val), u5 (val)
        a1.toolTip(a1)
        if not a1.disabled then
            u5({target = 1.1})
        end
    end

    v6.textButton = v7("TextButton", v8)
    v4.frame = createElement("Frame", v5, v6)
    return createElement("Frame", v3, v4)
end)