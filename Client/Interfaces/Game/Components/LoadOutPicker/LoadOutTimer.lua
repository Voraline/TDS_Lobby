-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.LoadOutPicker.LoadOutTimer
-- Decompile time: 5.88 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local useCountdown = require(Hooks.useCountdown)
local useReactBindings = require(Hooks.useReactBindings)
local useTransparencyModifier = require(Hooks.useTransparencyModifier)
local Tween = ReactFlow.Tween
local useAnimation = ReactFlow.useAnimation
local useGroupAnimation = ReactFlow.useGroupAnimation
local useRef = React.useRef
local useEffect = React.useEffect
local useTween = ReactFlow.useTween
local useSpring = ReactFlow.useSpring
local createElement = React.createElement
return React.memo(function(a1) -- Line: 40
    -- upvalues: useRef (val), useSpring (val), useCountdown (val), useTween (val), useGroupAnimation (val)
    -- upvalues: useAnimation (val), Tween (val), useTransparencyModifier (val), useEffect (val), useReactBindings (val)
    -- upvalues: createElement (val)
    local u3 = a1.Visible ~= false
    local v1 = a1.title or "Battle begins in..."
    local endsAt = a1.endsAt
    local u9 = a1.startsAt or endsAt
    local timerFinished = a1.timerFinished
    local u13 = useRef(0)
    local v2, u17 = useSpring({damper = 0.5, speed = 15, start = 0, target = 0})
    local v3 = useCountdown(endsAt)
    local v4, u27 = useTween({start = 1, target = 1, info = TweenInfo.new(1)})
    local v5 = TweenInfo.new(0.2, Enum.EasingStyle.Sine)
    local v6, u66 = useGroupAnimation({
        default = useAnimation({
            transparency = Tween({target = 0, info = v5}),
            position = Tween({target = UDim2.fromScale(0.5, 0.5), info = v5}),
        }),
        disable = useAnimation({
            transparency = Tween({target = 1, info = v5}),
            position = Tween({target = UDim2.fromScale(0.5, 2), info = v5}),
        }),
    }, {transparency = 1, position = UDim2.fromScale(0.5, 2)})
    local v7 = useTransparencyModifier(v6.transparency)
    local v8 = {u3}
    useEffect(function() -- Line: 87 -- upvalues: u66 (val), u3 (val)
        u66(if not u3 then "disable" else "default")
    end, v8)
    v8 = {endsAt, u9}
    useEffect(function() -- Line: 91 -- upvalues: endsAt (val), u9 (val), u27 (val)
        if endsAt and u9 then
            local v1 = endsAt - u9
            if v1 <= 0 then
                return
            end
            u27({
                start = 1,
                target = 0,
                info = TweenInfo.new(v1, Enum.EasingStyle.Linear),
            })
            return
        end
    end, v8)
    v8 = {v4}
    local v9 = {endsAt, u9}
    useReactBindings(function(a1) -- Line: 108 -- upvalues: u13 (val), endsAt (val), u9 (val), u17 (val), timerFinished (val)
        local current = u13.current
        local v1 = math.ceil((math.max(0, endsAt - u9)) * a1)
        u13.current = v1
        if current <= v1 then
            return
        end
        u17({force = 200})
        if v1 == 0 and timerFinished then
            timerFinished()
        end
    end, v8, v9)
    v8 = {BackgroundTransparency = 1}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 1)
    v8.AnchorPoint = AnchorPoint
    local Position = a1.Position or UDim2.fromScale(0.5, 0.98)
    v8.Position = Position
    local Size = a1.Size or UDim2.fromScale(0.4, 0.064)
    v8.Size = Size
    return createElement("Frame", v8, {
        uIAspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 10}),
        content = createElement("Frame", {
            Size = UDim2.fromScale(1, 1),
            Position = v6.position,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BackgroundTransparency = v7(0.2),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
        }, {
            amount = createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                TextSize = 14,
                TextWrapped = true,
                ZIndex = 3,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(27, 42, 53),
                FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                Position = v2:map(function(a1) -- Line: 155
                    return UDim2.new(0.5, 0, 0.5, -a1)
                end),
                Size = UDim2.fromScale(0.9, 0.6),
                Text = v3:map(function(a1) -- Line: 159
                    return (("%*s"):format((math.ceil(a1))))
                end),
                TextTransparency = v6.transparency,
                TextColor3 = Color3.fromRGB(255, 255, 255),
            }, {uIStroke = createElement("UIStroke", {Thickness = 2, Transparency = v7(0.5)})}),
            teamName = createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                TextSize = 14,
                TextWrapped = true,
                ZIndex = 3,
                AnchorPoint = Vector2.new(0.5, 1),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(27, 42, 53),
                FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
                Position = UDim2.fromScale(0.5, -0.25),
                Size = UDim2.fromScale(0.9, 0.6),
                Text = v1,
                TextTransparency = v6.transparency,
                TextColor3 = Color3.fromRGB(255, 255, 255),
            }, {uIStroke1 = createElement("UIStroke", {Thickness = 2, Transparency = v7(0.25)})}),
            uICorner = createElement("UICorner"),
            bar = createElement("ImageLabel", {
                BorderSizePixel = 0,
                Image = "rbxassetid://76856872302406",
                ZIndex = 2,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BackgroundTransparency = v6.transparency,
                ImageTransparency = v6.transparency,
                ImageColor3 = v4:map(function(a1) -- Line: 210
                    local v1 = 1 - a1
                    local v2 = Color3.fromRGB(98, 255, 0)
                    local v3 = Color3.fromRGB(255, 162, 0)
                    local v4 = Color3.fromRGB(255, 72, 0)
                    if v1 < 0.5 then
                        return v2:Lerp(v3, v1 * 2)
                    end
                    return v3:Lerp(v4, (v1 - 0.5) * 2)
                end),
                Size = UDim2.fromScale(1, 1),
            }, {
                uICorner1 = createElement("UICorner"),
                uIGradient = createElement("UIGradient", {
                    Offset = v4:map(function(a1) -- Line: 229
                        return Vector2.new(a1 - 0.5 - 0.001, 0)
                    end),
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0),
                        NumberSequenceKeypoint.new(0.5, 0),
                        NumberSequenceKeypoint.new(0.501, 1),
                        (NumberSequenceKeypoint.new(1, 1)),
                    }),
                }),
            }),
            uIStroke2 = createElement("UIStroke", {
                Thickness = 2,
                Color = Color3.fromRGB(39, 39, 39),
                Transparency = v6.transparency,
            }),
            dropShadow = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = "rbxassetid:///9239716855",
                ZIndex = -1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(27, 42, 53),
                ImageTransparency = v7(0.2),
                Position = UDim2.fromScale(0.5, 0.5),
                ScaleType = Enum.ScaleType.Slice,
                Size = UDim2.new(1, 16, 1, 16),
                SliceCenter = Rect.new(14, 14, 64, 24),
            }),
        }),
    })
end)