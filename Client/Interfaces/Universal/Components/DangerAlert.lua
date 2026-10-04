-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.DangerAlert
-- Decompile time: 9.75 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local Components = ReplicatedStorage.Client.Interfaces.Components
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local ImageLabel = require(Components.ImageLabel)
local TextLabel = require(Components.TextLabel)
local useTransparencyModifier = require(Hooks.useTransparencyModifier)
local useTween = ReactFlow.useTween
local useEffect = React.useEffect
local useBinding = React.useBinding
local joinBindings = React.joinBindings
local createElement = React.createElement
local useRef = React.useRef
return React.memo(function(a1) -- Line: 37
    -- upvalues: useRef (val), useBinding (val), useTween (val), useTransparencyModifier (val), useEffect (val)
    -- upvalues: RunService (val), createElement (val), joinBindings (val), ImageLabel (val), TextLabel (val)
    local u3 = a1.visible ~= false
    local position = a1.position
    if not position then
        position = UDim2.new(0.5, 0, 0, 200)
    end
    local u14 = useRef(0)
    local v1, u18 = useBinding(0)
    local v2, u22 = useBinding(0)
    local v3, u26 = useBinding(2)
    local v4, u35 = useTween({
        start = 0,
        target = 1,
        info = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut),
    })
    local v5, u44 = useTween({
        start = 1,
        target = 0,
        info = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
    })
    local v6, u53 = useTween({
        start = 1,
        target = 0,
        info = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    })
    local v7 = v5:map(function(a1) -- Line: 63
        return a1 * 120
    end)
    local v8 = useTransparencyModifier(v6)
    local v9 = v8(v4)
    local v10 = {u3}
    useEffect(function() -- Line: 69
        -- upvalues: u53 (val), u3 (val), u44 (val), RunService (upval), u14 (val), u26 (val), u22 (val), u18 (val)
        u53({start = if not u3 then 0 else 1, target = if not u3 then 1 else 0})
        u44({start = if not u3 then 0 else 1, target = if not u3 then 1 else 0})
        if not u3 then
            return
        end
        local u36 = RunService.RenderStepped:Connect(function(a1) -- Line: 83 -- upvalues: u14 (upval), u26 (upval), u22 (upval), u18 (upval)
            local current = u14.current
            local v1 = u14
            v1.current = v1.current + a1
            u26(math.sin(current * 4) * 2 + 5)
            u22(math.sin(current * 4) * 2)
            u18(math.cos(current * 4) * 10)
        end)
        return function() -- Line: 92 -- upvalues: u36 (val)
            u36:Disconnect()
        end
    end, v10)
    v10 = {u3}
    useEffect(function() -- Line: 97 -- upvalues: u3 (val), u35 (val)
        if not u3 then
            return
        end
        local u1 = true
        local u4 = task.spawn(function() -- Line: 103 -- upvalues: u1 (ref), u35 (upval)
            while u1 do
                u35({start = 0, target = 1})
                task.wait(1)
                if not u1 then
                    break
                end
                u35({start = 1, target = 0})
                task.wait(1)
            end
        end)
        return function() -- Line: 123 -- upvalues: u1 (ref), u4 (val)
            u1 = false
            task.cancel(u4)
        end
    end, v10)
    v10 = {BackgroundTransparency = 1, BorderSizePixel = 0}
    local anchorPoint = a1.anchorPoint or Vector2.new(0.5, 0)
    v10.AnchorPoint = anchorPoint
    local size = a1.size or UDim2.fromScale(0.2, 0.2)
    v10.Size = size
    v10.Rotation = v2
    v10.Position = (joinBindings({v1, v7})):map(function(a1) -- Line: 134 -- upvalues: position (val)
        return position + UDim2.fromOffset(0, a1[1] - a1[2])
    end)
    v10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v10.BorderColor3 = Color3.fromRGB(0, 0, 0)
    return createElement("Frame", v10, {
        aspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 8}),
        content = createElement("Frame", {
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = v8(0),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
        }, {
            corner = createElement("UICorner", {CornerRadius = UDim.new(0.05, 0)}),
            gradient = createElement("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 130, 130)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 89, 89))),
                }),
            }),
            stroke = createElement("UIStroke", {Color = Color3.fromRGB(209, 209, 209), Thickness = v3, Transparency = v8(0)}, {
                uIGradient = createElement("UIGradient", {
                    Rotation = 90,
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 130, 130)),
                        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 89, 89))),
                    }),
                }),
            }),
            leftIcon = createElement(ImageLabel, {
                Rotation = -10,
                BackgroundTransparency = 1,
                Image = "rbxassetid://126633634893521",
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.new(0, 15, 0.5, 0),
                Size = UDim2.fromScale(0.8, 0.8),
                SizeConstraint = Enum.SizeConstraint.RelativeYY,
                ImageTransparency = v9,
                ScaleType = Enum.ScaleType.Fit,
            }),
            rightIcon = createElement(ImageLabel, {
                Rotation = 10,
                BackgroundTransparency = 1,
                Image = "rbxassetid://126633634893521",
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.new(1, -15, 0.5, 0),
                Size = UDim2.fromScale(0.8, 0.8),
                SizeConstraint = Enum.SizeConstraint.RelativeYY,
                ImageTransparency = v9,
                ScaleType = Enum.ScaleType.Fit,
            }),
            alert = createElement(TextLabel, {
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                FontWeight = "Black",
                StrokeThickness = 2,
                Size = UDim2.fromScale(1, 0.5),
                Text = a1.text,
                TextTransparency = v8(0),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                StrokeLineJoinMode = Enum.LineJoinMode.Bevel,
                StrokeTransparency = v8(0.7),
            }),
        }),
        glow = createElement(ImageLabel, {
            BackgroundTransparency = 1,
            Image = "rbxassetid://18536350728",
            ZIndex = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = v3:map(function(a1) -- Line: 235
                local v1 = math.max(1, a1 / 5)
                return UDim2.new(1, v1 * 22, 1, v1 * 22)
            end),
            ImageTransparency = v8(0.43),
            ScaleType = Enum.ScaleType.Slice,
            SliceCenter = Rect.new(512, 512, 512, 512),
        }, {
            uIGradient1 = createElement("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 61, 106)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 108, 110))),
                }),
            }),
        }),
        sizeConstraint = createElement("UISizeConstraint", {MinSize = Vector2.new(300, 0)}),
    })
end)