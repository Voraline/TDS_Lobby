-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.LoadOutPicker
-- Decompile time: 10.51 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local useTransparencyModifier = require(Hooks.useTransparencyModifier)
local LoadOut = require(script.LoadOut)
local LoadOutTimer = require(script.LoadOutTimer)
local Fragment = React.Fragment
local Tween = ReactFlow.Tween
local useAnimation = ReactFlow.useAnimation
local useGroupAnimation = ReactFlow.useGroupAnimation
local createElement = React.createElement
local useEffect = React.useEffect
local useMemo = React.useMemo
local memo = React.memo
local u50 = memo(function(a1) -- Line: 48 -- upvalues: table (val), createElement (val), LoadOut (val), Fragment (val)
    local loadOuts = a1.loadOuts or {}
    local loadOutPicked = a1.loadOutPicked
    local u6 = a1.LayoutOrder or 0
    local Visible = a1.Visible
    local user = a1.user
    return createElement(Fragment, {}, (table.reduce(loadOuts, function(a1, a2, a3) -- Line: 55
        -- upvalues: createElement (upval), LoadOut (upval), table (upval), Visible (val), u6 (val), user (val)
        -- upvalues: loadOutPicked (val)
        if a2.name and a2.towers and next(a2.towers) then
            a1[a2.name] = (createElement(LoadOut, table.merge({}, a2, {
                Visible = Visible,
                LayoutOrder = u6 + a3,
                user = user,
                clicked = function() -- Line: 67 -- upvalues: loadOutPicked (upval), a2 (val)
                    if loadOutPicked then
                        loadOutPicked(a2.name, a2.towers)
                    end
                end,
            })))
            return a1
        end
        return a1
    end, {})))
end)
return memo(function(a1) -- Line: 80
    -- upvalues: useGroupAnimation (val), useAnimation (val), Tween (val), useMemo (val), useTransparencyModifier (val)
    -- upvalues: useEffect (val), createElement (val), LoadOutTimer (val), TextLabel (val), u50 (val)
    local u3 = a1.Visible ~= false
    local loadOuts = a1.loadOuts or {}
    local loadOutPicked = a1.loadOutPicked
    local userLoadout = a1.userLoadout
    if not userLoadout then
        userLoadout = {}
    end
    local userLoadoutPicked = a1.userLoadoutPicked
    local startsAt = a1.startsAt
    local endsAt = a1.endsAt
    local timerFinished = a1.timerFinished
    local v1 = TweenInfo.new(0.4, Enum.EasingStyle.Sine)
    local v2, u54 = useGroupAnimation({
        default = useAnimation({
            transparency = Tween({target = 0, info = v1}),
            position = Tween({target = UDim2.fromScale(0.5, 0.5), info = v1}),
        }),
        disable = useAnimation({
            transparency = Tween({target = 1, info = v1}),
            position = Tween({target = UDim2.fromScale(0.5, 2), info = v1}),
        }),
    }, {transparency = 1, position = UDim2.fromScale(0.5, 2)})
    local v3 = {userLoadout}
    local v4 = useMemo(function() -- Line: 115 -- upvalues: userLoadout (val)
        return {{name = "Your Loadout", description = "Your current loadout", towers = userLoadout}}
    end, v3)
    local v5 = useTransparencyModifier(v2.transparency)
    local v6 = {u3}
    useEffect(function() -- Line: 127 -- upvalues: u54 (val), u3 (val)
        u54(if not u3 then "disable" else "default")
    end, v6)
    v6 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.488, 0.521),
        Visible = v2.transparency:map(function(a1) -- Line: 139
            return a1 < 1
        end),
    }
    local v7 = {
        timer = endsAt and createElement(LoadOutTimer, {Visible = u3, startsAt = startsAt, endsAt = endsAt, timerFinished = timerFinished}),
        textLabel = createElement(TextLabel, {
            FontWeight = "SemiBold",
            Text = "Choose Your Loadout",
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            StrokeThickness = 4,
            StrokeGradientRotation = 90,
            AnchorPoint = Vector2.new(0.5, 0),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(0.5, 0.024),
            Size = UDim2.fromScale(1, 0.096),
            TextTransparency = v2.transparency,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            StrokeTransparency = v2.transparency,
            StrokeColor = Color3.new(1, 1, 1),
            StrokeGradientColor = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(59, 59, 59)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(26, 26, 26))),
            }),
        }, {
            uiTextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 48}),
            frame = createElement("Frame", {
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0.5, 0),
                BackgroundTransparency = v2.transparency,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Position = UDim2.fromScale(0.5, 1.05),
                Size = UDim2.new(0.8, 0, 0, 2),
            }, {
                gradient = createElement("UIGradient", {
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1),
                        NumberSequenceKeypoint.new(0.5, 0),
                        (NumberSequenceKeypoint.new(1, 1)),
                    }),
                }),
            }),
        }),
        background = createElement("Frame", {
            BorderSizePixel = 0,
            ZIndex = -1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BackgroundTransparency = v5(0.6),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1.3, 1),
        }, {
            gradient = createElement("UIGradient", {
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1),
                    NumberSequenceKeypoint.new(0.2, 0.25),
                    NumberSequenceKeypoint.new(0.5, 0),
                    NumberSequenceKeypoint.new(0.8, 0.25),
                    (NumberSequenceKeypoint.new(1, 1)),
                }),
            }),
        }),
    }
    local v8 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 0.6),
    }
    local v9 = {
        uIAspectRatioConstraint1 = createElement("UIAspectRatioConstraint", {AspectRatio = 3, AspectType = Enum.AspectType.FitWithinMaxSize}),
        listLayout = createElement("UIListLayout", {
            Wraps = true,
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            HorizontalFlex = Enum.UIFlexAlignment.SpaceEvenly,
            Padding = UDim.new(0.1, 0),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            VerticalFlex = Enum.UIFlexAlignment.Fill,
        }),
        content = createElement(u50, {Visible = u3, loadOuts = loadOuts, loadOutPicked = loadOutPicked}),
    }
    local v10 = false
    if a1.allowUserLoadout ~= false then
        v10 = createElement(u50, {
            LayoutOrder = -1,
            user = true,
            Visible = u3,
            loadOuts = v4,
            loadOutPicked = userLoadoutPicked,
        })
    end
    v9.userSelection = v10
    v7.loadouts = createElement("Frame", v8, v9)
    return createElement("Frame", v6, v7)
end)