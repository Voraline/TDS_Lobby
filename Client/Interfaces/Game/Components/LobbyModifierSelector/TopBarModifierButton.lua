-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.LobbyModifierSelector.TopBarModifierButton
-- Decompile time: 3.73 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local useTransparencyModifier = require(ReplicatedStorage.Client.Interfaces.Hooks.useTransparencyModifier)
local memo = React.memo
local createElement = React.createElement
local useEffect = React.useEffect
return memo(function(a1) -- Line: 19
    -- upvalues: ReactFlow (val), useTransparencyModifier (val), useEffect (val), createElement (val), React (val)
    local v1, u5 = ReactFlow.useSpring({target = 1, start = 1, speed = 40, damper = 0.6})
    local v2, u10 = ReactFlow.useSpring({target = 1, start = 1, speed = 10, damper = 0.6})
    local v3, u15 = ReactFlow.useSpring({target = 1, start = 1, speed = 10, damper = 0.6})
    local v4 = useTransparencyModifier(v3)
    local v5 = useEffect
    local v6 = {a1.visible}
    v5(function() -- Line: 43 -- upvalues: a1 (val), u10 (val), u15 (val)
        local u5 = task.delay(a1.zIndex / 10, function() -- Line: 44 -- upvalues: a1 (upval), u10 (upval), u15 (upval)
            if a1.visible then
                u10({target = 0})
                u15({target = 0})
                return
            end
            u10({target = -0.2})
            u15({target = 1})
        end)
        return function() -- Line: 54 -- upvalues: u5 (val)
            task.cancel(u5)
        end
    end, v6)
    v6 = {
        BackgroundTransparency = 1,
        BackgroundColor3 = Color3.new(),
        Position = UDim2.fromScale(0.128183, 0.154256),
        Size = UDim2.fromScale(0.161551, 0.581818),
        LayoutOrder = a1.zIndex or 1,
    }
    local v7 = {}
    local v8 = {
        BackgroundColor3 = Color3.new(),
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = v4(0),
        Position = v2:map(function(a1) -- Line: 73
            return UDim2.fromScale(0.5, 0.5 + a1 * 4)
        end),
    }
    local v9 = {uICorner = React.createElement("UICorner", {CornerRadius = UDim.new(0.15, 0)})}
    v9.textLabel = React.createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextScaled = true,
        ZIndex = 2,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
        Size = UDim2.fromScale(1, 1),
        Text = a1.text,
        TextColor3 = Color3.new(1, 1, 1),
        TextTransparency = v4(0),
    }, {
        uIPadding = React.createElement("UIPadding", {
            PaddingBottom = UDim.new(0.1, 0),
            PaddingLeft = UDim.new(0.1, 0),
            PaddingRight = UDim.new(0.1, 0),
            PaddingTop = UDim.new(0.1, 0),
        }),
    })
    local createElement_5 = React.createElement
    local v10 = {Thickness = 2}
    local v11 = a1.selected and Color3.new(1, 1, 1) or Color3.fromRGB(92, 92, 92)
    v10.Color = v11
    v10.Transparency = v4(0)
    v9.uIStroke = createElement_5("UIStroke", v10)
    local selected = a1.selected and React.createElement("Frame", {
        BackgroundColor3 = Color3.new(1, 1, 1),
        BackgroundTransparency = v4(0.4),
        Size = UDim2.fromScale(1, 1),
    }, {
        uICorner = React.createElement("UICorner", {CornerRadius = UDim.new(0.15, 0)}),
        uIGradient = React.createElement("UIGradient", {
            Rotation = -90,
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0.4375),
                NumberSequenceKeypoint.new(0.268171, 0.725),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
        }),
    })
    v9.selection = selected
    v9.uIScale = React.createElement("UIScale", {Scale = v1})
    local createElement_10 = React.createElement
    v10 = {
        BackgroundTransparency = 1,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        Size = UDim2.fromScale(1, 1),
        Text = "",
        TextColor3 = Color3.new(),
        TextScaled = true,
    }

    v10[React.Event.Activated] = function() -- Line: 139 -- upvalues: a1 (val)
        if a1.onClick then
            a1.onClick()
        end
    end

    v10[React.Event.MouseEnter] = function() -- Line: 144 -- upvalues: u5 (val)
        u5({target = 1.1})
    end

    v10[React.Event.MouseLeave] = function() -- Line: 149 -- upvalues: u5 (val)
        u5({target = 1})
    end

    v10[React.Event.MouseButton1Down] = function() -- Line: 154 -- upvalues: u5 (val)
        u5({target = 0.9})
    end

    v10[React.Event.MouseButton1Up] = function() -- Line: 159 -- upvalues: u5 (val)
        u5({target = 1.1})
    end

    v9.textButton = createElement_10("TextButton", v10)
    v7[1] = createElement("Frame", v8, v9)
    return createElement("Frame", v6, v7)
end)