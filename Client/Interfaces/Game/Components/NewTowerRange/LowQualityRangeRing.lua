-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewTowerRange.LowQualityRangeRing
-- Decompile time: 2.58 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local useReactBindings = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBindings)
local createElement = React.createElement
local useRef = React.useRef
local useTween = ReactFlow.useTween
return (React.memo(function(a1) -- Line: 22
    -- upvalues: useTween (val), useRef (val), useReactBindings (val), createElement (val), React (val)
    local Radius = a1.Radius
    local BaseRadius = a1.BaseRadius
    local v1 = a1.ZIndex or 1
    local v2 = a1.FillTransparency or 0.9
    local LineTransparency = a1.LineTransparency or (if not a1.DisableFill then 0 else 0.75)
    local v3, u18 = useTween({start = 0, target = 1, info = TweenInfo.new(0.2, Enum.EasingStyle.Sine)})
    local u21 = useRef(nil)
    local v4 = {BaseRadius, Radius}
    useReactBindings(function(a1, a2) -- Line: 36 -- upvalues: u21 (val), u18 (val)
        local current = u21.current
        if current and current.baseRadius == a1 and current.radius == a2 then
            return
        end
        u21.current = {baseRadius = a1, radius = a2}
        u18({start = 0, target = if a1 ~= 0 then a2 / a1 else 0})
    end, v4)
    local v5 = v3:map(function(a1) -- Line: 57
        return UDim2.new(a1, -20, a1, -20)
    end)
    return createElement(React.Fragment, {}, {
        rangeFill = createElement("SurfaceGui", {
            ClipsDescendants = true,
            LightInfluence = 0,
            Brightness = 1.5,
            MaxDistance = 1000,
            Enabled = v5:map(function(a1) -- Line: 63
                return 0.001 < a1.X.Scale
            end),
            Face = Enum.NormalId.Top,
            SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud,
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
            ZOffset = 0.01 * v1,
        }, {
            content = createElement("Frame", {
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = v5,
                BackgroundColor3 = a1.Color,
                BackgroundTransparency = if not a1.DisableFill then v2 else 1,
            }, {corner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)})}),
        }),
        rangeOutline = createElement("SurfaceGui", {
            AlwaysOnTop = true,
            ClipsDescendants = true,
            LightInfluence = 0,
            Brightness = 1.5,
            MaxDistance = 1000,
            Enabled = v5:map(function(a1) -- Line: 94
                return 0.001 < a1.X.Scale
            end),
            Face = Enum.NormalId.Top,
            SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud,
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
            ZOffset = 0.01 * v1,
        }, {
            content = createElement("Frame", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = v5,
                BackgroundColor3 = a1.Color,
            }, {
                corner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
                stroke = createElement("UIStroke", {Thickness = 5, Transparency = LineTransparency, Color = a1.Color}),
            }),
        }),
    })
end))