-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Inventory.NavButton
-- Decompile time: 3.79 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local ReactUtils = require(ReplicatedStorage.Shared.UI.ReactUtils)
local createElement = React.createElement
local memo = React.memo
local __subscribeToBinding = React.__subscribeToBinding
local useBinding = React.useBinding
local useBindings = ReactFlow.useBindings
return memo(function(a1) -- Line: 29
    -- upvalues: useBinding (val), ReactUtils (val), ReactFlow (val), React (val), __subscribeToBinding (val)
    -- upvalues: useBindings (val), createElement (val), ImageLabel (val)
    local v1 = a1.size ~= nil
    local u7 = a1.reducedMotion == true
    local v2 = a1.zIndex or 1
    local v3, u24 = useBinding(if not ReactUtils.isBinding(a1.enabled) then a1.enabled else a1.enabled:getValue())
    local v4 = v3:map(function(a1) -- Line: 36
        if a1 then
            return (Color3.fromRGB(255, 255, 255))
        end
        return (Color3.fromRGB(156, 156, 156))
    end)
    local v5 = v3:map(function(a1) -- Line: 39
        if a1 then
            return (Color3.fromRGB(0, 170, 255))
        end
        return (Color3.fromRGB(156, 156, 156))
    end)
    local v6, u37 = ReactFlow.useSpring({target = 1, start = 1, damper = 0.6, speed = 40})
    local v7, u42 = ReactFlow.useSpring({target = 0, start = 0, damper = 0.6, speed = 40})
    local useEffect = React.useEffect
    local v8 = {a1.enabled}
    useEffect(function() -- Line: 57 -- upvalues: ReactUtils (upval), a1 (val), u24 (val), __subscribeToBinding (upval)
        if ReactUtils.isBinding(a1.enabled) then
            u24(a1.enabled:getValue())
            return __subscribeToBinding(a1.enabled, u24)
        end
        u24(a1.enabled)
    end, v8)
    v8 = {v3}
    local v9 = {u7}
    useBindings(function(a1) -- Line: 66 -- upvalues: u7 (val), u42 (val)
        if a1 and not u7 then
            u42({force = 420, speed = 12})
            return
        end
        u42({start = 0, target = 0, speed = 40}, u7)
    end, v8, v9)
    v8 = {}
    v9 = if not v1 then Vector2.new(0, 0.5) else Vector2.new(0.5, 0.5)
    v8.AnchorPoint = v9
    v8.BackgroundTransparency = 1
    v8.LayoutOrder = a1.layoutOrder
    v9 = if not v1 then UDim2.fromScale(0.142679, 0.5) else UDim2.fromScale(0.5, 0.5)
    v8.Position = v9
    local size = a1.size or UDim2.new(0, 70, 0.835821, 0)
    v8.Size = size
    v8.Text = ""
    v8.AutomaticSize = if not v1 then Enum.AutomaticSize.X else Enum.AutomaticSize.None
    v8.Selectable = true
    v8.Active = true
    v8.ZIndex = v2

    v8[React.Event.Activated] = function() -- Line: 94 -- upvalues: a1 (val)
        a1.onClick(a1.title)
    end

    v8[React.Event.MouseButton1Down] = function() -- Line: 97 -- upvalues: u37 (val), u7 (val)
        u37({target = 0.95}, u7)
    end

    v8[React.Event.MouseButton1Up] = function() -- Line: 102 -- upvalues: u37 (val), u7 (val)
        u37({target = 1.1}, u7)
    end

    v8[React.Event.MouseEnter] = function() -- Line: 107 -- upvalues: u37 (val), u7 (val)
        u37({target = 1.1}, u7)
    end

    v8[React.Event.MouseLeave] = function() -- Line: 112 -- upvalues: u37 (val), u7 (val)
        u37({target = 1}, u7)
    end

    return createElement("TextButton", v8, {
        content = createElement("Frame", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.8, 0.8),
            Rotation = if not a1.flipped then 0 else -90,
            ZIndex = v2,
        }, {
            uIScale = createElement("UIScale", {
                Scale = v6:map(function(a1_2) -- Line: 127 -- upvalues: a1 (val)
                    return a1_2 * (a1.buttonSize or 1)
                end),
            }),
            aspectRatio = createElement("UIAspectRatioConstraint"),
            cornerRadius = createElement("UICorner", {CornerRadius = UDim.new(0.09375, 0)}),
            title = createElement("TextLabel", {
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                Position = UDim2.fromScale(0.523834, 0.985),
                Size = UDim2.fromScale(1.85521, 0.4),
                Text = a1.title,
                TextColor3 = Color3.new(1, 1, 1),
                TextScaled = a1.textSize == nil,
                TextSize = a1.textSize,
                ZIndex = v2 + 2,
            }, {
                uIStroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.5, LineJoinMode = Enum.LineJoinMode.Miter}),
            }),
            icon = createElement(ImageLabel, {
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Image = a1.icon,
                ImageColor3 = v4,
                Position = UDim2.fromScale(0.5, 0.5),
                ScaleType = Enum.ScaleType.Fit,
                Size = UDim2.fromScale(1.5, 1.5),
                ZIndex = v2 + 1,
            }),
            highlight = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = "rbxassetid://94123922287925",
                AnchorPoint = Vector2.new(0.5, 0.5),
                ImageColor3 = v5,
                Position = UDim2.fromScale(0.5, 0.5),
                ScaleType = Enum.ScaleType.Fit,
                Size = UDim2.fromScale(1.6, 1.6),
                ZIndex = if not a1.zIndex then -1 else v2,
                Rotation = v7,
            }, {aspectRatio = createElement("UIAspectRatioConstraint")}),
        }),
    })
end)