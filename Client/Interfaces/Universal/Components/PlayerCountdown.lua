-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.PlayerCountdown
-- Decompile time: 14.33 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Components = ReplicatedStorage.Client.Interfaces.Components
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useTransparencyModifier = require(ReplicatedStorage.Client.Interfaces.Hooks.useTransparencyModifier)
local u36 = RunService:IsRunning()
local useEffect = React.useEffect
local useBinding = React.useBinding
local joinBindings = React.joinBindings
local createElement = React.createElement
local memo = React.memo
local useSpring = ReactFlow.useSpring
local useGroupAnimation = ReactFlow.useGroupAnimation
local useAnimation = ReactFlow.useAnimation
local Tween = ReactFlow.Tween

local function now() -- Line: 35 -- upvalues: u36 (val)
    if u36 then
        return workspace:GetServerTimeNow()
    end
    return tick()
end

return memo(function(a1) -- Line: 43
    -- upvalues: useSound (val), useBinding (val), useSpring (val), useGroupAnimation (val), useAnimation (val)
    -- upvalues: Tween (val), useTransparencyModifier (val), useEffect (val), RunService (val), u36 (val)
    -- upvalues: createElement (val), joinBindings (val)
    local u3 = a1.Visible ~= false
    local endTime = a1.endTime
    local Timer = useSound("Timer")
    local u11, u12 = useBinding(endTime)
    local u15, u16 = useBinding(0)
    local v1, u20 = useBinding(0)
    local v2, u24 = useSpring({start = 10, target = 10, speed = 10, damper = 1})
    local v3, u28 = useSpring({start = 0, target = 1, speed = 15, damper = 0.8})
    local v4, u171 = useGroupAnimation({
        enabled = useAnimation({
            fade = Tween({target = 0, info = TweenInfo.new(1, Enum.EasingStyle.Exponential)}),
            loaderCircleScale = Tween({target = 1, info = TweenInfo.new(1, Enum.EasingStyle.Exponential)}),
            vignetteScale = Tween({target = 1, info = TweenInfo.new(1, Enum.EasingStyle.Exponential)}),
            titlePositiion = Tween({
                target = UDim2.fromScale(0.5, 0.2),
                info = TweenInfo.new(1, Enum.EasingStyle.Exponential),
            }),
            counterPosition = Tween({
                target = UDim2.fromScale(0.5, 0.5),
                info = TweenInfo.new(1, Enum.EasingStyle.Exponential),
            }),
            loaderPosition = Tween({
                target = UDim2.fromScale(0.5, 0.5),
                info = TweenInfo.new(1, Enum.EasingStyle.Exponential),
            }),
        }),
        disabled = useAnimation({
            fade = Tween({target = 1, info = TweenInfo.new(1, Enum.EasingStyle.Exponential)}),
            loaderCircleScale = Tween({target = 1.2, info = TweenInfo.new(1, Enum.EasingStyle.Exponential)}),
            vignetteScale = Tween({target = 1.2, info = TweenInfo.new(1, Enum.EasingStyle.Exponential)}),
            titlePositiion = Tween({
                target = UDim2.new(0.5, 0, 0.2, 100),
                info = TweenInfo.new(1, Enum.EasingStyle.Exponential),
            }),
            counterPosition = Tween({
                target = UDim2.new(0.5, 0, 0.5, 100),
                info = TweenInfo.new(1, Enum.EasingStyle.Exponential),
            }),
            loaderPosition = Tween({
                target = UDim2.new(0.5, 0, 0.5, 100),
                info = TweenInfo.new(1, Enum.EasingStyle.Exponential),
            }),
        }),
    }, {
        fade = 1,
        vignetteScale = 1.2,
        loaderCircleScale = 1.2,
        titlePositiion = UDim2.new(0.5, 0, 0.2, 100),
        counterPosition = UDim2.new(0.5, 0, 0.5, 100),
        loaderPosition = UDim2.new(0.5, 0, 0.5, 100),
    })
    local v5 = useTransparencyModifier(v4.fade)
    local v6 = v4.fade:map(function(a1) -- Line: 123
        return a1 < 1
    end)
    local v7 = {u3}
    useEffect(function() -- Line: 127 -- upvalues: u171 (val), u3 (val), RunService (upval), u20 (val), u16 (val), u15 (val)
        local u15_2 = nil
        u171(if not u3 then "disabled" else "enabled")
        if u3 then
            u15_2 = RunService.RenderStepped:Connect(function(a1) -- Line: 133 -- upvalues: u20 (upval), u16 (upval), u15 (upval)
                u20(math.abs((math.sin((tick()) / 2))) * 0.4 - 0.2)
                u16((u15:getValue()) + a1 * 180)
            end)
        end
        return function() -- Line: 139 -- upvalues: u15_2 (ref)
            if u15_2 and u15_2.Connected then
                u15_2:Disconnect()
            end
        end
    end, v7)
    v7 = {endTime}
    useEffect(function() -- Line: 146 -- upvalues: endTime (val), u12 (val), u36 (upval), u11 (val), u28 (val), u24 (val), Timer (val)
        if not endTime then
            return
        end
        local u3 = task.spawn(function() -- Line: 151
            -- upvalues: u12 (upval), endTime (upval), u36 (upval), u11 (upval), u28 (upval), u24 (upval), Timer (upval)
            local ServerTimeNow_2, v1, v2
            u12((math.round(endTime - (if not u36 then tick() else workspace:GetServerTimeNow()))))
            while true do
                ServerTimeNow_2 = if not u36 then tick() else workspace:GetServerTimeNow()
                if not (ServerTimeNow_2 < endTime) then
                    break
                end
                v1 = math.round(endTime - (if not u36 then tick() else workspace:GetServerTimeNow()))
                if v1 > 99999 then
                    v1 = "∞"
                end
                if u11:getValue() ~= v1 then
                    u28({force = 1})
                    u24({force = 400})
                    if not v2 and v1 <= 10 then
                        Timer()
                    end
                    u12(v1)
                end
                task.wait(0.5)
            end
            u12(0)
        end)
        return function() -- Line: 183 -- upvalues: u3 (val)
            task.cancel(u3)
        end
    end, v7)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Active = v6,
        Visible = v6,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {
        contentContainer = createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
        }, {
            loader = createElement("Frame", {
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Visible = true,
                Size = UDim2.fromScale(0.3, 0.3),
                SizeConstraint = Enum.SizeConstraint.RelativeYY,
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Rotation = u15,
            }, {
                scale = createElement("UIScale", {Scale = v4.loaderCircleScale}),
                corner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
                stroke = createElement("UIStroke", {
                    Thickness = v2,
                    Color = Color3.fromRGB(255, 255, 255),
                    Transparency = v5(0),
                }, {
                    gradient = createElement("UIGradient", {
                        Rotation = 0,
                        Transparency = NumberSequence.new(0),
                        Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, Color3.fromRGB(236, 36, 83)),
                            ColorSequenceKeypoint.new(0.499, Color3.fromRGB(236, 36, 83)),
                            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 149, 248)),
                            (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 149, 248))),
                        }),
                    }),
                }),
            }),
            counter = createElement("TextLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                LayoutOrder = 1,
                TextScaled = true,
                TextSize = 14,
                TextWrapped = true,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
                Size = UDim2.fromScale(2, 0.6),
                Text = u11,
                TextXAlignment = Enum.TextXAlignment.Center,
                TextYAlignment = Enum.TextYAlignment.Center,
                TextColor3 = Color3.fromRGB(229, 229, 229),
                TextTransparency = v5(0),
                Position = joinBindings({v4.counterPosition, v3}):map(function(a1) -- Line: 269
                    return a1[1] + UDim2.fromScale(0, -a1[2])
                end),
            }, {stroke = createElement("UIStroke", {Thickness = 3, Transparency = v5(0.8)})}),
            title = createElement("TextLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                LayoutOrder = 1,
                Text = "WAITING FOR PLAYERS...",
                TextScaled = true,
                TextSize = 14,
                TextWrapped = true,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
                Position = v4.titlePositiion,
                Size = UDim2.fromScale(1, 0.05),
                TextColor3 = Color3.fromRGB(229, 229, 229),
                TextTransparency = v5(0),
            }, {stroke = createElement("UIStroke", {Thickness = 3, Transparency = v5(0.8)})}),
            vignette = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = "rbxassetid://18720210000",
                AnchorPoint = Vector2.new(0.5, 0.5),
                ImageTransparency = v1,
                Position = UDim2.fromScale(0.5, 0.5),
                ScaleType = Enum.ScaleType.Slice,
                Size = UDim2.fromScale(1.03, 1.08),
                SliceCenter = Rect.new(384, 384, 384, 384),
            }, {
                scale = createElement("UIScale", {Scale = v4.vignetteScale}),
                gradient = createElement("UIGradient", {
                    Rotation = 62.5,
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(236, 36, 83)),
                        (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 149, 248))),
                    }),
                }),
            }),
        }),
    })
end)