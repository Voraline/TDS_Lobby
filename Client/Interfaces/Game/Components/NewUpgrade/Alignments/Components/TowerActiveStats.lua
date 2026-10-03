-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.Components.TowerActiveStats
-- Decompile time: 6.43 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Interfaces = ReplicatedStorage.Client.Interfaces
local Shared = ReplicatedStorage.Shared
local Packages = ReplicatedStorage.Packages
local BaseComponents = script.Parent.Parent.BaseComponents
local Hooks = Interfaces.Hooks
local React = require(Shared.UI.React)
local ReactFlow = require(Packages.ReactFlow)
local Comma = require(Shared.UI.Comma)
local useReactBindings = require(Hooks.useReactBindings)
local Container = require(BaseComponents.Container)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local createElement = React.createElement
local useEffect = React.useEffect
local useRef = React.useRef
local useSpring = ReactFlow.useSpring
local useTween = ReactFlow.useTween
local u45 = React.memo(function(a1) -- Line: 36 -- upvalues: useSpring (val), useReactBindings (val), createElement (val), TextLabel (val)
    local v1, u4 = useSpring({start = 0, speed = 18, damper = 0.7})
    local v2 = useReactBindings
    local v3 = {a1.Level}
    v2(function(a1) -- Line: 40 -- upvalues: u4 (val)
        u4({force = 15})
    end, v3)
    return createElement(TextLabel, {
        FontWeight = "SemiBold",
        StrokeThickness = 3,
        Size = UDim2.new(1, -16, 0, 16),
        Position = v1:map(function(a1) -- Line: 46
            return UDim2.new(0.5 + a1 / 6, 0, 0, 6)
        end),
        AnchorPoint = Vector2.new(0.5, 0),
        Text = a1.Level:map(function(a1) -- Line: 51
            return (("Level: %*"):format(a1))
        end),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextColor3 = v1:map(function(a1) -- Line: 56
            return (Color3.new(1, 1, 1)):Lerp(Color3.new(0, 1, 0), a1)
        end),
        Transparency = a1.Transparency,
    })
end, function(a1, a2) -- Line: 65
    return true
end)
local u49 = React.memo(function(a1) -- Line: 69
    -- upvalues: useSpring (val), useReactBindings (val), createElement (val), TextLabel (val), Comma (val)
    local v1, u4 = useSpring({start = 0, speed = 15, damper = 0.7})
    local v2 = useReactBindings
    local v3 = {a1.Cost}
    v2(function() -- Line: 73 -- upvalues: u4 (val)
        u4({force = 20})
    end, v3)
    return createElement(TextLabel, {
        FontWeight = "SemiBold",
        StrokeThickness = 3,
        Size = UDim2.new(1, -16, 0, 16),
        Position = v1:map(function(a1) -- Line: 79
            return UDim2.new(0.5 + a1 / 10, 0, 0, 28)
        end),
        AnchorPoint = Vector2.new(0.5, 0),
        Text = a1.Cost:map(function(a1) -- Line: 84 -- upvalues: Comma (upval)
            return (("Cost: $%*"):format((Comma(a1))))
        end),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextColor3 = v1:map(function(a1) -- Line: 88
            return (Color3.new(1, 1, 1)):Lerp(Color3.new(0, 1, 0), a1)
        end),
        Transparency = a1.Transparency,
    })
end, function(a1, a2) -- Line: 97
    return true
end)
local u53 = React.memo(function(a1) -- Line: 101
    -- upvalues: useTween (val), useSpring (val), useReactBindings (val), createElement (val), Container (val)
    -- upvalues: TextLabel (val), Comma (val)
    local v1, u8 = useTween({start = 0, info = TweenInfo.new(0.3, Enum.EasingStyle.Cubic)})
    local v2, u12 = useSpring({start = 0, speed = 15, damper = 0.7})
    local v3 = useReactBindings
    local v4 = {a1.Damage}
    v3(function(a1) -- Line: 107 -- upvalues: u8 (val), u12 (val)
        u8({target = a1})
        u12({force = 15})
    end, v4)
    return createElement(Container, {}, {
        damageTitle = createElement(TextLabel, {
            Text = "Total Damage:",
            FontWeight = "SemiBold",
            StrokeThickness = 3,
            Size = UDim2.new(1, -16, 0, 16),
            Position = UDim2.new(0.5, 0, 0, 6),
            AnchorPoint = Vector2.new(0.5, 0),
            TextXAlignment = Enum.TextXAlignment.Right,
            Transparency = a1.Transparency,
        }),
        damageValueText = createElement(TextLabel, {
            FontWeight = "SemiBold",
            StrokeThickness = 3,
            Size = UDim2.new(1, -16, 0, 16),
            Position = v2:map(function(a1) -- Line: 129
                return UDim2.new(0.5 - a1 / 30, 0, 0, 28)
            end),
            AnchorPoint = Vector2.new(0.5, 0),
            Text = v1:map(function(a1) -- Line: 134 -- upvalues: Comma (upval)
                return Comma((math.floor(a1)))
            end),
            TextXAlignment = Enum.TextXAlignment.Right,
            TextColor3 = v2:map(function(a1) -- Line: 138
                return (Color3.fromRGB(248, 89, 89)):Lerp(Color3.new(1, 1, 1), a1 * 1.7)
            end),
            Transparency = a1.Transparency,
        }),
    })
end, function(a1, a2) -- Line: 148
    return true
end)
return function(a1) -- Line: 153 -- upvalues: createElement (val), Container (val), u45 (val), u49 (val), u53 (val)
    return createElement(Container, {
        StrokeThickness = 1,
        Size = a1.Size,
        Position = a1.Position,
        AnchorPoint = a1.AnchorPoint,
        CornerRadius = a1.CornerRadius,
        StrokeColor = Color3.fromRGB(165, 165, 165),
        Transparency = a1.Transparency,
    }, {
        levelText = createElement(u45, {
            Transparency = a1.Transparency,
            Level = a1.Stats:map(function(a1) -- Line: 169
                return a1.Level
            end),
        }),
        costText = createElement(u49, {
            Transparency = a1.Transparency,
            Cost = a1.Stats:map(function(a1) -- Line: 176
                return a1.TotalCost
            end),
        }),
        damageText = createElement(u53, {
            Transparency = a1.Transparency,
            Damage = a1.Stats:map(function(a1) -- Line: 183
                return a1.TotalDamage
            end),
        }),
    })
end