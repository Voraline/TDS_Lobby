-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Battlepass.BattlepassBanner
-- Decompile time: 13.83 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local Seasons = require(ReplicatedStorage.Shared.Data.Seasons)
local BattlepassButton = require(script.Parent.BattlepassButton)
local useCountdown = require(Hooks.useCountdown)
local useScale = require(Hooks.useScale)
local useSound = require(Hooks.useSound)
local Tween = ReactFlow.Tween
local useGroupAnimation = ReactFlow.useGroupAnimation
local useAnimation = ReactFlow.useAnimation
local memo = React.memo
local Event = React.Event
local useMemo = React.useMemo
local useCallback = React.useCallback
local joinBindings = React.joinBindings
local createElement = React.createElement

local function formatTimer(a1) -- Line: 44 -- types: a1: number
    local v1 = math.floor(a1 / 86400)
    local v2 = math.floor(a1 % 86400 / 3600)
    local v3 = math.floor(a1 % 3600 / 60)
    local v4 = math.floor(a1 % 60)
    if v1 > 0 then
        return string.format("%d days", v1)
    end
    if v2 > 0 then
        return string.format("%02d:%02d:%02d", v2, v3, v4)
    end
    return string.format("%02d:%02d", v3, v4)
end

return memo(function(a1) -- Line: 59
    -- upvalues: useSound (val), useScale (val), useMemo (val), Seasons (val), useCountdown (val), joinBindings (val)
    -- upvalues: formatTimer (val), useGroupAnimation (val), useAnimation (val), Tween (val), useCallback (val)
    -- upvalues: createElement (val), RunService (val), Event (val), BattlepassButton (val)
    local v1 = a1.Visible ~= false
    local u6 = a1.name or ""
    local clicked = a1.clicked
    local u10 = a1.showEnded ~= false
    local Click = useSound("Click")
    local v2 = math.max(0.4, (math.min(1, (useScale(1)))))
    local v3 = {u6}
    local v4 = useMemo(function() -- Line: 68 -- upvalues: Seasons (upval), u6 (val)
        return Seasons.Seasons[u6]
    end, v3)
    local UnixTimestamp = v4 and v4.startsAt and v4.startsAt.UnixTimestamp or 0
    local UnixTimestamp_2 = v4 and v4.endsAt and v4.endsAt.UnixTimestamp or 0
    local v5 = (joinBindings({useCountdown(UnixTimestamp), (useCountdown(UnixTimestamp_2))})):map(function(a1) -- Line: 78 -- upvalues: u10 (val), u6 (val), formatTimer (upval)
        local v1 = a1[1]
        local v2 = a1[2]
        if not u10 then
            return u6
        end
        if v1 > 0 then
            return (("%* left until the %* battle pass starts!"):format(formatTimer(v1), u6))
        end
        if v2 > 0 then
            return (("%* left until the %* battle pass ends!"):format(formatTimer(v2), u6))
        end
        return (("%* battle pass has ended!"):format(u6))
    end)
    local v6, v7 = useGroupAnimation({
        enabled = useAnimation({
            position = Tween({target = UDim2.fromScale(0, 0), info = TweenInfo.new(0.2)}),
            shadowPosition = Tween({target = UDim2.fromScale(0.5, 0.5), info = TweenInfo.new(0.2)}),
            shadowTransparency = Tween({target = 0.2, info = TweenInfo.new(0.2)}),
            frameTransparency = Tween({target = 0.2, info = TweenInfo.new(0.2)}),
            transparency = Tween({target = 0, info = TweenInfo.new(0.2)}),
        }),
        disabled = useAnimation({
            position = Tween({target = UDim2.fromScale(0, -1), info = TweenInfo.new(0.2)}),
            shadowPosition = Tween({target = UDim2.fromScale(0.5, -0.5), info = TweenInfo.new(0.2)}),
            shadowTransparency = Tween({target = 1, info = TweenInfo.new(0.2)}),
            frameTransparency = Tween({target = 1, info = TweenInfo.new(0.2)}),
            transparency = Tween({target = 1, info = TweenInfo.new(0.2)}),
        }),
    }, {
        transparency = 1,
        shadowTransparency = 0.2,
        frameTransparency = 0.2,
        shadowPosition = UDim2.fromScale(0.5, -0.5),
        position = UDim2.fromScale(0, -1),
    })
    local v8 = {clicked}
    local v9 = useCallback(function() -- Line: 124 -- upvalues: Click (val), clicked (val)
        Click()
        if clicked then
            clicked()
        end
    end, v8)
    v7(if not v1 then "disabled" else "enabled")
    local v10 = {}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0)
    v10.AnchorPoint = AnchorPoint
    local Position = a1.Position or UDim2.new(0.5, 0, 0, if not RunService:IsRunning() then 50 else -40)
    v10.Position = Position
    local Size = a1.Size or UDim2.fromOffset(0, v2 * 60)
    v10.Size = Size
    v10.AutomaticSize = Enum.AutomaticSize.X
    v10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v10.BackgroundTransparency = 1
    v10.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v10.BorderSizePixel = 0
    v10.Text = ""
    v10.Visible = v6.transparency:map(function(a1) -- Line: 143
        return a1 < 0.99
    end)
    v10[Event.MouseButton1Down] = v9
    return createElement("TextButton", v10, {
        frame = createElement("Frame", {
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.fromRGB(48, 48, 48),
            BackgroundTransparency = v6.frameTransparency,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Size = UDim2.fromScale(1, 1),
            Position = v6.position,
        }, {
            buttonFrame = createElement("Frame", {
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(1, 0.5),
                Size = UDim2.fromOffset(v2 * 100, v2 * 35),
                Position = UDim2.fromScale(0.985, 0.5),
            }, {
                button = createElement(BattlepassButton, {
                    text = "View",
                    Size = UDim2.fromScale(1, 1),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    transparency = v6.transparency,
                    clicked = v9,
                }),
            }),
            imageLabel = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Image = "rbxassetid://82991540492128",
                LayoutOrder = -1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                ImageTransparency = v6.shadowTransparency,
                Position = UDim2.fromScale(0.5, 0.5),
                ScaleType = Enum.ScaleType.Fit,
                Size = UDim2.fromOffset(v2 * 30, v2 * 30),
            }),
            textLabel = createElement("TextLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                AutomaticSize = Enum.AutomaticSize.X,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                Position = UDim2.fromScale(0.439, 0.292),
                Size = UDim2.fromOffset(0, v2 * 30),
                Text = v5,
                TextTransparency = v6.transparency,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextSize = math.round(v2 * 24),
            }),
            uIPadding = createElement("UIPadding", {
                PaddingBottom = UDim.new(0, v2 * 10),
                PaddingLeft = UDim.new(0, v2 * 10),
                PaddingRight = UDim.new(0, v2 * 10),
                PaddingTop = UDim.new(0, v2 * 10),
            }),
            uIListLayout = createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                Padding = UDim.new(0, v2 * 15),
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
            }),
            uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, v2 * 5)}),
            uIGradient = createElement("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(38, 38, 38))),
                }),
            }),
        }),
        dropShadow = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "http://www.roblox.com/asset/?id=9239716855",
            ZIndex = -1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            ImageTransparency = v6.shadowTransparency,
            Position = v6.shadowPosition,
            ScaleType = Enum.ScaleType.Slice,
            Size = UDim2.new(1, 14, 1, 14),
            SliceCenter = Rect.new(14, 14, 64, 24),
        }),
    })
end)