-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Notifications
-- Decompile time: 13.17 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage.Client
local Hooks = Client.Interfaces.Hooks
local Components = Client.Interfaces.Components
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local Sift = require(ReplicatedStorage.Packages.Sift)
require(ReplicatedStorage.Shared.Modules.Signal)
local ImageLabel = require(Components.ImageLabel)
local useFontScale = require(Hooks.useFontScale)
local useTransparencyModifier = require(Hooks.useTransparencyModifier)
local Tween = ReactFlow.Tween
local Spring = ReactFlow.Spring
local useGroupAnimation = ReactFlow.useGroupAnimation
local useAnimation = ReactFlow.useAnimation
local memo = React.memo
local useEffect = React.useEffect
local useState = React.useState
local useCallback = React.useCallback
local createElement = React.createElement
local u53 = memo(function(a1) -- Line: 60
    -- upvalues: React (val), useFontScale (val), Sift (val), useGroupAnimation (val), useAnimation (val), Spring (val)
    -- upvalues: Tween (val), useTransparencyModifier (val), useEffect (val), createElement (val), ImageLabel (val)
    local v1, u5 = React.useBinding(0)
    local v2 = useFontScale({scale = 1.1})
    local color = a1.color or Color3.fromRGB(255, 255, 255)
    local v3 = color:Lerp(Color3.new(0, 0, 0), 0.98)
    local v4 = Sift.Dictionary.join({
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0, 0),
        AutomaticSize = Enum.AutomaticSize.XY,
        Position = UDim2.fromScale(0, 0),
        Size = UDim2.fromScale(0, 1),
    }, a1.native or {})
    local v5, u117 = useGroupAnimation({
        enable = useAnimation({
            position = Spring({speed = 20, target = UDim2.fromScale(0, 0)}),
            anchorPoint = Spring({speed = 20, target = Vector2.new(0, 0)}),
            transparency = Tween({target = 0, info = TweenInfo.new(0.2, Enum.EasingStyle.Sine)}),
        }),
        disable = useAnimation({
            position = Tween({
                target = UDim2.fromScale(1, 0),
                info = TweenInfo.new(0.2, Enum.EasingStyle.Sine),
            }),
            anchorPoint = Tween({
                target = Vector2.new(0, 0),
                info = TweenInfo.new(0.2, Enum.EasingStyle.Sine),
            }),
            transparency = Tween({target = 1, info = TweenInfo.new(0.2, Enum.EasingStyle.Sine)}),
        }),
    }, {
        transparency = 1,
        scale = 1,
        position = UDim2.fromScale(-1, 4),
        anchorPoint = Vector2.new(0, 1),
    })
    local v6 = useTransparencyModifier(v5.transparency)
    useEffect(function() -- Line: 110 -- upvalues: u117 (val)
        u117("enable")
    end, {})
    local v7 = useEffect
    local v8 = {a1.remove}
    v7(function() -- Line: 114 -- upvalues: a1 (val), u117 (val)
        local u10 = nil
        if a1.remove then
            u117("disable")
            u10 = task.delay(0.3, function() -- Line: 119 -- upvalues: a1 (upval)
                if a1.destroy then
                    a1.destroy()
                end
            end)
        end
        return function() -- Line: 126 -- upvalues: u10 (ref)
            if u10 then
                task.cancel(u10)
            end
        end
    end, v8)
    local v9 = {}
    local v10 = {
        BackgroundTransparency = 1,
        AnchorPoint = v5.anchorPoint,
        Size = UDim2.fromScale(1, 0),
        Position = v5.position,
        AutomaticSize = Enum.AutomaticSize.Y,
    }
    local v11 = {
        listLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 8),
        }),
    }
    local v12 = createElement
    local v13 = {Scale = v5.scale}
    v11.scale = v12("UIScale", v13)
    if not a1.icon then
        v12 = nil
    else
        v13 = {
            BackgroundTransparency = 1,
            LayoutOrder = -1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            ImageTransparency = v6(0),
        }
        local icon_3 = if typeof(a1.icon) ~= "number" then a1.icon else ("rbxassetid://%*"):format(a1.icon)
        v13.Image = icon_3
        v13.Size = v1:map(function(a1) -- Line: 161 -- types: a1: number
            return UDim2.fromOffset(a1 * 1.6, a1 * 1.6)
        end)
        v13.ScaleType = Enum.ScaleType.Fit
        v12 = createElement(ImageLabel, v13, {aspectRatio = createElement("UIAspectRatioConstraint")})
    end
    v11.icon = v12
    v12 = createElement
    v13 = {
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundTransparency = 1,
        Position = UDim2.fromScale(0.104225, -0.0833333),
        AnchorPoint = Vector2.new(0.5, 0.5),
        RichText = true,
        Size = UDim2.fromScale(0, 0),
        Text = a1.text,
        TextColor3 = color,
        TextWrapped = true,
        TextTransparency = v6(0),
        TextSize = v2,
        TextScaled = false,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
    }

    v13[React.Change.AbsoluteSize] = function(a1) -- Line: 189 -- upvalues: u5 (val) -- types: a1: userdata
        u5(a1.AbsoluteSize.Y)
    end

    v11.text = v12("TextLabel", v13, {stroke = createElement("UIStroke", {Thickness = 2, Color = v3, Transparency = v6(0.5)})})
    v9.content = createElement("Frame", v10, v11)
    return createElement("Frame", v4, v9)
