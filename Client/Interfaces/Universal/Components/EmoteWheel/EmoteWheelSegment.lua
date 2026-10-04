-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.EmoteWheel.EmoteWheelSegment
-- Decompile time: 7.22 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local useReactBindings = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBindings)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local createElement = React.createElement
local useEffect = React.useEffect
return React.memo(function(a1) -- Line: 25
    -- upvalues: useSpring (val), useReactBindings (val), useEffect (val), createElement (val), React (val)
    local v1 = a1.Rotation or 180
    local v2 = a1.index or 1
    local transparency = a1.transparency
    local Visible = a1.Visible
    local Size = a1.Size
    local v3, u18 = useSpring(Color3.fromRGB(28, 35, 42), 1, 20, true)
    local v4, u25 = useSpring(1, 1, 40, true)
    local v5, u32 = useSpring(1, 0.5, 20, true)
    local v6, u41 = useSpring(0, 1, 25 - (v2 - 1) * 2, true)
    local v7 = {Visible}
    useReactBindings(function(a1_2) -- Line: 38 -- upvalues: u41 (val), a1 (val)
        u41(if not a1.Visible then 0 else 1)
    end, v7, {})
    local v8 = useEffect
    v7 = {a1.selected}
    v8(function() -- Line: 42 -- upvalues: a1 (val), u18 (val), u32 (val), u25 (val)
        if a1.selected then
            u18(Color3.new(1, 1, 1))
            u32(1.1)
            u25(0.5)
            return
        end
        u18(Color3.fromRGB(28, 35, 42))
        u32(1)
        u25(1)
    end, v7)
    v7 = {
        BackgroundTransparency = 1,
        Size = React.joinBindings({Size, v6}):map(function(a1) -- Line: 55
            local v1, v2 = unpack(a1)
            return UDim2.fromOffset(v1.X * 0.5 * v2, v1.Y * 0.5 * v2)
        end),
    }
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    v7.AnchorPoint = AnchorPoint
    local Position = a1.Position or UDim2.fromScale(0.5, 0.5)
    v7.Position = Position
    v7.Rotation = v1
    return createElement("Frame", v7, {
        scale = createElement("UIScale", {Scale = v5}),
        container = createElement("ImageLabel", {
            Image = "rbxassetid://18639637967",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ImageColor3 = v3,
            ImageTransparency = transparency:map(function(a1) -- Line: 71
                return 1 - 0.8 * a1
            end),
            ScaleType = Enum.ScaleType.Fit,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
        }, {
            color = createElement("UIGradient", {
                Rotation = 99,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(70, 212, 255)),
                    ColorSequenceKeypoint.new(0.83, Color3.fromRGB(51, 194, 255)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(43, 124, 255))),
                }),
            }),
            content = createElement("Frame", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Position = UDim2.fromScale(0.5, 0.91),
                Rotation = -v1,
                Size = UDim2.fromScale(0.4, 0.4),
            }, {
                constraint = createElement("UIAspectRatioConstraint"),
                children = createElement(React.Fragment, {}, a1.children or {}),
            }),
        }),
        shadow = createElement("ImageLabel", {
            Image = "rbxassetid://18639637967",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = -1,
            ImageColor3 = Color3.fromRGB(0, 0, 0),
            ImageTransparency = v4,
            ScaleType = Enum.ScaleType.Fit,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = v4:map(function(a1) -- Line: 119
                local v1 = (1 - a1) / 0.5
                return UDim2.new(0.5, v1 * 3, 0.5, v1 * -3)
            end),
            Size = UDim2.fromScale(1, 1),
        }),
    })
end)