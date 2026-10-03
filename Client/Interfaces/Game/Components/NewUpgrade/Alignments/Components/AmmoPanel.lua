-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.Components.AmmoPanel
-- Decompile time: 3.79 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Interfaces = ReplicatedStorage.Client.Interfaces
local Shared = ReplicatedStorage.Shared
local Packages = ReplicatedStorage.Packages
local BaseComponents = script.Parent.Parent.BaseComponents
local Hooks = Interfaces.Hooks
local React = require(Shared.UI.React)
local ReactFlow = require(Packages.ReactFlow)
local useReactBindings = require(Hooks.useReactBindings)
local useTransparencyModifier = require(Hooks.useTransparencyModifier)
local Container = require(BaseComponents.Container)
local TextLabel = require(BaseComponents.TextLabel)
local createElement = React.createElement
local useRef = React.useRef
local joinBindings = React.joinBindings
local useEffect = React.useEffect
local useSpring = ReactFlow.useSpring
return React.memo(function(a1) -- Line: 34
    -- upvalues: useSpring (val), useRef (val), useReactBindings (val), useTransparencyModifier (val), useEffect (val)
    -- upvalues: createElement (val), Container (val), TextLabel (val), joinBindings (val)
    local u34
    local v1, u4 = useSpring({start = 0, speed = 25, damper = 0.7})
    local v2, u8 = useSpring({start = 0, speed = 20, damper = 0.8})
    local v3, u12 = useSpring({start = 0, speed = 20, damper = 0.8})
    local u15 = useRef(0)
    local u18 = useRef(0)
    local v4 = useReactBindings
    local v5 = {a1.Ammo, a1.MaxAmmo}
    v4(function(a1, a2) -- Line: 46 -- upvalues: u4 (val), u15 (val), u8 (val), u18 (val), u12 (val)
        local v1 = a1 / math.max(1, a2)
        u4({target = v1})
        if u15.current ~= v1 then
            u8({force = 10})
        end
        if a1 < u18.current then
            u12({force = 10})
        end
        u15.current = v1
        u18.current = a1
    end, v5)
    v4, u34 = useSpring({speed = 25, damper = 0.8, start = if not a1.Visible then 1 else 0})
    local v6 = useTransparencyModifier(a1.Transparency)(v4)
    local v7 = useEffect
    local v8 = {a1.Visible}
    v7(function() -- Line: 69 -- upvalues: u34 (val), a1 (val), u8 (val), u12 (val)
        u34({target = if not a1.Visible then 1 else 0})
        if a1.Visible then
            u8({force = 10})
            u12({force = 10})
        end
    end, v8)
    return createElement(Container, {
        BackgroundTransparency = 0.4,
        CornerRadius = 4,
        StrokeThickness = 1,
        Size = a1.Size,
        Position = v2:map(function(a1_2) -- Line: 80 -- upvalues: a1 (val)
            return a1.Position + UDim2.fromScale(0, a1_2 / 30)
        end),
        AnchorPoint = a1.AnchorPoint,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        StrokeColor = Color3.fromRGB(255, 255, 255),
        Transparency = v6,
        Visible = v6:map(function(a1) -- Line: 94
            return a1 < 0.99
        end),
    }, {
        valueText = createElement(TextLabel, {
            ZIndex = 2,
            FontWeight = "Black",
            StrokeThickness = 1,
            Size = UDim2.new(1, 0, 1, -4),
            Position = v3:map(function(a1) -- Line: 100
                return UDim2.fromScale(0.5 + a1 / 4, 0.5)
            end),
            Text = joinBindings({a1.Ammo, a1.MaxAmmo}):map(function(a1) -- Line: 105
                return (("%*/%*"):format(a1[1], a1[2]))
            end),
            StrokeColor = Color3.new(0, 0, 0),
            Transparency = v6,
        }),
        fillBar = createElement(Container, {
            CornerRadius = 10,
            Size = v1:map(function(a1) -- Line: 118
                return UDim2.new(math.min(a1, 1), -4, 1, -4)
            end),
            Visible = v1:map(function(a1) -- Line: 122
                return a1 > 0.01
            end),
        }, {
            fillFrame = createElement(Container, {
                BackgroundTransparency = 0,
                CornerRadius = 3,
                Size = UDim2.fromScale(1, 1),
                BackgroundColor3 = v2:map(function(a1) -- Line: 131
                    local v1 = math.max(a1 * 5, 0)
                    return (Color3.fromRGB(255, 170, 0)):Lerp(Color3.new(1, 1, 1), v1)
                end),
                Transparency = v6,
            }),
        }),
    })
end, function(a1, a2) -- Line: 142
    return a1.Visible == a2.Visible
end)