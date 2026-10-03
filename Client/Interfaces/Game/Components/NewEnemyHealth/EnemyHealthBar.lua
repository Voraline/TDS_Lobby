-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewEnemyHealth.EnemyHealthBar
-- Decompile time: 1.94 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local createElement = React.createElement
local memo = React.memo
local useSpring = ReactFlow.useSpring
local useTween = ReactFlow.useTween
local useEffect = React.useEffect

local function bar(a1) -- Line: 29 -- upvalues: createElement (val) -- types: a1: table
    local v1 = {
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.new(1, 1, 1),
        Position = UDim2.fromScale(0.5, 0),
        Size = UDim2.fromScale(1, 1),
        ZIndex = a1.zIndex or 2,
    }
    local v2 = {uICorner = createElement("UICorner")}
    local v3 = {Rotation = if not a1.reversed then 0 else 180, Offset = a1.mappedValue}
    local color = a1.color or ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(156, 42, 255)),
        ColorSequenceKeypoint.new(0.32, Color3.fromRGB(217, 0, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.new(1, 1, 1)),
        (ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))),
    })
    v3.Color = color
    v3.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.5, 0),
        NumberSequenceKeypoint.new(0.501, 1),
        (NumberSequenceKeypoint.new(1, 1)),
    })
    v2.uIGradient = createElement("UIGradient", v3)
    return createElement("Frame", v1, v2)
end

return memo(function(a1) -- Line: 58
    -- upvalues: useTween (val), useEffect (val), createElement (val), bar (val)
    local v1 = a1.health / a1.maxHealth
    local u6 = if a1.reversed then 0.5 - v1 else v1 + -0.5
    local v2, u16 = useTween({
        target = u6,
        start = u6,
        info = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
    })
    local v3 = {u6}
    useEffect(function() -- Line: 69 -- upvalues: u16 (val), u6 (val)
        u16({target = u6})
    end, v3)
    return createElement("Frame", {
        ZIndex = 2,
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.new(1, 1, 1),
        Position = UDim2.fromScale(0.5, 0),
        Size = UDim2.fromScale(1, 1),
    }, {
        delayBar = createElement(bar, {
            zIndex = 1,
            mappedValue = v2:map(function(a1) -- Line: 75
                return Vector2.new(a1, 0)
            end),
            reversed = a1.reversed,
            color = a1.delayBarColor1,
        }),
        bar = createElement(bar, {
            zIndex = 2,
            mappedValue = Vector2.new(u6, 0),
            reversed = a1.reversed,
            color = a1.color,
        }),
    })
end)