end)
local u56 = memo(function(a1) -- Line: 203 -- upvalues: createElement (val), u53 (val), ReactFlow (val)
    local v1 = {}
    for i, j in a1.data or {} do
        v1[j.id] = (createElement(u53, {
            text = j.text,
            icon = j.icon,
            color = j.color,
            native = {LayoutOrder = i},
        }))
    end
    local v2 = {BackgroundTransparency = 1}
    local position = a1.position or UDim2.fromScale(0.5, 0.25)
    v2.Position = position
    local size = a1.size or UDim2.new(1, 0, 0, 24)
    v2.Size = size
    local anchorPoint = a1.anchorPoint or Vector2.new(0.5, 0.5)
    v2.AnchorPoint = anchorPoint
    v2.ZIndex = a1.zIndex or 1
    v2.LayoutOrder = a1.layoutOrder or 1
    return createElement("Frame", v2, {
        listLayout = createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            Padding = UDim.new(0, 8),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Bottom,
            ItemLineAlignment = Enum.ItemLineAlignment.Center,
        }),
        dynamicList = createElement(ReactFlow.DynamicList, nil, v1),
    })
end)
return memo(function(a1) -- Line: 238
    -- upvalues: useState (val), useCallback (val), useEffect (val), HttpService (val), createElement (val), u56 (val)
    local v1, u4 = useState({})
    local onNotify = a1.onNotify
    local u9 = useCallback(function(a1) -- Line: 242 -- upvalues: u4 (val)
        u4(function(a1_2) -- Line: 243 -- upvalues: a1 (val)
            for i, j in a1_2 do
                if j.id == a1.id then
                    return a1_2
                end
            end
            local v1 = table.clone(a1_2)
            table.insert(v1, a1)
            while #v1 > 5 do
                table.remove(v1, 1)
            end
            return v1
        end)
    end, {})
    local u13 = useCallback(function(a1) -- Line: 261 -- upvalues: u4 (val) -- types: a1: number
        u4(function(a1_2) -- Line: 262 -- upvalues: a1 (val)
            local v1 = table.clone(a1_2)
            local v2 = false
            for i = #v1, 1, -1 do
                if v1[i].id == a1 then
                    table.remove(v1, i)
                    v2 = true
                    break
                end
            end
            if v2 then
                return v1
            end
            return a1_2
        end)
    end, {})
    local v2 = {onNotify}
    useEffect(function() -- Line: 278 -- upvalues: onNotify (val), HttpService (upval), u9 (val), u13 (val)
        local u4 = onNotify:Connect(function(a1) -- Line: 279 -- upvalues: HttpService (upval), u9 (upval), u13 (upval)
            local u6 = {
                id = HttpService:GenerateGUID(false),
                text = a1.text,
                timeout = a1.timeout,
                icon = a1.icon,
                color = a1.color,
            }
            u9(u6)
            task.delay(u6.timeout or 5, function() -- Line: 291 -- upvalues: u13 (upval), u6 (val)
                u13(u6.id)
            end)
        end)
        return function() -- Line: 296 -- upvalues: u4 (val)
            u4:Disconnect()
        end
    end, v2)
    return createElement(u56, {
        size = a1.size,
        position = a1.position,
        anchorPoint = a1.anchorPoint,
        zIndex = a1.zIndex,
        layoutOrder = a1.layoutOrder,
        data = v1,
    })
end)