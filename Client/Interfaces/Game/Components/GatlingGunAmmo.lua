-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.GatlingGunAmmo
-- Decompile time: 4.55 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Interfaces = ReplicatedStorage.Client.Interfaces
local Shared = ReplicatedStorage.Shared
local Packages = ReplicatedStorage.Packages
local BaseComponents = script.Parent.BaseComponents
local Hooks = Interfaces.Hooks
local React = require(Shared.UI.React)
local ReactFlow = require(Packages.ReactFlow)
local useReactBindings = require(Hooks.useReactBindings)
local useTransparencyModifier = require(Hooks.useTransparencyModifier)
local Container = require(BaseComponents.Container)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local createElement = React.createElement
local useRef = React.useRef
local joinBindings = React.joinBindings
local useEffect = React.useEffect
local useSpring = ReactFlow.useSpring
local u43 = UDim2.fromOffset(55, 55)
return React.memo(function(a1) -- Line: 36
    -- upvalues: useSpring (val), useRef (val), React (val), useReactBindings (val), useTransparencyModifier (val)
    -- upvalues: useEffect (val), createElement (val), Container (val), joinBindings (val), u43 (val), TextLabel (val)
    local u53
    local v1, u4 = useSpring({start = 0, speed = 25, damper = 0.7})
    local v2, u8 = useSpring({start = 0, speed = 20, damper = 0.8})
    local v3, u12 = useSpring({start = 0, speed = 20, damper = 0.8})
    local u15 = useRef(0)
    local u18 = useRef(0)
    local v4, u22 = useSpring({start = 0, speed = 15, damper = 0.5})
    local v5, u26 = useSpring({start = 0, speed = 4, damper = 1})
    local v6 = React.useBinding(a1.Size)
    local u32 = nil
    local v7 = useReactBindings
    local v8 = {a1.Reloading}
    v7(function(a1) -- Line: 55 -- upvalues: u22 (val), u32 (ref), u26 (val)
        if a1 then
            u22({target = 1})
            u32 = task.spawn(function() -- Line: 58 -- upvalues: u26 (upval)
                for i = 1, 12 do
                    u26({target = i * -360 * 4})
                    task.wait(1)
                end
            end)
            return
        end
        if u32 then
            task.cancel(u32)
            u32 = nil
        end
        u26({target = 0})
        u22({target = 0})
    end, v8)
    v7 = useReactBindings
    v8 = {a1.Ammo, a1.MaxAmmo}
    v7(function(a1, a2) -- Line: 74 -- upvalues: u4 (val), u15 (val), u8 (val), u18 (val), u12 (val)
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
    end, v8)
    v7, u53 = useSpring({speed = 25, damper = 0.8, start = if not a1.Visible then 1 else 0})
    local v9 = useTransparencyModifier(a1.Transparency)(v7)
    local v10 = useEffect
    local v11 = {a1.Visible}
    v10(function() -- Line: 97 -- upvalues: u53 (val), a1 (val), u8 (val), u12 (val)
        u53({target = if not a1.Visible then 1 else 0})
        if a1.Visible then
            u8({force = 10})
            u12({force = 10})
        end
    end, v11)
    return (createElement(Container, {
        CornerRadius = 4,
        StrokeThickness = 1,
        Size = (joinBindings({v6, v4})):map(function(a1) -- Line: 107 -- upvalues: u43 (upval)
            return a1[1]:Lerp(u43, a1[2])
        end),
        Position = v2:map(function(a1_2) -- Line: 110 -- upvalues: a1 (val)
            return a1.Position + UDim2.fromScale(0, a1_2 / 30)
        end),
        AnchorPoint = a1.AnchorPoint,
        BackgroundColor3 = joinBindings({a1.Reloading, v4}):map(function(a1) -- Line: 115
            local v1 = a1[1]
            local v2 = math.clamp(a1[2], 0, 1)
            return (Color3.fromRGB(0, 0, 0)):Lerp(Color3.fromRGB(255, 59, 85), v2)
        end),
        BackgroundTransparency = joinBindings({a1.Reloading, v4}):map(function(a1) -- Line: 119
            local v1 = a1[1]
            local v2 = a1[2]
            return 0.4 * (1 - v2) + 0.2 * v2
        end),
        StrokeColor = Color3.fromRGB(255, 255, 255),
        Transparency = v9,
        Visible = v9:map(function(a1) -- Line: 130
            return a1 < 0.99
        end),
    }, {
        reloadImage = createElement("ImageLabel", {
            Image = "rbxassetid://128060292631196",
            BackgroundTransparency = 1,
            Size = UDim2.fromOffset(50, 50),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Rotation = v5,
            Visible = a1.Visible,
        }, {uIscale = createElement("UIScale", {Scale = v4})}),
        valueText = createElement(TextLabel, {
            ZIndex = 2,
            FontWeight = "Black",
            StrokeThickness = 1,
            Size = UDim2.new(1, 0, 1, -4),
            Position = v3:map(function(a1) -- Line: 150
                return UDim2.fromScale(0.5 + a1 / 4, 0.5)
            end),
            Text = joinBindings({a1.Ammo, a1.MaxAmmo}):map(function(a1) -- Line: 155
                return (("%*/%*"):format(a1[1], a1[2]))
            end),
            StrokeColor = Color3.new(0, 0, 0),
            Transparency = v9,
            Visible = a1.Reloading:map(function(a1) -- Line: 166
                return not a1
            end),
        }),
        fillBar = createElement(Container, {
            CornerRadius = 10,
            Size = v1:map(function(a1) -- Line: 172
                return UDim2.new(math.min(a1, 1), -4, 1, -4)
            end),
            Visible = joinBindings({v1, a1.Reloading}):map(function(a1) -- Line: 176
                local v1 = false
                if 0 < a1[1] then
                    v1 = not a1[2]
                end
                return v1
            end),
        }, {
            fillFrame = createElement(Container, {
                BackgroundTransparency = 0,
                CornerRadius = 3,
                Size = UDim2.fromScale(1, 1),
                BackgroundColor3 = v2:map(function(a1) -- Line: 186
                    local v1 = math.max(a1 * 5, 0)
                    return (Color3.fromRGB(255, 170, 0)):Lerp(Color3.new(1, 1, 1), v1)
                end),
                Transparency = v9,
            }),
        }),
    }))
end, function(a1, a2) -- Line: 197
    return a1.Visible == a2.Visible
end)